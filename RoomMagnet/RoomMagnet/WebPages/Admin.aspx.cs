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
        
        WelcomeMessage.Text = "Hello, " + Session["FullName"];
        if (IsPostBack.Equals(false))
        {

        }
        if (IsPostBack.Equals(false))
        {
            cn.Open();
            String com = "SELECT [Email] FROM [dbo].[Users] WHERE [UserRole] = 'Admin';";
            SqlCommand sqlCommand = new SqlCommand(com, cn);
            SqlDataReader selectEmployeesDA = sqlCommand.ExecuteReader();
            if (selectEmployeesDA.HasRows)
            {
                while (selectEmployeesDA.Read())
                {
                    emailDropDown.Items.Add(new ListItem((selectEmployeesDA.GetString(0))));

                }
            }

            cn.Close();
        }
        if (IsPostBack.Equals(false))
        {
            
            cn.Open();
            String com = "SELECT [Email] FROM [dbo].[Users] WHERE [UserRole] = 'Renter' AND [Verified] = 'Unverified' OR [UserRole] = 'Host' AND [Verified] = 'Unverified';";
            SqlCommand sqlCommand = new SqlCommand(com, cn);
            SqlDataReader selectEmployeesDA = sqlCommand.ExecuteReader();
            if (selectEmployeesDA.HasRows)
            {
                while (selectEmployeesDA.Read())
                {
                    UnverifiedDropDown.Items.Add(new ListItem((selectEmployeesDA.GetString(0))));

                }
            }
            selectEmployeesDA.Close();
            // fill UserDropDown
            string AllUsers = "Select Email from Users where UserRole='Host' or UserRole='Renter' and AccountStatus='Actived'";
            SqlCommand command = new SqlCommand(AllUsers,cn);
            SqlDataReader reader = command.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    UserDropDown.Items.Add(new ListItem((reader.GetString(0))));
                }
            }
            reader.Close();
            // fill deactived userdropdown
            string DeactivedUser = "Select Email from Users where AccountStatus='Deactived'";
            SqlCommand sql = new SqlCommand(DeactivedUser, cn);
            SqlDataReader reader2 = sql.ExecuteReader();
            if (reader2.HasRows)
            {
                while (reader2.Read())
                {
                    DeavtivedUserDropDownList.Items.Add(new ListItem((reader2.GetString(0))));
                }
            }
            else
            {
                DeactivedLbl.Visible = true;
            }
            reader2.Close();
            cn.Close();
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
        adminDashboard.BackColor = System.Drawing.Color.FromArgb(84, 84, 84);
        adminEmployee.BackColor = System.Drawing.Color.FromArgb(51, 51, 51);
        adminAddEmployee.BackColor = System.Drawing.Color.FromArgb(51, 51, 51);
        adminVerification.BackColor = System.Drawing.Color.FromArgb(51, 51, 51);
    }

    protected void adminEmployee_Click(object sender, EventArgs e)
    {
        adminDashboardPanel.Visible = false;
        adminEmployeesPanel.Visible = true;
        adminVerificationPanel.Visible = false;
        adminAddEmployeePanel.Visible = false;
        adminDashboard.BackColor = System.Drawing.Color.FromArgb(51, 51, 51);
        adminEmployee.BackColor = System.Drawing.Color.FromArgb(84, 84, 84);
        adminAddEmployee.BackColor = System.Drawing.Color.FromArgb(51, 51, 51);
        adminVerification.BackColor = System.Drawing.Color.FromArgb(51, 51, 51);
    }

    protected void adminVerification_Click(object sender, EventArgs e)
    {
        adminDashboardPanel.Visible = false;
        adminEmployeesPanel.Visible = false;
        adminVerificationPanel.Visible = true;
        adminAddEmployeePanel.Visible = false;
        adminDashboard.BackColor = System.Drawing.Color.FromArgb(51, 51, 51);
        adminEmployee.BackColor = System.Drawing.Color.FromArgb(51, 51, 51);
        adminAddEmployee.BackColor = System.Drawing.Color.FromArgb(51, 51, 51);
        adminVerification.BackColor = System.Drawing.Color.FromArgb(84, 84, 84);
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
            updateCountryDropDown.SelectedValue = dr.GetString(7);
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
        updateVerify.Parameters.AddWithValue("@Country", updateCountryDropDown.SelectedValue);
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
        adminDashboard.BackColor = System.Drawing.Color.FromArgb(51, 51, 51);
        adminEmployee.BackColor = System.Drawing.Color.FromArgb(51, 51, 51);
        adminAddEmployee.BackColor = System.Drawing.Color.FromArgb(84, 84, 84);
        adminVerification.BackColor = System.Drawing.Color.FromArgb(51, 51, 51);
    }

    protected void SignUpEmailCustomValidator_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
    {
        try
        {
            if (cn.State == System.Data.ConnectionState.Closed)
            {
                cn.Open();
            }
            string sql = "Select Email from Users";
            SqlCommand sqlCommand = new SqlCommand(sql, cn);
            SqlDataReader reader = sqlCommand.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    string EmailInDataBase = reader.GetString(0).ToString();
                    if (EmailInDataBase == emailAddressText.Text)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
                        args.IsValid = false;
                        break;
                    }
                }
            }
            else
            {
                args.IsValid = true;
            }
            reader.Close();
            cn.Close();
        }
        catch (Exception)
        {
            args.IsValid = false;
            //AdminEmployeeCustomValidator.ErrorMessage = "Connection Error,Please try again Later";
        }
    }

    protected void insertBtn_Click(object sender, EventArgs e)
    {
        //if (AdminEmployeeCustomValidator.IsValid)
        //{
        if (countryDropDown.SelectedValue == "")
        {
            stateDropDown.SelectedValue = "";
            stateDropDown.Enabled = false;
        }
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
            createEmployee.Parameters.AddWithValue("@Country", countryDropDown.SelectedValue);     //9
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
            countryDropDown.SelectedValue = string.Empty;
            zipCodeText.Text = string.Empty;
            emailAddressText.Text = string.Empty;
            positionText.Text = string.Empty;
        //}
        
    }
    protected void countryValidator_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
    {
        if (countryDropDown.SelectedIndex == 0)
        {
            args.IsValid = false;
        }
        else
        {
            args.IsValid = true;
        }
    }

    protected void Deactive_Click(object sender, EventArgs e)
    {
        cn.Open();
        string deactive = "Update Users Set AccountStatus='Deactived' where Email=@Email";
        SqlCommand sqlCommand = new SqlCommand(deactive,cn);
        sqlCommand.Parameters.AddWithValue("@Email",UserDropDown.SelectedValue);
        sqlCommand.ExecuteNonQuery();
        cn.Close();

        UserDropDown.Items.Remove(UserDropDown.Items.FindByValue(UserDropDown.SelectedValue));
        //DeavtivedUserDropDownList.Items.Add(UserDropDown.Items.FindByValue(UserDropDown.SelectedValue));
    }

    protected void Active_Click(object sender, EventArgs e)
    {
        cn.Open();
        string active = "Update Users Set AccountStatus='Actived' where Email=@Email";
        SqlCommand sqlCommand = new SqlCommand(active, cn);
        sqlCommand.Parameters.AddWithValue("@Email", DeavtivedUserDropDownList.SelectedValue);
        sqlCommand.ExecuteNonQuery();
        cn.Close();

        DeavtivedUserDropDownList.Items.Remove(DeavtivedUserDropDownList.Items.FindByValue(DeavtivedUserDropDownList.SelectedValue));
        //UserDropDown.Items.Add(DeavtivedUserDropDownList.Items.FindByValue(DeavtivedUserDropDownList.SelectedValue));
    }
}