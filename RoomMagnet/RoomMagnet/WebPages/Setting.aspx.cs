using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebPages_Setting : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void updateusersetting_Click(object sender, EventArgs e)
    {

        string email = Users.UserArray[0].getEmail();
        Labeltest.Text = email;

    }
}