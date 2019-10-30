<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="SearchResult.aspx.cs" Inherits="WebPages_SearchResult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" Runat="Server">
    <h1>Search Result<asp:Label ID="SearchResultCount" runat="server" Text=""></asp:Label>
    </h1>
    <asp:TextBox ID="SearchResultText" runat="server" PlaceHolder="Enter a City or Zipcode"></asp:TextBox>
    <asp:Button ID="SearchResultButton" runat="server" Text="Search" OnClick="SearchResultButton_Click" />
    
    <div class="container">
        <u>Filters</u>
        <div class="row">
         Price
        </div>
        
        <div class="row">
            Min. Price
            <asp:TextBox ID="SearchResultMinPrice" runat="server"></asp:TextBox>
            <asp:CompareValidator ID="SearchResultsMinPriceValidator" ControlToValidate="SearchResultsMinPrice" Operator="DataTypeCheck" Type="Currency" runat="server" Text="(Invalid Price)"></asp:CompareValidator>
            Max Price
            <asp:TextBox ID="SearchResultMaxPrice" runat="server"></asp:TextBox>
            <asp:CompareValidator ID="SearchResultsMaxPriceValidator" ControlToValidate="SearchResultsMaxPrice" runat="server" Operator="DataTypeCheck" Type="Currency" Text="(Invalid Price)"></asp:CompareValidator>
            </div>
       </div>
</asp:Content>

