using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Web;
using System.Web.UI;

public partial class WebPages_AddProperty : System.Web.UI.Page
{
    private SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        Comparestart1.ValueToCompare = DateTime.Now.ToShortDateString();
        Comparestart2.ValueToCompare = DateTime.Now.ToShortDateString();
        Comparestart3.ValueToCompare = DateTime.Now.ToShortDateString();
        Comparestart4.ValueToCompare = DateTime.Now.ToShortDateString();
        room1.Visible = false;
        room2.Visible = false;
        room3.Visible = false;
        room4.Visible = false;

        if (Session["SignInEmail"] == null)
        {
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openLoginModal();", true);
        }
        else
        {
            var master = Master as RoomMagnet;
            master.AfterLogin();
        }
        othertextbox.Enabled = false;
        if (!IsPostBack)
        {
            addCountry.DataSource = objcountries();
            addCountry.DataBind();
        }

        if (checkOther.Checked)
        {
            othertextbox.Enabled = true;
        }

        if (addCountry.Text == "United States")
        {
            addState.Visible = true;
            replacestate.Visible = false;
        }
        else
        {
            addState.SelectedIndex = 0;
            addState.Visible = false;
            replacestate.Visible = true;
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

    protected void cancel_Click(object sender, EventArgs e)
    {
        if (Session["Roles"].ToString() == "Renter")
        {
            Response.Redirect("Renter.aspx");
        }
        else if (Session["Roles"].ToString() == "Host")
        {
            Response.Redirect("Host.aspx");
        }
    }

    protected void post_Click(object sender, EventArgs e)
    {
        cn.Open();
        int userid = Convert.ToInt32(Session["UserID"]);
        string FullName = Session["FullName"].ToString();

        string insert = "INSERT INTO [dbo].[Property]([Title],[StreetAddress] ,[City],[HomeState] ,[Country],[ZipCode],[SquareFootage],[RentPrice],[AvailableBedrooms], [AvailableBathrooms]," +
            "[StartDate],[EndDate],[LastUpdated],[LastUpdatedBy],[HostID]) VALUES (@Title, @StreetAddress, @City, @HomeState, @Country,@ZipCode, @SquareFootage, @RentPrice,@AvailableBedrooms," +
            "@AvailableBathrooms, @StartDate, @EndDate,@LastUpdated, @LastUpdatedBy,@HostID)";
        SqlCommand inserted = new SqlCommand(insert, cn);
        inserted.Parameters.AddWithValue("@Title", addtitle.Text);
        inserted.Parameters.AddWithValue("@StreetAddress", addStreet.Text);
        inserted.Parameters.AddWithValue("@City", addCity.Text);
        inserted.Parameters.AddWithValue("@HomeState", addState.SelectedValue);
        inserted.Parameters.AddWithValue("@Country", addCountry.SelectedValue);
        inserted.Parameters.AddWithValue("@ZipCode", addZip.Text);
        inserted.Parameters.AddWithValue("@SquareFootage", addSquare.Text);
        inserted.Parameters.AddWithValue("@RentPrice", addPrice.Text);
        inserted.Parameters.AddWithValue("@AvailableBedrooms", addBedrooms.Text);
        inserted.Parameters.AddWithValue("@AvailableBathrooms", addbath.SelectedValue);
        inserted.Parameters.AddWithValue("@StartDate", Convert.ToDateTime(addstartdate1.Text));
        inserted.Parameters.AddWithValue("@EndDate", Convert.ToDateTime(addenddate1.Text));
        inserted.Parameters.AddWithValue("@LastUpdated", DateTime.Now);
        inserted.Parameters.AddWithValue("@LastUpdatedBy", FullName);
        inserted.Parameters.AddWithValue("@HostID", userid);
        inserted.ExecuteNonQuery();
        cn.Close();

        cn.Open();
        System.Data.SqlClient.SqlCommand selectpid = new System.Data.SqlClient.SqlCommand();
        selectpid.Connection = cn;
        selectpid.CommandText = "SELECT [PropertyID] FROM [dbo].[Property] where [StreetAddress] = @StreetAddress and [ZipCode] = @ZipCode";
        selectpid.Parameters.Add(new SqlParameter("@StreetAddress", addStreet.Text));
        selectpid.Parameters.Add(new SqlParameter("@ZipCode", addZip.Text));
        SqlDataReader getpid = selectpid.ExecuteReader();
        int pid = -1;
        while (getpid.Read())
        {
            pid = Int32.Parse(getpid[0].ToString());
        }
        getpid.Close();
        string insertto = "INSERT INTO[dbo].[Amenities] ([PropertyID],[AirConditioning],[Heating],[OnSiteLaundry],[Parking],[Furnished],[PetFriendly],[CarbonMonoxideDetector]," +
            "[SmokeDetector],[SeperateEntrance],[WiFi],[TV],[SeparateBathroom],[Other]) VALUES(@PropertyID,@AC,@Heating,@Laundry,@Parking,@Furnished,@Pet,@Carbondetector," +
            "@SmokeDetector,@SeperateEntrance,@WiFi,@TV,@SeparateBathroom,@Other)";
        SqlCommand insertTo = new SqlCommand(insertto, cn);
        insertTo.Parameters.AddWithValue("@PropertyID", pid);
        insertTo.Parameters.AddWithValue("@AC", checkcondition.Checked ? 'Y' : 'N');
        insertTo.Parameters.AddWithValue("@Heating", checkheating.Checked ? 'Y' : 'N');
        insertTo.Parameters.AddWithValue("@Laundry", checkLaundry.Checked ? 'Y' : 'N');
        insertTo.Parameters.AddWithValue("@Parking", checkParking.Checked ? 'Y' : 'N');
        insertTo.Parameters.AddWithValue("@Furnished", checkFurnished.Checked ? 'Y' : 'N');
        insertTo.Parameters.AddWithValue("@Pet", checkpet.Checked ? 'Y' : 'N');
        insertTo.Parameters.AddWithValue("@Carbondetector", checkcarbondetector.Checked ? 'Y' : 'N');
        insertTo.Parameters.AddWithValue("@SmokeDetector", checksomkedetector.Checked ? 'Y' : 'N');
        insertTo.Parameters.AddWithValue("@SeperateEntrance", checkspeentrance.Checked ? 'Y' : 'N');
        insertTo.Parameters.AddWithValue("@WiFi", checkspeentrance.Checked ? 'Y' : 'N');
        insertTo.Parameters.AddWithValue("@TV", checkTV.Checked ? 'Y' : 'N');
        insertTo.Parameters.AddWithValue("@SeparateBathroom", checkspebath.Checked ? 'Y' : 'N');
        insertTo.Parameters.AddWithValue("@Other", checkOther.Checked ? othertextbox.Text : "");
        insertTo.ExecuteNonQuery();

        if (Int32.Parse(addBedrooms.SelectedValue) == 1)
        {
            string insertroom = "INSERT INTO[dbo].[PropertyRoom]([StartDate],[EndDate],[RentPrice],[Bathroom],[PropertyID],[PropertyRoomName]) VALUES(@StartDate,@EndDate,@RentPrice,@Bathroom,@PropertyID,@roomname)";
            SqlCommand room1 = new SqlCommand(insertroom, cn);
            room1.Parameters.AddWithValue("@PropertyID", pid);
            room1.Parameters.AddWithValue("@StartDate", addstartdate1.Text);
            room1.Parameters.AddWithValue("@EndDate", addenddate1.Text);
            room1.Parameters.AddWithValue("@RentPrice", roomprice1.Text);
            room1.Parameters.AddWithValue("@Bathroom", roombath1.SelectedValue);
            room1.Parameters.AddWithValue("@roomname", Room1Name.Text);
            room1.ExecuteNonQuery();
        }
        else if (Int32.Parse(addBedrooms.SelectedValue) == 2)
        {
            string insertroom1 = "INSERT INTO[dbo].[PropertyRoom]([StartDate],[EndDate],[RentPrice],[Bathroom],[PropertyID],[PropertyRoomName]) VALUES(@StartDate,@EndDate,@RentPrice,@Bathroom,@PropertyID,@roomname)";
            SqlCommand room1 = new SqlCommand(insertroom1, cn);
            room1.Parameters.AddWithValue("@PropertyID", pid);
            room1.Parameters.AddWithValue("@StartDate", addstartdate1.Text);
            room1.Parameters.AddWithValue("@EndDate", addenddate1.Text);
            room1.Parameters.AddWithValue("@RentPrice", roomprice1.Text);
            room1.Parameters.AddWithValue("@Bathroom", roombath1.SelectedValue);
            room1.Parameters.AddWithValue("@roomname", Room1Name.Text);
            room1.ExecuteNonQuery();

            string insertroom2 = "INSERT INTO[dbo].[PropertyRoom]([StartDate],[EndDate],[RentPrice],[Bathroom],[PropertyID],[PropertyRoomName]) VALUES(@StartDate,@EndDate,@RentPrice,@Bathroom,@PropertyID,@roomname)";
            SqlCommand room2 = new SqlCommand(insertroom2, cn);
            room2.Parameters.AddWithValue("@PropertyID", pid);
            room2.Parameters.AddWithValue("@StartDate", addstartdate2.Text);
            room2.Parameters.AddWithValue("@EndDate", addenddate2.Text);
            room2.Parameters.AddWithValue("@RentPrice", roomprice2.Text);
            room2.Parameters.AddWithValue("@Bathroom", roombath2.SelectedValue);
            room2.Parameters.AddWithValue("@roomname", Room2Name.Text);
            room2.ExecuteNonQuery();
        }
        else if (Int32.Parse(addBedrooms.SelectedValue) == 3)
        {
            string insertroom1 = "INSERT INTO[dbo].[PropertyRoom]([StartDate],[EndDate],[RentPrice],[Bathroom],[PropertyID],[PropertyRoomName]) VALUES(@StartDate,@EndDate,@RentPrice,@Bathroom,@PropertyID,@roomname)";
            SqlCommand room1 = new SqlCommand(insertroom1, cn);
            room1.Parameters.AddWithValue("@PropertyID", pid);
            room1.Parameters.AddWithValue("@StartDate", addstartdate1.Text);
            room1.Parameters.AddWithValue("@EndDate", addenddate1.Text);
            room1.Parameters.AddWithValue("@RentPrice", roomprice1.Text);
            room1.Parameters.AddWithValue("@Bathroom", roombath1.SelectedValue);
            room1.Parameters.AddWithValue("@roomname", Room1Name.Text);
            room1.ExecuteNonQuery();

            string insertroom2 = "INSERT INTO[dbo].[PropertyRoom]([StartDate],[EndDate],[RentPrice],[Bathroom],[PropertyID],[PropertyRoomName]) VALUES(@StartDate,@EndDate,@RentPrice,@Bathroom,@PropertyID,@roomname)";
            SqlCommand room2 = new SqlCommand(insertroom2, cn);
            room2.Parameters.AddWithValue("@PropertyID", pid);
            room2.Parameters.AddWithValue("@StartDate", addstartdate2.Text);
            room2.Parameters.AddWithValue("@EndDate", addenddate2.Text);
            room2.Parameters.AddWithValue("@RentPrice", roomprice2.Text);
            room2.Parameters.AddWithValue("@Bathroom", roombath2.SelectedValue);
            room2.Parameters.AddWithValue("@roomname", Room2Name.Text);
            room2.ExecuteNonQuery();

            string insertroom3 = "INSERT INTO[dbo].[PropertyRoom]([StartDate],[EndDate],[RentPrice],[Bathroom],[PropertyID],[PropertyRoomName]) VALUES(@StartDate,@EndDate,@RentPrice,@Bathroom,@PropertyID,@roomname)";
            SqlCommand room3 = new SqlCommand(insertroom3, cn);
            room3.Parameters.AddWithValue("@PropertyID", pid);
            room3.Parameters.AddWithValue("@StartDate", addstartdate3.Text);
            room3.Parameters.AddWithValue("@EndDate", addenddate3.Text);
            room3.Parameters.AddWithValue("@RentPrice", roomprice3.Text);
            room3.Parameters.AddWithValue("@Bathroom", roombath3.SelectedValue);
            room3.Parameters.AddWithValue("@roomname", Room3Name.Text);
            room3.ExecuteNonQuery();
        }
        else if (Int32.Parse(addBedrooms.SelectedValue) == 4)
        {
            string insertroom1 = "INSERT INTO[dbo].[PropertyRoom]([StartDate],[EndDate],[RentPrice],[Bathroom],[PropertyID],[PropertyRoomName]) VALUES(@StartDate,@EndDate,@RentPrice,@Bathroom,@PropertyID,@roomname)";
            SqlCommand room1 = new SqlCommand(insertroom1, cn);
            room1.Parameters.AddWithValue("@PropertyID", pid);
            room1.Parameters.AddWithValue("@StartDate", addstartdate1.Text);
            room1.Parameters.AddWithValue("@EndDate", addenddate1.Text);
            room1.Parameters.AddWithValue("@RentPrice", roomprice1.Text);
            room1.Parameters.AddWithValue("@Bathroom", roombath1.SelectedValue);
            room1.Parameters.AddWithValue("@roomname", Room1Name.Text);
            room1.ExecuteNonQuery();

            string insertroom2 = "INSERT INTO[dbo].[PropertyRoom]([StartDate],[EndDate],[RentPrice],[Bathroom],[PropertyID],[PropertyRoomName]) VALUES(@StartDate,@EndDate,@RentPrice,@Bathroom,@PropertyID,@roomname)";
            SqlCommand room2 = new SqlCommand(insertroom2, cn);
            room2.Parameters.AddWithValue("@PropertyID", pid);
            room2.Parameters.AddWithValue("@StartDate", addstartdate2.Text);
            room2.Parameters.AddWithValue("@EndDate", addenddate2.Text);
            room2.Parameters.AddWithValue("@RentPrice", roomprice2.Text);
            room2.Parameters.AddWithValue("@Bathroom", roombath2.SelectedValue);
            room2.Parameters.AddWithValue("@roomname", Room2Name.Text);
            room2.ExecuteNonQuery();

            string insertroom3 = "INSERT INTO[dbo].[PropertyRoom]([StartDate],[EndDate],[RentPrice],[Bathroom],[PropertyID],[PropertyRoomName]) VALUES(@StartDate,@EndDate,@RentPrice,@Bathroom,@PropertyID,@roomname)";
            SqlCommand room3 = new SqlCommand(insertroom3, cn);
            room3.Parameters.AddWithValue("@PropertyID", pid);
            room3.Parameters.AddWithValue("@StartDate", addstartdate3.Text);
            room3.Parameters.AddWithValue("@EndDate", addenddate3.Text);
            room3.Parameters.AddWithValue("@RentPrice", roomprice3.Text);
            room3.Parameters.AddWithValue("@Bathroom", roombath3.SelectedValue);
            room3.Parameters.AddWithValue("@roomname", Room3Name.Text);
            room3.ExecuteNonQuery();

            string insertroom4 = "INSERT INTO[dbo].[PropertyRoom]([StartDate],[EndDate],[RentPrice],[Bathroom],[PropertyID],[PropertyRoomName]) VALUES(@StartDate,@EndDate,@RentPrice,@Bathroom,@PropertyID,@roomname)";
            SqlCommand room4 = new SqlCommand(insertroom4, cn);
            room4.Parameters.AddWithValue("@PropertyID", pid);
            room4.Parameters.AddWithValue("@StartDate", addstartdate4.Text);
            room4.Parameters.AddWithValue("@EndDate", addenddate4.Text);
            room4.Parameters.AddWithValue("@RentPrice", roomprice4.Text);
            room4.Parameters.AddWithValue("@Bathroom", roombath4.SelectedValue);
            room4.Parameters.AddWithValue("@roomname", Room4Name.Text);
            room4.ExecuteNonQuery();
        }

        //upload images
        foreach (HttpPostedFile postedFile in FileUpload1.PostedFiles)
        {
            string filename = Path.GetFileName(postedFile.FileName);
            string contentType = postedFile.ContentType;
            using (Stream fs = postedFile.InputStream)
            {
                using (BinaryReader br = new BinaryReader(fs))
                {
                    byte[] bytes = br.ReadBytes((Int32)fs.Length);
                    //imgpreview.ImageUrl = "data:image;base64," + Convert.ToBase64String(bytes);
                    System.Data.SqlClient.SqlCommand picInsert = new System.Data.SqlClient.SqlCommand();
                    picInsert.Connection = cn;
                    picInsert.CommandText = "INSERT INTO[dbo].[ImagePath] (PropertyID, ImagePath) VALUES(@PropertyID, @ImagePath)";
                    picInsert.Parameters.AddWithValue("@PropertyID", pid);
                    picInsert.Parameters.AddWithValue("@ImagePath", bytes);
                    picInsert.ExecuteNonQuery();
                }
            }
        }
        Response.Redirect(Request.Url.AbsoluteUri);
        cn.Close();

        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
    }

    protected void goDashboard_Click(object sender, EventArgs e)
    {
        Response.Redirect("Host.aspx");
    }

    protected void addBedrooms_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (addBedrooms.SelectedIndex == 1)
        {
            room1.Visible = true;
        }
        else if (addBedrooms.SelectedIndex == 2)
        {
            room1.Visible = true;
            room2.Visible = true;
        }
        else if (addBedrooms.SelectedIndex == 3)
        {
            room1.Visible = true;
            room2.Visible = true;
            room3.Visible = true;
        }
        else if (addBedrooms.SelectedIndex == 4)
        {
            room1.Visible = true;
            room2.Visible = true;
            room3.Visible = true;
            room4.Visible = true;
        }
    }
}