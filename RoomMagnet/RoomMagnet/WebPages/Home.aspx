<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="Server">
    <asp:Button ID="HomePageGetStarted" runat="server" Text="Get Started" CssClass="btn btn-primary" data-target="#SignUp" data-toggle="modal" OnClick="HomePageGetStarted_Click" autopostback="false" OnClientClick="return false" />
        <div class="modal" id="SignUp" tabindex="-1">
            <div class=" modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <asp:Label ID="SignInLabel" runat="server" Text="Create an Account" ForeColor="IndianRed"></asp:Label>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <asp:Button ID="FacebookLogin" runat="server" Text="Continue with Facebook" />
                            <asp:Button ID="GmailLogin" runat="server" Text="Continue with Gmail" />
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="HomePageFirstName" runat="server" PlaceHolder="First Name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorFirstName" runat="server" ErrorMessage="(Required)" ControlToValidate="HomePageFirstName" Display="Dynamic" ValidationGroup="SignIn"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="HomePageLastName" runat="server" PlaceHolder="Last Name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorLastName" runat="server" ErrorMessage="(Required)" ControlToValidate="HomePageLastName" Display="Dynamic" ValidationGroup="SignIn"></asp:RequiredFieldValidator>
                        </div>
                        <asp:TextBox ID="HomePageEmail" runat="server" PlaceHolder="Email Address"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ErrorMessage="(Required)" ControlToValidate="HomePageEmail" Display="Dynamic" ValidationGroup="SignIn"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="HomePagePassword" runat="server" PlaceHolder="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" ErrorMessage="(Required)" ControlToValidate="HomePagePassword"  ValidationGroup="SignIn"></asp:RequiredFieldValidator>
                        <div class="modal-footer">
                            <asp:Button ID="HomePageSignUp" runat="server" Text="Sign Up" />
                            <asp:Button ID="HomePageLogin" runat="server" Text="Login"  ValidationGroup="SignIn"/>
                            <asp:Button ID="HomePageCancle" runat="server" Text="Close"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>