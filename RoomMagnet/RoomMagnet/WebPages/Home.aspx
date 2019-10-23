<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" Runat="Server">
    <asp:Button ID="HomePageGetStarted" runat="server" Text="Get Started" OnClick="Button5_Click" />
    
    <asp:Panel ID="Panel1" runat="server">
        <div>
            Create an Account
            <asp:Button ID="FacebookLogin" runat="server" Text="Continue with Facebook" />
            
    <asp:Button ID="GmailLogin" runat="server" Text="Continue with Gmail" />
    <hr />
    OR

     <asp:TextBox ID="HomePageFirstName" runat="server" PlaceHolder="First Name"></asp:TextBox>
     <asp:RequiredFieldValidator ID="RequiredFieldValidatorFirstName" runat="server" ErrorMessage="(Required)" ControlToValidate="HomePageFirstName" Display="Dynamic" ValidationGroup="SignIn"></asp:RequiredFieldValidator>
     <asp:TextBox ID="HomePageLastName" runat="server" PlaceHolder="Last Name"></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidatorLastName" runat="server" ErrorMessage="(Required)" ControlToValidate="HomePageLastName" Display="Dynamic" ValidationGroup="SignIn"></asp:RequiredFieldValidator> 
    <asp:TextBox ID="HomePageEmail" runat="server" PlaceHolder="Enter Email Address"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ErrorMessage="(Required)" ControlToValidate="HomePageEmail" Display="Dynamic" ValidationGroup="SignIn"></asp:RequiredFieldValidator>
    <asp:TextBox ID="HomePagePassword" runat="server" PlaceHolder="Enter Password"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" ErrorMessage="(Required)" ControlToValidate="HomePagePassword" Display="Dynamic" ValidationGroup="SignIn"></asp:RequiredFieldValidator>
    <asp:Button ID="HomePageSignUp" runat="server" Text="Sign Up" OnClick="HomePageSignUp_Click" />
    <asp:Button ID="HomePageLogin" runat="server" Text="Login" />
        </div>     
    </asp:Panel>
        

    </asp:Content>

