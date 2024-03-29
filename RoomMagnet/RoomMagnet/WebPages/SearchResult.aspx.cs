﻿using System;
using System.Collections;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using System.Web.UI;

public partial class WebPages_SearchResult : System.Web.UI.Page

{
    private SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ToString());

    private int resultCount = 0;

    private string OrderBy = String.Empty;
    private ArrayList RatingsPID = new ArrayList();
    private ArrayList PID = new ArrayList();
    private int RowCount = 0;
    private int RowNum;
    private int RowMinus = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
 
      
        SearchResultCount.Text = "Total Property Found: " + resultCount.ToString();
        Property1Space.Visible = false;
        Property2Space.Visible = false;
        Property3Space.Visible = false;
        Property4Space.Visible = false;
        Property5Space.Visible = false;
        ResultPg2.Visible = false; ResultPg3.Visible = false; ResultPg4.Visible = false; ResultPg5.Visible = false; ResultPg6.Visible = false;
        rating1.Visible = false; rating2.Visible = false; rating3.Visible = false; rating4.Visible = false; rating5.Visible = false;

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
        SearchResultMinPrice.Text = string.Empty;
        SearchResultMaxPrice.Text = string.Empty;
    }

    protected void ApplyButton_Click(object sender, EventArgs e)
    {
        if (address.Text == string.Empty)
        {
            FilterLbl.Visible = true;
            FilterLbl.Text = "Please enter a location first";
        }
        else
        {
            SearchResultButton_Click(sender, e);

        }
    }

    protected void SearchResultButton_Click(object sender, EventArgs e)
    {
        if (CustomValidator1.IsValid)
        {         
            Property1Space.Visible = false;
            Property2Space.Visible = false;
            Property3Space.Visible = false;
            Property4Space.Visible = false;
            Property5Space.Visible = false;

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
               "Order BY [Property].RentPrice " + OrderBy + ") row_num, Title, [Property].City, [Property].HomeState, [Property].ZipCode, AvailableBedrooms, [Property].RentPrice, [Property].StartDate, [Property].EndDate, " +
               "AvailableBathrooms, [Property].PropertyID from[Property] " +
               " WHERE([Property].ZipCode = " + address.Text + ") AND(RentPrice <= " + SearchResultMaxPrice.Text + ") AND(RentPrice >=" + SearchResultMinPrice.Text + ")" +
                  "AND(AvailableBedrooms " + BedsCmpr + ")" + startDate + endDate + HomeType + ") ";
                tempsql = sql;

                sql += " Select distinct Title, City, HomeState, ZipCode, AvailableBedrooms, RentPrice, StartDate, EndDate, AvailableBathrooms, PropertyID, row_num from cte_Property where row_num >" + RowCount;
                sql2 = tempsql + " Select Max(row_num) from cte_Property";
            }
            else
            {
                //Needs validator to make sure User enters a city, state
                string City = address.Text.Substring(0, address.Text.IndexOf(','));
                string State = address.Text.Substring(address.Text.IndexOf(',') + 1);

                sql = "With cte_Property AS(Select ROW_NUMBER() over(" +
               "Order BY [Property].RentPrice " + OrderBy + ") row_num, Title, [Property].City, [Property].HomeState, [Property].ZipCode, AvailableBedrooms, [Property].RentPrice, [Property].StartDate, [Property].EndDate, " +
               "AvailableBathrooms, [Property].PropertyID from [Property] WHERE ([Property].City = \'" + City + "\')" + "And ([Property].HomeState = \'" + State + "\')" + "AND([Property].RentPrice <= " + SearchResultMaxPrice.Text + ") AND([Property].RentPrice >=" + SearchResultMinPrice.Text + ")" +
                  "AND([Property].AvailableBedrooms " + BedsCmpr + ")" + startDate + endDate + HomeType + ") ";
                tempsql = sql;

                sql += " Select distinct Title, City, HomeState, ZipCode, AvailableBedrooms, RentPrice, StartDate, EndDate, AvailableBathrooms, PropertyID  from cte_Property where row_num >" + RowCount;
                sql2 = tempsql + " Select Max(row_num) from cte_Property";
            }
            SearchResultMinPrice.Text = string.Empty;
            SearchResultMaxPrice.Text = string.Empty;
            OrderBy = String.Empty;
            if (address.Text != String.Empty)
            {
                SqlCommand search = new SqlCommand(sql, connection);
                SqlDataReader reader = search.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        int tempPID = reader.GetInt32(9);
                        if (PID.Contains(tempPID) == false)
                        {
                            PID.Add(tempPID);
                            resultCount++;
                            decimal x;
                            string y;
                            if (resultCount == 1)
                            {
                                RatingsPID.Add(reader.GetInt32(9));
                                x = reader.GetDecimal(5);
                                y = String.Format("{0:0.##}", x);
                                Property1Title.Text = reader.GetString(0);
                                Property1Title.Visible = true;
                                Property1RentPrice.Text = "$" + y + "/Month";
                                Property1RentPrice.Visible = true;
                                Property1CityState.Text = reader.GetString(1) + "," + reader.GetString(2);
                                Property1CityState.Visible = true;
                                Property1Bath.Text = reader.GetInt32(8).ToString() + " Bathroom";
                                Property1Bed.Text = reader.GetInt32(4).ToString() + " Bed";
                                Property1StartDate.Text = "Dates Avaliable: " + reader.GetDateTime(6).ToShortDateString() + " - " + reader.GetDateTime(7).ToShortDateString();

                                
                            }

                            if (resultCount == 2)
                            {
                                RatingsPID.Add(reader.GetInt32(9));
                                x = reader.GetDecimal(5);
                                y = String.Format("{0:0.##}", x);
                                Property2Title.Text = reader.GetString(0);
                                Property2Title.Visible = true;

                                Property2RentPrice.Text = "$" + y + "/Month";
                                Property2RentPrice.Visible = true;
                                Property2CityState.Text = reader.GetString(1) + "," + reader.GetString(2);
                                Property2CityState.Visible = true;
                                Property2Bath.Text = reader.GetInt32(8).ToString() + " Bathroom";
                                Property2Bed.Text = reader.GetInt32(4).ToString() + " Bed";
                                Property2StartDate.Text = "Dates Avaliable: " + reader.GetDateTime(6).ToShortDateString() + " - " + reader.GetDateTime(7).ToShortDateString();

                                
                            }
                            if (resultCount == 3)
                            {
                                RatingsPID.Add(reader.GetInt32(9));
                                x = reader.GetDecimal(5);
                                y = String.Format("{0:0.##}", x);
                                Property3Title.Text = reader.GetString(0);
                                Property3Title.Visible = true;
                                Property3RentPrice.Text = "$" + y + "/Month";
                                Property3RentPrice.Visible = true;
                                Property3CityState.Text = reader.GetString(1) + "," + reader.GetString(2);
                                Property3CityState.Visible = true;
                                Property3Bath.Text = reader.GetInt32(8).ToString() + " Bathroom";
                                Property3Bed.Text = reader.GetInt32(4).ToString() + " Bed";
                                Property3StartDate.Text = "Dates Avaliable: " + reader.GetDateTime(6).ToShortDateString() + " - " + reader.GetDateTime(7).ToShortDateString();

                               
                            }
                            if (resultCount == 4)
                            {
                                RatingsPID.Add(reader.GetInt32(9));
                                x = reader.GetDecimal(5);
                                y = String.Format("{0:0.##}", x);
                                Property4Title.Text = reader.GetString(0);
                                Property4Title.Visible = true;

                                Property4RentPrice.Text = "$" + y + "/Month";
                                Property4RentPrice.Visible = true;
                                Property4CityState.Text = reader.GetString(1) + "," + reader.GetString(2);
                                Property4CityState.Visible = true;
                                Property4Bath.Text = reader.GetInt32(8).ToString() + " Bathroom";
                                Property4Bed.Text = reader.GetInt32(4).ToString() + " Bed";
                                Property4StartDate.Text = "Dates Avaliable: " + reader.GetDateTime(6).ToShortDateString() + " - " + reader.GetDateTime(7).ToShortDateString();

                                
                            }
                            if (resultCount == 5)
                            {
                                RatingsPID.Add(reader.GetInt32(9));
                                x = reader.GetDecimal(5);
                                y = String.Format("{0:0.##}", x);
                                Property5Title.Text = reader.GetString(0);
                                Property5Title.Visible = true;
                                Property5RentPrice.Text = "$" + y + "/Month";
                                Property5RentPrice.Visible = true;
                                Property5CityState.Text = reader.GetString(1) + "," + reader.GetString(2);
                                Property5CityState.Visible = true;
                                Property5Bath.Text = reader.GetInt32(8).ToString() + " Bathroom";
                                Property5Bed.Text = reader.GetInt32(4).ToString() + " Bed";
                                Property5StartDate.Text = "Dates Avaliable: " + reader.GetDateTime(6).ToShortDateString() + " - " + reader.GetDateTime(7).ToShortDateString();

                                
                            }
                        }
                        else
                        {
                            RowMinus--;
                        }
                    }
                    reader.NextResult();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Pooooopssssss", "openResultModal();", true);
                    ResultPg1.Visible = false;

                }
                reader.Close();
                


                for (int i = 0; i < RatingsPID.Count; i++)
                {
                    string SQL = "Select ImagePath from ImagePath WHERE PropertyID= " + RatingsPID[i].ToString();
                    SqlCommand ImagePaste = new SqlCommand(SQL, connection);
                    SqlDataReader ImageReader = ImagePaste.ExecuteReader();
                    if (ImageReader.HasRows)
                    {
                        while (ImageReader.Read())
                        {
                            if (i == 0)
                            {
                                byte[] images = (byte[])ImageReader[0];
                                if (images == null)
                                {
                                    return;
                                }
                                else
                                {
                                    Property1Image.ImageUrl = "data:image;base64," + Convert.ToBase64String(images);
                                    Property1Image.Visible = true;
                                }
                                Property1Space.Visible = true;
                                break;
                            }
                            if (i == 1)
                            {
                                byte[] images = (byte[])ImageReader[0];
                                if (images == null)
                                {
                                    return;
                                }
                                else
                                {
                                    Property2Image.ImageUrl = "data:image;base64," + Convert.ToBase64String(images);
                                    Property2Image.Visible = true;
                                }
                                Property2Space.Visible = true;
                                break;
                            }
                            if (i == 2)
                            {
                                byte[] images = (byte[])ImageReader[0];
                                if (images == null)
                                {
                                    return;
                                }
                                else
                                {
                                    Property3Image.ImageUrl = "data:image;base64," + Convert.ToBase64String(images);
                                    Property3Image.Visible = true;
                                }
                                Property3Space.Visible = true;
                                break;
                            }
                            if (i == 3)
                            {
                                byte[] images = (byte[])ImageReader[0];
                                if (images == null)
                                {
                                    return;
                                }
                                else
                                {
                                    Property4Image.ImageUrl = "data:image;base64," + Convert.ToBase64String(images);
                                    Property4Image.Visible = true;
                                }
                                Property4Space.Visible = true;
                                break;
                            }
                            if (i == 4)
                            {
                                byte[] images = (byte[])ImageReader[0];
                                if (images == null)
                                {
                                    return;
                                }
                                else
                                {
                                    Property5Image.ImageUrl = "data:image;base64," + Convert.ToBase64String(images);
                                    Property5Image.Visible = true;
                                }
                                Property5Space.Visible = true;
                                break;
                            }
                        }
                    }
                    ImageReader.Close();
                }
                
               
               
                
                SqlCommand Resultsearch = new SqlCommand(sql2, connection);
                SqlDataReader Resultreader = Resultsearch.ExecuteReader();
                if (Resultreader.HasRows)
                {
                    while (Resultreader.Read())
                    {
                        if (Resultreader.IsDBNull(0) == false)
                        {
                            RowNum = (int)Resultreader.GetInt64(0);
                        }
                        else
                        {
                            RowNum = 0;
                        }
                    }
                }

                Resultreader.Close();
                RowMinus = RowMinus + RowNum;
                SearchResultCount.Text = "Total Properties Found: " + RowMinus.ToString();
                if (RowMinus == 0)
                {
                    ResultPg1.Visible = false;
                }
                if (RowMinus > 5)
                {
                    ResultPg2.Visible = true;
                }
                if (RowMinus > 10)
                {
                    ResultPg3.Visible = true;
                }
                if (RowMinus > 15)
                {
                    ResultPg4.Visible = true;
                }
                if (RowMinus > 20)
                {
                    ResultPg5.Visible = true;
                }
                if (RowMinus > 25)
                {
                    ResultPg6.Visible = true;
                }
                int RatingCount = 0;
                for (int i = 0; i < RatingsPID.Count; i++)
                {
                    string RatingSQL = "Select NumStars from [Rating] where PropertyID =" + RatingsPID[i];
                    SqlCommand Ratingsearch = new SqlCommand(RatingSQL, connection);
                    SqlDataReader readers = Ratingsearch.ExecuteReader();
                    decimal RatingSum = 0;
                    
                    int RatingRecordCount = 0;
                    if (readers.HasRows)
                    {
                        
                        while (readers.Read())
                        {
                            if (RatingRecordCount < 5)
                            {
                                RatingSum += readers.GetDecimal(0);
                                RatingRecordCount++;
                            }
                        }
                    }
                    if (RatingRecordCount == 0)
                    {
                        continue;
                    }
                    if (RatingCount == 0)
                    {
                        if (Math.Round((RatingSum / RatingRecordCount), 1) != 0)
                        {
                            Property1Rating.Text = Math.Round((RatingSum / RatingRecordCount), 1).ToString();
                            rating1.Visible = true;
                        }

                    }
                    if (RatingCount == 1)
                    {
                        if (Math.Round((RatingSum / RatingRecordCount), 1) != 0)
                        {
                            Property2Rating.Text = Math.Round((RatingSum / RatingRecordCount), 1).ToString();
                            rating2.Visible = true;
                        }

                    }
                    if (RatingCount == 2)
                    {
                        if (Math.Round((RatingSum / RatingRecordCount), 1) != 0)
                        {
                            Property3Rating.Text = Math.Round((RatingSum / RatingRecordCount), 1).ToString();
                            rating3.Visible = true;
                        }

                    }
                    if (RatingCount == 3)
                    {
                        if (Math.Round((RatingSum / RatingRecordCount), 1) != 0)
                        {
                            Property4Rating.Text = Math.Round((RatingSum / RatingRecordCount), 1).ToString();
                            rating4.Visible = true;
                        }
                    }
                    if (RatingCount == 4)
                    {
                        if (Math.Round((RatingSum / RatingRecordCount), 1) != 0)
                        {
                            Property5Rating.Text = Math.Round((RatingSum / RatingRecordCount), 1).ToString();
                            rating5.Visible = true;
                        }
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
        SearchResultMinPrice.Text = string.Empty;
        SearchResultMaxPrice.Text = string.Empty;
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
                    if (CmprImageURL == Property1Image.ImageUrl)
                    {
                        Session["ResultPropertyID"] = PropertyID;
                    }
                }
            }
        }
        connection.Close();
        Response.Redirect("PropertyInfo.aspx");
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
                byte[] images = (byte[])reader[1];
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
        Response.Redirect("PropertyInfo.aspx");
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
                byte[] images = (byte[])reader[1];
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
        Response.Redirect("PropertyInfo.aspx");
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
                byte[] images = (byte[])reader[1];
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
        Response.Redirect("PropertyInfo.aspx");
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
                byte[] images = (byte[])reader[1];
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
        Response.Redirect("PropertyInfo.aspx");
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
        RowCount = 10;
        SearchResultButton_Click(sender, e);
    }

    protected void ResultPg4_Click(object sender, EventArgs e)
    {
        RowCount = 15;
        SearchResultButton_Click(sender, e);
    }

    protected void ResultPg5_Click(object sender, EventArgs e)
    {
        RowCount = 20;
        SearchResultButton_Click(sender, e);
    }

    protected void ResultPg6_Click(object sender, EventArgs e)
    {
        RowCount = 25;
        SearchResultButton_Click(sender, e);
    }

    protected void CustomValidator1_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
    {
        int zip;
        if (Int32.TryParse(address.Text, out zip))
        {
            if (address.Text.Length != 5)
            {
                args.IsValid = false;
                CustomValidator1.ErrorMessage = "Please enter a 5 digit zipcode";
            }
            else
            {
                args.IsValid = true;
            }
        }
        else
        {
            string cityandstate = address.Text;
            if (cityandstate.Contains(","))
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }
    }

    [System.Web.Services.WebMethod]
    [System.Web.Script.Services.ScriptMethod()]
    public static string QueryToJsonForZip(string num)
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ToString());
        connection.Open();
        string Findsaddress = "Select StreetAddress as Address,City,HomeState as State,Country,ZipCode, Title from Property where ZipCode=@ZipCode";
        SqlCommand GoogleFinder = new SqlCommand(Findsaddress, connection);
        GoogleFinder.Parameters.AddWithValue("@ZipCode", num);
        SqlDataReader addressReader = GoogleFinder.ExecuteReader();
        ArrayList AddressArray = new ArrayList();
        object[] fieldnames = new object[addressReader.FieldCount];
        for (int i = 0; i < addressReader.FieldCount; i++)
        {
            fieldnames[i] = addressReader.GetName(i);
        }
        AddressArray.Add(fieldnames);
        while (addressReader.Read())
        {
            // create array from a row of data
            object[] values = new object[addressReader.FieldCount];
            addressReader.GetValues(values);
            AddressArray.Add(values);
        }
        addressReader.Close();
        connection.Close();
        // serialize to JSON
        JavaScriptSerializer jss = new JavaScriptSerializer();
        String jsonResult = jss.Serialize(AddressArray);

        // return the json string
        return jsonResult;
    }

    [System.Web.Services.WebMethod]
    [System.Web.Script.Services.ScriptMethod()]
    public static string QueryToJsonForCityState(string something)
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ToString());
        connection.Open();
        string Findsaddress = "Select StreetAddress as Address,City,HomeState as State,Country,ZipCode, Title from Property where City=@City and HomeState=@HomeState";
        string City = something.Substring(0, something.IndexOf(','));
        string State = something.Substring(something.IndexOf(',') + 1);
        SqlCommand GoogleFinder = new SqlCommand(Findsaddress, connection);
        GoogleFinder.Parameters.AddWithValue("@City", City);
        GoogleFinder.Parameters.AddWithValue("@HomeState", State);
        SqlDataReader addressReader = GoogleFinder.ExecuteReader();
        ArrayList AddressArray = new ArrayList();
        object[] fieldnames = new object[addressReader.FieldCount];
        for (int i = 0; i < addressReader.FieldCount; i++)
        {
            fieldnames[i] = addressReader.GetName(i);
        }
        AddressArray.Add(fieldnames);
        while (addressReader.Read())
        {
            // create array from a row of data
            object[] values = new object[addressReader.FieldCount];
            addressReader.GetValues(values);
            AddressArray.Add(values);
        }
        connection.Close();
        addressReader.Close();
        // serialize to JSON
        JavaScriptSerializer jss = new JavaScriptSerializer();
        String jsonResult = jss.Serialize(AddressArray);

        // return the json string
        return jsonResult;
    }
}