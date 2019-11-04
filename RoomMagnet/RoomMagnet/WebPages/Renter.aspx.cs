using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class WebPages_Renter : System.Web.UI.Page
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

    protected void renterSavedSearch_Click(object sender, EventArgs e)
    {
        renterinfor.Visible = true;
        rentersearch.Visible = true;
        rentermymessage.Visible = false;
        renterconnection.Visible = false;
        renterpreferences.Visible = false;
        renterbecomehost.Visible = false;
        renteraddAmenities.Visible = false;
        renterSettingpanel.Visible = false;
        renterSavedSearch.ForeColor = System.Drawing.Color.Red;
        renterMessage.ForeColor = System.Drawing.Color.White;
        renterConnections.ForeColor = System.Drawing.Color.White;
        renterPreference.ForeColor = System.Drawing.Color.White;
        rentertohost.ForeColor = System.Drawing.Color.White;
        renterSetting.ForeColor = System.Drawing.Color.White;
    }

    protected void renterMessage_Click(object sender, EventArgs e)
    {
        renterinfor.Visible = true;
        rentermymessage.Visible = true;
        rentersearch.Visible = false;
        renterconnection.Visible = false;
        renterpreferences.Visible = false;
        renterbecomehost.Visible = false;
        renteraddAmenities.Visible = false;
        renterSettingpanel.Visible = false;
        renterSavedSearch.ForeColor = System.Drawing.Color.White;
        renterMessage.ForeColor = System.Drawing.Color.Red;
        renterConnections.ForeColor = System.Drawing.Color.White;
        renterPreference.ForeColor = System.Drawing.Color.White;
        rentertohost.ForeColor = System.Drawing.Color.White;
        renterSetting.ForeColor = System.Drawing.Color.White;
    }

    protected void renterConnections_Click(object sender, EventArgs e)
    {
        renterinfor.Visible = true;
        rentersearch.Visible = false;
        rentermymessage.Visible = false;
        renterconnection.Visible = true;
        renterpreferences.Visible = false;
        renterbecomehost.Visible = false;
        renteraddAmenities.Visible = false;
        renterSettingpanel.Visible = false;
        renterSavedSearch.ForeColor = System.Drawing.Color.White;
        renterMessage.ForeColor = System.Drawing.Color.White;
        renterConnections.ForeColor = System.Drawing.Color.Red;
        renterPreference.ForeColor = System.Drawing.Color.White;
        rentertohost.ForeColor = System.Drawing.Color.White;
        renterSetting.ForeColor = System.Drawing.Color.White;
    }

    protected void renterPreference_Click(object sender, EventArgs e)
    {
        renterinfor.Visible = true;
        rentersearch.Visible = false;
        rentermymessage.Visible = false;
        renterconnection.Visible = false;
        renterpreferences.Visible = true;
        renterbecomehost.Visible = false;
        renteraddAmenities.Visible = false;
        renterSettingpanel.Visible = false;
        renterSavedSearch.ForeColor = System.Drawing.Color.White;
        renterMessage.ForeColor = System.Drawing.Color.White;
        renterConnections.ForeColor = System.Drawing.Color.White;
        renterPreference.ForeColor = System.Drawing.Color.Red;
        rentertohost.ForeColor = System.Drawing.Color.White;
        renterSetting.ForeColor = System.Drawing.Color.White;
    }

    protected void rentertohost_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddProperty.aspx");
        renterinfor.Visible = false;
        rentersearch.Visible = false;
        rentermymessage.Visible = false;
        renterconnection.Visible = false;
        renterpreferences.Visible = false;
        renterbecomehost.Visible = true;
        renteraddAmenities.Visible = true;
        renterSettingpanel.Visible = false;
        renterSavedSearch.ForeColor = System.Drawing.Color.White;
        renterMessage.ForeColor = System.Drawing.Color.White;
        renterConnections.ForeColor = System.Drawing.Color.White;
        renterPreference.ForeColor = System.Drawing.Color.White;
        rentertohost.ForeColor = System.Drawing.Color.Red;
        renterSetting.ForeColor = System.Drawing.Color.White;
    }
    protected void renterSetting_Click(object sender, EventArgs e)
    {
        renterinfor.Visible = false;
        rentersearch.Visible = false;
        rentermymessage.Visible = false;
        renterconnection.Visible = false;
        renterpreferences.Visible = false;
        renterbecomehost.Visible = false;
        renteraddAmenities.Visible = false;
        renterSettingpanel.Visible = true;
        renterSavedSearch.ForeColor = System.Drawing.Color.White;
        renterMessage.ForeColor = System.Drawing.Color.White;
        renterConnections.ForeColor = System.Drawing.Color.White;
        renterPreference.ForeColor = System.Drawing.Color.White;
        rentertohost.ForeColor = System.Drawing.Color.White;
        renterSetting.ForeColor = System.Drawing.Color.Red;
    }

    protected void post_Click(object sender, EventArgs e)
    {
        /*
         * This will be saved for the update user information button.
         * There will be no information added to the host table outside of the update and signup pages
         */
        cn.Open();
        string insert = "INSERT INTO [dbo].[Hosts]([HostID],[StreetAddress] ,[City],[HomeState],[Country],[ZipCode])" +
            "VALUES" +
            "(" + 2 + " @StreetAddress, @City, @HomeState, @Country, @ZipCode)";
        SqlCommand inserted = new SqlCommand(insert, cn);
        inserted.Parameters.AddWithValue("@StreetAddress", addStreet.Text);
        inserted.Parameters.AddWithValue("@City", addCity.Text);
        inserted.Parameters.AddWithValue("@HomeState", addState.SelectedValue);
        inserted.Parameters.AddWithValue("@Country", addCountry.SelectedValue);
        inserted.Parameters.AddWithValue("ZipCode", addZip.Text);
        inserted.ExecuteNonQuery();
        cn.Close();
    }


    protected void cancel_Click(object sender, EventArgs e)
    {
        renterSavedSearch_Click(sender, e);
    }
}