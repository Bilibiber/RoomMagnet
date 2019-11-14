<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="ManageSearchProperties.aspx.cs" Inherits="WebPages_ManageSearchProperties" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Property Search Results
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="Body">
        
    <asp:Image ID="hostImage" runat="server" Height="372px" Width="321px" />
    <asp:Image ID="propertyImage5" runat="server" Height="371px" Width="381px" />
    <asp:Image ID="propertyImage6" runat="server" Height="373px" Width="250px" />
    <asp:Image ID="propertyImage3" runat="server" Width="325px" />
    <asp:Image ID="propertyImage4" runat="server" Height="369px" Width="321px" />

    <br <asp:Label ID="RentPrice" runat="server" Text="Rent Price: "></asp:Label> <asp:TextBox id="RentPriceTxtBx" runat="server"></asp:TextBox> 
    <br <asp:Label ID="availableBedroomsLbl" runat="server" Text="Air Conditioning "></asp:Label>  
    <br <asp:Label ID="startDateLbl" runat="server" Text="Start Date:  "></asp:Label>  
    <br <asp:Label ID="endDateLbl" runat="server" Text="End Date: "></asp:Label>  
    <br <asp:Label ID="availableBathroomsLbl" runat="server" Text="Available Bathrooms: "></asp:Label>  
    <br <asp:Label ID="descriptionsLbl" runat="server" Text="Description: "></asp:Label>  
    <br <asp:Label ID="numStarsLbl" runat="server" Text="Number of Stars: "></asp:Label>  
    <br <asp:Label ID="lastUpdatedLbl" runat="server" Text="Last Updated: "></asp:Label>  
    <br <asp:Label ID="ratingLbl" runat="server" Text="Ratings:  "></asp:Label>  


    <div id="amenitiesLbl" runat="server" Text="Amenities: " visible="false">
    <br <asp:Label ID="airConditioningLbl" runat="server" Text="Air Conditioning "></asp:Label>  
    <br <asp:Label ID="heatingLbl" runat="server" Text="Heating "></asp:Label>  
    <br <asp:Label ID="onSiteLaundryLbl" runat="server" Text="On Site Laundry "></asp:Label>  
    <br <asp:Label ID="parkingLbl" runat="server" Text="Parking "></asp:Label>  
    <br <asp:Label ID="furnishedLbl" runat="server" Text="Furnished "></asp:Label>  
    <br <asp:Label ID="petFriendlyLbl" runat="server" Text="Pet Friendly "></asp:Label>  
    <br <asp:Label ID="carbonMonoxideDetectorLbl" runat="server" Text="Carbon Monoxide Detector "></asp:Label>  
    <br <asp:Label ID="smokeDetectorLbl" runat="server" Text="Smoke Detector "></asp:Label>  
    <br <asp:Label ID="separateEntranceLbl" runat="server" Text="Seperate Entrance "></asp:Label>  
    <br <asp:Label ID="wifiLbl" runat="server" Text="WiFi "></asp:Label>  
    <br <asp:Label ID="tvLbl" runat="server" Text="TV "></asp:Label>  
    <br <asp:Label ID="seperateBathroomLbl" runat="server" Text="Seperate Bathroom "></asp:Label>    
    </div>
       
    <asp:Button ID="bookNowBtn" Text="Book Now " runat="server" />
    <asp:Button ID="saveToFavoritesBtn" Text="Save to Favorites" runat="server" OnClick="SavetoFav_OnClick"/>


</asp:Content>


