using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ASPSnippets.GoogleAPI;
using System.Web.Script.Serialization;
using System.Data.SqlClient;
using System.Configuration;

public partial class RoomMagnet : System.Web.UI.MasterPage
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        GoogleConnect.ClientId = "501924233388-4ts15v59i0l3orbfaeaqfh6e1cl5dg1h.apps.googleusercontent.com";
        GoogleConnect.ClientSecret = "71rfQJWsTXIkCOuI6cZOdBtL";
        GoogleConnect.RedirectUri = Request.Url.AbsoluteUri.Split('?')[0];

        if (!string.IsNullOrEmpty(Request.QueryString["code"]))
        {
            string code = Request.QueryString["code"];
            string json = GoogleConnect.Fetch("me", code);
            GoogleProfile profile = new JavaScriptSerializer().Deserialize<GoogleProfile>(json);
            HomePageFirstName.Text = profile.DisplayName;
            HomePageEmail.Text = profile.Emails.Find(email => email.Type == "account").Value;


            //Image1.ImageUrl = profile.Image.Url;
            //ImageButton1.Visible = false;
        }
        if (Request.QueryString["error"] == "access_denied")
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('Access denied.')", true);
        }
    }
    protected void GmailSignIn_Click(object sender, EventArgs e)
    {
        GoogleConnect.Authorize("profile", "email");
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
}
