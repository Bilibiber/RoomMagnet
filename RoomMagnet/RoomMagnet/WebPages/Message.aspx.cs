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
    int ReceiverID;
    string SenderID;
    string ReceiverName = "";
    int OldConversationID=0;
    int NewConversationID=0;
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
        cn.Open();
        string msg = (string)Application["message"];
        txtmsg.Text = msg;
        Session["ResultPropertyID"] = 1003;
        string PID = Session["ResultPropertyID"].ToString();
        string sql = "SELECT        Users.FirstName, Users.LastName,Property.HostID FROM Users INNER JOIN Property ON Users.UserID = Property.HostID where Property.PropertyID ="+PID;
        SqlCommand sqlCommand = new SqlCommand(sql,cn);
        SqlDataReader dataReader = sqlCommand.ExecuteReader();
        if (dataReader.Read())
        {
            string fn = dataReader.GetString(0);
            string ln = dataReader.GetString(1);
            ReceiverName = fn + " " + ln;
            ReceiverID = dataReader.GetInt32(2);
        }
        SenderID = Session["UserID"].ToString();
        dataReader.Close();

        
        string sql2 = "Select ConversationID FROM Conversations where SenderID=" + SenderID + "ReceiverID=" + ReceiverID;
        SqlCommand sqlCommand2 = new SqlCommand(sql2,cn);
        SqlDataReader reader = sqlCommand2.ExecuteReader();
        if (dataReader.Read())
        {
            OldConversationID = reader.GetInt32(0);
        }
        else
        {
            reader.Close();
            string sql3 = "Insert into Conversations values (@SenderId,@ReceiverID)";
            SqlCommand sqlCommand3 = new SqlCommand(sql3,cn);
            sqlCommand3.ExecuteNonQuery();
            //after instering finds the new conversation ID 

            string sql4 = "Select ConversationID FROM Conversations where SenderID = " + SenderID + "ReceiverID = " + ReceiverID;
            SqlCommand sqlCommand4 = new SqlCommand(sql4, cn);
            SqlDataReader reader2 = sqlCommand4.ExecuteReader();
            if (reader2.Read())
            {
                NewConversationID = reader2.GetInt32(0);
            }
            reader2.Close();

        }
        reader.Close();
        cn.Close();
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
            if (NewConversationID==0)
            {
                string sql = "Insert into Message(ConversationID,MessageContent,LastUpdated,LastUpdatedBy) values (@ConversationID,@MessageContent,@LastUpdated,@LastUpdatedBy)";
                SqlCommand command = new SqlCommand(sql, cn);
                command.Parameters.AddWithValue("@ConversationID", OldConversationID);
                command.Parameters.AddWithValue("@MessageContent", my);
                command.Parameters.AddWithValue("@LastUpdated", DateTime.Now);
                command.Parameters.AddWithValue("@LastUpdatedBy", Sendername);
            }
           
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

