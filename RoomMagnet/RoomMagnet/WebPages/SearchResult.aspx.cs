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
    protected void Page_Load(object sender, EventArgs e)
    {
        SearchResultCount.Text = "(" + resultCount.ToString() + ")";
        SearchLabel.Visible = false;
    }

    protected void SearchResultButton_Click(object sender, EventArgs e)
    {
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
        startDate = " AND(StartDate >= " + SearchResultStartDate.Text + ")";
        endDate = " AND (EndDate <= " + SearchResultEndDate.Text + ")";
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
        if (Int32.TryParse(SearchResultText.Text, out result))
        {
            sql = "Select Title, City, HomeState, ZipCode, AvailableBedrooms, RentPrice, [Property].StartDate, [Property].EndDate, "
        + "[Property].ImagePath, [PropertyRoom].ImagePath,[PropertyRoom].StartDate, [PropertyRoom].EndDate from [Property] inner join [PropertyRoom]"
        + " on [Property].PropertyID = [PropertyRoom].PropertyID WHERE (ZipCode = " + SearchResultText.Text + ")"
                + " AND (RentPrice <= " + SearchResultMaxPrice.Text + ") AND "
        + "(RentPrice >= " + SearchResultMinPrice.Text + ")"
            +"AND (AvailableBedrooms "+ BedsCmpr+ ")"
            + startDate
            + endDate;
        }
        else
        {
            sql = "Select Title, City, HomeState, ZipCode, AvailableBedrooms, RentPrice, [Property].StartDate, [Property].EndDate, "
         + "[Property].ImagePath, [PropertyRoom].ImagePath,[PropertyRoom].StartDate, [PropertyRoom].EndDate from [Property] inner join [PropertyRoom]"
         + " on [Property].PropertyID = [PropertyRoom].PropertyID WHERE (City = \'" + SearchResultText.Text + "\')"
                 + " AND (RentPrice <= " + SearchResultMaxPrice.Text + ") AND "
         + "(RentPrice >= " + SearchResultMinPrice.Text + ")"
                +" AND (AvailableBedrooms " + BedsCmpr + ")"
               + startDate
               + endDate;
        }

            if (SearchResultText.Text != String.Empty)
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
                        Label1.Text = reader.GetString(0);
                        Label1.Visible = true;
                        Label2.Text = string.Format(reader.GetInt32(4).ToString() + " Beds Available{0}" + "$" + y + "/Month{0}"
                            +  reader.GetString(1) + "," + reader.GetString(2), Environment.NewLine);
                        Label2.Visible = true;
                        Image2.ImageUrl = reader.GetString(8);
                        Image2.Visible = true;

                    }
                    
                    if (resultCount==2)
                    {
                        x = reader.GetDecimal(5);
                        y = String.Format("{0:0.##}", x);
                        Label5.Text = reader.GetString(0);
                        Label5.Visible = true;
                        Label6.Text = reader.GetInt32(4).ToString() + " Beds Available" + Environment.NewLine + "$" + y + "/Month"
                            + Environment.NewLine + reader.GetString(1) + "," + reader.GetString(2);
                        Label6.Visible = true;
                        Image3.ImageUrl = reader.GetString(8);
                        Image3.Visible = true;
                    }
                    if (resultCount==3)
                    {
                        x = reader.GetDecimal(5);
                        y = String.Format("{0:0.##}", x);
                        Label9.Text = reader.GetString(0);
                        Label9.Visible = true;
                        Label10.Text = reader.GetInt32(4).ToString() + " Beds Available" + "\n $" + y + "/Month"
                            + "\n" + reader.GetString(1) + "," + reader.GetString(2);
                        Label10.Visible = true;

                        Image4.ImageUrl = reader.GetString(8);
                        Image4.Visible = true;
                    }
                    
           
                  

                }
                reader.NextResult();
                SearchResultCount.Text = "("+resultCount.ToString()+ ")";
            }
           
            connection.Close();
            }
            else
            {
                SearchLabel.Text = "Please enter something in the text bar.";
            }

            //GetObject objectI = new GetObject();
        //objectI.RequestItem("testProperty.jpg");

        }

}
