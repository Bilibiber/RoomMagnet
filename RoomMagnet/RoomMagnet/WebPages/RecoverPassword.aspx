<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="RecoverPassword.aspx.cs" Inherits="WebPages_RecoverPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="Server">
    <div id="Part1" class="container" runat="server">
        <asp:Label ID="RecoverPasswordLbl" runat="server" Text="Enter your email address and we will send you a link to reset your password."></asp:Label>
        <asp:TextBox ID="RecoverPasswordEnteredEmail" runat="server" placeholder="Email" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Email Required" ControlToValidate="RecoverPasswordEnteredEmail" ValidationGroup="Recover" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:CustomValidator ID="RecoverPasswordEnteredEmailCustomValidator" runat="server" ErrorMessage="Email address not exist" ControlToValidate="RecoverPasswordEnteredEmail" ValidationGroup="Recover" OnServerValidate="RecoverPasswordEnteredEmailCustomValidator_ServerValidate"></asp:CustomValidator>
        <asp:Button ID="RecoverPasswordSubmitEmailButton" runat="server" Text="Send" OnClick="RecoverPasswordSubmitEmailButton_Click" ValidationGroup="Recover" />
    </div>
    <div id="Part2" runat="server" visible="false">
        <asp:Label ID="RecoverPasswordverification" runat="server" Text="Enter your verification code"></asp:Label>
        <asp:TextBox ID="RecoverPasswordverifiTxt" runat="server" MaxLength="5"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="RecoverPasswordverifiTxt" Display="Dynamic" ValidationGroup="Code"></asp:RequiredFieldValidator>
        <asp:Button ID="RecoverPasswordverifiButton" runat="server" Text="Verify" OnClick="RecoverPasswordverifiButton_Click" ValidationGroup="Code" />
        <asp:Label ID="ErrorLbl" runat="server" Text="" ForeColor="IndianRed"></asp:Label>
    </div>
    <div id="Part3" runat="server" visible="false">
        <asp:TextBox type="password" ID="NewPassword" runat="server"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidatorPasswordLowerCase" runat="server" ErrorMessage="Password must be at least 8 characters long and contains at least one: Lower Case, Upper Case, Special Character" ValidationExpression="^((?=.*[a-z])(?=.*[A-Z])(?=.*\d)|(?=.*[a-z])(?=.*[A-Z])(?=.*[^A-Za-z0-9])|(?=.*[a-z])(?=.*\d)(?=.*[^A-Za-z0-9])|(?=.*[A-Z])(?=.*\d)(?=.*[^A-Za-z0-9]))([A-Za-z\d@#$%^&£*\-_+=[\]{}|\\:',?/`~();!]|\.(?!@)){8,16}$" ControlToValidate="NewPassword" Display="Dynamic" ValidationGroup="newpass"></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Password Required" Display="Dynamic" ForeColor="IndianRed" ControlToValidate="NewPassword" ValidationGroup="newpass"></asp:RequiredFieldValidator>
        <asp:TextBox type="password" ID="ComfirmPassword" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please Comfirm Your Password" ControlToValidate="ComfirmPassword" Display="Dynamic" ForeColor="IndianRed" ValidationGroup="newpass"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password Does Not Match" ControlToCompare="NewPassword" ControlToValidate="ComfirmPassword" Display="Dynamic" ForeColor="IndianRed" ValidationGroup="newpass"></asp:CompareValidator>
        <asp:Button ID="ChangePasswordButton" runat="server" Text="Change My Password" ValidationGroup="newpass" OnClick="ChangePasswordButton_Click" />
        <asp:Label ID="ErrorLb2" runat="server" Text="" ForeColor="IndianRed"></asp:Label>
    </div>
</asp:Content>