using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Windows.Controls;


public partial class WebPages_SearchResult : System.Web.UI.Page

{
    SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ToString());
    int resultCount;

    string OrderBy = String.Empty;
    ArrayList RatingsPID = new ArrayList();
    int RowCount = 0;
    int RowNum;
    protected void Page_Load(object sender, EventArgs e)
    {
        SearchResultCount.Text = "Total Property Found: " + resultCount.ToString();
        Property1Image.Visible = false; Property1Title.Visible = false; Property1RentPrice.Visible = false; Property1CityState.Visible = false; Property1HostPic.Visible = false;
        Property2Image.Visible = false; Property2Title.Visible = false; Property2RentPrice.Visible = false; Property2CityState.Visible = false; Property2HostPic.Visible = false;
        Property3Image.Visible = false; Property3Title.Visible = false; Property3RentPrice.Visible = false; Property3CityState.Visible = false; Property3HostPic.Visible = false;
        Property4Image.Visible = false; Property4Title.Visible = false; Property4RentPrice.Visible = false; Property4CityState.Visible = false; Property4HostPic.Visible = false;
        Property5Image.Visible = false; Property5Title.Visible = false; Property5RentPrice.Visible = false; Property5CityState.Visible = false; Property5HostPic.Visible = false;

        if (Session["SignInEmail"] == null)
        {
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openLoginModal();", true);
        }
        else
        {
            var master = Master as RoomMagnet;
            master.AfterLogin();
        }
        if (Session["HomePageSearchContent"] != null)
        {
            address.Text = Session["HomePageSearchContent"].ToString();
            SearchResultButton_Click(sender, e);
            Session["HomePageSearchContent"] = null;
        }
    }

    protected void ApplyButton_Click(object sender, EventArgs e)
    {
        SearchResultButton_Click(sender, e);

    }
    protected void SearchResultButton_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "ReLoadTheMap", "geocodeAddress()", true);

        Property1Image.Visible = false; Property1Title.Visible = false; Property1RentPrice.Visible = false; Property1CityState.Visible = false; Property1HostPic.Visible = false;
        Property2Image.Visible = false; Property2Title.Visible = false; Property2RentPrice.Visible = false; Property2CityState.Visible = false; Property2HostPic.Visible = false;
        Property3Image.Visible = false; Property3Title.Visible = false; Property3RentPrice.Visible = false; Property3CityState.Visible = false; Property3HostPic.Visible = false;
        Property4Image.Visible = false; Property4Title.Visible = false; Property4RentPrice.Visible = false; Property4CityState.Visible = false; Property4HostPic.Visible = false;
        Property5Image.Visible = false; Property5Title.Visible = false; Property5RentPrice.Visible = false; Property5CityState.Visible = false; Property5HostPic.Visible = false;

        ResultPg2.Visible = false; ResultPg3.Visible = false; ResultPg4.Visible = false; ResultPg5.Visible = false; ResultPg6.Visible = false;
        resultCount = 0;
        if (SearchResultMinPrice.Text == String.Empty)
        {
            SearchResultMinPrice.Text = "0";
        }
        if (SearchResultMaxPrice.Text == String.Empty)
        {
            SearchResultMaxPrice.Text = "5000";
        }
        string BedsCmpr;
        if (SearchResultBedsAvailable.Text != "4+")
        {
            BedsCmpr = "=" + SearchResultBedsAvailable.Text;
        }
        else
        {
            BedsCmpr = ">= 4";
        }
        String startDate;
        String endDate;
        String HomeType;
        startDate = " AND([Property].StartDate >= \'" + SearchResultStartDate.Text + "\')";
        endDate = " AND ([Property].EndDate <= \'" + SearchResultEndDate.Text + "\')";
        if (SearchResultStartDate.Text == String.Empty)
        {
            startDate = " ";
        }
        if (SearchResultEndDate.Text == String.Empty)
        {
            endDate = " ";
        }
        connection.Open();

        int result;
        string sql;
        string sql2;
        string tempsql;
        if (SearchResultBedsAvailable.Text == String.Empty)
        {
            BedsCmpr = "> 0";
        }
        if (SearchResultHomeType.Text == "Home Type")
        {
            HomeType = " ";
        }
        else
        {
            HomeType = " AND ([Property].HomeType = \'" + SearchResultHomeType.Text + "\') ";
        }

        if (Int32.TryParse(address.Text, out result))
        {

            sql = "With cte_Property AS(Select ROW_NUMBER() over(" +
           "Order BY [Property].RentPrice " + OrderBy + ") row_num, Title, [Property].City, [Property].HomeState, [Property].ZipCode, AvailableBedrooms, [Property].RentPrice, [Property].StartDate, [Property].EndDate, [ImagePath].ImagePath," +
           "AvailableBathrooms, [Property].PropertyID from[Property] inner join [ImagePath] on[Property].PropertyID = [ImagePath].PropertyID" +
           " WHERE([Property].ZipCode = " + address.Text + ") AND(RentPrice <= " + SearchResultMaxPrice.Text + ") AND(RentPrice >=" + SearchResultMinPrice.Text + ")" +
              "AND(AvailableBedrooms " + BedsCmpr + ")" + startDate + endDate + HomeType + ") ";
            tempsql = sql;

            sql += " Select Title, City, HomeState, ZipCode, AvailableBedrooms, RentPrice, StartDate, EndDate, ImagePath, AvailableBathrooms, PropertyID, row_num from cte_Property where row_num >" + RowCount + OrderBy;
            sql2 = tempsql + " Select Max(row_num) from cte_Property";
        }
        else
        {
            //Needs validator to make sure User enters a city, state
            string City = address.Text.Substring(0, address.Text.IndexOf(','));
            string State = address.Text.Substring(address.Text.IndexOf(',') + 1);

            sql = "With cte_Property AS(Select ROW_NUMBER() over(" +
           "Order BY [Property].RentPrice " + OrderBy + ") row_num, Title, [Property].City, [Property].HomeState, [Property].ZipCode, AvailableBedrooms, [Property].RentPrice, [Property].StartDate, [Property].EndDate, [ImagePath].ImagePath," +
           "AvailableBathrooms, [Property].PropertyID from[Property] inner join [ImagePath] on[Property].PropertyID = [ImagePath].PropertyID  WHERE ([Property].City = \'" + City + "\')" + "And ([Property].HomeState = \'" + State + "\')" + "AND([Property].RentPrice <= " + SearchResultMaxPrice.Text + ") AND([Property].RentPrice >=" + SearchResultMinPrice.Text + ")" +
              "AND([Property].AvailableBedrooms " + BedsCmpr + ")" + startDate + endDate + HomeType + ") ";
            tempsql = sql;

            sql += " Select Title, City, HomeState, ZipCode, AvailableBedrooms, RentPrice, StartDate, EndDate, ImagePath, AvailableBathrooms, PropertyID  from cte_Property where row_num >" + RowCount;
            sql2 = tempsql + " Select Max(row_num) from cte_Property";

        }



        OrderBy = String.Empty;
        if (address.Text != String.Empty)
        {
            SqlCommand search = new SqlCommand(sql, connection);
            SqlDataReader reader = search.ExecuteReader();
            if (reader.HasRows)
            {

                while (reader.Read())
                {

                    resultCount++;
                    decimal x;
                    string y;
                    if (resultCount == 1)
                    {

                        RatingsPID.Add(reader.GetInt32(10));
                        x = reader.GetDecimal(5);
                        y = String.Format("{0:0.##}", x);
                        Property1Title.Text = reader.GetString(0);
                        Property1Title.Visible = true;

                        Property1Bath.Text = reader.GetInt32(9).ToString() + " Bathroom";

                        Property1RentPrice.Text = "$" + y + "/Month";
                        Property1RentPrice.Visible = true;
                        Property1CityState.Text = reader.GetString(1) + "," + reader.GetString(2);
                        Property1CityState.Visible = true;
                        Property1Bath.Text = reader.GetInt32(9).ToString() + " Bathroom";
                        Property1Bed.Text = reader.GetInt32(4).ToString() + " Bed";
                        byte[] images = (byte[])reader[8];
                        if (images == null)
                        {
                            return;
                        }
                        else
                        {
                            Property1Image.ImageUrl = "data:image;base64," + Convert.ToBase64String(images);
                            Property1Image.Visible = true;

                        }

                    }

                    if (resultCount == 2)
                    {
                        RatingsPID.Add(reader.GetInt32(10));
                        x = reader.GetDecimal(5);
                        y = String.Format("{0:0.##}", x);
                        Property2Title.Text = reader.GetString(0);
                        Property2Title.Visible = true;


                        Property2RentPrice.Text = "$" + y + "/Month";
                        Property2RentPrice.Visible = true;
                        Property2CityState.Text = reader.GetString(1) + "," + reader.GetString(2);
                        Property2CityState.Visible = true;
                        Property2Bath.Text = reader.GetInt32(9).ToString() + " Bathroom";
                        Property2Bed.Text = reader.GetInt32(4).ToString() + " Bed";
                        byte[] images = (byte[])reader[8];
                        if (images == null)
                        {
                            return;
                        }
                        else
                        {
                            Property2Image.ImageUrl = "data:image;base64," + Convert.ToBase64String(images);
                            Property2Image.Visible = true;

                        }

                    }
                    if (resultCount == 3)
                    {
                        RatingsPID.Add(reader.GetInt32(10));
                        x = reader.GetDecimal(5);
                        y = String.Format("{0:0.##}", x);
                        Property3Title.Text = reader.GetString(0);
                        Property3Title.Visible = true;
                        Property3RentPrice.Text = "$" + y + "/Month";
                        Property3RentPrice.Visible = true;
                        Property3CityState.Text = reader.GetString(1) + "," + reader.GetString(2);
                        Property3CityState.Visible = true;
                        Property3Bath.Text = reader.GetInt32(9).ToString() + " Bathroom";
                        Property3Bed.Text = reader.GetInt32(4).ToString() + " Bed";
                        byte[] images = (byte[])reader[8];
                        if (images == null)
                        {
                            return;
                        }
                        else
                        {
                            Property3Image.ImageUrl = "data:image;base64," + Convert.ToBase64String(images);
                            Property3Image.Visible = true;

                        }

                    }
                    if (resultCount == 4)
                    {
                        RatingsPID.Add(reader.GetInt32(10));
                        x = reader.GetDecimal(5);
                        y = String.Format("{0:0.##}", x);
                        Property4Title.Text = reader.GetString(0);
                        Property4Title.Visible = true;


                        Property4RentPrice.Text = "$" + y + "/Month";
                        Property4RentPrice.Visible = true;
                        Property4CityState.Text = reader.GetString(1) + "," + reader.GetString(2);
                        Property4CityState.Visible = true;
                        Property4Bath.Text = reader.GetInt32(9).ToString() + " Bathroom";
                        Property4Bed.Text = reader.GetInt32(4).ToString() + " Bed";
                        byte[] images = (byte[])reader[8];
                        if (images == null)
                        {
                            return;
                        }
                        else
                        {
                            Property4Image.ImageUrl = "data:image;base64," + Convert.ToBase64String(images);
                            Property4Image.Visible = true;

                        }

                    }
                    if (resultCount == 5)
                    {
                        RatingsPID.Add(reader.GetInt32(10));
                        x = reader.GetDecimal(5);
                        y = String.Format("{0:0.##}", x);
                        Property5Title.Text = reader.GetString(0);
                        Property5Title.Visible = true;
                        Property5RentPrice.Text = "$" + y + "/Month";
                        Property5RentPrice.Visible = true;
                        Property5CityState.Text = reader.GetString(1) + "," + reader.GetString(2);
                        Property5CityState.Visible = true;
                        Property5Bath.Text = reader.GetInt32(9).ToString() + " Bathroom";
                        Property5Bed.Text = reader.GetInt32(4).ToString() + " Bed";
                        byte[] images = (byte[])reader[8];
                        if (images == null)
                        {
                            return;
                        }
                        else
                        {
                            Property5Image.ImageUrl = "data:image;base64," + Convert.ToBase64String(images);
                            Property5Image.Visible = true;

                        }

                    }


                }
                reader.NextResult();

            }
            reader.Close();
            SqlCommand Resultsearch = new SqlCommand(sql2, connection);
            SqlDataReader Resultreader = Resultsearch.ExecuteReader();
            if (Resultreader.HasRows)
            {

                while (Resultreader.Read())
                {
                    RowNum = (int)Resultreader.GetInt64(0);
                }
            }
            Resultreader.Close();
            SearchResultCount.Text = "Total Properties Found: " + RowNum.ToString();
            if (RowNum > 5)
            {
                ResultPg2.Visible = true;
            }

            for (int i = 0; i < RatingsPID.Count; i++)
            {
                string RatingSQL = "Select NumStars from [Rating] where PropertyID =" + RatingsPID[i];
                SqlCommand Ratingsearch = new SqlCommand(RatingSQL, connection);
                SqlDataReader readers = Ratingsearch.ExecuteReader();
                decimal RatingSum = 0;
                int RatingCount = 0;
                int RatingRecordCount = 0;
                if (readers.HasRows)
                {
                    while (readers.Read())
                    {
                        RatingSum += readers.GetDecimal(0);
                        RatingRecordCount++;
                    }
                }
                if (RatingRecordCount == 0)
                {
                    return;
                }
                if (RatingCount == 0)
                {
                    Property1Rating.Text = (RatingSum / RatingRecordCount).ToString();
                }
                if (RatingCount == 1)
                {
                    Property2Rating.Text = (RatingSum / RatingRecordCount).ToString();
                }
                if (RatingCount == 2)
                {
                    Property3Rating.Text = (RatingSum / RatingRecordCount).ToString();
                }
                if (RatingCount == 3)
                {
                    Property4Rating.Text = (RatingSum / RatingRecordCount).ToString();
                }
                if (RatingCount == 4)
                {
                    Property5Rating.Text = (RatingSum / RatingRecordCount).ToString();
                }

                RatingCount++;
                readers.Close();
            }
            RatingsPID.Clear();



        }

      
    
        else
        {
            //SearchLabel.Text = "Please enter something in the text bar.";
        }

       
    }
    
    protected void HighToLow_Click(object sender, EventArgs e)
    {
        OrderBy = " desc";
        SearchResultButton_Click(sender, e);
    }

    protected void LowToHigh_Click(object sender, EventArgs e)
    {
        OrderBy = " asc";
        SearchResultButton_Click(sender, e);
    }


    protected void Property1Image_Click(object sender, ImageClickEventArgs e)
    {
        connection.Open();
        string sql = "Select PropertyID,ImagePath from [ImagePath]";
        SqlCommand search = new SqlCommand(sql, connection);
        SqlDataReader reader = search.ExecuteReader();

        if (reader.HasRows)
        {
            while (reader.Read())
            {
                byte[] images = (byte[])reader[1];
                int PropertyID = reader.GetInt32(0);
                if (images == null)
                {
                    return;
                }
                else
                {
                    string CmprImageURL = "data:image;base64," + Convert.ToBase64String(images);
                    if(CmprImageURL == Property1Image.ImageUrl)
                    {
                        Session["ResultPropertyID"] = PropertyID;
                    }

                }
            }
        }
        connection.Close();
        Response.Redirect("ManageSearchProperties.aspx");
    }
    protected void Property2Image_Click(object sender, ImageClickEventArgs e)
    {
        connection.Open();
        string sql = "Select PropertyID,ImagePath from [ImagePath]";
        SqlCommand search = new SqlCommand(sql, connection);
        SqlDataReader reader = search.ExecuteReader();

        if (reader.HasRows)
        {
            while (reader.Read())
            {
                byte[] images = (byte[])reader[8];
                int PropertyID = reader.GetInt32(0);
                if (images == null)
                {
                    return;
                }
                else
                {
                    string CmprImageURL = "data:image;base64," + Convert.ToBase64String(images);
                    if (CmprImageURL == Property2Image.ImageUrl)
                    {
                        Session["ResultPropertyID"] = PropertyID;
                    }

                }
            }
        }
        connection.Close();
        Response.Redirect("ManageSearchProperties.aspx");
    }

    protected void Property3Image_Click(object sender, ImageClickEventArgs e)
    {
        connection.Open();
        string sql = "Select PropertyID,ImagePath from [ImagePath]";
        SqlCommand search = new SqlCommand(sql, connection);
        SqlDataReader reader = search.ExecuteReader();

        if (reader.HasRows)
        {
            while (reader.Read())
            {
                byte[] images = (byte[])reader[8];
                int PropertyID = reader.GetInt32(0);
                if (images == null)
                {
                    return;
                }
                else
                {
                    string CmprImageURL = "data:image;base64," + Convert.ToBase64String(images);
                    if (CmprImageURL == Property3Image.ImageUrl)
                    {
                        Session["ResultPropertyID"] = PropertyID;
                    }

                }
            }
        }
        connection.Close();
        Response.Redirect("ManageSearchProperties.aspx");
    }

    protected void Property4Image_Click(object sender, ImageClickEventArgs e)
    {
        connection.Open();
        string sql = "Select PropertyID,ImagePath from [ImagePath]";
        SqlCommand search = new SqlCommand(sql, connection);
        SqlDataReader reader = search.ExecuteReader();

        if (reader.HasRows)
        {
            while (reader.Read())
            {
                byte[] images = (byte[])reader[8];
                int PropertyID = reader.GetInt32(0);
                if (images == null)
                {
                    return;
                }
                else
                {
                    string CmprImageURL = "data:image;base64," + Convert.ToBase64String(images);
                    if (CmprImageURL == Property4Image.ImageUrl)
                    {
                        Session["ResultPropertyID"] = PropertyID;
                    }

                }
            }
        }
        connection.Close();
        Response.Redirect("ManageSearchProperties.aspx");
    }

    protected void Property5Image_Click(object sender, ImageClickEventArgs e)
    {
        connection.Open();
        string sql = "Select PropertyID,ImagePath from [ImagePath]";
        SqlCommand search = new SqlCommand(sql, connection);
        SqlDataReader reader = search.ExecuteReader();

        if (reader.HasRows)
        {
            while (reader.Read())
            {
                byte[] images = (byte[])reader[8];
                int PropertyID = reader.GetInt32(0);
                if (images == null)
                {
                    return;
                }
                else
                {
                    string CmprImageURL = "data:image;base64," + Convert.ToBase64String(images);
                    if (CmprImageURL == Property5Image.ImageUrl)
                    {
                        Session["ResultPropertyID"] = PropertyID;
                    }

                }
                
            }
        }
        connection.Close();
        Response.Redirect("ManageSearchProperties.aspx");
    }

    protected void ResultPg1_Click(object sender, EventArgs e)
    {
        RowCount = 0;
        SearchResultButton_Click(sender, e);

    }

    protected void ResultPg2_Click(object sender, EventArgs e)
    {
        RowCount = 5;
        SearchResultButton_Click(sender, e);
    }

    protected void ResultPg3_Click(object sender, EventArgs e)
    {

    }

    protected void ResultPg4_Click(object sender, EventArgs e)
    {

    }

    protected void ResultPg5_Click(object sender, EventArgs e)
    {

    }

    protected void ResultPg6_Click(object sender, EventArgs e)
    {

    }
}
