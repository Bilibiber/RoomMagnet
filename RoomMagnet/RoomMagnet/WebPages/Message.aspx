<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="Message.aspx.cs" Inherits="WebPages_Message" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
        <script src="../lib/js/signalr/dist/browser/signalr.js"></script>
    <script src="../lib/js/signalr/dist/browser/Chat.js"></script>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" Runat="Server">
 <div>
            <asp:TextBox ID="txtServerInfo" runat="server" Height="206px" TextMode="MultiLine" Width="700px"></asp:TextBox>
            <hr />
            <asp:TextBox ID="txtClientInfo" runat="server" Height="197px" TextMode="MultiLine" Width="376px"></asp:TextBox>
            <asp:TextBox ID="txtContent" runat="server" Height="119px" TextMode="MultiLine"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Height="52px" OnClick="Button1_Click" Text="发送" Width="138px" />
        </div>
    </asp:Content>
