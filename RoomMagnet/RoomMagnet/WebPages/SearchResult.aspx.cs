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
    string OrderBy = String.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {

        handleSearchParameters();


    }

    private void handleSearchParameters()
    {
        string searchString = Request["searchString"];
        string[] parts = searchString.Split(',');
        string city = parts[0];
        string state = parts[1];
        string zip = parts[2];

        if (parts.Length >= 1)
        {
            city = parts[0];
        }

        if (parts.Length >= 2)
        {
            state = parts[1];
        }

        if (parts.Length >= 3)
        {
            zip = parts[2];
        }

    }

    private List<Property> fetchSearchResults(string city, string state, string zip)
    {



        List<Property> list = new List<Property>();

        return list;

    }

}