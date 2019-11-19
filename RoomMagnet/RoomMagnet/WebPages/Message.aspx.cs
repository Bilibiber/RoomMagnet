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
using System.Collections;
public partial class WebPages_Message : System.Web.UI.Page
{
    ArrayList ReceiverIDs = new ArrayList();
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ToString());
    int ReceiverID;
    int HostReceiverID;
    int RenterReceiverID;
    string SenderID;
    string ReceiverName = "";
    int OldConversationID = 0;
    int NewConversationID = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["SignInEmail"] == null)
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
       
        string PID = Session["ResultPropertyID"].ToString();
        if (Session["Roles"].ToString() == "Renter")
        {
            string sql = "SELECT  Users.FirstName, Users.LastName,Property.HostID FROM Users INNER JOIN Property ON Users.UserID = Property.HostID where Property.PropertyID =" + PID;
            SqlCommand sqlCommand = new SqlCommand(sql, cn);
            SqlDataReader dataReader = sqlCommand.ExecuteReader();
            if (dataReader.Read())
            {
                string fn = dataReader.GetString(0);
                string ln = dataReader.GetString(1);
                ReceiverName = fn + " " + ln;
                HostReceiverID = dataReader.GetInt32(2);
            }
            dataReader.Close();
            ReceiverLbl.Text = "You are sending message to : " + ReceiverName;
        }
        else
        {
            bool testConvo = true;
            int SenderID = 0;
            for (int i = 0; i < Conversation.ConversationCount; i++)
            {
                if (testConvo)
                {
                    if (Convert.ToInt32(Session["UserID"].ToString()) == Conversation.conversations[i].getRecieverID())
                    {
                        string sql9 = "Select SenderID, max(MessageID) as latestMessage, messageContent from Conversations inner join Message on Conversations.ConversationID = Message.ConversationID" +
                             " where ReceiverID= " + Session["UserID"].ToString() + " group by SenderID, MessageContent order by latestMessage asc ";
                        SqlCommand sqlCommand9 = new SqlCommand(sql9, cn);
                        SqlDataReader dataReader9 = sqlCommand9.ExecuteReader();
                        if (dataReader9.HasRows)
                        {
                            while (dataReader9.Read())
                            {
                                int tempSenderID = dataReader9.GetInt32(0);
                                if (tempSenderID != SenderID)
                                {
                                    if (ReceiverIDs.Contains(tempSenderID) == false)
                                    {
                                        ReceiverIDs.Add(dataReader9.GetInt32(0));
                                        Messages.Text += dataReader9.GetString(2) + Environment.NewLine;
                                        SenderID = dataReader9.GetInt32(0);
                                    }
                                }
                            }
                        }
                        testConvo = false;
                    }
                }
            }
            cn.Close();
                FillDropDown(ReceiverIDs);
                RenterNames.Visible = true;
            ReceiverLbl.Text = "You are sending message to : " + RenterNames.Text;


        }
        cn.Close();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        cn.Open();
        string SenderID2 = Session["UserID"].ToString();
        if (Session["Roles"].ToString() == "Renter")
        {


            string sql2 = "Select ConversationID FROM Conversations where SenderID=" + SenderID2 + "And ReceiverID=" + HostReceiverID;
            SqlCommand sqlCommand2 = new SqlCommand(sql2, cn);
            SqlDataReader reader = sqlCommand2.ExecuteReader();
            if (reader.Read())
            {
                OldConversationID = reader.GetInt32(0);
            }
            else
            {
                reader.Close();
                string sql3 = "Insert into Conversations values (@SenderId,@ReceiverID)";
                SqlCommand sqlCommand3 = new SqlCommand(sql3, cn);
                sqlCommand3.Parameters.AddWithValue("@SenderId", SenderID2);
                sqlCommand3.Parameters.AddWithValue("@ReceiverID", HostReceiverID);
                sqlCommand3.ExecuteNonQuery();
                //after instering finds the new conversation ID 
                Conversation newConvo = new Conversation(Int32.Parse(SenderID2), HostReceiverID);
                Conversation.conversations[Conversation.ConversationCount - 1] = newConvo;


                string sqlConvo = "Select ConversationID FROM Conversations where SenderID = " + SenderID2 + " AND ReceiverID = " + HostReceiverID;
                SqlCommand sqlCommand4 = new SqlCommand(sqlConvo, cn);
                SqlDataReader reader2 = sqlCommand4.ExecuteReader();
                if (reader2.Read())
                {
                    NewConversationID = reader2.GetInt32(0);
                    newConvo.setConversationID(NewConversationID);
                }
                reader2.Close();

            }
            reader.Close();
            string Sendername = Session["FullName"].ToString();
            string message = txtsend.Text;
            string my = Sendername + ":" + message;


            txtsend.Text = "";



      
            if (NewConversationID == 0)
            {
                string sql = "Insert into Message(ConversationID,MessageContent,LastUpdated,LastUpdatedBy) values (@ConversationID,@MessageContent,@LastUpdated,@LastUpdatedBy)";
                SqlCommand command = new SqlCommand(sql, cn);
                command.Parameters.AddWithValue("@ConversationID", OldConversationID);
                command.Parameters.AddWithValue("@MessageContent", my);
                command.Parameters.AddWithValue("@LastUpdated", DateTime.Now);
                command.Parameters.AddWithValue("@LastUpdatedBy", Sendername);
                command.ExecuteNonQuery();


            }
            else
            {
                string sqlMsg = "Insert into Message(ConversationID,MessageContent,LastUpdated,LastUpdatedBy) values (@ConversationID,@MessageContent,@LastUpdated,@LastUpdatedBy)";
                SqlCommand command2 = new SqlCommand(sqlMsg, cn);
                command2.Parameters.AddWithValue("@ConversationID", NewConversationID);
                command2.Parameters.AddWithValue("@MessageContent", my);
                command2.Parameters.AddWithValue("@LastUpdated", DateTime.Now);
                command2.Parameters.AddWithValue("@LastUpdatedBy", Sendername);
                NewConversationID = 0;
                command2.ExecuteNonQuery();


                
            }

        }
        else
        {
            int ConversationID = -1;
            RenterReceiverID = Int32.Parse(RenterNames.SelectedValue);
            string sql2 = "Select ConversationID FROM Conversations where SenderID=" + RenterReceiverID + "And ReceiverID=" + SenderID2;
            SqlCommand sqlCommand2 = new SqlCommand(sql2, cn);
            SqlDataReader reader = sqlCommand2.ExecuteReader();
            if (reader.Read())
            {
                ConversationID = reader.GetInt32(0);
            }
            reader.Close();
            string Sendername = Session["FullName"].ToString();
            string message = txtsend.Text;
            string my = Sendername + ":" + message;
            string sql = "Insert into Message(ConversationID,MessageContent,LastUpdated,LastUpdatedBy) values (@ConversationID,@MessageContent,@LastUpdated,@LastUpdatedBy)";
            SqlCommand command = new SqlCommand(sql, cn);
            command.Parameters.AddWithValue("@ConversationID", ConversationID);
            command.Parameters.AddWithValue("@MessageContent", my);
            command.Parameters.AddWithValue("@LastUpdated", DateTime.Now);
            command.Parameters.AddWithValue("@LastUpdatedBy", Sendername);
            command.ExecuteNonQuery();
             


        }
            cn.Close();



            Response.Redirect("Message.aspx");
        }
    

    protected void Clear_Click(object sender, EventArgs e)
    {
        Application["message"] = "";
        Response.Redirect("Message.aspx");
    }


    public void FillDropDown(ArrayList ReceiverIDs)
    {
        cn.Open();
        for (int i = 0; i < ReceiverIDs.Count; i++)
        {
            string sql = "Select FirstName, LastName from Users WHERE UserID=" + ReceiverIDs[i].ToString();
            SqlCommand sqlCommand = new SqlCommand(sql, cn);
            SqlDataReader reader3 = sqlCommand.ExecuteReader();
            if (reader3.HasRows)
            {
                while (reader3.Read())
                {
                    RenterNames.Items.Add(new ListItem ((reader3.GetString(0) + " " + reader3.GetString(1)),ReceiverIDs[i].ToString()));
                    
                }
            }
        }
        
        cn.Close();
    }

    protected void RenterNames_TextChanged(object sender, EventArgs e)
    {
        ReceiverLbl.Text = "You are sending message to: " + RenterNames.Text;
        
    }
}

