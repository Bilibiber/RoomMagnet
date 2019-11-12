using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

public partial class WebPages_Message : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["FullName"] == null)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openLoginModal();", true);
        }
        else
        {
            var master = Master as RoomMagnet;
            master.AfterLogin();
        }

        string msg = (string)Application["message"];
        txtmsg.Text = msg;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string name = Session["FullName"].ToString();
        string message = txtsend.Text;
        string my = name + ":" +message;

        Application["message"] = Application["message"] + my + Environment.NewLine;
        txtsend.Text = "";
        
    }
    protected void Clear_Click(object sender, EventArgs e)
    {
        Application["message"] = "";
    }
}

