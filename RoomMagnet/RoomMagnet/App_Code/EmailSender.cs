using System.Net.Mail;

/// <summary>
/// Summary description for Email
/// </summary>
public class EmailSender
{
    // Our Email
    //Upcase
    public const string FromEmailAddress = "roommagnetofficial@gmail.com";

    public const string FromEmailPassword = "CIS484roommagnet";

    // not useful rn
    private string ToEmailAddress;

    // server name and port to connect gmail server
    public const string GmailSmtp = "smtp.gmail.com";

    public const int GmailSmtpPort = 587;

    // a object where we can formate our email contents
    private MailMessage mail = new MailMessage();

    // Enable the connectiong from website to email server
    private SmtpClient smtpClient = new SmtpClient(GmailSmtp, GmailSmtpPort);

    public EmailSender()
    {

    }

    // Welcome email method
    public void SendWelcomeMail(string EnteredEmailAddress, string Welcomemailstring)
    {
        mail.From = new MailAddress(FromEmailAddress);
        // where we send out the email
        mail.To.Add(EnteredEmailAddress);
        //email subject
        mail.Subject = "Welcome to RoomMagnet";
        // email body, html tag friendly
  
      
            
        mail.IsBodyHtml = true;
        mail.Body = Welcomemailstring;

        smtpClient.Credentials = new System.Net.NetworkCredential(FromEmailAddress, FromEmailPassword);
        smtpClient.EnableSsl = true;
        //Send out email via gmail server
        //smtpClient.Send(mail);
    }
    public void SendCode(string EnteredEmailAddress, string emailbody)
    {
        mail.From = new MailAddress(FromEmailAddress);
        // where we send out the email
        mail.To.Add(EnteredEmailAddress);
        //email subject
        mail.Subject = "Welcome to RoomMagnet";
        // email body, html tag friendly



        mail.IsBodyHtml = true;
        mail.Body = emailbody;

        smtpClient.Credentials = new System.Net.NetworkCredential(FromEmailAddress, FromEmailPassword);
        smtpClient.EnableSsl = true;
        smtpClient.Send(mail);
    }
    // to be continue........
    //Fan Guo
}