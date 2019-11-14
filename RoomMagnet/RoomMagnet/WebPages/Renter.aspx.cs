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