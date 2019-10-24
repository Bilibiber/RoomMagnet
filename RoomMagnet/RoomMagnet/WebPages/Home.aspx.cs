using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Panel1.Visible = false;
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        Panel1.Visible = true;
    }

    protected void HomePageSignUp_Click(object sender, EventArgs e)
    {
        
    }
}