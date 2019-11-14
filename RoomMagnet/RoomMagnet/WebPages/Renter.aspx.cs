using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;

public partial class WebPages_Renter : System.Web.UI.Page
{

    private SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
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
        renterprofile.BackColor = System.Drawing.Color.FromArgb(198,214,226);
        renterFavorites.BackColor = System.Drawing.Color.White;
        renterConnections.BackColor = System.Drawing.Color.White;
        renterMessage.BackColor = System.Drawing.Color.White;
    }

    protected void renterFavorites_Click(object sender, EventArgs e)
    {
        panelprofile.Visible = false;
        panelfavorites.Visible = true;
        panelconnections.Visible = false;
        panelmessage.Visible = false;
        renterprofile.BackColor = System.Drawing.Color.White;
        renterFavorites.BackColor = System.Drawing.Color.FromArgb(198, 214, 226);
        renterConnections.BackColor = System.Drawing.Color.White;
        renterMessage.BackColor = System.Drawing.Color.White;

            string sql = "Select Title, City, HomeState, ZipCode, AvailableBedrooms, RentPrice, StartDate, EndDate, ImagePath, AvailableBathrooms, [Favorites].PropertyID from[Property] INNER JOIN[ImagePath]" +
                " on[Property].PropertyID = [ImagePath].PropertyID INNER JOIN [Favorites] on[Property].PropertyID = [Favorites].PropertyID WHERE UserID = " + Session["UserID"];
            cn.Open();
            SqlCommand search = new SqlCommand(sql, cn);
            SqlDataReader reader = search.ExecuteReader();
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
                    Property1Rating.Text = (RatingSum / RatingRecordCount).ToString();
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

    protected void renterConnections_Click(object sender, EventArgs e)
    {
        panelprofile.Visible = false;
        panelfavorites.Visible = false;
        panelconnections.Visible = true;
        panelmessage.Visible = false;
        renterprofile.BackColor = System.Drawing.Color.White;
        renterFavorites.BackColor = System.Drawing.Color.White;
        renterConnections.BackColor = System.Drawing.Color.FromArgb(198, 214, 226);
        renterMessage.BackColor = System.Drawing.Color.White;
    }

    protected void renterMessage_Click(object sender, EventArgs e)
    {
        panelprofile.Visible = false;
        panelfavorites.Visible = false;
        panelconnections.Visible = false;
        panelmessage.Visible = true;
        renterprofile.BackColor = System.Drawing.Color.White;
        renterFavorites.BackColor = System.Drawing.Color.White;
        renterConnections.BackColor = System.Drawing.Color.White;
        renterMessage.BackColor = System.Drawing.Color.FromArgb(198, 214, 226);
    }

    protected void rentertohost_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddProperty.aspx");
    }


    protected void editprofile_Click(object sender, EventArgs e)
    {
        Response.Redirect("Setting.aspx");
    }
}