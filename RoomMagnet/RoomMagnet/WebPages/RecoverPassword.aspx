<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="RecoverPassword.aspx.cs" Inherits="WebPages_RecoverPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" Runat="Server">
    <div class="container">
        <asp:Label ID="RecoverPasswordLbl" runat="server" Text="Enter your email address and we will send you a link to reset your password."></asp:Label>
        <asp:TextBox ID="RecoverPasswordEnteredEmail" runat="server" placeholder="Email" CssClass="form-control"></asp:TextBox>
        <asp:CustomValidator ID="RecoverPasswordEnteredEmailCustomValidator" runat="server" ErrorMessage="Email address not exist" ControlToValidate="RecoverPasswordEnteredEmail" ValidationGroup="Recover" OnServerValidate="RecoverPasswordEnteredEmailCustomValidator_ServerValidate"></asp:CustomValidator>
        <asp:Button ID="RecoverPasswordSubmitEmailButton" runat="server" Text="Send" OnClick="RecoverPasswordSubmitEmailButton_Click" ValidationGroup="Recover" />
        <div>
            <asp:Label ID="RecoverPasswordverification" runat="server" Text="Enter your verification code" Visible="false"></asp:Label>
            <asp:TextBox ID="RecoverPasswordverifiTxt" runat="server" Visible="false" MaxLength="5"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="RecoverPasswordverifiTxt" Display="Dynamic" ValidationGroup="Code"></asp:RequiredFieldValidator>
            <asp:Button ID="RecoverPasswordverifiButton" runat="server" Text="Verify" Visible="false" OnClick="RecoverPasswordverifiButton_Click" ValidationGroup="Code"/>
            <asp:Label ID="ErrorLbl" runat="server" Text="Label" Visible="false"></asp:Label>
        </div>
    </div>

</asp:Content>

