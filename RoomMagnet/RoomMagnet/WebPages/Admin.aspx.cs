using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class WebPages_Admin : System.Web.UI.Page
{
    private SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        adminDashboard.ForeColor = System.Drawing.Color.Red;
        adminStatistics.ForeColor = System.Drawing.Color.White;
        adminVerification.ForeColor = System.Drawing.Color.White;
        adminEmployee.ForeColor = System.Drawing.Color.White;

        if (IsPostBack.Equals(false))
        {
            SqlCommand selectEmployees = new SqlCommand();
            selectEmployees.Connection = cn;
            String com = "SELECT [Email] FROM [dbo].[Users] WHERE [UserRole] = 'a';";
            SqlDataAdapter selectEmployeesDA = new SqlDataAdapter(com, cn);
            DataTable dt = new DataTable();
            selectEmployeesDA.Fill(dt);
            emailDropDown.DataSource = dt;
            emailDropDown.DataBind();
        }
        if (IsPostBack.Equals(false))
        {
            SqlCommand selectUnverifiedUsers = new SqlCommand();
            selectUnverifiedUsers.Connection = cn;
            String com = "SELECT [Email] FROM [dbo].[Users] WHERE [UserRole] = 'Renter' AND [Verified] = 'Unverified';";
            SqlDataAdapter selectUsersDA = new SqlDataAdapter(com, cn);
            DataTable dt = new DataTable();
            selectUsersDA.Fill(dt);
            UnverifiedDropDown.DataSource = dt;
            UnverifiedDropDown.DataBind();
        }
            

        if (Session["SignInEmail"] == null)
        {
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openLoginModal();", true);
        }
        else
        {
            var master = Master as RoomMagnet;
            master.AfterLogin();
        }       
            //SqlConnection db = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ToString());
            //db.Open();
            //SqlCommand selectuser = new SqlCommand();
            //selectuser.Connection = db;
            //int userid = Convert.ToInt32(Session["UserID"]);
            //selectuser.CommandText = "select [FirstName], [Gender], [Occupation], [Description], [DateOfBirth] from [RoomMagnet].[dbo].[Users] where [UserID] =@UserID";
            //selectuser.Parameters.Add(new SqlParameter("@UserID", userid));
            //SqlDataReader getinfor = selectuser.ExecuteReader();    
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

    protected void adminDashboard_Click(object sender, EventArgs e)
    {
        adminDashboardPanel.Visible = true;
        adminStatisticsPanel.Visible = false;
        adminEmployeesPanel.Visible = false;
        adminVerificationPanel.Visible = false;
        adminDashboard.ForeColor = System.Drawing.Color.Red;
        adminStatistics.ForeColor = System.Drawing.Color.White;
        adminEmployee.ForeColor = System.Drawing.Color.White;
        adminVerification.ForeColor = System.Drawing.Color.White;
        adminDashboardPanel.ForeColor = System.Drawing.Color.Red;
        adminStatisticsPanel.ForeColor = System.Drawing.Color.White;
        adminEmployeesPanel.ForeColor = System.Drawing.Color.White;
        adminVerificationPanel.ForeColor = System.Drawing.Color.White;
    }

    protected void adminStatistics_Click(object sender, EventArgs e)
    {
        adminDashboardPanel.Visible = false;
        adminStatisticsPanel.Visible = true;
        adminEmployeesPanel.Visible = false;
        adminVerificationPanel.Visible = false;
        adminDashboard.ForeColor = System.Drawing.Color.White;
        adminStatistics.ForeColor = System.Drawing.Color.Red;
        adminEmployee.ForeColor = System.Drawing.Color.White;
        adminVerification.ForeColor = System.Drawing.Color.White;
        adminDashboardPanel.ForeColor = System.Drawing.Color.White;
        adminStatisticsPanel.ForeColor = System.Drawing.Color.Red;
        adminEmployeesPanel.ForeColor = System.Drawing.Color.White;
        adminVerificationPanel.ForeColor = System.Drawing.Color.White;
    }

    protected void adminEmployee_Click(object sender, EventArgs e)
    {
        adminDashboardPanel.Visible = false;
        adminStatisticsPanel.Visible = false;
        adminEmployeesPanel.Visible = true;
        adminVerificationPanel.Visible = false;
        adminDashboard.ForeColor = System.Drawing.Color.White;
        adminStatistics.ForeColor = System.Drawing.Color.White;
        adminEmployee.ForeColor = System.Drawing.Color.Red;
        adminVerification.ForeColor = System.Drawing.Color.White;
        adminDashboardPanel.ForeColor = System.Drawing.Color.White;
        adminStatisticsPanel.ForeColor = System.Drawing.Color.White;
        adminEmployeesPanel.ForeColor = System.Drawing.Color.Red;
        adminVerificationPanel.ForeColor = System.Drawing.Color.White;

        employeeName.ForeColor = System.Drawing.Color.Black;
        employeeName1.ForeColor = System.Drawing.Color.Black;
        employeeAge.ForeColor = System.Drawing.Color.Black;
        adminAge.ForeColor = System.Drawing.Color.Black;
        employeeGender.ForeColor = System.Drawing.Color.Black;
        employeeGenderLbl.ForeColor = System.Drawing.Color.Black;
        employeeOccu.ForeColor = System.Drawing.Color.Black;
        employeeOccupation.ForeColor = System.Drawing.Color.Black;
    }

    protected void adminVerification_Click(object sender, EventArgs e)
    {
        adminDashboardPanel.Visible = false;
        adminStatisticsPanel.Visible = false;
        adminEmployeesPanel.Visible = false;
        adminVerificationPanel.Visible = true;
        adminDashboard.ForeColor = System.Drawing.Color.White;
        adminStatistics.ForeColor = System.Drawing.Color.White;
        adminEmployee.ForeColor = System.Drawing.Color.White;
        adminVerification.ForeColor = System.Drawing.Color.Red;
        adminDashboardPanel.ForeColor = System.Drawing.Color.White;
        adminStatisticsPanel.ForeColor = System.Drawing.Color.White;
        adminEmployeesPanel.ForeColor = System.Drawing.Color.White;
        adminVerificationPanel.ForeColor = System.Drawing.Color.Red;

        

    }

    protected void adminNameChange(object sender, EventArgs e)
    {

    }

    protected void view_Btn(object sender, EventArgs e)
    {
        cn.Open();
        SqlCommand com1 = new SqlCommand("SELECT [FirstName], [LastName], [Gender], [Occupation] AS FullName FROM [dbo].[Users] where [Email] = @Email", cn);
        com1.Parameters.AddWithValue("@Email", emailDropDown.SelectedValue);
        string fullName = "";
        string gender = "";
        string occupation = "";
        SqlDataReader dr = com1.ExecuteReader();
        while (dr.Read())
        {

            try
            {
                employeeName1.Text = dr.GetString(0) + " " + dr.GetString(1);
            }
            catch (Exception)
            {
                employeeName1.Text = fullName;
            }
            try
            {
                employeeGender.Text = dr.GetString(2);
            }
            catch (Exception)
            {
                employeeGender.Text = gender;
            }
            try 
            {
                employeeOccu.Text = dr.GetString(3);
            }
            catch (Exception)
            {
                employeeOccu.Text = occupation;
                
            }
        }
        cn.Close();
    }

    protected void VerificationButton_Click(object sender, EventArgs e)
    {
        cn.Open();
        SqlCommand updateVerify = new SqlCommand("UPDATE [dbo].[Users] SET [Verified] = 'Verified' WHERE [Email] = @Email");
        updateVerify.Connection = cn;
        updateVerify.Parameters.AddWithValue("@Email", UnverifiedDropDown.SelectedValue);
        updateVerify.ExecuteNonQuery();
        cn.Close();

        UnverifiedDropDown.Items.Remove(UnverifiedDropDown.Items.FindByValue(UnverifiedDropDown.SelectedValue));


        
    }

    protected void updateData_Btn(object sender, EventArgs e)
    {

        string[] names = employeeName1.Text.Split(' ');
        string firstName = names[0];
        string lastName = names[1];

        cn.Open();
        SqlCommand updateVerify = new SqlCommand("UPDATE [dbo].[Users] SET [FirstName] = @FirstName, [LastName] = @LastName, [Occupation] = @Occupation, [Gender] = @Gender  WHERE [Email] = @Email");
        updateVerify.Connection = cn;
        updateVerify.Parameters.AddWithValue("@Email", emailDropDown.SelectedValue);
        updateVerify.Parameters.AddWithValue("@FirstName", firstName);
        updateVerify.Parameters.AddWithValue("@LastName", lastName);
        updateVerify.Parameters.AddWithValue("@Occupation", employeeOccu.Text);
        updateVerify.Parameters.AddWithValue("@Gender", employeeGender.Text);
        updateVerify.ExecuteNonQuery();
        cn.Close();
    }

    protected void DeleteButton_Click(object sender, EventArgs e)
    {
        cn.Open();
        SqlCommand deleteUser = new SqlCommand("DELETE FROM [dbo].[Users] WHERE [Email] = @Email");
        deleteUser.Connection = cn;
        deleteUser.Parameters.AddWithValue("@Email", UnverifiedDropDown.SelectedValue);
        deleteUser.ExecuteNonQuery();
        cn.Close();

        UnverifiedDropDown.Items.Remove(UnverifiedDropDown.Items.FindByValue(UnverifiedDropDown.SelectedValue));
    }
}