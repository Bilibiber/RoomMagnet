using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebPages_Renter : System.Web.UI.Page
{
    private SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ToString());
    private ArrayList RatingsPID = new ArrayList();

    private ArrayList ReceiverIDs = new ArrayList();
    private int ReceiverID;
    private int HostReceiverID;
    private int RenterReceiverID;
    private string SenderID;
    private string ReceiverName = "";
    private int OldConversationID = 0;
    private int NewConversationID = 0;

    private ArrayList RequestIDs = new ArrayList();
    private ArrayList HostEmails = new ArrayList();

    protected void Page_Load(object sender, EventArgs e)
    {
        Property1Space.Visible = false;
        Property2Space.Visible = false;
        Property3Space.Visible = false;
        history1.Visible = false;
        Div2.Visible = false;
        Div3.Visible = false;
        errorLabel.Visible = false;
        if (Session["SignInEmail"] == null)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openLoginModal();", true);
        }
        else
        {
            var master = Master as RoomMagnet;
            master.AfterLogin();
        }
        if (!IsPostBack)
        {
            cn.Open();
            System.Data.SqlClient.SqlCommand selectimg = new System.Data.SqlClient.SqlCommand();
            selectimg.Connection = cn;
            int userid = Convert.ToInt32(Session["UserID"]);
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
            if (ReceiverIDs.Count > 0)
            {
                HostNames.Visible = true;
            }
        }

        string status = Session["Verified"].ToString().ToUpper();
        userstatus.Text = status;

        if (!IsPostBack)
        {
            SqlConnection db = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ToString());
            db.Open();
            System.Data.SqlClient.SqlCommand selectuser = new System.Data.SqlClient.SqlCommand();
            selectuser.Connection = db;
            int userid = Convert.ToInt32(Session["UserID"]);
            selectuser.CommandText = "select [FirstName], [Gender], [Occupation], [Description]from [RoomMagnet].[dbo].[Users] where [UserID] =@UserID";
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
            if (ReceiverIDs.Count > 0)
            {
                HostNames.Visible = true;
            }
            getinfor.Close();
            db.Close();
        }
        //SQL statement to fill receiver dropdown list
        cn.Open();
        int tempReceiverID;
        string sql = "Select ReceiverID from Conversations  where SenderID= " + Session["UserID"].ToString();
        SqlCommand sqlCommand3 = new SqlCommand(sql, cn);
        SqlDataReader reader2 = sqlCommand3.ExecuteReader();
        if (reader2.HasRows)
        {
            while (reader2.Read())
            {
                tempReceiverID = reader2.GetInt32(0);
                if (ReceiverIDs.Contains(tempReceiverID) == false)
                {
                    ReceiverIDs.Add(tempReceiverID);
                }
            }
        }

        cn.Close();
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

    protected void renterProfile_Click(object sender, EventArgs e)
    {
        panelprofile.Visible = true;
        panelfavorites.Visible = false;
        panelconnections.Visible = false;
        panelmessage.Visible = false;
        panelhistory.Visible = false;
        renterprofile.BackColor = System.Drawing.Color.FromArgb(84, 84, 84);
        renterFavorites.BackColor = System.Drawing.Color.FromArgb(51, 51, 51);
        renterConnections.BackColor = System.Drawing.Color.FromArgb(51, 51, 51);
        renterMessage.BackColor = System.Drawing.Color.FromArgb(51, 51, 51);
        renterHistory.BackColor = System.Drawing.Color.FromArgb(51, 51, 51);
    }

    protected void renterFavorites_Click(object sender, EventArgs e)
    {
        panelprofile.Visible = false;
        panelfavorites.Visible = true;
        panelconnections.Visible = false;
        panelmessage.Visible = false;
        panelhistory.Visible = false;
        renterprofile.BackColor = System.Drawing.Color.FromArgb(51, 51, 51);
        renterFavorites.BackColor = System.Drawing.Color.FromArgb(84, 84, 84);
        renterConnections.BackColor = System.Drawing.Color.FromArgb(51, 51, 51);
        renterMessage.BackColor = System.Drawing.Color.FromArgb(51, 51, 51);
        renterHistory.BackColor = System.Drawing.Color.FromArgb(51, 51, 51);

        string sql = "SELECT Property.Title, Property.City, Property.HomeState, Property.ZipCode, Property.AvailableBedrooms, Property.RentPrice, Property.StartDate," +
            " Property.EndDate, Property.AvailableBathrooms, Property.PropertyID FROM Favorites LEFT OUTER JOIN Property ON Favorites.PropertyID = Property.PropertyID where userid = " + Session["UserID"];
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
                    RatingsPID.Add(reader.GetInt32(9));
                    x = reader.GetDecimal(5);
                    y = String.Format("{0:0.##}", x);
                    Property1Title.Text = reader.GetString(0);
                    Property1Title.Visible = true;
                    Property1Bath.Text = reader.GetInt32(9).ToString() + " Bathroom";
                    Property1RentPrice.Text = "$" + y + "/Month";
                    Property1RentPrice.Visible = true;
                    Property1CityState.Text = reader.GetString(1) + "," + reader.GetString(2);
                    Property1CityState.Visible = true;
                    Property1Bath.Text = reader.GetInt32(9).ToString() + " Bathroom";
                    Property1Bed.Text = reader.GetInt32(4).ToString() + " Bed";
                    Property1StartDate.Text = "Start Date: " + reader.GetDateTime(6).ToShortDateString();
                    Property1EndDate.Text = "End Date: " + reader.GetDateTime(7).ToShortDateString();

                    int pid = reader.GetInt32(9);
                    System.Data.SqlClient.SqlCommand selectimg = new System.Data.SqlClient.SqlCommand();
                    selectimg.Connection = cn;
                    selectimg.CommandText = "Select ImagePath from [ImagePath] WHERE PropertyID = @pid";
                    selectimg.Parameters.Add(new SqlParameter("@pid", pid));
                    SqlDataReader getinfor = selectimg.ExecuteReader();
                    while (getinfor.Read())
                    {
                        byte[] images1 = (byte[])getinfor[0];
                        Property1Image.ImageUrl = "data:image;base64," + Convert.ToBase64String(images1);
                        Property1Image.Visible = true;
                    }
                    getinfor.Close();
                    Property1Space.Visible = true;
                }

                if (resultCount == 2)
                {
                    RatingsPID.Add(reader.GetInt32(9));
                    x = reader.GetDecimal(5);
                    y = String.Format("{0:0.##}", x);
                    Property2Title.Text = reader.GetString(0);
                    Property2Title.Visible = true;

                    Property2RentPrice.Text = "$" + y + "/Month";
                    Property2RentPrice.Visible = true;
                    Property2CityState.Text = reader.GetString(1) + "," + reader.GetString(2);
                    Property2CityState.Visible = true;
                    Property2Bath.Text = reader.GetInt32(9).ToString() + " Bathroom";
                    Property2Bed.Text = reader.GetInt32(4).ToString() + " Bed";
                    Property2StartDate.Text = "Start Date: " + reader.GetDateTime(6).ToShortDateString();
                    Property2EndDate.Text = "End Date: " + reader.GetDateTime(7).ToShortDateString();

                    int pid = reader.GetInt32(9);
                    System.Data.SqlClient.SqlCommand selectimg = new System.Data.SqlClient.SqlCommand();
                    selectimg.Connection = cn;
                    selectimg.CommandText = "Select ImagePath from [ImagePath] WHERE PropertyID = @pid";
                    selectimg.Parameters.Add(new SqlParameter("@pid", pid));
                    SqlDataReader getinfor = selectimg.ExecuteReader();
                    while (getinfor.Read())
                    {
                        byte[] images2 = (byte[])getinfor[0];
                        Property2Image.ImageUrl = "data:image;base64," + Convert.ToBase64String(images2);
                        Property2Image.Visible = true;
                    }
                    getinfor.Close();
                    Property2Space.Visible = true;
                }
                if (resultCount == 3)
                {
                    RatingsPID.Add(reader.GetInt32(9));
                    x = reader.GetDecimal(5);
                    y = String.Format("{0:0.##}", x);
                    Property3Title.Text = reader.GetString(0);
                    Property3Title.Visible = true;
                    Property3RentPrice.Text = "$" + y + "/Month";
                    Property3RentPrice.Visible = true;
                    Property3CityState.Text = reader.GetString(1) + "," + reader.GetString(2);
                    Property3CityState.Visible = true;
                    Property3Bath.Text = reader.GetInt32(9).ToString() + " Bathroom";
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
                Property1Rating.Text = Math.Round((RatingSum / RatingRecordCount), 1).ToString();
            }
            if (RatingCount == 1)
            {
                Property2Rating.Text = Math.Round((RatingSum / RatingRecordCount), 1).ToString();
            }
            if (RatingCount == 2)
            {
                Property3Rating.Text = Math.Round((RatingSum / RatingRecordCount), 1).ToString();
            }
            RatingCount++;
            readers.Close();
        }
        RatingsPID.Clear();
        cn.Close();
    }

    protected void renterConnections_Click(object sender, EventArgs e)
    {
        panelprofile.Visible = false;
        panelfavorites.Visible = false;
        panelconnections.Visible = true;
        panelmessage.Visible = false;
        panelhistory.Visible = false;
        renterprofile.BackColor = System.Drawing.Color.FromArgb(51, 51, 51);
        renterFavorites.BackColor = System.Drawing.Color.FromArgb(51, 51, 51);
        renterConnections.BackColor = System.Drawing.Color.FromArgb(84, 84, 84);
        renterMessage.BackColor = System.Drawing.Color.FromArgb(51, 51, 51);
        renterHistory.BackColor = System.Drawing.Color.FromArgb(51, 51, 51);
        cn.Open();
        string InsideLbl = "";
        int userid = Convert.ToInt32(Session["UserID"]);
        int requestcount = 0;
        string Rentersql = "SELECT        Requests.RequestID, PropertyRoom.RentPrice, Property.Title, Property.City, Property.HomeState, Property.Country, Property.ZipCode,Users.Email,Requests.RequestStatus, PropertyRoom.PropertyRoomName" +
            " FROM Requests INNER JOIN" +
            " PropertyRoom ON Requests.PropertyRoomID = PropertyRoom.RoomID INNER JOIN" +
            " Property ON PropertyRoom.PropertyID = Property.PropertyID Inner JOIN Users ON Property.HostID = Users.UserID" +
            " Where Requests.RoomRenterID = @RenterID and RequestStatus= \'Declined\'";
        SqlCommand command = new SqlCommand(Rentersql, cn);
        command.Parameters.AddWithValue("@RenterID", userid);
        SqlDataReader reader = command.ExecuteReader();
        if (reader.HasRows)
        {
            while (reader.Read())
            {
                if (reader.GetString(8) == "Accepted")
                {
                    if (requestcount == 0)
                    {
                        request1.Visible = true;
                        StriptPay1.Visible = true;
                        request1des.Text = "Your Request for" + reader.GetString(9) + " in " + reader.GetString(2) + reader.GetString(3) + reader.GetString(4) + reader.GetString(6) + reader.GetString(5) + "has been approved";
                        RequestedRoomPrice1.Text = reader.GetDecimal(1).ToString();
                        int temRquestID = reader.GetInt32(0);
                        if (RequestIDs.Contains(temRquestID) == false)
                        {
                            RequestIDs.Add(reader.GetInt32(0));
                            HostEmails.Add(reader.GetString(7));
                        }
                    }
                }
                else if (reader.GetString(8) == "Pending")
                {
                    request1.Visible = true;
                    StriptPay1.Visible = false;
                    request1des.Text = "Your Request for" + reader.GetString(9) + " in " + reader.GetString(2) + reader.GetString(3) + reader.GetString(4) + reader.GetString(6) + reader.GetString(5) + "is pending";
                    int temRquestID = reader.GetInt32(0);
                    if (RequestIDs.Contains(temRquestID) == false)
                    {
                        RequestIDs.Add(reader.GetInt32(0));
                        HostEmails.Add(reader.GetString(7));
                    }
                }
                requestcount++;
            }
        }
        reader.Close();
        cn.Close();
    }

    protected void renterMessage_Click(object sender, EventArgs e)
    {
        panelprofile.Visible = false;
        panelfavorites.Visible = false;
        panelconnections.Visible = false;
        panelmessage.Visible = true;
        panelhistory.Visible = false;

        renterprofile.BackColor = System.Drawing.Color.FromArgb(51, 51, 51);
        renterFavorites.BackColor = System.Drawing.Color.FromArgb(51, 51, 51);
        renterConnections.BackColor = System.Drawing.Color.FromArgb(51, 51, 51);
        renterMessage.BackColor = System.Drawing.Color.FromArgb(84, 84, 84);
        renterHistory.BackColor = System.Drawing.Color.FromArgb(51, 51, 51);

        FillDropDown(ReceiverIDs);
        if (HostNames.SelectedValue != "No One")
        {
            Messages.Text = String.Empty;
            HostReceiverID = Int32.Parse(HostNames.SelectedValue);
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
    }

    protected void renterHistory_Click(object sender, EventArgs e)
    {
        panelprofile.Visible = false;
        panelfavorites.Visible = false;
        panelconnections.Visible = false;
        panelmessage.Visible = false;
        panelhistory.Visible = true;
        renterprofile.BackColor = System.Drawing.Color.FromArgb(51, 51, 51);
        renterFavorites.BackColor = System.Drawing.Color.FromArgb(51, 51, 51);
        renterConnections.BackColor = System.Drawing.Color.FromArgb(51, 51, 51);
        renterMessage.BackColor = System.Drawing.Color.FromArgb(51, 51, 51);
        renterHistory.BackColor = System.Drawing.Color.FromArgb(84, 84, 84);

        string sql = "Select Title, City, HomeState, ZipCode, AvailableBedrooms, RentPrice, StartDate, EndDate, AvailableBathrooms,PropertyID,PropertyID from[Property] WHERE propertyid = 1003";
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
                    x = reader.GetDecimal(5);
                    y = String.Format("{0:0.##}", x);
                    history1title.Text = reader.GetString(0);
                    history1title.Visible = true;
                    history1price.Text = "$" + y + "/Month";
                    history1price.Visible = true;
                    history1city.Text = reader.GetString(1) + "," + reader.GetString(2);
                    history1city.Visible = true;
                    history1bath.Text = reader.GetInt32(8).ToString() + " Bathroom";
                    history1bed.Text = reader.GetInt32(4).ToString() + " Bed";
                    history1start.Text = "Start Date: " + reader.GetDateTime(6).ToShortDateString();
                    history1end.Text = "End Date: " + reader.GetDateTime(7).ToShortDateString();

                    int pid = reader.GetInt32(10);
                    System.Data.SqlClient.SqlCommand selectimg = new System.Data.SqlClient.SqlCommand();
                    selectimg.Connection = cn;
                    selectimg.CommandText = "Select ImagePath from [ImagePath] WHERE PropertyID = 1003";
                    selectimg.Parameters.Add(new SqlParameter("@pid", pid));
                    SqlDataReader getinfor = selectimg.ExecuteReader();
                    while (getinfor.Read())
                    {
                        byte[] images1 = (byte[])getinfor[0];
                        history1img.ImageUrl = "data:image;base64," + Convert.ToBase64String(images1);
                        history1img.Width = new System.Web.UI.WebControls.Unit("200px");
                        history1img.Height = new System.Web.UI.WebControls.Unit("200px");

                        history1img.Visible = true;
                    }
                    getinfor.Close();
                    history1.Visible = true;
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
                history1rating.Text = Math.Round((RatingSum / RatingRecordCount), 1).ToString();
            }
            if (RatingCount == 1)
            {
                Property2Rating.Text = Math.Round((RatingSum / RatingRecordCount), 1).ToString();
            }
            if (RatingCount == 2)
            {
                Property3Rating.Text = Math.Round((RatingSum / RatingRecordCount), 1).ToString();
            }
            RatingCount++;
            readers.Close();
        }
        RatingsPID.Clear();
        cn.Close();
    }

    protected void rentertohost_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddProperty.aspx");
    }

    protected void editprofile_Click(object sender, EventArgs e)
    {
        Response.Redirect("Setting.aspx");
    }

    protected void Property1Image_Click(object sender, ImageClickEventArgs e)
    {
        cn.Open();
        string sql = "Select PropertyID,ImagePath from [ImagePath]";
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
        string sql = "Select PropertyID,ImagePath from [ImagePath]";
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
        string sql = "Select PropertyID,ImagePath from [ImagePath]";
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

    protected void historyproperty1_Click(object sender, EventArgs e)
    {
        cn.Open();
        string sql = "SELECT [PropertyID] FROM [RoomMagnet].[dbo].[Property] where title =@title and city +','+ [HomeState] =@citystate";
        SqlCommand search = new SqlCommand(sql, cn);
        search.Parameters.Add(new SqlParameter("@title", history1title.Text));
        search.Parameters.Add(new SqlParameter("@citystate", history1city.Text));
        SqlDataReader reader = search.ExecuteReader();

        if (reader.HasRows)
        {
            while (reader.Read())
            {
                Session["ResultPropertyID"] = reader.GetInt32(0);
            }
        }
        cn.Close();
        Response.Redirect("PropertyInfo.aspx");
    }

    protected void review_Click(object sender, EventArgs e)
    {
        ClientScript.RegisterStartupScript(this.GetType(), "p", "ShowPopup();", true);
    }

    protected void submitReview_Click(object sender, EventArgs e)
    {
        cn.Open();
        System.Data.SqlClient.SqlCommand review = new System.Data.SqlClient.SqlCommand();
        review.Connection = cn;
        review.CommandText = "INSERT INTO [dbo].[Rating]([Descriptions],[NumStars],[LastUpdated],[LastUpdatedBy],[RenterID],[PropertyID]) VALUES" +
            "(@Descriptions,@NumStars,@LastUpdated,@LastUpdatedBy,@RenterID,@PropertyID)";
        review.Parameters.Add(new SqlParameter("@Descriptions", reviewdes.Text));
        review.Parameters.Add(new SqlParameter("@NumStars", Convert.ToDecimal(reviewStar.Text)));
        review.Parameters.Add(new SqlParameter("@LastUpdated", DateTime.Now));
        review.Parameters.Add(new SqlParameter("@LastUpdatedBy", Session["FullName"].ToString()));
        review.Parameters.Add(new SqlParameter("@RenterID", Int32.Parse(Session["UserID"].ToString())));
        review.Parameters.Add(new SqlParameter("@PropertyID", 1003));
        review.ExecuteNonQuery();
        cn.Close();

        renterHistory_Click(sender, e);
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (HostNames.Visible == true)
        {
            cn.Open();
            string SenderID2 = Session["UserID"].ToString();
            HostReceiverID = Int32.Parse(HostNames.SelectedValue);
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
            errorLabel.Text = "No conversations have been initiated with a Host ";
            errorLabel.Visible = true;
        }
        txtsend.Text = String.Empty;
    }

    public void FillDropDown(ArrayList ReceiverIDs)
    {
        // change the name of dropdown list to hostname
        if (HostNames.Items.Count != ReceiverIDs.Count + 1)
        {
            cn.Open();

            for (int i = 0; i < ReceiverIDs.Count; i++)
            {
                string sql = "Select FirstName, LastName from Users WHERE UserID=" + ReceiverIDs[i].ToString();
                SqlCommand sqlCommand = new SqlCommand(sql, cn);
                SqlDataReader reader3 = sqlCommand.ExecuteReader();
                if (reader3.HasRows)
                {
                    HostNames.Visible = true;
                    errorLabel.Visible = false;
                    while (reader3.Read())
                    {
                        HostNames.Items.Add(new ListItem(reader3.GetString(0) + " " + reader3.GetString(1).ToString(), ReceiverIDs[i].ToString()));
                    }
                }
                reader3.Close();
            }

            cn.Close();
        }
    }

    protected void HostNames_TextChanged(object sender, EventArgs e)
    {
        // change the name
        if (HostNames.SelectedValue != "No One")
        {
            Messages.Text = String.Empty;
            string sql = "Select messageContent from Conversations inner join Message on Conversations.ConversationID = Message.ConversationID" +
                " where (SenderID = " + Session["UserID"].ToString() + ") and (ReceiverID = " + HostNames.SelectedValue + ")";
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
            HostNames.Visible = true;
            cn.Close();
        }
    }
    protected void DeleteButton1_Click(object sender, EventArgs e)
    {

    }
    protected void DeleteButton2_Click(object sender, EventArgs e)
    {

    }
    protected void DeleteButton3_Click(object sender, EventArgs e)
    {

    }
    protected void DeleteButton4_Click(object sender, EventArgs e)
    {

    }
    protected void DeleteButton5_Click(object sender, EventArgs e)
    {

    }








}