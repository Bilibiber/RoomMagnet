using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;

/// <summary>
/// Summary description for SendEmail
/// </summary>
public class EmailUtility
{

    public static readonly string FROMEMAILADDRESS = "roommagnetofficial@gmail.com";
    public static readonly string FROMEMAILPASSWORD = "CIS484roommagnet";
    public static readonly string GMAILSMTP = "smtp.gmail.com";
    public static readonly int GMAILSMTPPORT = 587;
    

    public static void SendEmail(string email, string subject, string body)
    {
        MailMessage mail = new MailMessage();
        SmtpClient smtpClient = new SmtpClient(GMAILSMTP, GMAILSMTPPORT);


        mail.From = new MailAddress(FROMEMAILADDRESS, FROMEMAILPASSWORD);
        // where we send out the email
        mail.To.Add(email);
        //email subject
        mail.Subject = subject;
        // email body, html tag friendly
        mail.IsBodyHtml = true;
        mail.Body = body; ;

        smtpClient.Credentials = new System.Net.NetworkCredential(FROMEMAILADDRESS, FROMEMAILPASSWORD);
        smtpClient.EnableSsl = true;
        //Send out email via gmail server
        smtpClient.Send(mail);
    }

    public static void SendWelcomeEmail()
    {
        SendEmail("toperson@gmail", "Welcome", "<h1>welcome</h1>");
    }

    
}