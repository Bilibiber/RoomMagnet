using System;
using System.Configuration;
using System.Data.SqlClient;
using ASPSnippets.GoogleAPI;
using System.Web.Script.Serialization;

public partial class Home : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        GoogleConnect.ClientId = "Use Your Client ID Here";
        GoogleConnect.ClientSecret = "Use Your Client Secret Key Here";
        GoogleConnect.RedirectUri = Request.Url.AbsoluteUri.Split('?')[0];

        if (!string.IsNullOrEmpty(Request.QueryString["code"]))
        {
            string code = Request.QueryString["code"];
            string json = GoogleConnect.Fetch("me", code);
            GoogleProfile profile = new JavaScriptSerializer().Deserialize<GoogleProfile>(json);
            Label3.Text = profile.Id;
            Label4.Text = profile.DisplayName;
            Label5.Text = profile.Emails.Find(email => email.Type == "account").Value;


            Image1.ImageUrl = profile.Image.Url;
            ImageButton1.Visible = false;
        }
        if (Request.QueryString["error"] == "access_denied")
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('Access denied.')", true);
        }
    }

    protected void HomePageGetStarted_Click(object sender, EventArgs e)
    {

    }
    protected void HomePageSignUp_Click(object sender, EventArgs e)
    {
        try
        {
            EmailSender email = new EmailSender();
            email.SendWelcomeMail(HomePageEmail.Text);
            Users users = new Users(HomePageFirstName.Text, HomePageLastName.Text, HomePageEmail.Text, HomePagePassword.Text);
            if (cn.State == System.Data.ConnectionState.Closed)
            {
                cn.Open();
            }
            string SqlCommand = "insert into Users values(@FirstName,@LastName,@MiddleName,@Gender,@Email,@Password,@DOB,@BackgroundURL,@LastUpdated,@LastUpdatedBy)";
            cn.Close();
        }
        catch (Exception)
        {

        }
    }
    protected void GmailSignIn_Click(object sender, EventArgs e)
    {

    }
}