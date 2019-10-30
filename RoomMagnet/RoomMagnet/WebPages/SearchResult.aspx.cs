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
    int resultCount = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        SearchResultCount.Text = "(" + resultCount.ToString() + ")";
    }

    protected void SearchResultButton_Click(object sender, EventArgs e)
    {
        connection.Open();
        string sql = "Select Title, City, State, ZipCode, AvailableBedrooms, RentPrice, StartDate, EndDate, "
 + "[Property].ImagePath, [PropertyRoom].ImagePath from [Property] inner join [PropertyRoom]"
+ " on [Property].PropertyID = [PropertyRoom].PropertyID WHERE (City = " + SearchResultText.Text + " OR ZipCode = " + SearchResultText.Text + ") AND "
+ "((RentPrice<= " + SearchResultMaxPrice.Text + ") OR 1=1) AND "
+ "((RentPrice>= " + SearchResultMinPrice.Text + ") OR 1=1)";
        //+ "AND((BedsAvailable = " + SearchResultBedsAvailable.Text + ") OR 1=1)"
        //+ "AND((StartDate = " + SearchResultStartDate.Text + ") OR 1=1)"
        //+ "AND((EndDate = " + SearchResultsEndDate.Text + ") OR 1=1)";
        SqlCommand search = new SqlCommand(sql, connection);
        SqlDataReader reader = search.ExecuteReader();
        if (reader.HasRows)
        {
            while (reader.Read())
            {
                string x = reader.GetString(0);
                
                PictureBox PropertyPic = new PictureBox();
                //PropertyPic.Load(reader.GetString(7));
                Console.WriteLine(reader.GetString(5));
            }
            reader.NextResult();
        }
        connection.Close();
        
        
    }
}