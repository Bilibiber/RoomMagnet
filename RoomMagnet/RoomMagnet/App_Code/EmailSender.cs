using System.Net.Mail;
/// <summary>
/// Summary description for Email
/// </summary>
public class Email
{
    // Our Email 
    public const string FromEmailAddress = "roommagnetofficial@gmail.com";
    public const string FromEmailPassword = "@a1S2d3F4";
    // not useful rn
    private string ToEmailAddress;
    // server name and port to connect gmail server
    public const string GmailSmtp = "smtp.gmail.com";
    public const int GmailSmtpPort = 587;
    // a object where we can formate our email contents
    MailMessage mail = new MailMessage();
    // Enable the connectiong from website to email server
    SmtpClient smtpClient = new SmtpClient(GmailSmtp, GmailSmtpPort);
    
    public Email(string EmailAddress)
    {
        this.ToEmailAddress = EmailAddress;
    }
    // Welcome email method
    public void SendWelcomeMail(string EnteredEmailAddress)
    {
        mail.From = new MailAddress(FromEmailAddress);
        // where we send out the email
        mail.To.Add(EnteredEmailAddress);
        //email subject
        mail.Subject = "Welcome to RoomMagnet";
        // email body, html tag friendly
        string welcomemailstring = 
            @"<html>
            <body>
            <p>balabala</p>                     
            </body>
            </html>";
        mail.IsBodyHtml = true;
        mail.Body = welcomemailstring;

        smtpClient.Credentials = new System.Net.NetworkCredential(FromEmailAddress, FromEmailPassword);
        smtpClient.EnableSsl = true;
        //Send out email via gmail server
        smtpClient.Send(mail);
    }
    // to be continue........
}

