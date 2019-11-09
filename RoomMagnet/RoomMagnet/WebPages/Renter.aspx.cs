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
                byte[] img = (byte[])getimg[0];
                imgpreview.ImageUrl = "data:image;base64," + Convert.ToBase64String(img);
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
            selectuser.CommandText = "select [FirstName], [Gender], [Occupation], [Description], [DateOfBirth] from [RoomMagnet].[dbo].[Users] where [UserID] =@UserID";
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
                if (!getinfor.IsDBNull(4))
                {
                    DateTime birth = getinfor.GetDateTime(4);
                    DateTime now = DateTime.Now;
                    int age = now.Year - birth.Year;
                    if (now.Month < birth.Month || (now.Month == birth.Month && now.Day < birth.Day))
                        age--;
                    userAge.Text = age.ToString();
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

    protected void renterSavedSearch_Click(object sender, EventArgs e)
    {
        renterinfor.Visible = true;
        rentersearch.Visible = true;
        rentermymessage.Visible = false;
        renterconnection.Visible = false;
        renterpreferences.Visible = false;
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
        renterSavedSearch.ForeColor = System.Drawing.Color.White;
        renterMessage.ForeColor = System.Drawing.Color.White;
        renterConnections.ForeColor = System.Drawing.Color.White;
        renterPreference.ForeColor = System.Drawing.Color.White;
        rentertohost.ForeColor = System.Drawing.Color.Red;
        renterSetting.ForeColor = System.Drawing.Color.White;
    }
    protected void renterSetting_Click(object sender, EventArgs e)
    {
        Response.Redirect("Setting.aspx");
        renterinfor.Visible = false;
        rentersearch.Visible = false;
        rentermymessage.Visible = false;
        renterconnection.Visible = false;
        renterpreferences.Visible = false;
        renterSavedSearch.ForeColor = System.Drawing.Color.White;
        renterMessage.ForeColor = System.Drawing.Color.White;
        renterConnections.ForeColor = System.Drawing.Color.White;
        renterPreference.ForeColor = System.Drawing.Color.White;
        rentertohost.ForeColor = System.Drawing.Color.White;
        renterSetting.ForeColor = System.Drawing.Color.Red;
    }



    protected void cancel_Click(object sender, EventArgs e)
    {
        renterSavedSearch_Click(sender, e);
    }
}