<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="GoogleMapSearch.aspx.cs" Inherits="WebPages_GoogleMapSearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Property Search
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="Server">
    <div>
        <h1>Enter Your Location Details</h1>
    </div>
    <div>
        <asp:TextBox ID="address" runat="server" CssClass="form-control-sm" type="textbox" ClientIDMode="Static"></asp:TextBox>
    </div>
    <div>
        <asp:Button ID="search" runat="server" Text="Search" ClientIDMode="Static" UseSubmitBehavior="false" OnClientClick="return true"/>
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
            });
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
            });
        }
        google.maps.event.addListener(window, 'load',  initMap);
    </script>
          <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDu9-V7rNAJ0LWxj2senGo9wVHwgLXQr-0&callback=initMap&language=en">
    </script>
</asp:Content>
