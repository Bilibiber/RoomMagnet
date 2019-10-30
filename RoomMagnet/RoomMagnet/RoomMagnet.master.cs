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
    }

    protected void GmailSignIn_Click(object sender, EventArgs e)
    {
        string url = "https://accounts.google.com/o/oauth2/v2/auth?scope=profile&include_granted_scopes=true&redirect_uri=" + redirection_url + "&response_type=code&client_id=" + clientid + "";
        Response.Redirect(url);
    }

    protected void MasterPageSignUp_Click(object sender, EventArgs e)
    {
        try
        {
            EmailSender email = new EmailSender();
            email.SendWelcomeMail(MasterPageEmail.Text);
            Users users = new Users(MasterPageFirstName.Text, MasterPageLastName.Text, MasterPageEmail.Text, MasterPagePassword.Text,MasterPageBirthday.Text);
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
                    new SqlParameter("@Password",users.getLastName()),
                    new SqlParameter("@DateOfBirth",users.getBirthday()),
                    new SqlParameter("@LastUpdated",users.getLastName()),
                    new SqlParameter("@LastUpdatedBy",users.getLastName()),
                });
                
            cn.Close();
        }
        catch (Exception)
        {
        }
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
}