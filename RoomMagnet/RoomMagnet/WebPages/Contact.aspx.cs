using System;
using System.Web;
using System.Web.UI;
using System.Windows.Forms;


public partial class WebPages_Contact : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["SignInEmail"] == null)
        {
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openLoginModal();", true);
        }
        else
        {
            var master = Master as RoomMagnet;
            master.AfterLogin();
        }
    }




    public void SendEmail_OnClick(Object sender, EventArgs e)
    {
        string name = HttpUtility.HtmlEncode(Name.Text);
        string email = HttpUtility.HtmlEncode(Email.Text);
        string message = HttpUtility.HtmlEncode(Message.Text);
        string body = "";

        body += String.Format("Thank you for contacting us, {0}", name);
        body += "<p>Your Message: </p>";
        body += String.Format("<p>{0}</p>", message);

        EmailUtility.SendEmail(email, "RoomMagnet Contact", body);


    }
}