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
        Hello.Text = "Hello, " + Session["FullName"];
        if (IsPostBack.Equals(false))
        {
            adminDashboard.ForeColor = System.Drawing.Color.Red;
            adminAddEmployee.ForeColor = System.Drawing.Color.White;
            adminVerification.ForeColor = System.Drawing.Color.White;
            adminEmployee.ForeColor = System.Drawing.Color.White;
        }
        if (IsPostBack.Equals(false))
        {
            SqlCommand selectEmployees = new SqlCommand();
            selectEmployees.Connection = cn;
            String com = "SELECT [Email] FROM [dbo].[Users] WHERE [UserRole] = 'Admin';";
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
            String com = "SELECT [Email] FROM [dbo].[Users] WHERE [UserRole] = 'Renter' AND [Verified] = 'Unverified' OR [UserRole] = 'Host' AND [Verified] = 'Unverified';";
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
        adminEmployeesPanel.Visible = false;
        adminVerificationPanel.Visible = false;
        adminAddEmployeePanel.Visible = false;
        adminDashboard.ForeColor = System.Drawing.Color.Red;
        adminEmployee.ForeColor = System.Drawing.Color.White;
        adminAddEmployee.ForeColor = System.Drawing.Color.White;
        adminVerification.ForeColor = System.Drawing.Color.White;
        adminDashboardPanel.ForeColor = System.Drawing.Color.Red;
        adminEmployeesPanel.ForeColor = System.Drawing.Color.White;
        adminVerificationPanel.ForeColor = System.Drawing.Color.White;
    }

    protected void adminEmployee_Click(object sender, EventArgs e)
    {
        adminDashboardPanel.Visible = false;
        adminEmployeesPanel.Visible = true;
        adminVerificationPanel.Visible = false;
        adminAddEmployeePanel.Visible = false;
        adminDashboard.ForeColor = System.Drawing.Color.White;
        adminEmployee.ForeColor = System.Drawing.Color.Red;
        adminAddEmployee.ForeColor = System.Drawing.Color.White;
        adminVerification.ForeColor = System.Drawing.Color.White;
        adminDashboardPanel.ForeColor = System.Drawing.Color.White;
        adminEmployeesPanel.ForeColor = System.Drawing.Color.Red;
        adminVerificationPanel.ForeColor = System.Drawing.Color.White;

        updateFirstNameLbl.ForeColor = System.Drawing.Color.Black;
        updateLastNameLbl.ForeColor = System.Drawing.Color.Black;
        updateStreetAddressLbl.ForeColor = System.Drawing.Color.Black;
        updateCityLbl.ForeColor = System.Drawing.Color.Black;
        updateStateLbl.ForeColor = System.Drawing.Color.Black;
        updateCountryLbl.ForeColor = System.Drawing.Color.Black;
        updateZipCodeLbl.ForeColor = System.Drawing.Color.Black;
        updatePositionLbl.ForeColor = System.Drawing.Color.Black;
        updateEmailLbl.ForeColor = System.Drawing.Color.Black;
    }

    protected void adminVerification_Click(object sender, EventArgs e)
    {
        adminDashboardPanel.Visible = false;
        adminEmployeesPanel.Visible = false;
        adminVerificationPanel.Visible = true;
        adminAddEmployeePanel.Visible = false;
        adminDashboard.ForeColor = System.Drawing.Color.White;
        adminEmployee.ForeColor = System.Drawing.Color.White;
        adminAddEmployee.ForeColor = System.Drawing.Color.White;
        adminVerification.ForeColor = System.Drawing.Color.Red;
        adminDashboardPanel.ForeColor = System.Drawing.Color.White;
        adminEmployeesPanel.ForeColor = System.Drawing.Color.White;
        adminVerificationPanel.ForeColor = System.Drawing.Color.Red;
    }

    protected void adminNameChange(object sender, EventArgs e)
    {

    }

    protected void view_Btn(object sender, EventArgs e)
    {
        cn.Open();
        SqlCommand com1 = new SqlCommand("SELECT [FirstName],[LastName],[Email],[Occupation],[StreetAddress],[City],[HomeState],[Country]," +
            "[ZipCode] FROM [dbo].[Users] where [Email] = @Email", cn);
        com1.Parameters.AddWithValue("@Email", emailDropDown.SelectedValue);
        SqlDataReader dr = com1.ExecuteReader();
        while (dr.Read())
        {
            updateFirstNameText.Text = dr.GetString(0);
            updateLastNameText.Text = dr.GetString(1);
            updateEmailText.Text = dr.GetString(2);
            updatePositionText.Text = dr.GetString(3);
            updateStreetAddressText.Text = dr.GetString(4);
            updateCityText.Text = dr.GetString(5);
            updateStateDropDownList.SelectedValue = dr.GetString(6);
            updateCountryText.Text = dr.GetString(7);
            updateZipCodeText.Text = dr.GetString(8);
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
        cn.Open();
        SqlCommand updateVerify = new SqlCommand("UPDATE [dbo].[Users] SET [FirstName] = @FirstName, [LastName] = @LastName, [StreetAddress] = @StreetAddress," +
            "[City] = @City, [HomeState] = @State, [Country] = @Country, [ZipCode] = @ZipCode, [Email] = @Email, [Occupation] = @Position WHERE [Email] = @Email");
        updateVerify.Connection = cn;
        updateVerify.Parameters.AddWithValue("@FirstName", updateFirstNameText.Text);
        updateVerify.Parameters.AddWithValue("@LastName", updateLastNameText.Text);
        updateVerify.Parameters.AddWithValue("@StreetAddress", updateStreetAddressText.Text);
        updateVerify.Parameters.AddWithValue("@City", updateCityText.Text);
        updateVerify.Parameters.AddWithValue("@State", updateStateDropDownList.SelectedValue);
        updateVerify.Parameters.AddWithValue("@Country", updateCountryText.Text);
        updateVerify.Parameters.AddWithValue("@ZipCode", updateZipCodeText.Text);
        updateVerify.Parameters.AddWithValue("@Position", updatePositionText.Text);
        updateVerify.Parameters.AddWithValue("@Email", updateEmailText.Text);

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

    protected void adminAddEmployee_Click(object sender, EventArgs e)
    {
        adminAddEmployeePanel.Visible = true;
        adminDashboardPanel.Visible = false;
        adminEmployeesPanel.Visible = false;
        adminVerificationPanel.Visible = false;
        adminDashboard.ForeColor = System.Drawing.Color.White;
        adminAddEmployee.ForeColor = System.Drawing.Color.Red;
        adminEmployee.ForeColor = System.Drawing.Color.White;
        adminVerification.ForeColor = System.Drawing.Color.White;
        adminDashboardPanel.ForeColor = System.Drawing.Color.White;
        adminEmployeesPanel.ForeColor = System.Drawing.Color.White;
        adminVerificationPanel.ForeColor = System.Drawing.Color.White;
        adminAddEmployee.ForeColor = System.Drawing.Color.Red;
    }

    protected void insertBtn_Click(object sender, EventArgs e)
    {
        string HashedPassword = PasswordHash.HashPassword("original");
        cn.Open();
        SqlCommand createEmployee = new SqlCommand("INSERT INTO [dbo].[Users]([FirstName],[LastName],[Password],[Email],[UserRole],[Verified],[Occupation],[StreetAddress],[City],[HomeState],[Country]," +
            "[ZipCode],[SignUpDate],[LastUpdated],[LastUpdatedBy]) VALUES (@FirstName, @LastName, @Password, @Email, 'Admin', 'Admin', @Position, @StreetAddress, @City, @HomeState, @Country, @ZipCode," +
            " @SignUpDate, @LastUpdated, @LastUpdatedBy)");
        createEmployee.Connection = cn;
        createEmployee.Parameters.AddWithValue("@FirstName", firstNameText.Text);     //1
        createEmployee.Parameters.AddWithValue("@LastName", lastNameText.Text);     //2
        createEmployee.Parameters.AddWithValue("@Email", emailAddressText.Text);     //3
        createEmployee.Parameters.AddWithValue("@Position", positionText.Text);     //5
        createEmployee.Parameters.AddWithValue("@StreetAddress", streetAddressText.Text);     //6
        createEmployee.Parameters.AddWithValue("@City", cityText.Text);     //7
        createEmployee.Parameters.AddWithValue("@HomeState", stateDropDown.SelectedValue);     //8
        createEmployee.Parameters.AddWithValue("@Country", countryText.Text);     //9
        createEmployee.Parameters.AddWithValue("@ZipCode", zipCodeText.Text);     //10
        createEmployee.Parameters.AddWithValue("@Password", HashedPassword);
        createEmployee.Parameters.AddWithValue("@SignUpDate", DateTime.Now);     //11
        createEmployee.Parameters.AddWithValue("@LastUpdated", DateTime.Now);     //12
        createEmployee.Parameters.AddWithValue("@LastUpdatedBy", "Ottis Bishop");     //13
        createEmployee.ExecuteNonQuery();
        cn.Close();
        firstNameText.Text = string.Empty;
        lastNameText.Text = string.Empty;
        streetAddressText.Text = string.Empty;
        cityText.Text = string.Empty;
        stateDropDown.SelectedValue = "";
        countryText.Text = string.Empty;
        zipCodeText.Text = string.Empty;
        emailAddressText.Text = string.Empty;
        positionText.Text = string.Empty;
    }
}