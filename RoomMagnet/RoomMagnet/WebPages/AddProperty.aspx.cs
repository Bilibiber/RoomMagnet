using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class WebPages_AddProperty : System.Web.UI.Page
{
    private SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            addCountry.DataSource = objcountries();
            addCountry.DataBind();
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
        int UserID=1;
        string FirstName;
        string LastName;
        string FullName=" ";

        string select = "Select UserID, FirstName, LastName from [Users] Where Email = 'bishopob@dukes.jmu.edu'";
        SqlCommand selected = new SqlCommand(select, cn);
        SqlDataReader read = selected.ExecuteReader();
        if (read.Read())
        {
             UserID = read.GetInt32(0);
             FirstName = read.GetString(1);
             LastName = read.GetString(2);
             FullName = FirstName + LastName;
        }
        read.Close();
        string insert = "INSERT INTO [dbo].[Property]([PropertyID],[Title],[StreetAddress] ,[City],[HomeState] ,[Country],[ZipCode],[SquareFootage], [PermanentResidences], [TotalBedrooms], [TotalBathrooms], " +
            "[RentPrice],[AvailableBedrooms],[StartDate],[EndDate],[Filters],[ImagePath],[LastUpdated],[LastUpdatedBy],[HostID]) VALUES (" + 2 + ", @Title, @StreetAddress, @City, @HomeState, @Country," +
            " @ZipCode, @SquareFootage," + 2 + "," + 2 + ", " + 2 +", @RentPrice, @AvailableBedrooms, @StartDate, @EndDate, 'hello', 'hello', @LastUpdated, @LastUpdatedBy, " + 1 + ")";
        SqlCommand inserted = new SqlCommand(insert, cn);
        inserted.Parameters.AddWithValue("@Title", addtitle.Text);
        inserted.Parameters.AddWithValue("@StreetAddress", addStreet.Text);
        inserted.Parameters.AddWithValue("@City", addCity.Text);
        inserted.Parameters.AddWithValue("@HomeState", addState.SelectedValue);
        inserted.Parameters.AddWithValue("@Country", addCountry.SelectedValue);
        inserted.Parameters.AddWithValue("ZipCode", addZip.Text);
        inserted.Parameters.AddWithValue("@SquareFootage", addSquare.Text);
        inserted.Parameters.AddWithValue("@RentPrice", addPrice.Text);
        inserted.Parameters.AddWithValue("@AvailableBedrooms", addAvailable.Text);
        inserted.Parameters.AddWithValue("@StartDate", Convert.ToDateTime(addstartdate.Text));
        inserted.Parameters.AddWithValue("@EndDate", Convert.ToDateTime(addenddate.Text));
        inserted.Parameters.AddWithValue("@LastUpdated", DateTime.Now);
        inserted.Parameters.AddWithValue("@LastUpdatedBy", FullName);
        //inserted.Parameters.AddWithValue("@HostID", UserID);
        inserted.ExecuteNonQuery();
        cn.Close();

    }
}