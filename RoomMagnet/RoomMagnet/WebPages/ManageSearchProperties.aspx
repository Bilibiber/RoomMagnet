<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="ManageSearchProperties.aspx.cs" Inherits="WebPages_ManageSearchProperties" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Property Search Results
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="Body">

    <style>
        .item-container {
            display: flex;
            flex-direction: column;
        }

        .item-section {
            flex: 1;
            display: flex;
            flex-direction: row;
            align-items: center;
            justify-content: flex-start;
            margin: 10px;
        }
    </style>



    <div class="container">
        <asp:Image ID="propertyImage1" runat="server" Height="371px" Width="381px" />
        <asp:Image ID="propertyImage2" runat="server" Height="373px" Width="250px" />
        <asp:Image ID="propertyImage3" runat="server" Width="325px" />
        <asp:Image ID="propertyImage4" runat="server" Height="369px" Width="321px" />
    </div>


    <div class="item-container">
        <div class="item-section">
            <asp:Label runat="server" Text="Rent Price: "></asp:Label>
            <asp:Label ID="rentPriceLbl" runat="server"></asp:Label>
        </div>

        <div class="item-section">
            <asp:Label runat="server" Text="Start Date: "></asp:Label>
            <asp:Label ID="startDateLbl" runat="server"></asp:Label>
        </div>

        <div class="item-section">
            <asp:Label runat="server" Text="End Date: "></asp:Label>
            <asp:Label ID="endDateLbl" runat="server"></asp:Label>
        </div>

        <div class="item-section">
            <asp:Label runat="server" Text="Available Bathrooms: "></asp:Label>
            <asp:Label ID="availableBathroomsLbl" runat="server"></asp:Label>
        </div>

        <div class="item-section">
            <asp:Label runat="server" Text="Descriptions: "></asp:Label>
            <asp:Label ID="descriptionsLbl" runat="server"></asp:Label>
        </div>

        <div class="item-section">
            <asp:Label runat="server" Text="Number of Stars: "></asp:Label>
            <asp:Label ID="numStarsLbl" runat="server"></asp:Label>
        </div>

        <div class="item-section">
            <asp:Label runat="server" Text="Last Updated: "></asp:Label>
            <asp:Label ID="lastUpdatedLbl" runat="server"></asp:Label>
        </div>
    </div>
    
       <div class="item-container">
            <div id="amenitiesLbl" runat="server" text="Amenities: " visible="false">
            <br />
            <h3>Ameneties: </h3>
            <asp:Label ID="airConditioningLbl" runat="server" Text="Air Conditioning " Visible="false"></asp:Label>
            <asp:Label ID="heatingLbl" runat="server" Text="Heating " Visible="false"></asp:Label>
            <asp:Label ID="onSiteLaundryLbl" runat="server" Text="On Site Laundry " Visible="false"></asp:Label>
            <asp:Label ID="parkingLbl" runat="server" Text="Parking " Visible="false"></asp:Label>
            <asp:Label ID="furnishedLbl" runat="server" Text="Furnished " Visible=" false"></asp:Label>
            <asp:Label ID="petFriendlyLbl" runat="server" Text="Pet Friendly " Visible="false"></asp:Label>
            <asp:Label ID="carbonMonoxideDetectorLbl" runat="server" Text="Carbon Monoxide Detector " Visible="false"></asp:Label>
            <asp:Label ID="smokeDetectorLbl" runat="server" Text="Smoke Detector " Visible="false"></asp:Label>
            <asp:Label ID="separateEntranceLbl" runat="server" Text="Seperate Entrance " Visible="false"></asp:Label>
            <asp:Label ID="wifiLbl" runat="server" Text="WiFi " Visible="false"></asp:Label>
            <asp:Label ID="tvLbl" runat="server" Text="TV " Visible="false"></asp:Label>
            <asp:Label ID="seperateBathroomLbl" runat="server" Text="Seperate Bathroom " Visible="false"></asp:Label>
        </div>
           <br />

       </div>


    <asp:Button ID="bookNowBtn" Text="Book Now " runat="server" />
    <asp:Button ID="saveToFavoritesBtn" Text="Save to Favorites" runat="server" OnClick="SavetoFav_OnClick" />


</asp:Content>


