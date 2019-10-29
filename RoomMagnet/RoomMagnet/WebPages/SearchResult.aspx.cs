using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

public partial class WebPages_SearchResult : System.Web.UI.Page
{
    int resultCount = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        SearchResultCount.Text = "(" + resultCount.ToString() + ")";
    }

    protected void SearchResultButton_Click(object sender, EventArgs e)
    {

    }
}