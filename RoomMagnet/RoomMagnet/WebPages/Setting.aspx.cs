using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Windows.Forms;

public partial class WebPages_Setting : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["SignInEmail"] == null)
        {
        }
        else
        {
            var master = Master as RoomMagnet;
            master.AfterLogin();
        }

        //if (!IsPostBack)
        //{
        //    setCountry.DataSource = objcountries();
        //    setCountry.DataBind(); +     $exception  { "Invalid column name 'Description'."}
        //    System.Data.SqlClient.SqlException

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
                setfirstname.Text = getinfor.GetString(0);
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
            System.Data.SqlClient.SqlCommand updateusers = new System.Data.SqlClient.SqlCommand();
            updateusers.Connection = db;
            int usersid = Convert.ToInt32(Session["UserID"]);
            if (setconfirmpass.Text == "")
            {
                updateusers.CommandText = "UPDATE [dbo].[Users] SET [FirstName] = @FirstName , [LastName] = @LastName , [MiddleName] = @MiddleName, Gender = @Gender, " +
                "Occupation = @Occupation, Description=@Description,LastUpdated=@LastUpdated,LastUpdatedBy=@LastUpdatedBy WHERE [UserID] = @UserID";

                updateusers.Parameters.Add(new SqlParameter("@FirstName", setfirstname.Text));
                updateusers.Parameters.Add(new SqlParameter("@MiddleName", setmiddlename.Text));
                updateusers.Parameters.Add(new SqlParameter("@LastName", setlastname.Text));
                updateusers.Parameters.Add(new SqlParameter("@Gender", setgender.Text));
                updateusers.Parameters.Add(new SqlParameter("@Occupation", setOccupation.Text));
                updateusers.Parameters.Add(new SqlParameter("@Description", setdescription.Text));
                updateusers.Parameters.Add(new SqlParameter("@LastUpdated", DateTime.Now));
                updateusers.Parameters.Add(new SqlParameter("@LastUpdatedBy", setfirstname.Text + " " + setlastname.Text));
                updateusers.Parameters.Add(new SqlParameter("@UserID", usersid));

                updateusers.ExecuteNonQuery();
                db.Close();
            }
            else
            {
                updateusers.CommandText = "UPDATE [dbo].[Users] SET [FirstName] = @FirstName , [LastName] = @LastName , [MiddleName] = @MiddleName, Gender = @Gender, " +
                 "Occupation = @Occupation, Description=@Description,LastUpdated=@LastUpdated,LastUpdatedBy=@LastUpdatedBy, Password=@Password WHERE [UserID] = @UserID";

                updateusers.Parameters.Add(new SqlParameter("@FirstName", setfirstname.Text));
                updateusers.Parameters.Add(new SqlParameter("@MiddleName", setmiddlename.Text));
                updateusers.Parameters.Add(new SqlParameter("@LastName", setlastname.Text));
                updateusers.Parameters.Add(new SqlParameter("@Gender", setgender.Text));
                updateusers.Parameters.Add(new SqlParameter("@Occupation", setOccupation.Text));
                updateusers.Parameters.Add(new SqlParameter("@Description", setdescription.Text));
                updateusers.Parameters.Add(new SqlParameter("@LastUpdated", DateTime.Now));
                updateusers.Parameters.Add(new SqlParameter("@LastUpdatedBy", setfirstname.Text + " " + setlastname.Text));
                string newpass = PasswordHash.HashPassword(setconfirmpass.Text);
                updateusers.Parameters.Add(new SqlParameter("@Password", newpass));
                updateusers.Parameters.Add(new SqlParameter("@UserID", usersid));

                updateusers.ExecuteNonQuery();
                db.Close();
            }
        }
        catch (Exception)
        {
        }

        // update image
        string filepath = Server.MapPath("\\Upload");
        HttpFileCollection uploadedFiles = Request.Files;
        string fileNames = String.Empty;
        string filePaths = String.Empty;

        for (int i = 0; i < uploadedFiles.Count; i++)
        {
            HttpPostedFile userPostedFile = uploadedFiles[i];
            try
            {
                if (userPostedFile.ContentLength > 0)
                {
                    userPostedFile.SaveAs(filepath + "\\" + Path.GetFileName(userPostedFile.FileName));
                    fileNames += userPostedFile.FileName + " ";
                    filePaths += filepath + "\\" + Path.GetFileName(userPostedFile.FileName) + " ";
                }
            }
            catch (Exception)
            {
            }
        }

        string imgLocation = "";

        Thread t = new Thread((ThreadStart)(() =>
        {
            OpenFileDialog opendlg = new OpenFileDialog();
            //opendlg.Filter = "png files(*.png)|*.png|jpg files(*.jpg)|*.jpg|All files(*.*)";
            if (opendlg.ShowDialog() == DialogResult.OK)
            {
                imgLocation = opendlg.FileName.ToString();
            }
            byte[] images = null;
            FileStream stream = new FileStream(imgLocation, FileMode.Open, FileAccess.Read);
            BinaryReader brs = new BinaryReader(stream);
            images = brs.ReadBytes((int)stream.Length);
            Session["image"] = images;
            byte[] sessionimg = (byte[])Session["image"];

            db.Open();
            System.Data.SqlClient.SqlCommand updateuser = new System.Data.SqlClient.SqlCommand();
            updateuser.Connection = db;
            int userid = Convert.ToInt32(Session["UserID"]);
            updateuser.CommandText = "UPDATE [dbo].[Users] SET [ImagePath] = @image  WHERE [UserID] = @UserID";

            updateuser.Parameters.Add(new SqlParameter("@image", images));
            updateuser.Parameters.Add(new SqlParameter("@UserID", userid));
            updateuser.ExecuteNonQuery();

            db.Close();
        }));

        // Run your code from a thread that joins the STA Thread
        t.SetApartmentState(ApartmentState.STA);
        t.Start();
        t.Join();

        //Open modal
        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
    }

    protected void goDashboard_Click(object sender, EventArgs e)
    {
        Response.Redirect("Renter.aspx");
    }
}