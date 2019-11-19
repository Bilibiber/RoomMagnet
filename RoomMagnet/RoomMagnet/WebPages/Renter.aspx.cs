using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Web.UI;

public partial class WebPages_Renter : System.Web.UI.Page
{
    private SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ToString());
    private ArrayList RatingsPID = new ArrayList();

    protected void Page_Load(object sender, EventArgs e)
    {
        Property1Space.Visible = false;
        Property2Space.Visible = false;
        Property3Space.Visible = false;
        history1.Visible = false;
        Div2.Visible = false;
        Div3.Visible = false;
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
        }

        /*string status = Session["Verified"].ToString().ToUpper();
        userstatus.Text = status;
        if (Session["SignInEmail"] == null)
        {
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openLoginModal();", true);
        }
        else
        {
            var master = Master as RoomMagnet;
            master.AfterLogin();
        }*/

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
            getinfor.Close();
            db.Close();
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

    protected void renterProfile_Click(object sender, EventArgs e)
    {
        panelprofile.Visible = true;
        panelfavorites.Visible = false;
        panelconnections.Visible = false;
        panelmessage.Visible = false;
        panelhistory.Visible = false;
        renterprofile.BackColor = System.Drawing.Color.FromArgb(198, 214, 226);
        renterFavorites.BackColor = System.Drawing.Color.White;
        renterConnections.BackColor = System.Drawing.Color.White;
        renterMessage.BackColor = System.Drawing.Color.White;
        renterHistory.BackColor = System.Drawing.Color.White;
    }

    protected void renterFavorites_Click(object sender, EventArgs e)
    {
        panelprofile.Visible = false;
        panelfavorites.Visible = true;
        panelconnections.Visible = false;
        panelmessage.Visible = false;
        panelhistory.Visible = false;
        renterprofile.BackColor = System.Drawing.Color.White;
        renterFavorites.BackColor = System.Drawing.Color.FromArgb(198, 214, 226);
        renterConnections.BackColor = System.Drawing.Color.White;
        renterMessage.BackColor = System.Drawing.Color.White;
        renterHistory.BackColor = System.Drawing.Color.White;

        string sql = "Select Title, City, HomeState, ZipCode, AvailableBedrooms, RentPrice, StartDate, EndDate, ImagePath, AvailableBathrooms, [Favorites].PropertyID from[Property] INNER JOIN[ImagePath]" +
            " on[Property].PropertyID = [ImagePath].PropertyID INNER JOIN [Favorites] on[Property].PropertyID = [Favorites].PropertyID WHERE UserID = " + Session["UserID"];
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

                    byte[] images = (byte[])reader[8];
                    if (images == null)
                    {
                        return;
                    }
                    else
                    {
                        Property1Image.ImageUrl = "data:image;base64," + Convert.ToBase64String(images);
                        Property1Image.Visible = true;
                    }
                    Property1Space.Visible = true;
                }

                if (resultCount == 2)
                {
                    RatingsPID.Add(reader.GetInt32(10));
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
                    byte[] images = (byte[])reader[8];
                    if (images == null)
                    {
                        return;
                    }
                    else
                    {
                        Property2Image.ImageUrl = "data:image;base64," + Convert.ToBase64String(images);
                        Property2Image.Visible = true;
                    }
                    Property2Space.Visible = true;
                }
                if (resultCount == 3)
                {
                    RatingsPID.Add(reader.GetInt32(10));
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
                    byte[] images = (byte[])reader[8];
                    if (images == null)
                    {
                        return;
                    }
                    else
                    {
                        Property3Image.ImageUrl = "data:image;base64," + Convert.ToBase64String(images);
                        Property3Image.Visible = true;
                    }
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
                Property1Rating.Text = Math.Round((RatingSum / RatingRecordCount),1).ToString();
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
        renterprofile.BackColor = System.Drawing.Color.White;
        renterFavorites.BackColor = System.Drawing.Color.White;
        renterConnections.BackColor = System.Drawing.Color.FromArgb(198, 214, 226);
        renterMessage.BackColor = System.Drawing.Color.White;
        renterHistory.BackColor = System.Drawing.Color.White;
    }

    protected void renterMessage_Click(object sender, EventArgs e)
    {
        panelprofile.Visible = false;
        panelfavorites.Visible = false;
        panelconnections.Visible = false;
        panelmessage.Visible = true;
        panelhistory.Visible = false;
        renterprofile.BackColor = System.Drawing.Color.White;
        renterFavorites.BackColor = System.Drawing.Color.White;
        renterConnections.BackColor = System.Drawing.Color.White;
        renterMessage.BackColor = System.Drawing.Color.FromArgb(198, 214, 226);
        renterHistory.BackColor = System.Drawing.Color.White;
    }

    protected void renterHistory_Click(object sender, EventArgs e)
    {
        panelprofile.Visible = false;
        panelfavorites.Visible = false;
        panelconnections.Visible = false;
        panelmessage.Visible = false;
        panelhistory.Visible = true;
        renterprofile.BackColor = System.Drawing.Color.White;
        renterFavorites.BackColor = System.Drawing.Color.White;
        renterConnections.BackColor = System.Drawing.Color.White;
        renterMessage.BackColor = System.Drawing.Color.White;
        renterHistory.BackColor = System.Drawing.Color.FromArgb(198, 214, 226);

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
                history1rating.Text = (RatingSum / RatingRecordCount).ToString();
            }
            if (RatingCount == 1)
            {
                Property2Rating.Text = (RatingSum / RatingRecordCount).ToString();
            }
            if (RatingCount == 2)
            {
                Property3Rating.Text = (RatingSum / RatingRecordCount).ToString();
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
        Response.Redirect("ManageSearchProperties.aspx");
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
        Response.Redirect("ManageSearchProperties.aspx");
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
        Response.Redirect("ManageSearchProperties.aspx");
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
        review.Parameters.Add(new SqlParameter("@NumStars", Convert.ToDecimal( reviewStar.Text)));
        review.Parameters.Add(new SqlParameter("@LastUpdated", DateTime.Now));
        review.Parameters.Add(new SqlParameter("@LastUpdatedBy", Session["FullName"].ToString()));
        review.Parameters.Add(new SqlParameter("@RenterID", Int32.Parse(Session["UserID"].ToString())));
        review.Parameters.Add(new SqlParameter("@PropertyID", 1003));
        review.ExecuteNonQuery();
        cn.Close();
    }
}