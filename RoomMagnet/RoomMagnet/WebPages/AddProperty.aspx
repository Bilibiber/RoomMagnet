<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="AddProperty.aspx.cs" Inherits="WebPages_AddProperty" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">
    Add Property
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" Runat="Server">
    <div>

        <asp:Label ID="Label1" runat="server" Text="Title: "></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

    </div>
</asp:Content>

