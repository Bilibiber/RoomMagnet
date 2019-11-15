using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Globalization;
using System.IO;
using System.Text;
using System.Threading;
using System.Web;
using System.Windows.Forms;

public partial class WebPages_AddProperty : System.Web.UI.Page
{
    private SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
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
        Response.Redirect("Renter.aspx");
    }

    protected void post_Click(object sender, EventArgs e)
    {
        cn.Open();
        int userid = Convert.ToInt32(Session["UserID"]);
        string FullName = Session["FullName"].ToString();

        string insert = "INSERT INTO [dbo].[Property]([Title],[StreetAddress] ,[City],[HomeState] ,[Country],[ZipCode],[SquareFootage],[RentPrice],[AvailableBedrooms]," +
            "[StartDate],[EndDate],[LastUpdated],[LastUpdatedBy],[HostID]) VALUES (@Title, @StreetAddress, @City, @HomeState, @Country,@ZipCode, @SquareFootage, @RentPrice," +
            " @AvailableBedrooms, @StartDate, @EndDate,@LastUpdated, @LastUpdatedBy,@HostID)";
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
        inserted.Parameters.AddWithValue("@StartDate", Convert.ToDateTime(addstartdate.Text));
        inserted.Parameters.AddWithValue("@EndDate", Convert.ToDateTime(addenddate.Text));
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
                    imgpreview.ImageUrl = "data:image;base64," + Convert.ToBase64String(bytes);
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
    }

   
   


    //protected void Upload_Click(object sender, EventArgs e)
    //{
    //    foreach (HttpPostedFile postedFile in FileUpload1.PostedFiles)
    //    {
    //        string filename = Path.GetFileName(postedFile.FileName);
    //        string contentType = postedFile.ContentType;
    //        using (Stream fs = postedFile.InputStream)
    //        {
    //            using (BinaryReader br = new BinaryReader(fs))
    //            {
    //                byte[] bytes = br.ReadBytes((Int32)fs.Length);

    //                cn.Open();
    //                System.Data.SqlClient.SqlCommand updateuser = new System.Data.SqlClient.SqlCommand();
    //                updateuser.Connection = cn;
    //                updateuser.CommandText = "INSERT INTO [dbo].[testpath] ([path]) VALUES (@image)";

    //                updateuser.Parameters.Add(new SqlParameter("@image", bytes));
    //                updateuser.ExecuteNonQuery();

    //                cn.Close();
    //                Label1.Text = bytes.ToString();
    //            }
    //        }
    //    }
    //    Response.Redirect(Request.Url.AbsoluteUri);

    //}

    
}