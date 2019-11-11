using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebPages_ManageSearchProperties : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public void propertySearchResults(object sender, EventArgs ex)
    {
        string queryString = "Select Title from Property where PropertyID = 1000;";
        SqlConnection con = new SqlConnection();
        con.Open();
        SqlCommand cmd = new SqlCommand(queryString, con);
        SqlDataReader reader = cmd.ExecuteReader();

        SqlDataAdapter adapter = new SqlDataAdapter();
        adapter.SelectCommand = cmd;
    }

}