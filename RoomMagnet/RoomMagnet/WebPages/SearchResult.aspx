<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="SearchResult.aspx.cs" Inherits="WebPages_SearchResult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" Runat="Server">
    <h1>Search Result<asp:Label ID="SearchResultCount" runat="server" Text=""></asp:Label>
    </h1>
    <asp:TextBox ID="SearchResultText" runat="server" PlaceHolder="Enter a City or Zipcode"></asp:TextBox>
    <asp:Button ID="SearchResultButton" runat="server" Text="Search" OnClick="SearchResultButton_Click"/>
    
    <div class="container">
        <u>Filters</u>
        <div class="row">
         Price
        </div>
        
        <div class="row">
            Min. Price
            <asp:TextBox ID="SearchResultMinPrice" runat="server"></asp:TextBox>
            <asp:CompareValidator ID="SearchResultsMinPriceValidator" ControlToValidate="SearchResultMinPrice" Operator="DataTypeCheck" Type="Currency" runat="server" Text="(Invalid Price)"></asp:CompareValidator>
            Max Price
            <asp:TextBox ID="SearchResultMaxPrice" runat="server"></asp:TextBox>
            <asp:CompareValidator ID="SearchResultsMaxPriceValidator" ControlToValidate="SearchResultMaxPrice" runat="server" Operator="DataTypeCheck" Type="Currency" Text="(Invalid Price)"></asp:CompareValidator>
            <asp:Label ID="SearchLabel" runat="server" Text=""></asp:Label>
            <asp:Image ID="Image2" runat="server" ImageUrl="https://property-created.s3.us-west-2.amazonaws.com/Property%20Pictures/testProperty.jpg?X-Amz-Expires=3592&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAXZN4IZI4EEHR4OUZ/20191103/us-west-2/s3/aws4_request&X-Amz-Date=20191103T213457Z&X-Amz-SignedHeaders=host&X-Amz-Signature=7c1b0de04f9f3cd5f8062a22fc4b910e306f72d5fdc67b0b9bd7265836b2b28a" />
            </div>
        <div class="row">
            Start Date
            <asp:TextBox ID="SearchResultStartDate" runat="server"></asp:TextBox>
            End Date
            <asp:TextBox ID="SearchResultEndDate" runat="server" OnTextChanged="SearchResultEndDate_TextChanged"></asp:TextBox>
        </div>

        <div class="row">
            Beds Available
            <asp:DropDownList ID="SearchResultBedsAvailable" runat="server" >
                <asp:ListItem Value="1">1</asp:ListItem>
                <asp:ListItem Value="2">2</asp:ListItem>
                <asp:ListItem Value="3">3</asp:ListItem>
                <asp:ListItem Value="4">4+</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="row">
            Home Type
        <asp:DropDownList ID="SearchResultHomeType" runat="server">
                <asp:ListItem>Apartment</asp:ListItem>
                <asp:ListItem>Townhome</asp:ListItem>
                <asp:ListItem>House</asp:ListItem>
            </asp:DropDownList>
        </div>
            
       </div>
</asp:Content>

