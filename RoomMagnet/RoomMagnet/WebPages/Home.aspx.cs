using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Text.RegularExpressions;

public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Panel1.Visible = false;
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        Panel1.Visible = true;
    }

    protected void HomePageSignUp_Click(object sender, EventArgs e)
    {
        String FirstName = HomePageFirstName.Text;
        String LastName = HomePageLastName.Text;
        String Email;
        //Checks to see if email at least has an @ symbol
        if (HomePageEmail.Text.Contains("@"))
{
            Email = HomePageEmail.Text;
}
        else
{
            Label1.Text = "Email missing @ symbol";
            Label1.Visible = true;
            return;
        }
        String Password = HomePagePassword.Text;
        //Validate email format
        if (IsValidEmail(Email))
        {
            Users.usersAdded[Users.UserCount] = new Users(FirstName, LastName, Email, Password);
            Users newUser = Users.usersAdded[Users.UserCount];




            insert.CommandText = "insert into [dbo].[User] (FirstName, LastName, Email, Password) " +
            "values(@FirstName, @LastName, @Email,@Password)";
            insert.Parameters.Add(new SqlParameter("@FirstName", newUser.getFirstName()));
            insert.Parameters.Add(new SqlParameter("@LastName", newUser.getLastName()));
            insert.Parameters.Add(new SqlParameter("@Email", newUser.getEmail()));
            insert.Parameters.Add(new SqlParameter("@Password", newUser.getPassword()));
        
            insert.ExecuteNonQuery();
        }
    }
    //Validate email format
    public static bool IsValidEmail(string email)
    {
        if (string.IsNullOrWhiteSpace(email))
            return false;

        try
        {
            // Normalize the domain
            email = Regex.Replace(email, @"(@)(.+)$", DomainMapper,
                                  RegexOptions.None, TimeSpan.FromMilliseconds(200));

            // Examines the domain part of the email and normalizes it.
            string DomainMapper(Match match)
            {
                // Use IdnMapping class to convert Unicode domain names.
                var idn = new IdnMapping();

                // Pull out and process domain name (throws ArgumentException on invalid)
                var domainName = idn.GetAscii(match.Groups[2].Value);

                return match.Groups[1].Value + domainName;
            }
        }
        catch (RegexMatchTimeoutException e)
        {
            return false;
        }
        catch (ArgumentException e)
        {
            return false;
        }

        try
        {
            return Regex.IsMatch(email,
                @"^(?("")("".+?(?<!\\)""@)|(([0-9a-z]((\.(?!\.))|[-!#\$%&'\*\+/=\?\^`\{\}\|~\w])*)(?<=[0-9a-z])@))" +
                @"(?(\[)(\[(\d{1,3}\.){3}\d{1,3}\])|(([0-9a-z][-0-9a-z]*[0-9a-z]*\.)+[a-z0-9][\-a-z0-9]{0,22}[a-z0-9]))$",
                RegexOptions.IgnoreCase, TimeSpan.FromMilliseconds(250));
        }
        catch (RegexMatchTimeoutException)
        {
            return false;
        }
    }
}