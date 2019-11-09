<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="SearchResult.aspx.cs" Inherits="WebPages_SearchResult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <style>
        body {
            width:85%;
            margin:auto;
        }
    </style>
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" Runat="Server">
       <div>
         <h1>Search Result<asp:Label ID="SearchResultCount" runat="server" Text=""></asp:Label> 
    </h1>
    </div>
    <div>
        <asp:TextBox ID="address" runat="server" CssClass="form-control-sm" type="textbox" ClientIDMode="Static"></asp:TextBox>
    </div>
    <div>
        <asp:Button ID="searches" runat="server" Text="Searches" ClientIDMode="Static" OnClick="SearchResultButton_Click"   Visible="true" />
        <asp:Button ID="search" runat="server" Text="Search"  Visible="true" UseSubmitBehavior="false"  />
    </div>
    <div id="map" style="width: 100%; height: 500px; border: 5px solid #5E5454;">
    </div>

    <script>
        function initMap() {
            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 8,
                center: { lat: -34.397, lng: 150.644 }
            });
            var geocoder = new google.maps.Geocoder();
            
            document.getElementById('search').addEventListener('click', function () {
                geocodeAddress(geocoder, map);
            })
            
                
        }
        

        function geocodeAddress(geocoder, resultsMap) {
            var address = document.getElementById('address').value;
            geocoder.geocode({ 'address': address }, function (results, status) {
                if (status === 'OK') {
                    resultsMap.setCenter(results[0].geometry.location);
                    var marker = new google.maps.Marker({
                        map: resultsMap,
                        position: results[0].geometry.location
                    });
                } else {
                    alert('Geocode was not successful for the following reason: ' + status);
                }
            })
                
        }
        document.getElementById('<%= searches.ClientID %>').click();
        google.maps.event.addListener(window, 'load',  initMap);
    </script>
          <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDu9-V7rNAJ0LWxj2senGo9wVHwgLXQr-0&callback=initMap&language=en">
    </script>


   
   
    
    
    <div>
         <u>Filters</u>
      </div>
        <div >
            Price
        </div>
        
       
            Min. Price
            <asp:TextBox ID="SearchResultMinPrice" runat="server"></asp:TextBox>
            <asp:CompareValidator ID="SearchResultsMinPriceValidator" ControlToValidate="SearchResultMinPrice" Operator="DataTypeCheck" Type="Currency" runat="server" Text="(Invalid Price)" Display="Dynamic"></asp:CompareValidator>
            Max Price
            <asp:TextBox ID="SearchResultMaxPrice" runat="server"></asp:TextBox>
            <asp:CompareValidator ID="SearchResultsMaxPriceValidator" ControlToValidate="SearchResultMaxPrice" runat="server" Operator="DataTypeCheck" Type="Currency" Text="(Invalid Price)"></asp:CompareValidator>
            <asp:Label ID="SearchLabel" runat="server" Text=""></asp:Label>
            <div>
                Start Date
            <asp:TextBox ID="SearchResultStartDate" runat="server"></asp:TextBox>
            End Date
            <asp:TextBox ID="SearchResultEndDate" runat="server" ></asp:TextBox>
            <br />
            Beds Available

            <asp:DropDownList ID="SearchResultBedsAvailable" runat="server">

                <asp:ListItem Value="1">1</asp:ListItem>
                <asp:ListItem Value="2">2</asp:ListItem>
                <asp:ListItem Value="3">3</asp:ListItem>
                <asp:ListItem Value="4">4+</asp:ListItem>
            </asp:DropDownList>
     
        
            
        <asp:DropDownList ID="SearchResultHomeType" Visible="false" runat="server">
                <asp:ListItem>Apartment</asp:ListItem>
                <asp:ListItem>Townhome</asp:ListItem>
                <asp:ListItem>House</asp:ListItem>
            </asp:DropDownList>





           
                <div class="container">
                   <br />
                    <asp:Image ID="Image2" Visible="true" runat="server"  style="width:200px;" />
                <div class="media-body">
                    <h3 class="mt-0"> <asp:Label ID="Label1" Visible="false" runat="server" Text="Label"></asp:Label> </h3>
                    <asp:Label ID="Label2" runat="server" Visible="false" CssClass="small" Text="Label"></asp:Label>
                    <hr />
                     <h5 class="mt-0"> <asp:Label ID="Label3" Visible="false" CssClass="la-font" runat="server" Text="Amenities"></asp:Label> </h5>
                       <asp:Label ID="Label4" runat="server" Visible="false" CssClass="small" Text="Label"></asp:Label>
                    
                </div>
                    <asp:Image ID="Image3" runat="server" Visible="false"  style="width:200px;" />
                <div class="media-body">
                    <h3 class="mt-0"> <asp:Label ID="Label5" Visible="false" runat="server" Text="Label"></asp:Label> </h3>
                    <asp:Label ID="Label6" runat="server" Visible="false" CssClass="small" Text="Label"></asp:Label>
                    <hr />
                     <h5 class="mt-0"> <asp:Label ID="Label7" Visible="false" CssClass="la-font" runat="server" Text="Amenities"></asp:Label> </h5>
                       <asp:Label ID="Label8" runat="server" Visible="false" CssClass="small" Text="Label"></asp:Label>
                    
                </div>
                    <asp:Image ID="Image4" runat="server" Visible="false"  style="width:200px;" />
                <div class="media-body">
                    <h3 class="mt-0"> <asp:Label ID="Label9" Visible="false" runat="server" Text="Label"></asp:Label> </h3>
                    <asp:Label ID="Label10" runat="server" Visible="false" CssClass="small" Text="Label"></asp:Label>
                    <hr />
                     <h5 class="mt-0"> <asp:Label ID="Label11" Visible="false" CssClass="la-font" runat="server" Text="Amenities"></asp:Label> </h5>
                       <asp:Label ID="Label12" runat="server" Visible="false" CssClass="small" Text="Label"></asp:Label>
                    
                </div>
                    <asp:Image ID="Image5" runat="server" Visible="false"  style="width:200px;" />
                <div class="media-body">
                    <h3 class="mt-0"> <asp:Label ID="Label13" Visible="false" runat="server" Text="Label"></asp:Label> </h3>
                    <asp:Label ID="Label14" runat="server" Visible="false" CssClass="small" Text="Label"></asp:Label>
                    <hr />
                     <h5 class="mt-0"> <asp:Label ID="Label15" Visible="false" CssClass="la-font" runat="server" Text="Amenities"></asp:Label> </h5>
                       <asp:Label ID="Label16" runat="server" Visible="false" CssClass="small" Text="Label"></asp:Label>
                </div>
                
            
                </div>

        
            
       </div>
        
</asp:Content>

