using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebPages_AddProperty : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        othertextbox.Enabled = false;
        if (!IsPostBack)
        {
            addCountry.DataSource = objcountries();
            addCountry.DataBind();
        }

        if (checkOther.Checked)
        {
            othertextbox.Enabled = true;
        }

        if(addCountry.Text == "United States")
        {
            addState.Enabled = true;
        }
        else{
            addState.SelectedIndex = 0;
            addState.Enabled = false;
        }

    }

    public static List<string> objcountries()
    {
        List<string> objcountries = new List<string>();
        CultureInfo[] objculture = CultureInfo.GetCultures(CultureTypes.SpecificCultures);
        foreach (CultureInfo getculture in objculture)
        {
            RegionInfo objregion = new RegionInfo(getculture.LCID);
            string ss = getculture.DisplayName;
            if (!(objcountries.Contains(objregion.EnglishName)))
            {
                objcountries.Add(objregion.EnglishName);
            }
        }
        objcountries.Sort();
        return objcountries;
    }

    protected void cancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Renter.aspx");
    }

    protected void post_Click(object sender, EventArgs e)
    {

    }


    protected void testimage_Click(object sender, EventArgs e)
    {
        
    }
}