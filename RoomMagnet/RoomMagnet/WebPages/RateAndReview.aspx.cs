using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using AjaxControlToolkit;

public partial class WebPages_RateAndReview : System.Web.UI.Page
{
    DataTable dt = new DataTable();
    private string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //DataTable dt = this.GetData("SELECT ISNULL(")

        }

    }
}