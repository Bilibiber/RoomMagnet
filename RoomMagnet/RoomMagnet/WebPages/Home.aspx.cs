using System;
using System.Configuration;
using System.Data.SqlClient;

//using ASPSnippets.GoogleAPI;

public partial class Home : System.Web.UI.Page
{
    private SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["SignInEmail"] == null)
        {
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openLoginModal();", true);
        }
        else
        {
            var master = Master as RoomMagnet;
            master.AfterLogin();
        }
    }
    protected void HomePageSearchButton_Click(object sender, EventArgs e)
    {
        if (CustomValidator1.IsValid)
        {
            Session["HomePageSearchContent"] = HomePageSearchText.Text;
            Response.Redirect("SearchResult.aspx");
        }

    }

    protected void CustomValidator1_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
    {
        int zip;
        if (Int32.TryParse(HomePageSearchText.Text, out zip))
        {
            if (HomePageSearchText.Text.Length != 5)
            {
                args.IsValid = false;
                CustomValidator1.ErrorMessage = "Please enter a 5 digit zipcode";
            }
            else
            {
                args.IsValid = true;
            }
        }
        else
        {
            string cityandstate = HomePageSearchText.Text;
            if (cityandstate.Contains(","))
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }
    }
}