using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;


public partial class WebPages_Contact : System.Web.UI.Page
{

    private MailMessage mail = new MailMessage();
    private string body;

    protected void Page_Load(object sender, EventArgs e)
    {
        EmailUtility.SendEmail("roommagnetofficial@gmail.com", "Help", body);
        //email body, html tag friendly
        string emailstring =
            @"<html>
            <body>
            <p>balabala</p>
            </body>
            </html>";
        mail.IsBodyHtml = true;
        mail.Body = emailstring;
    }
}