using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebPages_Host : System.Web.UI.Page
{
    private SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ToString());
    private ArrayList RatingsPID = new ArrayList();
    private ArrayList tempimages = new ArrayList();

    private ArrayList ReceiverIDs = new ArrayList();
    private int ReceiverID;
    private int HostReceiverID;
    private int RenterReceiverID;
    private string SenderID;
    private string ReceiverName = "";
    private int OldConversationID = 0;
    private int NewConversationID = 0;

    private ArrayList RequestIDs = new ArrayList();
    private ArrayList RenterEmails = new ArrayList();



    protected void Page_Load(object sender, EventArgs e)
    {
        errorLabel.Visible = false;
        if (Session["SignInEmail"] == null)
        {
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openLoginModal();", true);
            //ScriptManager.RegisterStartupScript(Master, Master.GetType(), "Pop", "openLoginModal();",true);
        }
        else
        {
            var master = Master as RoomMagnet;
            master.AfterLogin();
        }

        int userid = Convert.ToInt32(Session["UserID"]);
        Property1Space.Visible = false;
        Property2Space.Visible = false;
        Property3Space.Visible = false;

        

        if (!IsPostBack)
        {
            cn.Open();
            System.Data.SqlClient.SqlCommand selectimg = new System.Data.SqlClient.SqlCommand();
            selectimg.Connection = cn;
           
            selectimg.CommandText = "select [ImagePath] from [RoomMagnet].[dbo].[Users] where [UserID] =@UserID";
            selectimg.Parameters.Add(new SqlParameter("@UserID", userid));
            SqlDataReader getimg = selectimg.ExecuteReader();
            while (getimg.Read())
            {
                if (getimg[0].ToString() != "Null")
                {
                    if (!Convert.IsDBNull(getimg[0]))
                    {
                        byte[] img = (byte[])getimg[0];
                        Session["ImagePath"] = getimg[0].ToString();
                        imgpreview.ImageUrl = "data:image;base64," + Convert.ToBase64String(img);
                    }
                    else
                    {
                        imgpreview.ImageUrl = "http://cliquecities.com/assets/no-image-e3699ae23f866f6cbdf8ba2443ee5c4e.jpg";
                    }
                }
                else
                {
                    imgpreview.ImageUrl = "http://cliquecities.com/assets/no-image-e3699ae23f866f6cbdf8ba2443ee5c4e.jpg";
                }
            }

            getimg.Close();
            cn.Close();
        }


        
      
       
        string status = Session["Verified"].ToString().ToUpper();
        userstatus.Text = status;
        if (status.ToString() == "VERIFIED")
        {
            userstatus.BackColor = System.Drawing.Color.Green;
        }
        else
        {
            userstatus.BackColor = System.Drawing.Color.FromArgb(189, 32, 38);
        }

        if (!IsPostBack)
        {
            SqlConnection db = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ToString());
            db.Open();
            System.Data.SqlClient.SqlCommand selectuser = new System.Data.SqlClient.SqlCommand();
            selectuser.Connection = db;         
            selectuser.CommandText = "select [FirstName], [Gender], [Occupation], [Description] from [RoomMagnet].[dbo].[Users] where [UserID] =@UserID";
            selectuser.Parameters.Add(new SqlParameter("@UserID", userid));
            SqlDataReader getinfor = selectuser.ExecuteReader();
            while (getinfor.Read())
            {
                hellow.Text = "Hello, " + getinfor.GetString(0);
                if (!getinfor.IsDBNull(1))
                {
                    userGender.Text = getinfor.GetString(1);
                }
                if (!getinfor.IsDBNull(2))
                {
                    userOccu.Text = getinfor.GetString(2);
                }
                if (!getinfor.IsDBNull(3))
                {
                    userDes.Text = getinfor.GetString(3);
                }
            }
            getinfor.Close();
            db.Close();
        }
        cn.Open();
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
                    dataReader9.Close();
                    testConvo = false;
                }
            }
        }
        cn.Close();
        if (ReceiverIDs.Count > 0)
        {
            FillDropDown(ReceiverIDs);
            RenterNames.Visible = true;

        }
        else
        {
            errorLabel.Text = "No messages from Renters";
            errorLabel.Visible = true;
        }
        
       
    }

    public static List<string> objcountries()
    {
        List<string> objcountries = new List<string>();
        CultureInfo[] objculture = CultureInfo.GetCultures(CultureTypes.SpecificCultures);
        foreach (CultureInfo getculture in objculture)
        {
            RegionInfo objregion = new RegionInfo(getculture.LCID);
            string ss = getculture.DisplayName;
            if (!(objcountries.Contains(objregion.EnglishName)))
            {
                objcountries.Add(objregion.EnglishName);
            }
        }
        objcountries.Sort();
        return objcountries;
    }

    protected void hostProfile_Click(object sender, EventArgs e)
    {
        panelprofile.Visible = true;
        panelfavorites.Visible = false;
        panelconnections.Visible = false;
        panelmessage.Visible = false;
        hostprofile.BackColor = System.Drawing.Color.FromArgb(84, 84, 84);
        hostproperty.BackColor = System.Drawing.Color.FromArgb(51, 51, 51);
        hostConnections.BackColor = System.Drawing.Color.FromArgb(51, 51, 51);
        hostMessage.BackColor = System.Drawing.Color.FromArgb(51, 51, 51);
    }

    protected void hostproperty_Click(object sender, EventArgs e)
    {
        panelprofile.Visible = false;
        panelfavorites.Visible = true;
        panelconnections.Visible = false;
        panelmessage.Visible = false;
        hostprofile.BackColor = System.Drawing.Color.FromArgb(51, 51, 51);
        hostproperty.BackColor = System.Drawing.Color.FromArgb(84, 84, 84);
        hostConnections.BackColor = System.Drawing.Color.FromArgb(51, 51, 51);
        hostMessage.BackColor = System.Drawing.Color.FromArgb(51, 51, 51);

        string sql = "Select Title, City, HomeState, ZipCode, AvailableBedrooms, RentPrice, StartDate, EndDate, AvailableBathrooms,PropertyID,PropertyID from[Property] WHERE hostid = " + Session["UserID"];
        cn.Open();
        SqlCommand search = new SqlCommand(sql, cn);
        SqlDataReader reader = search.ExecuteReader();
        int resultCount = 0;
        if (reader.HasRows)
        {
            while (reader.Read())
            {
                resultCount++;
                decimal x;
                string y;
                if (resultCount == 1)
                {
                    RatingsPID.Add(reader.GetInt32(10));
                    Session["pid1"] = reader.GetInt32(10);
                    x = reader.GetDecimal(5);
                    y = String.Format("{0:0.##}", x);
                    Property1Title.Text = reader.GetString(0);
                    Property1Title.Visible = true;
                    Property1RentPrice.Text = "$" + y + "/Month";
                    Property1RentPrice.Visible = true;
                    Property1CityState.Text = reader.GetString(1) + "," + reader.GetString(2);
                    Property1CityState.Visible = true;
                    Property1Bath.Text = reader.GetInt32(8).ToString() + " Bathroom";
                    Property1Bed.Text = reader.GetInt32(4).ToString() + " Bed";
                    Property1StartDate.Text = "Start Date: " + reader.GetDateTime(6).ToShortDateString();
                    Property1EndDate.Text = "End Date: " + reader.GetDateTime(7).ToShortDateString();

                    int pid = reader.GetInt32(10);
                    System.Data.SqlClient.SqlCommand selectimg = new System.Data.SqlClient.SqlCommand();
                    selectimg.Connection = cn;
                    selectimg.CommandText = "Select ImagePath from [ImagePath] WHERE PropertyID = @pid";
                    selectimg.Parameters.Add(new SqlParameter("@pid", pid));
                    SqlDataReader getinfor = selectimg.ExecuteReader();
                    while (getinfor.Read())
                    {
                        byte[] images1 = (byte[])getinfor[0];
                        Property1Image.ImageUrl = "data:image;base64," + Convert.ToBase64String(images1);
                        Property1Image.Width = new System.Web.UI.WebControls.Unit("200px");
                        Property1Image.Height = new System.Web.UI.WebControls.Unit("200px");

                        Property1Image.Visible = true;
                    }
                    getinfor.Close();
                    Property1Space.Visible = true;
                }

                if (resultCount == 2)
                {
                    RatingsPID.Add(reader.GetInt32(10));
                    Session["pid2"] = reader.GetInt32(10);
                    x = reader.GetDecimal(5);
                    y = String.Format("{0:0.##}", x);
                    Property2Title.Text = reader.GetString(0);
                    Property2Title.Visible = true;
                    Property2RentPrice.Text = "$" + y + "/Month";
                    Property2RentPrice.Visible = true;
                    Property2CityState.Text = reader.GetString(1) + "," + reader.GetString(2);
                    Property2CityState.Visible = true;
                    Property2Bath.Text = reader.GetInt32(8).ToString() + " Bathroom";
                    Property2Bed.Text = reader.GetInt32(4).ToString() + " Bed";
                    Property2StartDate.Text = "Start Date: " + reader.GetDateTime(6).ToShortDateString();
                    Property2EndDate.Text = "End Date: " + reader.GetDateTime(7).ToShortDateString();

                    int pid = reader.GetInt32(10);
                    System.Data.SqlClient.SqlCommand selectimg = new System.Data.SqlClient.SqlCommand();
                    selectimg.Connection = cn;
                    selectimg.CommandText = "Select ImagePath from [ImagePath] WHERE PropertyID = @pid";
                    selectimg.Parameters.Add(new SqlParameter("@pid", pid));
                    SqlDataReader getinfor = selectimg.ExecuteReader();
                    while (getinfor.Read())
                    {
                        byte[] images2 = (byte[])getinfor[0];
                        Property2Image.ImageUrl = "data:image;base64," + Convert.ToBase64String(images2);
                        Property2Image.Width = new System.Web.UI.WebControls.Unit("200px");
                        Property2Image.Height = new System.Web.UI.WebControls.Unit("200px");
                        Property2Image.Visible = true;
                    }
                    getinfor.Close();
                    Property2Space.Visible = true;
                }
                if (resultCount == 3)
                {
                    RatingsPID.Add(reader.GetInt32(10));
                    Session["pid3"] = reader.GetInt32(10);
                    x = reader.GetDecimal(5);
                    y = String.Format("{0:0.##}", x);
                    Property3Title.Text = reader.GetString(0);
                    Property3Title.Visible = true;
                    Property3RentPrice.Text = "$" + y + "/Month";
                    Property3RentPrice.Visible = true;
                    Property3CityState.Text = reader.GetString(1) + "," + reader.GetString(2);
                    Property3CityState.Visible = true;
                    Property3Bath.Text = reader.GetInt32(8).ToString() + " Bathroom";
                    Property3Bed.Text = reader.GetInt32(4).ToString() + " Bed";
                    Property3StartDate.Text = "Start Date: " + reader.GetDateTime(6).ToShortDateString();
                    Property3EndDate.Text = "End Date: " + reader.GetDateTime(7).ToShortDateString();

                    int pid = reader.GetInt32(10);
                    System.Data.SqlClient.SqlCommand selectimg = new System.Data.SqlClient.SqlCommand();
                    selectimg.Connection = cn;
                    selectimg.CommandText = "Select ImagePath from [ImagePath] WHERE PropertyID = @pid";
                    selectimg.Parameters.Add(new SqlParameter("@pid", pid));
                    SqlDataReader getinfor = selectimg.ExecuteReader();
                    while (getinfor.Read())
                    {
                        byte[] images3 = (byte[])getinfor[0];
                        Property3Image.ImageUrl = "data:image;base64," + Convert.ToBase64String(images3);
                        Property3Image.Width = new System.Web.UI.WebControls.Unit("200px");
                        Property3Image.Height = new System.Web.UI.WebControls.Unit("200px");
                        Property3Image.Visible = true;
                    }
                    getinfor.Close();
                    Property3Space.Visible = true;
                }
            }
        }
        reader.Close();
        for (int i = 0; i < RatingsPID.Count; i++)
        {
            string RatingSQL = "Select NumStars from [Rating] where PropertyID =" + RatingsPID[i];
            SqlCommand Ratingsearch = new SqlCommand(RatingSQL, cn);
            SqlDataReader readers = Ratingsearch.ExecuteReader();
            decimal RatingSum = 0;
            int RatingCount = 0;
            int RatingRecordCount = 0;
            if (readers.HasRows)
            {
                while (readers.Read())
                {
                    RatingSum += readers.GetDecimal(0);
                    RatingRecordCount++;
                }
            }
            if (RatingRecordCount == 0)
            {
                return;
            }
            if (RatingCount == 0)
            {
                if (Math.Round((RatingSum / RatingRecordCount), 1) != 0)
                {
                    Property1Rating.Text = Math.Round((RatingSum / RatingRecordCount), 1).ToString();
                    rating1.Visible = true;
                }
                
            }
            if (RatingCount == 1)
            {
                if (Math.Round((RatingSum / RatingRecordCount), 1) != 0)
                {
                    Property2Rating.Text = Math.Round((RatingSum / RatingRecordCount), 1).ToString();
                    rating2.Visible = true;
                }

            }
            if (RatingCount == 2)
            {
                if (Math.Round((RatingSum / RatingRecordCount), 1) != 0)
                {
                    Property3Rating.Text = Math.Round((RatingSum / RatingRecordCount), 1).ToString();
                    rating3.Visible = true;
                }

            }
            RatingCount++;
            readers.Close();
        }
        RatingsPID.Clear();
        cn.Close();
    }

    protected void hostConnections_Click(object sender, EventArgs e)
    {
        panelprofile.Visible = false;
        panelfavorites.Visible = false;
        panelconnections.Visible = true;
        panelmessage.Visible = false;
        hostprofile.BackColor = System.Drawing.Color.FromArgb(51, 51, 51);
        hostproperty.BackColor = System.Drawing.Color.FromArgb(51, 51, 51);
        hostConnections.BackColor = System.Drawing.Color.FromArgb(84, 84, 84);
        hostMessage.BackColor = System.Drawing.Color.FromArgb(51, 51, 51);

        int userid = Convert.ToInt32(Session["UserID"]);
        cn.Open();
        int requestcount = 0;
        string requestsql = "SELECT        Requests.RequestStatus, Requests.Request, Requests.RequestID, Users.Email FROM Users " +
            "INNER JOIN Requests ON Users.UserID = Requests.RoomRenterID" +
            " Where Requests.PropertyHostID = @HostID and (RequestStatus= \'Pending\')";
        SqlCommand requestsqlcommand = new SqlCommand(requestsql, cn);
        requestsqlcommand.Parameters.AddWithValue("@HostID", userid);
        SqlDataReader requestReader = requestsqlcommand.ExecuteReader();

        if (requestReader.HasRows)
        {
            while (requestReader.Read())
            {
                    if (requestcount == 0)
                    {
                        request1.Visible = true;
                        request1des.Text = requestReader.GetString(1);
                        RequestIDs.Add(requestReader.GetInt32(2));
                        RenterEmails.Add(requestReader.GetString(3));
                    }
                    if (requestcount == 1)
                    {
                        request2.Visible = true;
                        request2des.Text = requestReader.GetString(1);
                        RequestIDs.Add(requestReader.GetInt32(2));
                        RenterEmails.Add(requestReader.GetString(3));
                    }
                    if (requestcount == 2)
                    {
                        request3.Visible = true;
                        request3des.Text = requestReader.GetString(1);
                        RequestIDs.Add(requestReader.GetInt32(2));
                        RenterEmails.Add(requestReader.GetString(3));
                    }
                    if (requestcount == 3)
                    {
                        request4.Visible = true;
                        request4des.Text = requestReader.GetString(1);
                        RequestIDs.Add(requestReader.GetInt32(2));
                        RenterEmails.Add(requestReader.GetString(3));
                    }
                    if (requestcount == 4)
                    {
                        request5.Visible = true;
                        request5des.Text = requestReader.GetString(1);
                        RequestIDs.Add(requestReader.GetInt32(2));
                        RenterEmails.Add(requestReader.GetString(3));
                    }
                
                requestcount++;
            }
        }
        else
        {
            RequestHeader.Text = "No Pending Requests";
        }
        ViewState["RequestIDarray"] = RequestIDs;
        ViewState["RenterEmails"] = RenterEmails;
        requestReader.Close();
        cn.Close();
    }

    protected void hostMessage_Click(object sender, EventArgs e)
    {
        panelprofile.Visible = false;
        panelfavorites.Visible = false;
        panelconnections.Visible = false;
        panelmessage.Visible = true;
        hostprofile.BackColor = System.Drawing.Color.FromArgb(51, 51, 51);
        hostproperty.BackColor = System.Drawing.Color.FromArgb(51, 51, 51);
        hostConnections.BackColor = System.Drawing.Color.FromArgb(51, 51, 51);
        hostMessage.BackColor = System.Drawing.Color.FromArgb(84, 84, 84);
    }

    protected void editprofile_Click(object sender, EventArgs e)
    {
        Response.Redirect("Setting.aspx");
    }

    protected void addproperty_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddProperty.aspx");
    }

    protected void Property1Image_Click(object sender, ImageClickEventArgs e)
    {
        cn.Open();
        string sql = "Select PropertyID,ImagePath from [ImagePath] where PropertyID = " + Int32.Parse(Session["pid1"].ToString());
        SqlCommand search = new SqlCommand(sql, cn);
        SqlDataReader reader = search.ExecuteReader();

        if (reader.HasRows)
        {
            while (reader.Read())
            {
                byte[] images = (byte[])reader[1];
                int PropertyID = reader.GetInt32(0);
                if (images == null)
                {
                    return;
                }
                else
                {
                    string CmprImageURL = "data:image;base64," + Convert.ToBase64String(images);
                    if (CmprImageURL == Property1Image.ImageUrl)
                    {
                        Session["ResultPropertyID"] = PropertyID;
                    }
                }
            }
        }
        cn.Close();
        Response.Redirect("PropertyInfo.aspx");
    }

    protected void Property2Image_Click(object sender, ImageClickEventArgs e)
    {
        cn.Open();
        string sql = "Select PropertyID,ImagePath from [ImagePath] where PropertyID = " + Int32.Parse(Session["pid2"].ToString());
        SqlCommand search = new SqlCommand(sql, cn);
        SqlDataReader reader = search.ExecuteReader();

        if (reader.HasRows)
        {
            while (reader.Read())
            {
                byte[] images = (byte[])reader[1];
                int PropertyID = reader.GetInt32(0);
                if (images == null)
                {
                    return;
                }
                else
                {
                    string CmprImageURL = "data:image;base64," + Convert.ToBase64String(images);
                    if (CmprImageURL == Property2Image.ImageUrl)
                    {
                        Session["ResultPropertyID"] = PropertyID;
                    }
                }
            } 
        }
        cn.Close();
        Response.Redirect("PropertyInfo.aspx");
    }

    protected void Property3Image_Click(object sender, ImageClickEventArgs e)
    {
        cn.Open();
        string sql = "Select PropertyID,ImagePath from [ImagePath] where PropertyID = "  + Int32.Parse(Session["pid3"].ToString());
        SqlCommand search = new SqlCommand(sql, cn);
        SqlDataReader reader = search.ExecuteReader();

        if (reader.HasRows)
        {
            while (reader.Read())
            {
                byte[] images = (byte[])reader[1];
                int PropertyID = reader.GetInt32(0);
                if (images == null)
                {
                    return;
                }
                else
                {
                    string CmprImageURL = "data:image;base64," + Convert.ToBase64String(images);
                    if (CmprImageURL == Property3Image.ImageUrl)
                    {
                        Session["ResultPropertyID"] = PropertyID;
                    }
                }
            }
        }
        cn.Close();
        Response.Redirect("PropertyInfo.aspx");
    }



    protected void updateproperty1_Click(object sender, EventArgs e)
    {
        cn.Open();
        string sql = "SELECT [PropertyID] FROM [RoomMagnet].[dbo].[Property] where title =@title and city +','+ [HomeState] =@citystate";
        SqlCommand search = new SqlCommand(sql, cn);
        search.Parameters.Add(new SqlParameter("@title", Property1Title.Text));
        search.Parameters.Add(new SqlParameter("@citystate", Property1CityState.Text));
        SqlDataReader reader = search.ExecuteReader();

        if (reader.HasRows)
        {
            while (reader.Read())
            {
                Session["updatepropertyID"] = reader.GetInt32(0);
            }
        }
        cn.Close();
        Response.Redirect("UpdateProperty.aspx");
    }

    protected void updateproperty2_Click(object sender, EventArgs e)
    {
        cn.Open();
        string sql = "SELECT [PropertyID] FROM [RoomMagnet].[dbo].[Property] where title =@title and city +','+ [HomeState] =@citystate";
        SqlCommand search = new SqlCommand(sql, cn);
        search.Parameters.Add(new SqlParameter("@title", Property2Title.Text));
        search.Parameters.Add(new SqlParameter("@citystate", Property2CityState.Text));
        SqlDataReader reader = search.ExecuteReader();

        if (reader.HasRows)
        {
            while (reader.Read())
            {
                Session["updatepropertyID"] = reader.GetInt32(0);
            }
        }
        cn.Close();
        Response.Redirect("UpdateProperty.aspx");
    }

    protected void updateproperty3_Click(object sender, EventArgs e)
    {
        cn.Open();
        string sql = "SELECT [PropertyID] FROM [RoomMagnet].[dbo].[Property] where title =@title and city +','+ [HomeState] =@citystate";
        SqlCommand search = new SqlCommand(sql, cn);
        search.Parameters.Add(new SqlParameter("@title", Property3Title.Text));
        search.Parameters.Add(new SqlParameter("@citystate", Property3CityState.Text));
        SqlDataReader reader = search.ExecuteReader();

        if (reader.HasRows)
        {
            while (reader.Read())
            {
                Session["updatepropertyID"] = reader.GetInt32(0);
            }
        }
        cn.Close();
        Response.Redirect("UpdateProperty.aspx");
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        cn.Open();
        string SenderID2 = Session["UserID"].ToString();
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
        txtsend.Text = String.Empty;
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

    protected void AcceptButton1_Click(object sender, EventArgs e)
    {
        RequestIDs = (ArrayList)ViewState["RequestIDarray"];
        RenterEmails = (ArrayList)ViewState["RenterEmails"];
        cn.Open();
        string status = "Accepted";
        string accept = "Update Requests Set RequestStatus= @Accept where RequestID = @RequestID";
        SqlCommand sqlCommand = new SqlCommand(accept, cn);
        sqlCommand.Parameters.AddWithValue("@RequestID",RequestIDs[0].ToString());
        sqlCommand.Parameters.AddWithValue("@Accept",status);
        sqlCommand.ExecuteNonQuery();

        cn.Close();

        string EmailAddress = RenterEmails[0].ToString();
        string EmailBody = "One of your requests has been accepted by a Host, please login to our website and make a payment.";
        EmailSender emailSender = new EmailSender();
        // uncomment this when hosting to aws
        //emailSender.SendAcceptEmail(EmailAddress, EmailBody);

        request1.Visible = false;
        
    }

    protected void DeclineButton1_Click(object sender, EventArgs e)
    {
        RequestIDs = (ArrayList)ViewState["RequestIDarray"];
        RenterEmails = (ArrayList)ViewState["RenterEmails"];
        cn.Open();
        string status = "Declined";
        string accept = "Update Requests Set RequestStatus= @Declined where RequestID = @RequestID";
        SqlCommand sqlCommand = new SqlCommand(accept, cn);
        sqlCommand.Parameters.AddWithValue("@RequestID", RequestIDs[0].ToString());
        sqlCommand.Parameters.AddWithValue("@Declined", status);
        sqlCommand.ExecuteNonQuery();
        cn.Close();

        string EmailAddress = RenterEmails[0].ToString();
        string EmailBody = "One of your requests has been declined by a Host.";
        EmailSender emailSender = new EmailSender();
        // uncomment this when hosting to aws
        //emailSender.SendDeclinedEmail(EmailAddress, EmailBody);

        request1.Visible = false;
    }

    protected void AcceptButton2_Click(object sender, EventArgs e)
    {
        RequestIDs = (ArrayList)ViewState["RequestIDarray"];
        cn.Open();
        string status = "Accepted";
        string accept = "Update Requests Set RequestStatus= @Accept where RequestID = @RequestID";
        SqlCommand sqlCommand = new SqlCommand(accept, cn);
        sqlCommand.Parameters.AddWithValue("@RequestID", RequestIDs[1].ToString());
        sqlCommand.Parameters.AddWithValue("@Accept", status);
        sqlCommand.ExecuteNonQuery();
        cn.Close();

        string EmailAddress = RenterEmails[1].ToString();
        string EmailBody = "One of your requests has been accepted by a Host please login to our website and make a payment";
        EmailSender emailSender = new EmailSender();
        // uncomment this when hosting to aws
        //emailSender.SendAcceptEmail(EmailAddress, EmailBody);

        request1.Visible = false;
    }

    protected void DeclineButton2_Click(object sender, EventArgs e)
    {
        RequestIDs = (ArrayList)ViewState["RequestIDarray"];
        cn.Open();
        string status = "Declined";
        string accept = "Update Requests Set RequestStatus= @Declined where RequestID = @RequestID";
        SqlCommand sqlCommand = new SqlCommand(accept, cn);
        sqlCommand.Parameters.AddWithValue("@RequestID", RequestIDs[1].ToString());
        sqlCommand.Parameters.AddWithValue("@Declined", status);
        sqlCommand.ExecuteNonQuery();
        cn.Close();

        string EmailAddress = RenterEmails[1].ToString();
        string EmailBody = "One of your requests has been declined by a Host";
        EmailSender emailSender = new EmailSender();
        // uncomment this when hosting to aws
        //emailSender.SendDeclinedEmail(EmailAddress, EmailBody);

        request1.Visible = false;
    }

    protected void AcceptButton3_Click(object sender, EventArgs e)
    {
        RequestIDs = (ArrayList)ViewState["RequestIDarray"];
        cn.Open();
        string status = "Accepted";
        string accept = "Update Requests Set RequestStatus= @Accept where RequestID = @RequestID";
        SqlCommand sqlCommand = new SqlCommand(accept, cn);
        sqlCommand.Parameters.AddWithValue("@RequestID", RequestIDs[2].ToString());
        sqlCommand.Parameters.AddWithValue("@Accept", status);
        sqlCommand.ExecuteNonQuery();
        cn.Close();

        string EmailAddress = RenterEmails[2].ToString();
        string EmailBody = "One of your requests has been accepted by a Host, please login to our website and make a payment";
        EmailSender emailSender = new EmailSender();
        // uncomment this when hosting to aws
        //emailSender.SendAcceptEmail(EmailAddress, EmailBody);

        request1.Visible = false;
    }

    protected void DeclineButton3_Click(object sender, EventArgs e)
    {
        RequestIDs = (ArrayList)ViewState["RequestIDarray"];
        cn.Open();
        string status = "Declined";
        string accept = "Update Requests Set RequestStatus= @Declined where RequestID = @RequestID";
        SqlCommand sqlCommand = new SqlCommand(accept, cn);
        sqlCommand.Parameters.AddWithValue("@RequestID", RequestIDs[2].ToString());
        sqlCommand.Parameters.AddWithValue("@Declined", status);
        sqlCommand.ExecuteNonQuery();
        cn.Close();

        string EmailAddress = RenterEmails[2].ToString();
        string EmailBody = "One of your requests has been declined by a Host";
        EmailSender emailSender = new EmailSender();
        // uncomment this when hosting to aws
        //emailSender.SendDeclinedEmail(EmailAddress, EmailBody);

        request1.Visible = false;
    }

    protected void AcceptButton4_Click(object sender, EventArgs e)
    {
        RequestIDs = (ArrayList)ViewState["RequestIDarray"];
        cn.Open();
        string status = "Accepted";
        string accept = "Update Requests Set RequestStatus= @Accept where RequestID = @RequestID";
        SqlCommand sqlCommand = new SqlCommand(accept, cn);
        sqlCommand.Parameters.AddWithValue("@RequestID", RequestIDs[3].ToString());
        sqlCommand.Parameters.AddWithValue("@Accept", status);
        sqlCommand.ExecuteNonQuery();
        cn.Close();

        string EmailAddress = RenterEmails[3].ToString();
        string EmailBody = "One of your requests has been accepted by a Host, please login to our website and make a payment";
        EmailSender emailSender = new EmailSender();
        // uncomment this when hosting to aws
        //emailSender.SendAcceptEmail(EmailAddress, EmailBody);

        request1.Visible = false;
    }

    protected void DeclineButton4_Click(object sender, EventArgs e)
    {
        RequestIDs = (ArrayList)ViewState["RequestIDarray"];
        cn.Open();
        string status = "Declined";
        string accept = "Update Requests Set RequestStatus= @Declined where RequestID = @RequestID";
        SqlCommand sqlCommand = new SqlCommand(accept, cn);
        sqlCommand.Parameters.AddWithValue("@RequestID", RequestIDs[3].ToString());
        sqlCommand.Parameters.AddWithValue("@Declined", status);
        sqlCommand.ExecuteNonQuery();
        cn.Close();

        string EmailAddress = RenterEmails[3].ToString();
        string EmailBody = "One of your requests has been declined by a Host";
        EmailSender emailSender = new EmailSender();
        // uncomment this when hosting to aws
        //emailSender.SendDeclinedEmail(EmailAddress, EmailBody);

        request1.Visible = false;
    }

    protected void AcceptButton5_Click(object sender, EventArgs e)
    {
        RequestIDs = (ArrayList)ViewState["RequestIDarray"];
        cn.Open();
        string status = "Accepted";
        string accept = "Update Requests Set RequestStatus= @Accept where RequestID = @RequestID";
        SqlCommand sqlCommand = new SqlCommand(accept, cn);
        sqlCommand.Parameters.AddWithValue("@RequestID", RequestIDs[4].ToString());
        sqlCommand.Parameters.AddWithValue("@Accept", status);
        sqlCommand.ExecuteNonQuery();
        cn.Close();

        string EmailAddress = RenterEmails[4].ToString();
        string EmailBody = "One of your requests has been accepted by a Host please login to our website and make a payment";
        EmailSender emailSender = new EmailSender();
        // uncomment this when hosting to aws
        //emailSender.SendAcceptEmail(EmailAddress, EmailBody);

        request1.Visible = false;
    }

    protected void DeclineButton5_Click(object sender, EventArgs e)
    {
        RequestIDs = (ArrayList)ViewState["RequestIDarray"];
        cn.Open();
        string status = "Declined";
        string accept = "Update Requests Set RequestStatus= @Declined where RequestID = @RequestID";
        SqlCommand sqlCommand = new SqlCommand(accept, cn);
        sqlCommand.Parameters.AddWithValue("@RequestID", RequestIDs[4].ToString());
        sqlCommand.Parameters.AddWithValue("@Declined", status);
        sqlCommand.ExecuteNonQuery();
        cn.Close();

        string EmailAddress = RenterEmails[4].ToString();
        string EmailBody = "One of your request has declined by the Host";
        EmailSender emailSender = new EmailSender();
        // uncomment this when hosting to aws
        //emailSender.SendDeclinedEmail(EmailAddress, EmailBody);

        request1.Visible = false;
    }
}