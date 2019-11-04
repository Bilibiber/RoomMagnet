using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebPages_RoomMagnet : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
}



//Create basic page layout with labels and buttons
//select query to pull list of renters and hosts that have not been verified from renter/host tables
//update query to change to verified if verified
//confirmation email to verified: youre verified! rent away
//adverse action letter if not cleared.....attachment and explanation in email from bob
