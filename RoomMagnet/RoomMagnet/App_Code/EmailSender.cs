using System.Net.Mail;
/// <summary>
/// Summary description for Email
/// </summary>
public class Email
{
    public const string FromEmailAddress = "roommagnetofficial@gmail.com";
    public const string FromEmailPassword = "@a1S2d3F4";
    public string ToEmailAddress;
    public const string GmailSmtp = "smtp.gmail.com";
    public const int GmailSmtpPort = 587;
    MailMessage mail = new MailMessage();
    SmtpClient smtpClient = new SmtpClient(GmailSmtp, GmailSmtpPort);
    public Email(string EmailAddress)
    {
        this.ToEmailAddress = EmailAddress;
    }
    public void SendWelcomeMail(string EnteredEmailAddress)
    {
        mail.From = new MailAddress(FromEmailAddress);
        mail.To.Add(EnteredEmailAddress);
        mail.Subject = "Welcome to RoomMagnet";
        mail.Body = "Testing Email function";

        smtpClient.Credentials = new System.Net.NetworkCredential(FromEmailAddress, FromEmailPassword);
        smtpClient.EnableSsl = true;
        smtpClient.Send(mail);
    }
}

