using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebPages_Renter : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void renterSavedSearch_Click(object sender, EventArgs e)
    {
        renterinfor.Visible = true;
        rentersearch.Visible = true;
        rentermymessage.Visible = false;
        renterconnection.Visible = false;
        renterpreferences.Visible = false;
        renterbecomehost.Visible = false;
        renteraddAmenities.Visible = false;

    }

    protected void renterMessage_Click(object sender, EventArgs e)
    {
        renterinfor.Visible = true;
        rentermymessage.Visible = true;
        rentersearch.Visible = false;
        renterconnection.Visible = false;
        renterpreferences.Visible = false;
        renterbecomehost.Visible = false;
        renteraddAmenities.Visible = false;
    }

    protected void renterConnections_Click(object sender, EventArgs e)
    {
        renterinfor.Visible = true;
        rentersearch.Visible = false;
        rentermymessage.Visible = false;
        renterconnection.Visible = true;
        renterpreferences.Visible = false;
        renterbecomehost.Visible = false;
        renteraddAmenities.Visible = false;
    }

    protected void renterPreference_Click(object sender, EventArgs e)
    {
        renterinfor.Visible = true;
        rentersearch.Visible = false;
        rentermymessage.Visible = false;
        renterconnection.Visible = false;
        renterpreferences.Visible = true;
        renterbecomehost.Visible = false;
        renteraddAmenities.Visible = false;
    }

    protected void rentertohost_Click(object sender, EventArgs e)
    {
        renterinfor.Visible = false;
        rentersearch.Visible = false;
        rentermymessage.Visible = false;
        renterconnection.Visible = false;
        renterpreferences.Visible = false;
        renterbecomehost.Visible = true;
        renteraddAmenities.Visible = true;
    }

    protected void unverified_Click(object sender, EventArgs e)
    {
        Response.Redirect("https://www.youtube.com");
    }



    protected void Unnamed2_Click(object sender, EventArgs e)
    {
        renterSavedSearch_Click(sender, e);
    }

}