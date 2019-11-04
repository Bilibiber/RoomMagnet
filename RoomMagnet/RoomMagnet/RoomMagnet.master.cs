using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Net;
using System.Text;
using System.Web.Script.Serialization;
using System.Web.UI;

public partial class RoomMagnet : System.Web.UI.MasterPage
{
    private SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ToString());
    private string clientid = "501924233388-4ts15v59i0l3orbfaeaqfh6e1cl5dg1h.apps.googleusercontent.com";
    private string clientsecret = "71rfQJWsTXIkCOuI6cZOdBtL";
    private string redirection_url = "http://localhost:59379/WebPages/Home.aspx";
    private string url = "https://accounts.google.com/o/oauth2/token";
    string FName;
    string LName;
    protected void Page_Load(object sender, EventArgs e)
    {
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
        if (SignUpEmailCustomValidator.IsValid)
        {
            Users users = new Users(MasterPageFirstName.Text, MasterPageLastName.Text, MasterPageEmail.Text, MasterPagePassword.Text, MasterPageBirthday.Text);
            string MasterPagepassword = users.getPassword();
            string HashedPassword = PasswordHash.HashPassword(MasterPagepassword);
            try
            {
                if (cn.State == System.Data.ConnectionState.Closed)
                {
                    cn.Open();
                }
                string Sql = "insert into Users (FirstName,LastName,Email,Password,DateOfBirth,LastUpdated,LastUpdatedBy) values(@FirstName,@LastName,@Email,@Password,@DateOfBirth,@LastUpdated,@LastUpdatedBy)";
                SqlCommand sqlCommand = new SqlCommand(Sql, cn);
                sqlCommand.Parameters.AddRange(
                    new SqlParameter[]
                    {
                    new SqlParameter("@FirstName",users.getFirstName()),
                    new SqlParameter("@LastName",users.getLastName()),
                    new SqlParameter("@Email",users.getEmail()),
                    new SqlParameter("@Password",HashedPassword),
                    new SqlParameter("@DateOfBirth",users.getBirthday()),
                    new SqlParameter("@LastUpdated",users.getLastUpdated()),
                    new SqlParameter("@LastUpdatedBy",users.getLastUpdatedBy()),
                    });
                sqlCommand.ExecuteNonQuery();
                cn.Close();
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
        MasterPageBirthday.Text = string.Empty;
        MasterPageComfirmPassword.Text = string.Empty;
        MasterPageEmail.Text = string.Empty;
        MasterPageFirstName.Text = string.Empty;
        MasterPageLastName.Text = string.Empty;
        MasterPagePassword.Text = string.Empty;
    }

    protected void MasterPageSignIn_Click(object sender, EventArgs e)
    {
        string sql = "Select Password from Users where Email = @Email ";

        Session["SignInEmail"] = SignInEmail.Text;
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
                        GetUserInfo();
                        MasterPageSignUp.Visible = false;
                        MasterPageLogIn.Visible = false;
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
            string SqlGetUserInfos = "SELECT        Users.UserID, Users.FirstName, Users.LastName, Users.ImagePath, UserRoles.Roles" +
                                                " FROM Users INNER JOIN UserRoles ON Users.UserID = UserRoles.UserID " +
                                                "where Users.Email =@Email";
            SqlCommand Finder = new SqlCommand(SqlGetUserInfos, cn);
            Finder.Parameters.AddWithValue("@Email", Session["SignInEmail"]);
            SqlDataReader dataReader = Finder.ExecuteReader();
            if (dataReader.HasRows)
            {
                if (dataReader.Read())
                {
                    Session["UserID"] = dataReader.GetInt32(0);
                    Session["FullName"] = dataReader.GetString(1) +" "+ dataReader.GetString(2);
                    //Session["ImagePath"] = dataReader.GetString(3);
                    Session["Roles"] = dataReader.GetString(4);
                }
            }
            dataReader.Close();
            MasterUserName.Visible = true;
            MasterUserName.Text = Session["FullName"].ToString();
            MasterPageUserProfileImage.Visible = true;

        }
        catch (Exception)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openLoginModal();", true);
            SignInErrorLbl.Visible = true;
            SignInErrorLbl.Text = "DataBase Error please try again later";
        }
        cn.Close();
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
        MasterPageBirthday.Text = userinfo.birthday;
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
            string sql ="Select Email from Users";
            SqlCommand sqlCommand = new SqlCommand(sql,cn);
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
    protected void MasterPageSignOut_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.Clear();
        Response.Redirect("Home.aspx");
        //MasterUserName.Visible = false;
    }

    protected void GotoDashBoard_Click(object sender, EventArgs e)
    {
        GotoDashBoard.PostBackUrl = "~/WebPages/Renter.aspx";
    }

    protected void GotoSetting_Click(object sender, EventArgs e)
    {

    }
}