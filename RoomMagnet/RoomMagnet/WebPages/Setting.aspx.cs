using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebPages_Setting : System.Web.UI.Page
{
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

        //if (!IsPostBack)
        //{
        //    setCountry.DataSource = objcountries();
        //    setCountry.DataBind();+		$exception	{"Invalid column name 'Description'."}	System.Data.SqlClient.SqlException

        //}

        if (!IsPostBack)
        {
            SqlConnection db = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ToString());
            db.Open();
            System.Data.SqlClient.SqlCommand selectuser = new System.Data.SqlClient.SqlCommand();
            selectuser.Connection = db;
            int userid = Convert.ToInt32(Session["UserID"]);
            selectuser.CommandText = "select [FirstName], [MiddleName], [LastName], [Gender], [Occupation], [Description] from [RoomMagnet].[dbo].[Users] where [UserID] =@UserID";
            selectuser.Parameters.Add(new SqlParameter("@UserID", userid));
            SqlDataReader getinfor = selectuser.ExecuteReader();
            while (getinfor.Read())
            {
                firstNameTxt.Text = getinfor.GetString(0);
                if (!getinfor.IsDBNull(1))
                {
                    setmiddlename.Text = getinfor.GetString(1);
                }
                setlastname.Text = getinfor.GetString(2);
                if (!getinfor.IsDBNull(3))
                {
                    setgender.SelectedValue = getinfor.GetString(3);
                }
                if (!getinfor.IsDBNull(4))
                {
                    setOccupation.Text = getinfor.GetString(4);
                }
                if (!getinfor.IsDBNull(5))
                {
                    setdescription.Text = getinfor.GetString(5);
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

    protected void updateusersetting_Click(object sender, EventArgs e)
    {
        string connect = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
        SqlConnection db = new SqlConnection(connect);
        try
        {
            db.Open();
            System.Data.SqlClient.SqlCommand updateuser = new System.Data.SqlClient.SqlCommand();
            updateuser.Connection = db;
            int userid = Convert.ToInt32(Session["UserID"]);
            if (setconfirmpass.Text == "")
            {
                updateuser.CommandText = "UPDATE [dbo].[Users] SET [FirstName] = @FirstName , [LastName] = @LastName , [MiddleName] = @MiddleName, Gender = @Gender, " +
                "Occupation = @Occupation, Description=@Description,LastUpdated=@LastUpdated,LastUpdatedBy=@LastUpdatedBy WHERE [UserID] = @UserID";

                updateuser.Parameters.Add(new SqlParameter("@FirstName", firstNameTxt.Text));
                updateuser.Parameters.Add(new SqlParameter("@MiddleName", setmiddlename.Text));
                updateuser.Parameters.Add(new SqlParameter("@LastName", setlastname.Text));
                updateuser.Parameters.Add(new SqlParameter("@Gender", setgender.Text));
                updateuser.Parameters.Add(new SqlParameter("@Occupation", setOccupation.Text));
                updateuser.Parameters.Add(new SqlParameter("@Description", setdescription.Text));
                updateuser.Parameters.Add(new SqlParameter("@LastUpdated", DateTime.Now));
                updateuser.Parameters.Add(new SqlParameter("@LastUpdatedBy", firstNameTxt.Text + " " + setlastname.Text));
                updateuser.Parameters.Add(new SqlParameter("@UserID", userid));

                updateuser.ExecuteNonQuery();
                db.Close();
            }
            else
            {
                updateuser.CommandText = "UPDATE [dbo].[Users] SET [FirstName] = @FirstName , [LastName] = @LastName , [MiddleName] = @MiddleName, Gender = @Gender, " +
                 "Occupation = @Occupation, Description=@Description,LastUpdated=@LastUpdated,LastUpdatedBy=@LastUpdatedBy, Password=@Password WHERE [UserID] = @UserID";

                updateuser.Parameters.Add(new SqlParameter("@FirstName", firstNameTxt.Text));
                updateuser.Parameters.Add(new SqlParameter("@MiddleName", setmiddlename.Text));
                updateuser.Parameters.Add(new SqlParameter("@LastName", setlastname.Text));
                updateuser.Parameters.Add(new SqlParameter("@Gender", setgender.Text));
                updateuser.Parameters.Add(new SqlParameter("@Occupation", setOccupation.Text));
                updateuser.Parameters.Add(new SqlParameter("@Description", setdescription.Text));
                updateuser.Parameters.Add(new SqlParameter("@LastUpdated", DateTime.Now));
                updateuser.Parameters.Add(new SqlParameter("@LastUpdatedBy", firstNameTxt.Text + " " + setlastname.Text));
                string newpass = PasswordHash.HashPassword(setconfirmpass.Text);
                updateuser.Parameters.Add(new SqlParameter("@Password", newpass));
                updateuser.Parameters.Add(new SqlParameter("@UserID", userid));

                updateuser.ExecuteNonQuery();
                db.Close();
            }

        }
        catch (Exception)
        {

        }
        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);


    }

    protected void goDashboard_Click(object sender, EventArgs e)
    {
        Response.Redirect("Renter.aspx");
    }
}