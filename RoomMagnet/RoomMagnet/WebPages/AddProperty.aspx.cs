using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class WebPages_AddProperty : System.Web.UI.Page
{
    private SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        Label4.Visible = false;
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
            addState.Enabled = true;
        }
        else {
            addState.SelectedIndex = 0;
            addState.Enabled = false;
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

    //public string SaveFile(HttpPostedFile file)
    //{
    //    // Specify the path to save the uploaded file to.
    //    string savePath = "c:\\temp\\uploads\\";

    //    // Get the name of the file to upload.
    //    //string fileName = FileUpload1.FileName;

    //    // Create the path and file name to check for duplicates.
    //    string pathToCheck = savePath + fileName;

    //    // Create a temporary file name to use for checking duplicates.
    //    string tempfileName = "";

    //    // Check to see if a file already exists with the
    //    // same name as the file to upload.        
    //    if (System.IO.File.Exists(pathToCheck))
    //    {
    //        int counter = 2;
    //        while (System.IO.File.Exists(pathToCheck))
    //        {
    //            // if a file with this name already exists,
    //            // prefix the filename with a number.
    //            tempfileName = counter.ToString() + fileName;
    //            pathToCheck = savePath + tempfileName;
    //            counter++;
    //        }

    //        fileName = tempfileName;

    //        // Notify the user that the file name was changed.
    //        Label4.Text = "A file with the same name already exists." +
    //            "<br />Your file was saved as " + fileName;
    //    }
    //    else
    //    {
    //        // Notify the user that the file was saved successfully.
    //        Label4.Text = "Your file was uploaded successfully.";
    //    }
    //    // Append the name of the file to upload to the path.
    //   // savePath += fileName;

    //    // Call the SaveAs method to save the uploaded
    //    // file to the specified directory.
    //    //FileUpload1.SaveAs(savePath);
    //    return savePath;
    //}

    protected void post_Click(object sender, EventArgs e)
    {
        cn.Open();
        int UserID = 1;
        string FirstName;
        string LastName;
        string FullName = " ";
        string objectName;
        string filePath;
        //if (FileUpload1.HasFiles)
        //{

        //filePath = SaveFile(FileUpload1.PostedFile);







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
            " @ZipCode, @SquareFootage," + 2 + "," + 2 + ", " + 2 + ", @RentPrice, @AvailableBedrooms, @StartDate, @EndDate, 'hello', 'hello', @LastUpdated, @LastUpdatedBy, " + 1 + ")";
        SqlCommand inserted = new SqlCommand(insert, cn);
        inserted.Parameters.AddWithValue("@Title", addtitle.Text);
        inserted.Parameters.AddWithValue("@StreetAddress", addStreet.Text);
        inserted.Parameters.AddWithValue("@City", addCity.Text);
        inserted.Parameters.AddWithValue("@HomeState", addState.SelectedValue);
        inserted.Parameters.AddWithValue("@Country", addCountry.SelectedValue);
        inserted.Parameters.AddWithValue("ZipCode", addZip.Text);
        inserted.Parameters.AddWithValue("@SquareFootage", addSquare.Text);
        inserted.Parameters.AddWithValue("@RentPrice", addPrice.Text);
        inserted.Parameters.AddWithValue("@AvailableBedrooms", 1);
        inserted.Parameters.AddWithValue("@StartDate", Convert.ToDateTime(addstartdate.Text));
        inserted.Parameters.AddWithValue("@EndDate", Convert.ToDateTime(addenddate.Text));
        inserted.Parameters.AddWithValue("@LastUpdated", DateTime.Now);
        inserted.Parameters.AddWithValue("@LastUpdatedBy", FullName);
        //inserted.Parameters.AddWithValue("@HostID", UserID);
        inserted.ExecuteNonQuery(); 
        cn.Close();
        Label4.Text = "File has been uploaded.";
        Label4.Visible = true; 
        //}
        //else
        //{
        //    Label4.Text = "A file has not been uploaded, try again.";
        //    Label4.Visible = true;
        //}
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
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
                    filePaths += filepath + "\\" + Path.GetFileName(userPostedFile.FileName) +" ";
                }
            }
            catch (Exception)
            {
                Label4.Text = "An unexpected error has occurred";
            }
        }
    }
}