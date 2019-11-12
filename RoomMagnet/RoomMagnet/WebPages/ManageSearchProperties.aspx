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

    <br <asp:Label ID="RentPrice" runat="server" Text="Rent Price: "></asp:Label>    <asp:TextBox ID="RentPriceTxtBx" runat="server" /> 
    <br <asp:Label ID="Label1" runat="server" Text="Amenities: "></asp:Label>    <asp:TextBox ID="TextBox1" runat="server" /> 
    <br <asp:Label ID="Label3" runat="server" Text="Description: "></asp:Label>    <asp:TextBox ID="TextBox3" runat="server" />
    <br <asp:Label ID="Label4" runat="server" Text="Start Date: "></asp:Label>    <asp:TextBox ID="TextBox4" runat="server" /> 
    <br <asp:Label ID="Label5" runat="server" Text="End Date: "></asp:Label>    <asp:TextBox ID="TextBox5" runat="server" /> 
    <asp:Button ID="Button1" Text="Reserve Property " runat="server" 
        
        />


    


    



</asp:Content>


