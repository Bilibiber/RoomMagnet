using System;
using System.Configuration;
using System.Data.SqlClient;
using ASPSnippets.GoogleAPI;
using System.Web.Script.Serialization;

public partial class Home : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void HomePageGetStarted_Click(object sender, EventArgs e)
    {

    }


}