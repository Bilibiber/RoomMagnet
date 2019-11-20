using System;
using System.Collections;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebPages_Message : System.Web.UI.Page
{
    private ArrayList ReceiverIDs = new ArrayList();
    private SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ToString());
    private int ReceiverID;
    private int HostReceiverID;
    private int RenterReceiverID;
    private string SenderID;
    private string ReceiverName = "";
    private int OldConversationID = 0;
    private int NewConversationID = 0;

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
        //string msg = (string)Application["message"];
        //txtmsg.Text = msg;

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
            string sql2 = "Select messageContent from Conversations inner join Message on Conversations.ConversationID = Message.ConversationID" +
            " where (SenderID = " + Session["UserID"].ToString() + ") and (ReceiverID = " + HostReceiverID + ")";

            SqlCommand sqlCommand2 = new SqlCommand(sql2, cn);
            SqlDataReader reader = sqlCommand2.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    Messages.Text += reader.GetString(0) + Environment.NewLine;
                }
            }
        }
        else
        {
            string sql = "Select SenderID, ReceiverID, ConversationID from Conversations";
            SqlCommand sqlCommand5 = new SqlCommand(sql, cn);
            SqlDataReader dataReader2 = sqlCommand5.ExecuteReader();
            if (dataReader2.HasRows)
            {
                while (dataReader2.Read())
                {
                    Conversation newConvo = new Conversation();
                    newConvo.setSenderID(dataReader2.GetInt32(0));
                    newConvo.setRecieverID(dataReader2.GetInt32(1));
                    newConvo.setConversationID(dataReader2.GetInt32(2));
                    Conversation.conversations[Conversation.ConversationCount - 1] = newConvo;
                }
            }
            dataReader2.Close();
            bool testConvo = true;
            ReceiverIDs.Clear();
            int SenderID = 0;
            Messages.Text = String.Empty;
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
            ReceiverLbl.Text = "You are sending a message to : " + RenterNames.Text;
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
            Messages.Text += my + Environment.NewLine;
        }
        else
        {
            int ConversationID = -1;
            string tempName = RenterNames.SelectedItem.ToString();
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

            string sql4 = "Select messageContent from Conversations inner join Message on Conversations.ConversationID = Message.ConversationID" +
           " where (SenderID = " + RenterNames.SelectedValue + ") and (ReceiverID = " + Session["UserID"].ToString() + ")";
            SqlCommand sqlCommand = new SqlCommand(sql4, cn);
            SqlDataReader reader4 = sqlCommand.ExecuteReader();
            Messages.Text = String.Empty;
            if (reader4.HasRows)
            {
                while (reader4.Read())
                {
                    Messages.Text += reader4.GetString(0) + Environment.NewLine;
                }
            }
            ReceiverLbl.Text = "You are sending a message to: " + tempName;
        }

        cn.Close();

        //Response.Redirect("Message.aspx");
    }

    public void FillDropDown(ArrayList ReceiverIDs)
    {
        if (RenterNames.Items.Count != ReceiverIDs.Count + 1)
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
                        RenterNames.Items.Add(new ListItem((reader3.GetString(0) + " " + reader3.GetString(1)), ReceiverIDs[i].ToString()));
                    }
                }
            }
            cn.Close();
        }
    }

    protected void RenterNames_TextChanged(object sender, EventArgs e)
    {
        if (RenterNames.SelectedValue != "No One")
        {
            Messages.Text = String.Empty;
            ReceiverLbl.Text = "You are sending a message to: " + RenterNames.SelectedItem;
            string sql = "Select messageContent from Conversations inner join Message on Conversations.ConversationID = Message.ConversationID" +
                " where (SenderID = " + RenterNames.SelectedValue + ") and (ReceiverID = " + Session["UserID"].ToString() + ")";
            cn.Open();
            SqlCommand sqlCommand = new SqlCommand(sql, cn);
            SqlDataReader reader = sqlCommand.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    Messages.Text += reader.GetString(0) + Environment.NewLine;
                }
            }
            cn.Close();
        }
    }
}