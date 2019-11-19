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
        SqlConnection db = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ToString());
        if (!IsPostBack)
        {
            db.Open();
            System.Data.SqlClient.SqlCommand selectimg = new System.Data.SqlClient.SqlCommand();
            selectimg.Connection = db;
            int userid = Convert.ToInt32(Session["UserID"]);
            selectimg.CommandText = "select [ImagePath] from [RoomMagnet].[dbo].[Users] where [UserID] =@UserID";
            selectimg.Parameters.Add(new SqlParameter("@UserID", userid));
            SqlDataReader getimg = selectimg.ExecuteReader();
            while (getimg.Read())
            {
                //byte[] img = (byte[])getimg[0];
                //imgpreview.ImageUrl = "data:image;base64," + Convert.ToBase64String(img);
                if (getimg[0].ToString() != "Null")
                {
                    if (!Convert.IsDBNull(getimg[0]))
                    {
                        byte[] img = (byte[])getimg[0];
                        imgpreview.ImageUrl = "data:image;base64," + Convert.ToBase64String(img);
                    }
                    else
                    {
                        imgpreview.ImageUrl = "http://cliquecities.com/assets/no-image-e3699ae23f866f6cbdf8ba2443ee5c4e.jpg";
                    }


                }
                else
                {

                }
            }
            getimg.Close();
            db.Close();
        }
        if (Session["SignInEmail"] == null)
        {
        }
        else
        {
            var master = Master as RoomMagnet;
            master.AfterLogin();
        }

        if (!IsPostBack)
        {
            setCountry.DataSource = objcountries();
            setCountry.DataBind();
        }

        if (!IsPostBack)
        {
            db.Open();
            System.Data.SqlClient.SqlCommand selectuser = new System.Data.SqlClient.SqlCommand();
            selectuser.Connection = db;
            int userid = Convert.ToInt32(Session["UserID"]);
            selectuser.CommandText = "select [FirstName], [MiddleName], [LastName], [Gender], [Occupation], [Description], [StreetAddress],[City],[HomeState],[ZipCode],[Country] from [RoomMagnet].[dbo].[Users] where [UserID] =@UserID";
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
                if (!getinfor.IsDBNull(6))
                {
                    setStreet.Text = getinfor.GetString(6);
                }
                if (!getinfor.IsDBNull(7))
                {
                    setCity.Text = getinfor.GetString(7);
                }
                if (!getinfor.IsDBNull(8))
                {
                    setState.SelectedValue = getinfor.GetString(8);
                }
                if (!getinfor.IsDBNull(9))
                {
                    setZip.Text = getinfor.GetString(9);
                }
                if (!getinfor.IsDBNull(10))
                {
                    setCountry.SelectedValue = getinfor.GetString(10);
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
                updateusers.CommandText = "UPDATE [dbo].[Users] SET [FirstName] = @FirstName , [LastName] = @LastName , [MiddleName] = @MiddleName, Gender = @Gender," +
                    "Occupation = @Occupation, Description = @Description,StreetAddress=@StreetAddress,City=@City,Country=@Country,HomeState=@HomeState,ZipCode=@ZipCode,LastUpdated=@LastUpdated," +
                    "LastUpdatedBy=@LastUpdatedBy WHERE [UserID] = @UserID";

                updateusers.Parameters.Add(new SqlParameter("@FirstName", setfirstname.Text));
                updateusers.Parameters.Add(new SqlParameter("@MiddleName", setmiddlename.Text));
                updateusers.Parameters.Add(new SqlParameter("@LastName", setlastname.Text));
                updateusers.Parameters.Add(new SqlParameter("@Gender", setgender.Text));
                updateusers.Parameters.Add(new SqlParameter("@Occupation", setOccupation.Text));
                updateusers.Parameters.Add(new SqlParameter("@Description", setdescription.Text));
                updateusers.Parameters.Add(new SqlParameter("@StreetAddress", setStreet.Text));
                updateusers.Parameters.Add(new SqlParameter("@City", setCity.Text));
                updateusers.Parameters.Add(new SqlParameter("@Country", setCountry.SelectedValue));
                updateusers.Parameters.Add(new SqlParameter("@HomeState", setState.SelectedValue));
                updateusers.Parameters.Add(new SqlParameter("@ZipCode", setZip.Text));
                updateusers.Parameters.Add(new SqlParameter("@LastUpdated", DateTime.Now));
                updateusers.Parameters.Add(new SqlParameter("@LastUpdatedBy", setfirstname.Text + " " + setlastname.Text));
                updateusers.Parameters.Add(new SqlParameter("@UserID", usersid));

                updateusers.ExecuteNonQuery();
                db.Close();
            }
            else
            {
                updateusers.CommandText = "UPDATE [dbo].[Users] SET [FirstName] = @FirstName , [LastName] = @LastName , [MiddleName] = @MiddleName, Gender = @Gender, " +
                 "Occupation = @Occupation, Description=@Description,[StreetAddress]=@[StreetAddress],[City]=@[City],Country=@Country,[HomeState]=@[HomeState],[ZipCode]=@[ZipCode]," +
                 "LastUpdated=@LastUpdated, LastUpdatedBy=@LastUpdatedBy, Password=@Password WHERE [UserID] = @UserID";

                updateusers.Parameters.Add(new SqlParameter("@FirstName", setfirstname.Text));
                updateusers.Parameters.Add(new SqlParameter("@MiddleName", setmiddlename.Text));
                updateusers.Parameters.Add(new SqlParameter("@LastName", setlastname.Text));
                updateusers.Parameters.Add(new SqlParameter("@Gender", setgender.Text));
                updateusers.Parameters.Add(new SqlParameter("@Occupation", setOccupation.Text));
                updateusers.Parameters.Add(new SqlParameter("@Description", setdescription.Text));
                updateusers.Parameters.Add(new SqlParameter("@StreetAddress", setStreet.Text));
                updateusers.Parameters.Add(new SqlParameter("@City", setCity.Text));
                updateusers.Parameters.Add(new SqlParameter("@Country", setCountry.SelectedValue));
                updateusers.Parameters.Add(new SqlParameter("@HomeState", setState.SelectedValue));
                updateusers.Parameters.Add(new SqlParameter("@ZipCode", setZip.Text));
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
        db.Close();


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
        if (imgpreview.ImageUrl != "http://cliquecities.com/assets/no-image-e3699ae23f866f6cbdf8ba2443ee5c4e.jpg")
        {
            db.Open();
            byte[] sessionimg = (byte[])Session["image"];
            if (sessionimg != null)
            {
                System.Data.SqlClient.SqlCommand updateuser = new System.Data.SqlClient.SqlCommand();
                updateuser.Connection = db;
                int userid = Convert.ToInt32(Session["UserID"]);
                updateuser.CommandText = "UPDATE [dbo].[Users] SET [ImagePath] = @image  WHERE [UserID] = @UserID";

                updateuser.Parameters.Add(new SqlParameter("@image", sessionimg));
                updateuser.Parameters.Add(new SqlParameter("@UserID", userid));
                updateuser.ExecuteNonQuery();
            }
            

            db.Close();
        }

        ScriptManager.RegisterStartupScript(this, this.GetType(), "p", "ShowPopup();", true);

    }

    protected void goDashboard_Click(object sender, EventArgs e)
    {
        Response.Redirect("Renter.aspx");
    }

    protected void Upload_Click(object sender, EventArgs e)
    {
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
            if (imgLocation != "")
            {
                FileStream stream = new FileStream(imgLocation, FileMode.Open, FileAccess.Read);
                BinaryReader brs = new BinaryReader(stream);
                images = brs.ReadBytes((int)stream.Length);
                Session["image"] = images;
                imgpreview.ImageUrl = "data:image;base64," + Convert.ToBase64String(images);
            }
        }));

        // Run your code from a thread that joins the STA Thread
        t.SetApartmentState(ApartmentState.STA);
        t.Start();
        t.Join();
    }
}