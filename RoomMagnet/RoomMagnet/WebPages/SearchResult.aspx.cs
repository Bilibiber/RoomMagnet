using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class WebPages_SearchResult : System.Web.UI.Page
    
{
    SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ToString());
    int resultCount;
    string OrderBy=String.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        SearchResultCount.Text = "Total Property Found: " + resultCount.ToString();
        Property1Image.Visible = false; Property1Title.Visible = false; Property1RentPrice.Visible = false; Property1CityState.Visible = false;
        Property2Image.Visible = false; Property2Title.Visible = false; Property2RentPrice.Visible = false; Property2CityState.Visible = false;
        Property3Image.Visible = false; Property3Title.Visible = false; Property3RentPrice.Visible = false; Property3CityState.Visible = false;
        Property4Image.Visible = false; Property4Title.Visible = false; Property4RentPrice.Visible = false; Property4CityState.Visible = false;
        Property5Image.Visible = false; Property5Title.Visible = false; Property5RentPrice.Visible = false; Property5CityState.Visible = false;

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

        resultCount = 0;
        if (SearchResultMinPrice.Text==String.Empty)
        {
            SearchResultMinPrice.Text = "0";
        }
        if (SearchResultMaxPrice.Text == String.Empty)
        {
            SearchResultMaxPrice.Text = "5000";
        }
        string BedsCmpr;
        if (SearchResultBedsAvailable.Text!="4+")
        {
            BedsCmpr = "=" + SearchResultBedsAvailable.Text;
        }
        else
        {
            BedsCmpr = ">= 4"; 
        }
        String startDate;
        String endDate;
        startDate = " AND([Property].StartDate >= \'" + SearchResultStartDate.Text + "\')";
        endDate = " AND ([Property].EndDate <= \'" + SearchResultEndDate.Text + "\')";
        if (SearchResultStartDate.Text== String.Empty)
        {
            startDate = " ";
        }
        if(SearchResultEndDate.Text== String.Empty)
        {
            endDate = " ";
        }
        connection.Open();

        int result;
        string sql;
        if (SearchResultBedsAvailable.Text== String.Empty)
        {
            BedsCmpr = "> 0";
        }
        if (Int32.TryParse(address.Text, out result))
        {
            sql = "Select Title, City, HomeState, ZipCode, AvailableBedrooms, RentPrice, [Property].StartDate, [Property].EndDate, "
        + "ImagePath from [Property] inner join [ImagePath]"
        + " on [Property].PropertyID = [ImagePath].PropertyID WHERE (ZipCode = " + address.Text + ")"
                + " AND (RentPrice <= " + SearchResultMaxPrice.Text + ") AND "
        + "(RentPrice >= " + SearchResultMinPrice.Text + ")"
            + "AND (AvailableBedrooms " + BedsCmpr + ")"
            + startDate
            + endDate + OrderBy;
        }
        else
        {
            //Needs validator to make sure User enters a city, state
            string City = address.Text.Substring(0, address.Text.IndexOf(','));
            string State = address.Text.Substring(address.Text.IndexOf(',') + 1);

            sql = "Select Title, City, HomeState, ZipCode, AvailableBedrooms, RentPrice, [Property].StartDate, [Property].EndDate, "
         + "ImagePath from [Property] inner join [ImagePath] "
         + " on [Property].PropertyID = [ImagePath].PropertyID WHERE (City = \'" + City + "\')" + "And (HomeState = \'" + State + "\')"
                 + " AND (RentPrice <= " + SearchResultMaxPrice.Text + ") AND "
         + "(RentPrice >= " + SearchResultMinPrice.Text + ")"
                + " AND (AvailableBedrooms " + BedsCmpr + ")"
               + startDate
               + endDate + OrderBy;
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
                        x = reader.GetDecimal(5);
                        y = String.Format("{0:0.##}", x);
                        Property1Title.Text = reader.GetString(0);
                        Property1Title.Visible = true;
                        

                        Property1RentPrice.Text = "$" + y + "/Month";
                        Property1RentPrice.Visible = true;
                        Property1CityState.Text= reader.GetString(1) + "," + reader.GetString(2);
                        Property1CityState.Visible = true;
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
                        x = reader.GetDecimal(5);
                        y = String.Format("{0:0.##}", x);
                        Property2Title.Text = reader.GetString(0);
                        Property2Title.Visible = true;


                        Property2RentPrice.Text = "$" + y + "/Month";
                        Property2RentPrice.Visible = true;
                        Property2CityState.Text = reader.GetString(1) + "," + reader.GetString(2);
                        Property2CityState.Visible = true;
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
                            x = reader.GetDecimal(5);
                            y = String.Format("{0:0.##}", x);
                            Property3Title.Text = reader.GetString(0);
                            Property3Title.Visible = true;
                            Property3RentPrice.Text = "$" + y + "/Month";
                            Property3RentPrice.Visible = true;
                            Property3CityState.Text = reader.GetString(1) + "," + reader.GetString(2);
                            Property3CityState.Visible = true;
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
                            x = reader.GetDecimal(5);
                            y = String.Format("{0:0.##}", x);
                            Property4Title.Text = reader.GetString(0);
                            Property4Title.Visible = true;


                            Property4RentPrice.Text = "$" + y + "/Month";
                            Property4RentPrice.Visible = true;
                            Property4CityState.Text = reader.GetString(1) + "," + reader.GetString(2);
                            Property4CityState.Visible = true;
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
                    if (resultCount ==5)
                        {
                            x = reader.GetDecimal(5);
                            y = String.Format("{0:0.##}", x);
                            Property5Title.Text = reader.GetString(0);
                            Property5Title.Visible = true;
                            Property5RentPrice.Text = "$" + y + "/Month";
                            Property5RentPrice.Visible = true;
                            Property5CityState.Text = reader.GetString(1) + "," + reader.GetString(2);
                            Property5CityState.Visible = true;
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
                SearchResultCount.Text = "("+resultCount.ToString()+ ")";
            }
           
            connection.Close();
            }
            else
            {
                //SearchLabel.Text = "Please enter something in the text bar.";
            }

        //GetObject objectI = new GetObject();
        //objectI.RequestItem("testProperty.jpg");
    }
    //public string queryToJSON(String GoogleMapQuery)
    //{
    //    try
    //    {
    //        if (connection.State == System.Data.ConnectionState.Closed)
    //        {
    //            connection.Open();
    //        }
    //        SqlCommand sc = conn
    //        sc.CommandText = GoogleMapQuery;
    //        SqlDataReader sdr = sc.ExecuteReader()

    //    }
    //    catch (Exception)
    //    {

    //    }
    //}
    //public static string GetAddressformap()
    //{

    //}



    protected void HighToLow_Click(object sender, EventArgs e)
    {
        OrderBy = "ORDER BY RentPrice desc";
        SearchResultButton_Click(sender, e);
    }

    protected void LowToHigh_Click(object sender, EventArgs e)
    {
        OrderBy = "ORDER BY RentPrice asc";
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
                byte[] images = (byte[])reader[8];
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
    }
}
