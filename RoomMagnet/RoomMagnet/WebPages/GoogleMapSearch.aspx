<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="GoogleMapSearch.aspx.cs" Inherits="WebPages_GoogleMapSearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Property Search
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <script src="https://maps.googleapis.com/maps/api/js?libraries=places&sensor=true&key=AIzaSyBJDXayDhTHkNU54jkDy3PWl0uqHarxeIo"></script>
    <script src="../Map.js"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="Server">
    <div>  
            <h1>Enter Your Location Details</h1>  
        </div>  
        <div>  
            <asp:TextBox ID="txt_location" runat="server"></asp:TextBox>  
    </div>  
        <div>  
            <asp:Button ID="search" runat="server" Text="Search" OnClientClick=""/>
        </div>  
    <div id="map_populate" style="width:100%; height:500px; border: 5px solid #5E5454;">  
    </div>  
</asp:Content>

