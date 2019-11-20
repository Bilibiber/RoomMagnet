using System;
using System.Collections;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebPages_PropertyInfo : System.Web.UI.Page
{
    private SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ToString());
    private string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ToString();
    private ArrayList tempImages = new ArrayList();
    private ArrayList RoomRentPrices = new ArrayList();
    int PropertyHostID;
    bool RoomsBool = false;

    protected void Page_Load(object sender, EventArgs e)
    {
        HostValidate.Visible = false;
        if (Session["SignInEmail"] == null)
        {
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openLoginModal();", true);
        }
        else
        {
            var master = Master as RoomMagnet;
            master.AfterLogin();
        }
        //set all amentities labels to visible = false;
        propertyImage1.Visible = false;
        propertyImage2.Visible = false;
        propertyImage3.Visible = false;
        propertyImage4.Visible = false;
        string test = Session["ResultPropertyID"].ToString();
        String sql = "Select Title, [Property].City, [Property].HomeState, [Property].ZipCode, AvailableBedrooms, [Property].RentPrice, [Property].StartDate, [Property].EndDate, " +
      "[ImagePath].ImagePath, AvailableBathrooms, AirConditioning, Heating, OnSiteLaundry,Parking,Furnished,PetFriendly,CarbonMonoxideDetector, SmokeDetector,SeperateEntrance," +
    "Wifi, TV, SeparateBathroom, [Property].Descriptions,Users.FirstName, Users.LastName, Users.ImagePath, Users.UserID from [Property] inner join [ImagePath]" +
    "on [Property].PropertyID = [ImagePath].PropertyID INNER JOIN [PropertyRoom] ON [Property].PropertyID = [PropertyRoom].PropertyID" +
    " INNER JOIN Amenities ON [Amenities].PropertyID = [Property].PropertyID INNER JOIN [Rating] ON [Property].PropertyID= " +
    "[Rating].PropertyID INNER JOIN Users ON Property.HostID = Users.UserID WHERE [Property].PropertyID = " + test;

        connection.Open();
        string title = "";
        string city = "";
        string homeState = "";
        string zipCode = "";
        int availableBedrooms = -1;
        string rentPrice = "";
        string startDate = "";

        int availableBathrooms = -1;
        string airConditioning = "";
        string heating = "";
        string onSiteLaundry = "";
        string parking = "";
        string furnished = "";
        string petFriendly = "";
        string carbonMonoxideDetector = "";
        string smokeDetector = "";
        string separateEntrance = "";
        string wifi = "";
        string tv = "";
        string seperateBathroom = "";
        string descriptions = "";
        decimal numStars = 0;
        DateTime lastUpdated = DateTime.Now;
        string lastUpdatedBy = "";

        SqlCommand search = new SqlCommand(sql, connection);
        SqlDataReader reader = search.ExecuteReader();

        int counter = 0;

        if (reader.HasRows)
        {
            while (reader.Read())
            {
                byte[] propertyImage = (byte[])reader[8];
                byte[] OwnerImage = (byte[])reader[25];
                PropertyHostID = reader.GetInt32(26);
                string OWNERImageURL = "data:image;base64," + Convert.ToBase64String(OwnerImage);
                PropertyOwnerImage.ImageUrl = OWNERImageURL;
                PropertyOwnerName.Text = reader.GetString(23) + " " + reader.GetString(24);
                PropertyDescription.Text = reader.GetString(22);
                string propertyImageURL = "data:image;base64," + Convert.ToBase64String(propertyImage);
                if (tempImages.Contains(propertyImageURL) == false)
                {
                    tempImages.Add(propertyImageURL);

                    if (counter == 0)
                    {
                        if (tempImages.Contains(propertyImage1.ImageUrl) == false)
                        {
                            Image1.Visible = true;
                            propertyImage1.ImageUrl = propertyImageURL;
                            propertyImage1.Visible = true;
                            
                        }
                    }
                    else if (counter == 1)
                    {
                        if (tempImages.Contains(propertyImage2.ImageUrl) == false)
                        {
                            Image2.Visible = true;
                            propertyImage2.ImageUrl = propertyImageURL;
                            propertyImage2.Visible = true;

                        }
                    }
                    else if (counter == 2)
                    {
                        if (tempImages.Contains(propertyImage3.ImageUrl) == false)
                        {
                            Image3.Visible = true;
                            propertyImage3.ImageUrl = propertyImageURL;
                            propertyImage3.Visible = true;

                        }
                    }
                    else if (counter == 3)
                    {
                        if (tempImages.Contains(propertyImage4.ImageUrl) == false)
                        {
                            Image4.Visible = true;
                            propertyImage4.ImageUrl = propertyImageURL;
                            propertyImage4.Visible = true;
                        }
                    }
                    else if (counter == 4)
                    {
                        if (tempImages.Contains(propertyImage5.ImageUrl) == false)
                        {
                            Image5.Visible = true;
                            propertyImage5.ImageUrl = propertyImageURL;
                            propertyImage5.Visible = true;
                        }
                    }

                    if (counter == 0)
                    {
                        titleLbl.Text = reader.GetString(0);
                        cityLbl.Text = reader.GetString(1) + ", ";
                        homeStateLbl.Text = reader.GetString(2) + ", ";
                        zipCodeLbl.Text = reader.GetString(3);
                        availableBedrooms = reader.GetInt32(4);
                        decimal x = reader.GetDecimal(5);
                        rentPrice = String.Format("{0:0.##}", x);
                        rentPriceLbl.Text = "$" + rentPrice + "/Month";

                        startDate = reader.GetDateTime(6).ToShortDateString() + " - " + reader.GetDateTime(7).ToShortDateString();

                        availableBathrooms = reader.GetInt32(9);
                        airConditioning = reader.GetString(10);
                        heating = reader.GetString(11);
                        onSiteLaundry = reader.GetString(12);
                        parking = reader.GetString(13);
                        furnished = reader.GetString(14);
                        petFriendly = reader.GetString(15);
                        carbonMonoxideDetector = reader.GetString(16);
                        smokeDetector = reader.GetString(17);
                        separateEntrance = reader.GetString(18);
                        wifi = reader.GetString(19);
                        tv = reader.GetString(20);
                        seperateBathroom = reader.GetString(21);
                         descriptions = reader.GetString(22);

                    }
                    counter++;
                }
            }
            //amenitiesLbl.Visible = true;

            if (airConditioning == "Y")
            {
                airConditioningLbl.Text = "Air Conditioning";
                AirConditioningIcon.Visible = true;
            }

            if (heating == "Y")
            {
                heatingLbl.Text = "Heating";
                HeatingIcon.Visible = true;
            }

            if (onSiteLaundry == "Y")
            {
                onSiteLaundryLbl.Text = "On Site Laundry";

                onSiteLaundryIcon.Visible = true;
            }

            if (parking == "Y")
            {
                parkingLbl.Text = "Parking";

                parkingIcon.Visible = true;
            }

            if (furnished == "Y")
            {
                furnishedLbl.Text = "Furnished";

                furnishedIcon.Visible = true;
            }

            if (petFriendly == "Y")
            {
                petFriendlyLbl.Text = "Pet Friendly";

                petFriendlyIcon.Visible = true;
            }

            if (carbonMonoxideDetector == "Y")
            {
                carbonMonoxideDetectorLbl.Text = "Carbon Monoxide Detector";

                carbonMonoxideDetectorIcon.Visible = true;
            }

            if (smokeDetector == "Y")
            {
                smokeDetectorLbl.Text = "Smoke Detector";

                smokeDetectorIcon.Visible = true;
            }

            if (separateEntrance == "Y")
            {
                seperateEntranceLbl.Text = "Seperate Entrance";

                seperateEntranceIcon.Visible = true;
            }

            if (wifi == "Y")
            {
                wifiLbl.Text = "Wifi";

                wifiIcon.Visible = true;
            }

            if (tv == "Y")
            {
                tvLbl.Text = "TV";

                tvIcon.Visible = true;
            }

            if (seperateBathroom == "Y")
            {
                seperateBathroomLbl.Text = "Seperate Bathroom";

                seperateBathroomIcon.Visible = true;
            }

            startDateLbl.Text = "Date Avaliable: " + startDate.ToString();
            availableBathroomsLbl.Text = availableBathrooms.ToString();
            lastUpdatedLbl.Text = lastUpdated.ToShortDateString();

            counter++;

            tempImages.Clear();
        }
        reader.Close();
        int RatingCount = 0;
        decimal RatingSum = 0;
        string tempReviewer = "";
        string tempDescription = "";
        string tempLastUpdated = "";
        string tempStars = "";
        string sql2 = "Select NumStars, LastUpdatedBy, Descriptions, LastUpdated from [Rating] where PropertyID=" + test;
        SqlCommand sqlCommand = new SqlCommand(sql2, connection);
        SqlDataReader reader2 = sqlCommand.ExecuteReader();
        if (reader2.HasRows)
        {
            while (reader2.Read())
            {
     
                if (RatingCount == 0)
                {
                    RatingSum += reader2.GetDecimal(0);
                    tempReviewer = reader2.GetString(1);
                    tempDescription = reader2.GetString(2);
                    tempLastUpdated = reader2.GetDateTime(3).ToShortDateString();
                    tempStars = reader2.GetDecimal(0).ToString();
                    PropertyReviewPoster.Text = tempReviewer;
                    PropertyReviewContent.Text = tempDescription;
                    PropertyReviewPostTime.Text = tempLastUpdated;
                    PropertyReviewPosterStar.Text = tempStars;
                    RatingCount++;
                    continue;
                }

                if (RatingCount == 1)
                {
                    RatingSum += reader2.GetDecimal(0);
                    Review2.Visible = true;
                    PropertyReviewPoster2.Text = reader2.GetString(1);
                    PropertyReviewContent2.Text = reader2.GetString(2);
                    PropertyReviewPostTime2.Text = reader2.GetDateTime(3).ToShortDateString();
                    PropertyReviewPosterStar2.Text = reader2.GetDecimal(0).ToString();
                    RatingCount++;
                    continue;
                }
                if (RatingCount == 2)
                {
                    RatingSum += reader2.GetDecimal(0);
                    Review3.Visible = true;
                    PropertyReviewPoster3.Text = reader2.GetString(1);
                    PropertyReviewContent3.Text = reader2.GetString(2);
                    PropertyReviewPostTime3.Text = reader2.GetDateTime(3).ToShortDateString();
                    PropertyReviewPosterStar3.Text = reader2.GetDecimal(0).ToString();
                    RatingCount++;
                    continue;
                }
                if (RatingCount == 3)
                {
                    RatingSum += reader2.GetDecimal(0);
                    Review4.Visible = true;
                    PropertyReviewPoster4.Text = reader2.GetString(1);
                    PropertyReviewContent4.Text = reader2.GetString(2);
                    PropertyReviewPostTime4.Text = reader2.GetDateTime(3).ToShortDateString();
                    PropertyReviewPosterStar4.Text = reader2.GetDecimal(0).ToString();
                    RatingCount++;
                    continue;
                }
                if (RatingCount == 4)
                {
                    RatingSum += reader2.GetDecimal(0);
                    Review5.Visible = true;
                    PropertyReviewPoster5.Text = reader2.GetString(1);
                    PropertyReviewContent5.Text = reader2.GetString(2);
                    PropertyReviewPostTime5.Text = reader2.GetDateTime(3).ToShortDateString();
                    PropertyReviewPosterStar5.Text = reader2.GetDecimal(0).ToString();
                    RatingCount++;
                    continue;
                }
                
            }
        }
        if (RatingCount != 0)
        {
            PropertyReviewCount.Text = "Review: " + RatingCount.ToString();
            numStarsLbl.Text = (RatingSum / RatingCount).ToString();
            numStarsLbl.Visible = true;
        }
        else
        {
            PropertyReviewCount.Text = "Review: " + RatingCount.ToString();
            numStarsLbl.Visible = false;
        }
        reader2.Close();
        string Roomsql = "Select PropertyRoomName, RoomID, RentPrice from PropertyRoom where PropertyID=" + Session["ResultPropertyID"].ToString();
        if (RoomsBool == false)
        {
            SqlCommand sqlCommand6 = new SqlCommand(Roomsql, connection);
            SqlDataReader reader6 = sqlCommand6.ExecuteReader();
            if (reader6.HasRows)
            {
                while (reader6.Read())
                {
                    Rooms.Items.Add(new ListItem(reader6.GetString(0), reader6.GetInt32(1).ToString()));
                    RoomRentPrices.Add(Convert.ToDecimal(string.Format("{0:F2}", reader6.GetDecimal(2).ToString("0.00"))));
                    RoomRentPrice.Text = string.Format("{0:F2}", reader6.GetDecimal(2).ToString("0.00"));
                }
            }
            RoomsBool = true;
        }
        connection.Close();
    }

    protected void SavetoFav_OnClick(object sender, EventArgs a)
    {
        if (Session["SignInEmail"] == null)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openLoginModal();", true);
        }
        else if (PropertyHostID.ToString() == Session["UserID"].ToString())
        {
            HostValidate.Text = "A Host can not reserve their own property";
            HostValidate.Visible = true;
            return;
        }
        else
        {
            string userSignInEmail = (string)Session["SignInEmail"];
            int userId = pullUserID(userSignInEmail);
            int propertyId = (int)Session["ResultPropertyID"];
            addPropertytoUserFav(userId, propertyId);
        }
    }

    private int pullUserID(string email)
    {
        //We need to double check that we don't allow a user to create multiple accounts with the same email
        int userId = -1;
        SqlConnection con = new SqlConnection(connectionString);
        string userIdQuery = "SELECT TOP 1 UserID from Users WHERE Email = @email";
        con.Open();
        SqlCommand cmd = new SqlCommand(userIdQuery, con);
        cmd.Parameters.AddWithValue("@email", email);

        SqlDataReader reader = cmd.ExecuteReader();

        if (reader.HasRows)
        {
            reader.Read();
            userId = reader.GetInt32(0);
        }

        return userId;
    }

    protected void addPropertytoUserFav(int userId, int propertyId)
    {
        SqlConnection con = new SqlConnection(connectionString);
        string insertQuery = "INSERT INTO Favorites (UserID, PropertyID) VALUES (@userId, @propertyId);";
        con.Open();

        SqlCommand cmd = new SqlCommand(insertQuery, con);
        cmd.Parameters.AddWithValue("@userId", userId);
        cmd.Parameters.AddWithValue("@propertyId", propertyId);

        cmd.ExecuteNonQuery();
    }

    protected void Unnamed_Click(object sender, EventArgs e)
    {
        if (Session["SignInEmail"] == null)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openLoginModal();", true);
        }
        else if (PropertyHostID.ToString() == Session["UserID"].ToString())
        {
            HostValidate.Text = "A Host can not reserve their own property";
            HostValidate.Visible = true;
            return;
        }
        else
        {
            Response.Redirect("Message.aspx");
        }
    }
    protected void Reserve_Click(object sender, EventArgs e)
    {
        if (Session["SignInEmail"] == null)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openLoginModal();", true);
        }
        else if (PropertyHostID.ToString() == Session["UserID"].ToString())
        {
            HostValidate.Text = "A Host can not reserve their own property";
            HostValidate.Visible = true;
            return;
        }
        else
        {
            string Request = Session["FullName"].ToString() + " is interested in renting a room in " + titleLbl.Text +   ", Would you like to accept their request?";
            string sql = "INSERT INTO Request (PropertyHostID, PropertyID, PropertyRoomID, RoomRenterID, Request) VALUES (@PropertyHostID, @PropertyID, @PropertyRoomID, @RoomRenterID, @Request)";
            connection.Open();

            SqlCommand cmd = new SqlCommand(sql, connection);
            cmd.Parameters.AddWithValue("@PropertyHostID", PropertyHostID);
            cmd.Parameters.AddWithValue("@PropertyID", Session["ResultPropertyID"].ToString());
            cmd.Parameters.AddWithValue("@PropertyRoomID", Rooms.SelectedValue);
            cmd.Parameters.AddWithValue("@RoomRenterID", Session["UserID"].ToString());
            cmd.Parameters.AddWithValue("@Request", Request);
           
            connection.Close();
        }
    }

    protected void Rooms_SelectedIndexChanged(object sender, EventArgs e)
    {
        int i = Rooms.SelectedIndex;
        RoomRentPrice.Text = "$" + RoomRentPrices[i];
    }
}