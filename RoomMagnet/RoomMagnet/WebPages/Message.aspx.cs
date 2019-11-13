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
using System.Data.SqlClient;
using System.Configuration;

public partial class WebPages_Message : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["SingInEmail"] == null)
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
        string receiverID = Session["ResultPropertyID"].ToString();

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string Sendername = Session["FullName"].ToString();
        string message = txtsend.Text;
        string my = Sendername + ":" +message;

        Application["message"] = Application["message"] + my + Environment.NewLine;
        txtsend.Text = "";
        

        try
        {
            cn.Open();
            string sql = "Insert int to Message(ConversationID,MessageContent,LastUpdated,LastUpdatedBy) values (@ConversationID,@MessageContent,@LastUpdated,@LastUpdatedBy)";
            SqlCommand command = new SqlCommand(sql, cn);
        }
        catch
        {

        }
        Response.Redirect("Message.aspx");
    }
    protected void Clear_Click(object sender, EventArgs e)
    {
        Application["message"] = "";
        Response.Redirect("Message.aspx");
    }
}

