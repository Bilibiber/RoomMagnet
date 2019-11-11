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
        //Session["HomePageSearchContent"] = HomePageSearchText.Text;
        Response.Redirect("SearchResult.aspx");
    }
}