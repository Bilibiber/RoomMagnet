using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Web.UI;

public partial class WebPages_Host : System.Web.UI.Page
{
    private SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ToString());
    private ArrayList RatingsPID = new ArrayList();
    private ArrayList tempimages = new ArrayList();

    protected void Page_Load(object sender, EventArgs e)
    {
        Property1Space.Visible = false;
        Property2Space.Visible = false;
        Property3Space.Visible = false;
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


        string status = Session["Verified"].ToString().ToUpper();
        userstatus.Text = status;
        if (Session["SignInEmail"] == null)
        {
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openLoginModal();", true);
        }
        else
        {
            var master = Master as RoomMagnet;
            master.AfterLogin();
        }

        if (!IsPostBack)
        {
            SqlConnection db = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ToString());
            db.Open();
            System.Data.SqlClient.SqlCommand selectuser = new System.Data.SqlClient.SqlCommand();
            selectuser.Connection = db;
            int userid = Convert.ToInt32(Session["UserID"]);
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
}