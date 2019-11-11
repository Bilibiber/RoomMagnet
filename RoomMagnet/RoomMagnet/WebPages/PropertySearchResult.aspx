<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="PropertySearchResult.aspx.cs" Inherits="WebPages_PropertySearchResult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" Runat="Server">
    
         <asp:SqlDataSource
          id="SqlDataSource1"
          runat="server"
          DataSourceMode="DataReader"
          ConnectionString="<%$ ConnectionStrings:MyConnectionString%>"
          SelectCommand="SELECT Title FROM Property WHERE PropertyID = 1000;">
      </asp:SqlDataSource>
    <p>
        <asp:Image ID="Image3" runat="server" />
&nbsp;<asp:Image ID="Image4" runat="server" />
        <asp:Image ID="Image5" runat="server" />
    </p>
    <p>
        Amenities</p>
    <p>
        Available:
    </p>
    <p>
        Reviews:
    </p>
    <p>
        &nbsp;
    </p>
</asp:Content>

