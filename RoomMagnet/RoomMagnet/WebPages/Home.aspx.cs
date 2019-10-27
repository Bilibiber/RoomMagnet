using System;
using System.Configuration;
using System.Data.SqlClient;

public partial class Home : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
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
}