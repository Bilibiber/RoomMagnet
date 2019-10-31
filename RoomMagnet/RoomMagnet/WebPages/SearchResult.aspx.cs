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
using Microsoft.AspNetCore.Builder;

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

        connection.Open();

        int result;
        string sql;
        if (Int32.TryParse(SearchResultText.Text, out result))
        {
            sql = "Select Title, City, HomeState, ZipCode, AvailableBedrooms, RentPrice, [Property].StartDate, [Property].EndDate, "
        + "[Property].ImagePath, [PropertyRoom].ImagePath,[PropertyRoom].StartDate, [PropertyRoom].EndDate from [Property] inner join [PropertyRoom]"
        + " on [Property].PropertyID = [PropertyRoom].PropertyID WHERE (ZipCode = " + SearchResultText.Text + ")"
                + " AND (RentPrice <= " + SearchResultMaxPrice.Text + ") AND "
        + "(RentPrice >= " + SearchResultMinPrice.Text + ")";
            //+"AND((BedsAvailable = " + SearchResultBedsAvailable.Text + ") OR 1=1)"
            //+ "AND((StartDate = " + SearchResultStartDate.Text + ") OR 1=1)"
            //+ "AND((EndDate = " + SearchResultsEndDate.Text + ") OR 1=1)";
        }
        else
        {
            sql = "Select Title, City, HomeState, ZipCode, AvailableBedrooms, RentPrice, [Property].StartDate, [Property].EndDate, "
         + "[Property].ImagePath, [PropertyRoom].ImagePath,[PropertyRoom].StartDate, [PropertyRoom].EndDate from [Property] inner join [PropertyRoom]"
         + " on [Property].PropertyID = [PropertyRoom].PropertyID WHERE (City = " + SearchResultText.Text + ")"
                 + " AND ((RentPrice <= " + SearchResultMaxPrice.Text + ") AND "
         + "(RentPrice >= " + SearchResultMinPrice.Text + ")";
            //    +"AND((BedsAvailable = " + SearchResultBedsAvailable.Text + ") OR 1=1)"
            //    + "AND((StartDate = " + SearchResultStartDate.Text + ") OR 1=1)"
            //    + "AND((EndDate = " + SearchResultsEndDate.Text + ") OR 1=1)";
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
                    PropertyPic.Load(reader.GetString(7));
                    Console.WriteLine(reader.GetString(5));
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
    }
