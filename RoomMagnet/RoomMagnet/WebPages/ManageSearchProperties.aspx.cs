using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;


public partial class WebPages_ManageSearchProperties : System.Web.UI.Page
{
    SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ToString());
    private string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ToString();

    ArrayList tempImages = new ArrayList();
    protected void Page_Load(object sender, EventArgs e)
    {
        
        
        
        //set all amentities labels to visible = false;
        propertyImage1.Visible = false;
        propertyImage2.Visible = false;
        propertyImage3.Visible = false;
        propertyImage4.Visible = false;
        string test = Session["ResultPropertyID"].ToString();
        String sql = "Select Title, [Property].City, [Property].HomeState, [Property].ZipCode, AvailableBedrooms, [Property].RentPrice, [Property].StartDate, [Property].EndDate, " +
      "[ImagePath].ImagePath, AvailableBathrooms, AirConditioning, Heating, OnSiteLaundry,Parking,Furnished,PetFriendly,CarbonMonoxideDetector, SmokeDetector,SeperateEntrance," +
    "Wifi, TV, SeparateBathroom, [Rating].Descriptions, NumStars, [Rating].LastUpdated, [Rating].LastUpdatedBy from [Property] inner join [ImagePath]" +
    "on [Property].PropertyID = [ImagePath].PropertyID INNER JOIN [PropertyRoom] ON [Property].PropertyID = [PropertyRoom].PropertyID" +
    " INNER JOIN Amenities ON [Amenities].PropertyID = [Property].PropertyID INNER JOIN [Rating] ON [Property].PropertyID= " +
    "[Rating].PropertyID WHERE [Property].PropertyID = " + Session["ResultPropertyID"];



        connection.Open();
        string title = "";
        string city = "";
        string homeState = "";
        string zipCode = "";
        int availableBedrooms = -1;
        string rentPrice = "";
        DateTime startDate = DateTime.Now;
        DateTime endDate = DateTime.Now;
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
            reader.Read();
            byte[] propertyImage = (byte[])reader[8];

            string propertyImageURL = "data:image;base64," + Convert.ToBase64String(propertyImage);
            if (tempImages.Contains(propertyImageURL) == false)
            {
                tempImages.Add(propertyImageURL);

                if (counter == 0)
                {
                    if (tempImages.Contains(propertyImage1.ImageUrl) == false)
                    {


                        propertyImage1.ImageUrl = propertyImageURL;
                        propertyImage1.Visible = true;
                    }
                }

                else if (counter == 1)
                {
                    if (tempImages.Contains(propertyImage2.ImageUrl) == false)
                    {


                        propertyImage2.ImageUrl = propertyImageURL;
                        propertyImage2.Visible = true;
                    }
                }

                else if (counter == 2)
                {
                    if (tempImages.Contains(propertyImage3.ImageUrl) == false)
                    {


                        propertyImage3.ImageUrl = propertyImageURL;
                        propertyImage3.Visible = true;
                    }
                }
                else if (counter == 3)
                {
                    if (tempImages.Contains(propertyImage4.ImageUrl) == false)
                    {


                        propertyImage4.ImageUrl = propertyImageURL;
                        propertyImage4.Visible = true;
                    }
                }
            }
            
            if (counter == 0)
            {
                titleLbl.Text = reader.GetString(0);
               
                cityLbl.Text = reader.GetString(1);
                homeStateLbl.Text = reader.GetString(2);
                zipCodeLbl.Text = reader.GetString(3);
                availableBedrooms = reader.GetInt32(4);
                decimal x = reader.GetDecimal(5);
  
                rentPrice = String.Format("{0:0.##}", x);
                rentPriceLbl.Text = "$" + rentPrice + "/Month";

                startDate = reader.GetDateTime(6);
                endDate = reader.GetDateTime(7);
                
                
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
                //if (reader.IsDBNull(22) == false)
                //{
                //    descriptions = reader.GetString(22);
                //}
                numStars = reader.GetDecimal(23);
                lastUpdated = reader.GetDateTime(24);
                lastUpdatedBy = reader.GetString(25);

            }
            counter++;




            //amenitiesLbl.Visible = true;

            if (airConditioning == "Y")
            {
                airConditioningLbl.Text = "Air Conditioning";
                airConditioningLbl.Visible = true;

            }

            if (heating == "Y")
            {
                heatingLbl.Text = "Heating";
                heatingLbl.Visible = true;
            }

            if (onSiteLaundry == "Y")
            {
                onSiteLaundryLbl.Text = "On Site Laundry";
                onSiteLaundryLbl.Visible = true;

            }

            if (parking == "Y")
            {
                parkingLbl.Text = "Parking";
                parkingLbl.Visible = true;

            }

            if (furnished == "Y")
            {
                furnishedLbl.Text = "Furnished";
                furnishedLbl.Visible = true;

            }

            if (petFriendly == "Y")
            {
                petFriendlyLbl.Text = "Pet Friendly";
                petFriendlyLbl.Visible = true;

            }

            if (carbonMonoxideDetector == "Y")
            {
                carbonMonoxideDetectorLbl.Text = "Carbon Monoxide Detector";
                carbonMonoxideDetectorLbl.Visible = true;

            }

            if (smokeDetector == "Y")
            {
                smokeDetectorLbl.Text = "Smoke Detector";
                smokeDetectorLbl.Visible = true;

            }

            if (separateEntrance == "Y")
            {
                seperateEntranceLbl.Text = "Seperate Entrance";
                seperateEntranceLbl.Visible = true;

            }

            if (wifi == "Y")
            {
                wifiLbl.Text = "Wifi";
                wifiLbl.Visible = true;

            }

            if (tv == "Y")
            {
                tvLbl.Text = "TV";
                tvLbl.Visible = true;

            }

            if (seperateBathroom == "Y")
            {
                seperateBathroomLbl.Text = "Seperate Bathroom";
                seperateBathroomLbl.Visible = true;

            }

            startDateLbl.Text = startDate.ToString();
            endDateLbl.Text = endDate.ToString();
            availableBathroomsLbl.Text = availableBathrooms.ToString();
            descriptionsLbl.Text = descriptions.ToString();
            numStarsLbl.Text = numStars.ToString();
            lastUpdatedLbl.Text = lastUpdated.ToString();


            counter++;


            connection.Close();
            tempImages.Clear();
        }
    }


    protected void SavetoFav_OnClick(object sender, EventArgs a)
    {
        string userSignInEmail = (string)Session["SignInEmail"];
        int userId = pullUserID(userSignInEmail);
        int propertyId = (int)Session["ResultPropertyID"];
        addPropertytoUserFav(userId, propertyId);
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

    protected void message_OnClick(object sender, EventArgs ex)
    {
        Response.Redirect("Message.aspx");
    }

    
    //JS code
    //let params = new URLSearchParameters({
    //PropertyID: 1000
    //};
    //let url = "/ManageSearchProperties.aspx?" + params.toString();
    //window.location = url;



}