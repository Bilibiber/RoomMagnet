using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.Data.SqlClient;

public partial class WebPages_SearchResult : System.Web.UI.Page
{
    SqlConnection connection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString.ToString());
    int resultCount = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        SearchResultCount.Text = "(" + resultCount.ToString() + ")";
    }

    protected void SearchResultButton_Click(object sender, EventArgs e)
    {
        connection.Open();
        SqlDataAdapter searchResults = new SqlDataAdapter("Select Title, City, State, ZipCode, AvailableBedrooms, RentPrice, DatesAvailable,"
 + "Property.ImagePath, PropertytRoom.ImagePath from Property inner join PropertyRoom"
+ "on Property.PropertyID = PropertyRoom.PropertyID where (City = " + SearchResultText.Text + "OR ZipCode = " + SearchResultText.Text + ") AND"
+ "((Price<=" + SearchResultMaxPrice.Text + ") OR 1=1)"
+ "((Price>=" + SearchResultMinPrice.Text + ") OR 1=1)"
+ "AND((BedsAvailable = " + SearchResultBedsAvailable.Text + ") OR 1=1)"
+ "AND((StartDate = " + SearchResultStartDate.Text + ") OR 1=1)"
+ "AND((EndDate = " + SearchResultsEndDate.Text + ") OR 1=1)", connection);
    }
}