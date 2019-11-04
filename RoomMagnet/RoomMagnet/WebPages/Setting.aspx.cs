using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebPages_Setting : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SqlConnection db = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ToString());
            db.Open();
            System.Data.SqlClient.SqlCommand selectuser = new System.Data.SqlClient.SqlCommand();
            selectuser.Connection = db;
            selectuser.CommandText = "select [FirstName], [MiddleName], [LastName], [Gender], [Occupation], [Description] from [RoomMagnet].[dbo].[Users] where [UserID] = 24";
            SqlDataReader getinfor = selectuser.ExecuteReader();
            while (getinfor.Read())
            {
                setfirstname.Text = getinfor.GetString(0);
                if (!getinfor.IsDBNull(1))
                {
                    setmiddlename.Text = getinfor.GetString(1);
                }
                setlastname.Text = getinfor.GetString(2);
                if (!getinfor.IsDBNull(3))
                {
                    setgender.SelectedValue = getinfor.GetString(3);
                }
                if (!getinfor.IsDBNull(4))
                {
                    setOccupation.Text = getinfor.GetString(4);
                }
                if (!getinfor.IsDBNull(5))
                {
                    setdescription.Text = getinfor.GetString(5);
                }

            }
            getinfor.Close();
            db.Close();
        }

    }

    protected void updateusersetting_Click(object sender, EventArgs e)
    {
        string connect = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
        SqlConnection db = new SqlConnection(connect);
        try
        {
            db.Open();
            System.Data.SqlClient.SqlCommand updateuser = new System.Data.SqlClient.SqlCommand();
            updateuser.Connection = db;
            updateuser.CommandText = "UPDATE [dbo].[Users] SET [FirstName] = @FirstName , [LastName] = @LastName , [MiddleName] = @MiddleName, Gender = @Gender, " +
                "Occupation = @Occupation, Description=@Description,LastUpdated=@LastUpdated,LastUpdatedBy=@LastUpdatedBy WHERE [UserID] = 24";

            updateuser.Parameters.Add(new SqlParameter("@FirstName", setfirstname.Text));
            updateuser.Parameters.Add(new SqlParameter("@MiddleName", setmiddlename.Text));
            updateuser.Parameters.Add(new SqlParameter("@LastName", setlastname.Text));
            updateuser.Parameters.Add(new SqlParameter("@Gender", setgender.Text));
            updateuser.Parameters.Add(new SqlParameter("@Occupation", setOccupation.Text));
            updateuser.Parameters.Add(new SqlParameter("@Description", setdescription.Text));
            updateuser.Parameters.Add(new SqlParameter("@LastUpdated", DateTime.Now));
            updateuser.Parameters.Add(new SqlParameter("@LastUpdatedBy", setfirstname.Text + " " + setlastname.Text));

            updateuser.ExecuteNonQuery();
            db.Close();
        }
        catch (Exception)
        {

        }


    }
}