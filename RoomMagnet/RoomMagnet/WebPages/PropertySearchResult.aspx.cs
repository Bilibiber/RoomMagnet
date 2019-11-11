//using System;
//using System.Collections.Generic;
//using System.Configuration;
//using System.Data.SqlClient;
//using System.Linq;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;

//public partial class WebPages_PropertySearchResult : System.Web.UI.Page
//{
//    SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ToString());

//    protected void Page_Load(object sender, EventArgs e)
//    {
//        PropertySearchResults(sender, e);

//    }

//    protected void PropertySearchResults(object sender, EventArgs e)
//    {
//        SqlConnection connection = new SqlConnection("'connection'");

//            connection.Open();
//        string sql = "Select Title from Property WHERE PropertyID = 1000";
//        SqlCommand search = new SqlCommand(sql, connection);

//        SqlDataReader reader = search.ExecuteReader();

//        connection.Close();
//    }

//}