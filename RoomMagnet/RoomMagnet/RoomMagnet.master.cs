using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;

public partial class RoomMagnet : System.Web.UI.MasterPage

{
    private SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ToString());
    private string clientid = "501924233388-4ts15v59i0l3orbfaeaqfh6e1cl5dg1h.apps.googleusercontent.com";
    private string clientsecret = "71rfQJWsTXIkCOuI6cZOdBtL";
    private string redirection_url = "http://localhost:59379/WebPages/Home.aspx";
    private string url = "https://accounts.google.com/o/oauth2/token";
    private string FName;
    private string LName;

    protected void Page_Load(object sender, EventArgs e)
    {
        Session["UserCount"] = 0;
        if (!IsPostBack)
        {
            if (Request.QueryString["code"] != null)
            {
                GetToken(Request.QueryString["code"].ToString());
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
            }
        }

       
        if (IsPostBack)
            return;
    }

    protected void GmailSignIn_Click(object sender, EventArgs e)
    {
        string url = "https://accounts.google.com/o/oauth2/v2/auth?scope=profile&include_granted_scopes=true&redirect_uri=" + redirection_url + "&response_type=code&client_id=" + clientid + "";
        Response.Redirect(url, false);
    }

    protected void MasterPageSignUp_Click(object sender, EventArgs e)
    {
        //EmailSender email = new EmailSender();
        //email.SendWelcomeMail(MasterPageEmail.Text);
        //Not working in showker Lab
        if (SignUpEmailCustomValidator.IsValid && CustomValidator1.IsValid)
        {
            Users users = new Users(MasterPageFirstName.Text, MasterPageLastName.Text, MasterPageEmail.Text, MasterPagePassword.Text, MasterPageAgeRangeDropDownList.SelectedValue);

            string Welcomemailstring = "Welcome to RoomMagnet!";

            string EnteredEmailAddress = MasterPageEmail.Text;
            EmailSender email = new EmailSender();
            email.SendWelcomeMail(EnteredEmailAddress, Welcomemailstring);

            string MasterPagepassword = users.getPassword();
            string HashedPassword = PasswordHash.HashPassword(MasterPagepassword);
            try
            {
                if (cn.State == System.Data.ConnectionState.Closed)
                {
                    cn.Open();
                }
                string Sql = "insert into Users (FirstName,LastName,Email,Password,AgeRange,UserRole,Verified,SignUpDate,LastUpdated,LastUpdatedBy) values(@FirstName,@LastName,@Email,@Password,@AgeRange,@UserRole,@Verified,@SignUpDate,@LastUpdated,@LastUpdatedBy)";
                SqlCommand sqlCommand = new SqlCommand(Sql, cn);
                string role = "Renter";
                string verified = "Unverified";
                
                sqlCommand.Parameters.AddRange(
                    new SqlParameter[]
                    {
                    new SqlParameter("@FirstName",users.getFirstName()),
                    new SqlParameter("@LastName",users.getLastName()),
                    new SqlParameter("@Email",users.getEmail()),
                    new SqlParameter("@Password",HashedPassword),
                    new SqlParameter("@AgeRange",users.getAgeRange()),
                    new SqlParameter("@LastUpdated",users.getLastUpdated()),
                    new SqlParameter("@LastUpdatedBy",users.getLastUpdatedBy()),
                    new SqlParameter("@SignUpDate",DateTime.Now),
                    new SqlParameter("@UserRole",role),
                    new SqlParameter("@Verified",verified),
                    });
                sqlCommand.ExecuteNonQuery();
                cn.Close();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openNotificationModal();", true);
                MasterPageAgeRangeDropDownList.SelectedIndex = 0;
                MasterPageComfirmPassword.Text = string.Empty;
                MasterPageEmail.Text = string.Empty;
                MasterPageFirstName.Text = string.Empty;
                MasterPageLastName.Text = string.Empty;
                MasterPagePassword.Text = string.Empty;
            }

            // client -side to show a notification
            catch (Exception)
            {
                // client -side to show a error notification
            }
        }
        else
        {
            // lBL
        }
    }

    protected void MasterPageSignIn_Click(object sender, EventArgs e)
    {
        string sql = "Select Password from Users where Email = @Email ";
        try
        {
            string storedHash;
            if (cn.State == System.Data.ConnectionState.Closed)
            {
                cn.Open();
            }
            SqlCommand sqlCommand = new SqlCommand(sql, cn);
            sqlCommand.Parameters.AddWithValue("@Email", SignInEmail.Text);
            SqlDataReader reader = sqlCommand.ExecuteReader();
            if (reader.HasRows)
            {
                if (reader.Read())
                {
                    storedHash = reader["Password"].ToString();
                    reader.Close();
                    if (PasswordHash.ValidatePassword(SignInPassword.Text, storedHash))
                    {
                        Session["SignInEmail"] = SignInEmail.Text;
                        GetUserInfo();
                        AfterLogin();
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openLoginModal();", true);
                        PasswordErrorLbl.Visible = true;
                        PasswordErrorLbl.Text = "Invaild Password";
                    }
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openLoginModal();", true);
                EmailErrorLbl.Visible = true;
                EmailErrorLbl.Text = "Email address not exist";
            }
            cn.Close();
        }
        catch (Exception)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openLoginModal();", true);
            SignInErrorLbl.Visible = true;
            SignInErrorLbl.Text = "DataBase Error please try again later";
        }

    }

    public void GetUserInfo()
    {
        try
        {
            if (cn.State == System.Data.ConnectionState.Closed)
            {
                cn.Open();
            }
            string SqlGetUserInfos = "SELECT UserID,FirstName,LastName,ImagePath,UserRole,Verified FROM Users where Users.Email = @Email";
            SqlCommand Finder = new SqlCommand(SqlGetUserInfos, cn);
            Finder.Parameters.AddWithValue("@Email", Session["SignInEmail"]);
            SqlDataReader dataReader = Finder.ExecuteReader();
            if (dataReader.HasRows)
            {
                if (dataReader.Read())
                {
                    Session["UserID"] = dataReader.GetInt32(0);
                    Session["FullName"] = dataReader.GetString(1) + " " + dataReader.GetString(2); 
                    Session["Roles"] = dataReader.GetString(4);
                    Session["Verified"] = dataReader.GetString(5);
                }
            }
            dataReader.Close();
        }
        catch (Exception)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openLoginModal();", true);
            SignInErrorLbl.Visible = true;
            SignInErrorLbl.Text = "DataBase Error please try again later";
        }
        cn.Close();
    }

    public void AfterLogin()
    {
        MasterUserName.Visible = true;
        MasterUserName.Text = Session["FullName"].ToString();
        cn.Open();
        string SqlGetUserInfos = "SELECT ImagePath FROM Users where Users.Email =@Email";
        SqlCommand Finder = new SqlCommand(SqlGetUserInfos, cn);
        Finder.Parameters.AddWithValue("@Email", Session["SignInEmail"]);
        SqlDataReader dataReader = Finder.ExecuteReader();
        if (dataReader.HasRows)
        {
            if (dataReader.Read())
            {
                if (dataReader[0].ToString() != "NULL")
                {

                    if (!Convert.IsDBNull(dataReader[0]))
                    {
                        byte[] img = (byte[])dataReader[0];
                        Session["ImagePath"] = dataReader[0].ToString();
                        MasterPageUserProfileImage.ImageUrl = "data:image;base64," + Convert.ToBase64String(img);
                    }
                    else
                    {
                        MasterPageUserProfileImage.ImageUrl = "~/img/40x40.png";
                    }



                }
                else
                {
                    MasterPageUserProfileImage.ImageUrl = "~/img/mason-user.png";
                }

            }
        }
        dataReader.Close();
        cn.Close();
        MasterPageUserProfileImage.Visible = true;
        MasterPageSignUp.Visible = false;
        MasterPageLogIn.Visible = false;
    }

    public void GetToken(string code)
    {
        string poststring = "grant_type=authorization_code&code=" + code + "&client_id=" + clientid + "&client_secret=" + clientsecret + "&redirect_uri=" + redirection_url + "";
        var request = (HttpWebRequest)WebRequest.Create(url);
        request.ContentType = "application/x-www-form-urlencoded";
        request.Method = "POST";
        UTF8Encoding utfenc = new UTF8Encoding();
        byte[] bytes = utfenc.GetBytes(poststring);
        Stream outputstream = null;
        try
        {
            request.ContentLength = bytes.Length;
            outputstream = request.GetRequestStream();
            outputstream.Write(bytes, 0, bytes.Length);
        }
        catch
        { }
        var response = (HttpWebResponse)request.GetResponse();
        var streamReader = new StreamReader(response.GetResponseStream());
        string responseFromServer = streamReader.ReadToEnd();
        JavaScriptSerializer js = new JavaScriptSerializer();
        Tokenclass obj = js.Deserialize<Tokenclass>(responseFromServer);
        GetuserProfile(obj.access_token);
    }

    public void GetuserProfile(string accesstoken)
    {
        string url = "https://www.googleapis.com/oauth2/v1/userinfo?alt=json&access_token=" + accesstoken + "";
        WebRequest request = WebRequest.Create(url);
        request.Credentials = CredentialCache.DefaultCredentials;
        WebResponse response = request.GetResponse();
        Stream dataStream = response.GetResponseStream();
        StreamReader reader = new StreamReader(dataStream);
        string responseFromServer = reader.ReadToEnd();
        reader.Close();
        response.Close();
        JavaScriptSerializer js = new JavaScriptSerializer();
        Userclass userinfo = js.Deserialize<Userclass>(responseFromServer);
        //imgprofile.ImageUrl = userinfo.picture;  to stored image come from google
        MasterPageFirstName.Text = userinfo.given_name;
        MasterPageLastName.Text = userinfo.family_name;
        MasterPageEmail.Text = userinfo.email;
        
        //a
    }

    protected void SignUpEmailCustomValidator_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
    {
        try
        {
            if (cn.State == System.Data.ConnectionState.Closed)
            {
                cn.Open();
            }
            string sql = "Select Email from Users";
            SqlCommand sqlCommand = new SqlCommand(sql, cn);
            SqlDataReader reader = sqlCommand.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    string EmailInDataBase = reader.GetString(0).ToString();
                    if (EmailInDataBase == MasterPageEmail.Text)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
                        args.IsValid = false;
                        break;
                    }
                }
            }
            else
            {
                args.IsValid = true;
            }
            reader.Close();
            cn.Close();
        }
        catch (Exception)
        {
            args.IsValid = false;
            SignUpEmailCustomValidator.ErrorMessage = "Connection Error,Please try again Later";
        }
    }

    protected void GotoDashBoard_Click(object sender, EventArgs e)
    {
        MasterUserName.Visible = true;
        MasterUserName.Text = Session["FullName"].ToString();
        MasterPageUserProfileImage.Visible = true;
        string sql = "Select UserRole from Users where UserID=@UserID";
        string role="";
        cn.Open();
        SqlCommand sqlCommand = new SqlCommand(sql, cn);
        sqlCommand.Parameters.AddWithValue("@UserID", Session["UserID"].ToString());
        SqlDataReader reader = sqlCommand.ExecuteReader();    
        if (reader.Read())
        {
            role = reader.GetString(0);
        }
        reader.Close();
        if (role== "Renter")
        {
            Response.Redirect("Renter.aspx");
        }
        else if(role == "Host")
        {
            Response.Redirect("Host.aspx");
        }
        else if (role == "Admin")
        {
            Response.Redirect("Admin.aspx");
        }
    }

    protected void GotoSetting_Click(object sender, EventArgs e)
    {
        Response.Redirect("Setting.aspx");
    }
    protected void MasterPageSignOut_Click(object sender, EventArgs e)
    {
        //Session.Abandon();
        Session.Clear();
        Response.Redirect("Home.aspx");
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Home.aspx");
    }

    protected void CustomValidator1_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
    {
        if (MasterPageAgeRangeDropDownList.SelectedIndex == 0)
        {
            args.IsValid = false;
        }
        else
        {
            args.IsValid = true;
        }
    }
}