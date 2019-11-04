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
        SearchLabel.Visible = false;
    }

    protected void SearchResultButton_Click(object sender, EventArgs e)
    {
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
        connection.Open();

        int result;
        string sql;
        if (Int32.TryParse(SearchResultText.Text, out result))
        {
            sql = "Select Title, City, HomeState, ZipCode, AvailableBedrooms, RentPrice, [Property].StartDate, [Property].EndDate, "
        + "[Property].ImagePath, [PropertyRoom].ImagePath,[PropertyRoom].StartDate, [PropertyRoom].EndDate from [Property] inner join [PropertyRoom]"
        + " on [Property].PropertyID = [PropertyRoom].PropertyID WHERE (ZipCode = " + SearchResultText.Text + ")"
                + " AND (RentPrice <= " + SearchResultMaxPrice.Text + ") AND "
        + "(RentPrice >= " + SearchResultMinPrice.Text + ")"
            +"AND (BedsAvailable "+ BedsCmpr+ ")"
            + "AND (StartDate >=" + SearchResultStartDate.Text + ")"
            + "AND (EndDate <= " + SearchResultEndDate.Text + ")";
        }
        else
        {
            sql = "Select Title, City, HomeState, ZipCode, AvailableBedrooms, RentPrice, [Property].StartDate, [Property].EndDate, "
         + "[Property].ImagePath, [PropertyRoom].ImagePath,[PropertyRoom].StartDate, [PropertyRoom].EndDate from [Property] inner join [PropertyRoom]"
         + " on [Property].PropertyID = [PropertyRoom].PropertyID WHERE (City = " + SearchResultText.Text + ")"
                 + " AND (RentPrice <= " + SearchResultMaxPrice.Text + ") AND "
         + "(RentPrice >= " + SearchResultMinPrice.Text + ")"
                +" AND (AvailableBedrooms " + BedsCmpr + ")"
               + " AND ([Property].StartDate >=  \'" + SearchResultStartDate.Text + "\')"
               + " AND ([Property].EndDate <=  \'" + SearchResultEndDate.Text + "\')";
        }

            if (SearchResultText.Text != String.Empty)
            {
                SqlCommand search = new SqlCommand(sql, connection);
                SqlDataReader reader = search.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    string x = reader.GetString(0);

                    PictureBox PropertyPic = new PictureBox();
                    PropertyPic.Load("https://property-created.s3.us-west-2.amazonaws.com/Property%20Pictures/testProperty.jpg?X-Amz-Expires=3592&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAXZN4IZI4EEHR4OUZ/20191103/us-west-2/s3/aws4_request&X-Amz-Date=20191103T213457Z&X-Amz-SignedHeaders=host&X-Amz-Signature=7c1b0de04f9f3cd5f8062a22fc4b910e306f72d5fdc67b0b9bd7265836b2b28a");
                    
                }
                reader.NextResult();
            }
            connection.Close();
            }
            else
            {
                SearchLabel.Text = "Please enter something in the text bar.";
            }


        }

    protected void SearchResultEndDate_TextChanged(object sender, EventArgs e)
    {

    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs ex)
    {

    }
}
