<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="RateProperty.aspx.cs" Inherits="WebPages_Rate_Property" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" Runat="Server">
    <p>
        Property Rating</p>
    <p>
        Please rate the property on the following attributes:</p>
    <p>
        Communication:
    </p>
    <p>
        Cleanliness</p>
    <p>
        Value</p>
    <p>
        Accuracy</p>
    <p>
        Amenities</p>
    <p>
        Written Comments: (1000 character limit)</p>
    <p>
        <asp:TextBox ID="TextBox1" runat="server" Height="90px" Width="358px"></asp:TextBox>
    </p>
</asp:Content>

