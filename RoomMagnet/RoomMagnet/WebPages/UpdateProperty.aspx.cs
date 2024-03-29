﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Web;
using System.Windows.Forms;
using System.Linq;
using System.Threading;
using System.Web.UI.WebControls;
using System.Web.UI;

public partial class WebPages_UpdateProperty : System.Web.UI.Page
{
    private SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        Comparestart1.ValueToCompare = DateTime.Now.ToShortDateString();
        Comparestart2.ValueToCompare = DateTime.Now.ToShortDateString();
        Comparestart3.ValueToCompare = DateTime.Now.ToShortDateString();
        Comparestart4.ValueToCompare = DateTime.Now.ToShortDateString();
        if (!IsPostBack)
        {
            room1.Visible = false;
            room2.Visible = false;
            room3.Visible = false;
            room4.Visible = false;

            //select property date from database
            cn.Open();
            string select = "SELECT [Title],[StreetAddress],[City],[HomeState],[Country],[ZipCode],[SquareFootage],[AvailableBedrooms]," +
                "[AvailableBathrooms],[RentPrice],[Descriptions],[HomeType] FROM [RoomMagnet].[dbo].[Property] where propertyid = @pid";
            SqlCommand property = new SqlCommand(select, cn);
            property.Parameters.AddWithValue("@pid", Int32.Parse(Session["updatepropertyID"].ToString()));
            SqlDataReader reader = property.ExecuteReader();
            while (reader.Read())
            {
                addtitle.Text = reader.GetString(0);
                addStreet.Text = reader.GetString(1);
                addCity.Text = reader.GetString(2);
                addCountry.SelectedValue = reader.GetString(4);
                addState.SelectedValue = reader.GetString(3);
                addZip.Text = reader.GetString(5);
                addSquare.Text = reader.GetInt32(6).ToString();
                decimal price = Convert.ToDecimal(string.Format("{0:F2}", reader.GetDecimal(9).ToString()));
                addPrice.Text = price.ToString("0.00");
                addbath.Text = reader.GetInt32(7).ToString();
                addBedrooms.Text = reader.GetInt32(8).ToString();
                propertydes.Text = reader.GetString(10);
                addType.SelectedValue = reader.GetString(11);
            }
            reader.Close();

            // select property room
            string selectroom = "SELECT[StartDate],[EndDate],[RentPrice],[Bathroom],[PropertyRoomName] FROM [RoomMagnet].[dbo].[PropertyRoom] where PropertyId = @pid";
            SqlCommand room = new SqlCommand(selectroom, cn);
            room.Parameters.AddWithValue("@pid", Int32.Parse(Session["updatepropertyID"].ToString()));
            SqlDataReader readroom = room.ExecuteReader();
            int numbers = 0;
            while (readroom.Read())
            {
                numbers++;
                if (numbers == 1)
                {
                    room1.Visible = true;
                    decimal price = Convert.ToDecimal(string.Format("{0:F2}", readroom.GetDecimal(2).ToString()));
                    roomprice1.Text = price.ToString("0.00");
                    roombath1.SelectedValue = readroom.GetString(3);
                    addstartdate1.Text = readroom.GetDateTime(0).ToString("MM/dd/yyyy");
                    addenddate1.Text = readroom.GetDateTime(1).ToString("MM/dd/yyyy");
                    Room1Name.Text = readroom.GetString(4);
                }
                if (numbers == 2)
                {
                    room2.Visible = true;
                    decimal price = Convert.ToDecimal(string.Format("{0:F2}", readroom.GetDecimal(2).ToString()));
                    roomprice2.Text = price.ToString("0.00");
                    roombath2.SelectedValue = readroom.GetString(3);
                    addstartdate2.Text = readroom.GetDateTime(0).ToString("MM/dd/yyyy");
                    addenddate2.Text = readroom.GetDateTime(1).ToString("MM/dd/yyyy");
                    Room2Name.Text = readroom.GetString(4);
                }
                if (numbers == 3)
                {
                    room3.Visible = true;
                    decimal price = Convert.ToDecimal(string.Format("{0:F2}", readroom.GetDecimal(2).ToString()));
                    roomprice3.Text = price.ToString("0.00");
                    roombath3.SelectedValue = readroom.GetString(3);
                    addstartdate3.Text = readroom.GetDateTime(0).ToString("MM/dd/yyyy");
                    addenddate3.Text = readroom.GetDateTime(1).ToString("MM/dd/yyyy");
                    Room3Name.Text = readroom.GetString(4);
                }
                if (numbers == 4)
                {
                    room4.Visible = true;
                    decimal price = Convert.ToDecimal(string.Format("{0:F2}", readroom.GetDecimal(2).ToString()));
                    roomprice4.Text = price.ToString("0.00");
                    roombath4.SelectedValue = readroom.GetString(3);
                    addstartdate4.Text = readroom.GetDateTime(0).ToString("MM/dd/yyyy");
                    addenddate4.Text = readroom.GetDateTime(1).ToString("MM/dd/yyyy");
                    Room4Name.Text = readroom.GetString(4);
                }
            }
            readroom.Close();

            //select Amenities from database
            string selectamen = "SELECT[AirConditioning],[Heating],[OnSiteLaundry],[Parking],[Furnished],[PetFriendly],[CarbonMonoxideDetector]," +
                "[SmokeDetector],[SeperateEntrance],[WiFi],[TV],[SeparateBathroom],[Other] FROM [RoomMagnet].[dbo].[Amenities] where propertyid = @pid";
            SqlCommand amen = new SqlCommand(selectamen, cn);
            amen.Parameters.AddWithValue("@pid", Int32.Parse(Session["updatepropertyID"].ToString()));
            SqlDataReader readamen = amen.ExecuteReader();
            while (readamen.Read())
            {
                if (readamen.GetString(0) == "Y")
                {
                    checkcondition.Checked = true;
                }
                if (readamen.GetString(1) == "Y")
                {
                    checkheating.Checked = true;
                }
                if (readamen.GetString(2) == "Y")
                {
                    checkLaundry.Checked = true;
                }
                if (readamen.GetString(3) == "Y")
                {
                    checkParking.Checked = true;
                }
                if (readamen.GetString(4) == "Y")
                {
                    checkFurnished.Checked = true;
                }
                if (readamen.GetString(5) == "Y")
                {
                    checkpet.Checked = true;
                }
                if (readamen.GetString(6) == "Y")
                {
                    checkcarbondetector.Checked = true;
                }
                if (readamen.GetString(7) == "Y")
                {
                    checksomkedetector.Checked = true;
                }
                if (readamen.GetString(8) == "Y")
                {
                    checkspeentrance.Checked = true;
                }
                if (readamen.GetString(9) == "Y")
                {
                    checkWifi.Checked = true;
                }
                if (readamen.GetString(10) == "Y")
                {
                    checkTV.Checked = true;
                }
                if (readamen.GetString(11) == "Y")
                {
                    checkspebath.Checked = true;
                }
                if (readamen.GetString(12) != "")
                {
                    checkcondition.Checked = true;
                    othertextbox.Text = readamen.GetString(12);
                }
            }
            readamen.Close();
            cn.Close();
        }
       

        if (Session["SignInEmail"] == null)
        {
            Response.Redirect("Home.aspx");
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
        Response.Redirect("Host.aspx");
    }

    protected void post_Click(object sender, EventArgs e)
    {
        int userid = Convert.ToInt32(Session["UserID"]);
        string FullName = Session["FullName"].ToString();
        int pid = Convert.ToInt32(Session["updatepropertyID"]);

        cn.Open();
        System.Data.SqlClient.SqlCommand update = new System.Data.SqlClient.SqlCommand();
        update.Connection = cn;
        update.CommandText = "UPDATE [dbo].[Property] SET [Title] = @title,[StreetAddress] = @street,[City] = @city,[HomeState] = @state,[Country] = @country,[ZipCode] = @zip," +
            "[SquareFootage] = @square,[AvailableBedrooms] =@bedrooms ,[AvailableBathrooms] = @bathrooms,[RentPrice] = @price,[StartDate] = @start,[EndDate] = @end,[HostID] = @hostid," +
            "[LastUpdated] = @lastUpdated,[LastUpdatedBy] = @lastUpdatedBy,[Descriptions] = @Descriptions, [HomeType] = @HomeType WHERE propertyid =@pid";
        update.Parameters.AddWithValue("@title", addtitle.Text);
        update.Parameters.AddWithValue("@street", addStreet.Text);
        update.Parameters.AddWithValue("@city", addCity.Text);
        update.Parameters.AddWithValue("@state", addState.SelectedValue);
        update.Parameters.AddWithValue("@country", addCountry.SelectedValue);
        update.Parameters.AddWithValue("@zip", addZip.Text);
        update.Parameters.AddWithValue("@square", addSquare.Text);
        update.Parameters.AddWithValue("@price", addPrice.Text);
        update.Parameters.AddWithValue("@bedrooms", addBedrooms.SelectedValue);
        update.Parameters.AddWithValue("@bathrooms", addbath.SelectedValue);
        update.Parameters.AddWithValue("@start", DateTime.Now.ToString("d"));
        update.Parameters.AddWithValue("@end", DateTime.Now.ToString("d"));
        update.Parameters.AddWithValue("@hostid", userid);
        update.Parameters.AddWithValue("@lastUpdated", DateTime.Now.ToString("d"));
        update.Parameters.AddWithValue("@lastUpdatedBy", FullName);
        update.Parameters.AddWithValue("@Descriptions", propertydes.Text);
        update.Parameters.AddWithValue("@HomeType", addType.SelectedValue);
        update.Parameters.AddWithValue("@pid", pid);
        update.ExecuteNonQuery();
        cn.Close();

        cn.Open();
        string updateamen = "UPDATE [dbo].[Amenities] SET [AirConditioning] = @AC,[Heating] =@Heating,[OnSiteLaundry] = @Laundry,[Parking] = @Parking,[Furnished] = @Furnished,[PetFriendly] = @Pet," +
            "[CarbonMonoxideDetector] =@Carbondetector,[SmokeDetector] =@SmokeDetector,[SeperateEntrance] = @SeperateEntrance,[WiFi] =@WiFi,[TV] = @TV,[SeparateBathroom] = @SeparateBathroom,[Other] = @Other WHERE propertyid = @pid";
        SqlCommand updated = new SqlCommand(updateamen, cn);
        updated.Parameters.AddWithValue("@pid", pid);
        updated.Parameters.AddWithValue("@AC", checkcondition.Checked ? 'Y' : 'N');
        updated.Parameters.AddWithValue("@Heating", checkheating.Checked ? 'Y' : 'N');
        updated.Parameters.AddWithValue("@Laundry", checkLaundry.Checked ? 'Y' : 'N');
        updated.Parameters.AddWithValue("@Parking", checkParking.Checked ? 'Y' : 'N');
        updated.Parameters.AddWithValue("@Furnished", checkFurnished.Checked ? 'Y' : 'N');
        updated.Parameters.AddWithValue("@Pet", checkpet.Checked ? 'Y' : 'N');
        updated.Parameters.AddWithValue("@Carbondetector", checkcarbondetector.Checked ? 'Y' : 'N');
        updated.Parameters.AddWithValue("@SmokeDetector", checksomkedetector.Checked ? 'Y' : 'N');
        updated.Parameters.AddWithValue("@SeperateEntrance", checkspeentrance.Checked ? 'Y' : 'N');
        updated.Parameters.AddWithValue("@WiFi", checkspeentrance.Checked ? 'Y' : 'N');
        updated.Parameters.AddWithValue("@TV", checkTV.Checked ? 'Y' : 'N');
        updated.Parameters.AddWithValue("@SeparateBathroom", checkspebath.Checked ? 'Y' : 'N');
        updated.Parameters.AddWithValue("@Other", checkOther.Checked ? othertextbox.Text : "");
        updated.ExecuteNonQuery();

        string delectroom = "DELETE FROM [dbo].[PropertyRoom] WHERE propertyid = @pid";
        SqlCommand delect = new SqlCommand(delectroom, cn);
        delect.Parameters.AddWithValue("@pid", pid);
        delect.ExecuteNonQuery();

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

    protected void updateimg_Click(object sender, EventArgs e)
    {
        cn.Open();
        int pid = Convert.ToInt32(Session["updatepropertyID"]);
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
        cn.Close();
        Response.Redirect(Request.Url.AbsoluteUri);
    }
}