using System;
using System.Net.Mail;

public partial class WebPages_Contact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object Sender, EventArgs e)
    {
        try
        {
            if (Page.IsValid)
            {
                string EmailBox = EmailBox.Text;
                string NameBox = NameBox.Text;
                string ContactMessageBox = ContactMessageBox.Text;
                string body = String.Format("<h5>  Hello,</h5>", name);
                body += "<p>Thank you for contacting us!</p>";

                EmailUtility.SendEmail(EmailBox, "Contact Room Magnet", body);


                txtName.Enabled = false;
                txtEmail.Enabled = false;
                txtComments.Enabled = false;
                txtSubject.Enabled = false;
                Button1.Enabled = false;
            }
        }
        catch (Exception ex)
        {
            
            //Label1.ForeColor = System.Drawing.Color.Red;
            //Label1.Text = "There is an unkwon problem. Please try later";
        }

    }

}