<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="Server">
    <asp:Button ID="HomePageLogin" runat="server" Text="Login" data-target="#SignIn" data-toggle="modal" OnClientClick="return false"  data-dismiss="modal"/>
    <asp:Button ID="HomePageGetStarted" runat="server" Text="Get Started" CssClass="btn btn-primary" data-target="#SignUp" data-toggle="modal"  OnClientClick="return false" />
        <div class="modal" id="SignUp" tabindex="-1">
            <div class=" modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <asp:Label ID="SignInLabel" runat="server" Text="Create an Account" ForeColor="IndianRed" CssClass="text-center"></asp:Label>
                        <div class="form-group">
                            <asp:Button ID="FacebookLogin" runat="server" Text="Continue with Facebook" />
                            <asp:Button ID="GmailLogin" runat="server" Text="Continue with Gmail"  OnClick="GmailSignIn_Click"/>
                        </div>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <asp:TextBox ID="HomePageFirstName" runat="server" PlaceHolder="First Name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorFirstName" runat="server" ErrorMessage="(Required)" ControlToValidate="HomePageFirstName" Display="Dynamic" ValidationGroup="SignUp"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="HomePageLastName" runat="server" PlaceHolder="Last Name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorLastName" runat="server" ErrorMessage="(Required)" ControlToValidate="HomePageLastName" Display="Dynamic" ValidationGroup="SignUp"></asp:RequiredFieldValidator>
                        </div>
                        <asp:TextBox ID="HomePageEmail" runat="server" PlaceHolder="Email Address"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ErrorMessage="(Required)" ControlToValidate="HomePageEmail" Display="Dynamic" ValidationGroup="SignUp"></asp:RequiredFieldValidator>
                        <asp:TextBox type="Password" ID="HomePagePassword" runat="server" PlaceHolder="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" ErrorMessage="(Required)" ControlToValidate="HomePagePassword"  ValidationGroup="SignUp"></asp:RequiredFieldValidator>
                        <asp:TextBox  type="Password" ID="HomePageComfirmPassword" runat="server" PlaceHolder="Comfirm Password"></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password Not Match" ControlToCompare="HomePagePassword" ControlToValidate="HomePageComfirmPassword" ValidationGroup="SignUp"></asp:CompareValidator>
                        <%--Date of brith--%>
                        <asp:TextBox ID="BirthdayText" runat="server" PlaceHolder="Date of Brith" TextMode="Date"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorBirthday" runat="server" ErrorMessage="Required" ControlToValidate="BirthdayText" ValidationGroup="SignUp"></asp:RequiredFieldValidator>
                        <div class="modal-footer">
                            <asp:Button ID="HomePageSignUp" runat="server" Text="Sign Up" ValidationGroup="SignUp" OnClick="HomePageSignUp_Click" />
                            
                            <asp:Button ID="HomePageClose" runat="server" Text="Close"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal" id="SignIn" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header text-center">
                        <asp:Label ID="SignInLbl" runat="server" Text="Sign In"></asp:Label>
                    </div>
                    <div class="modal-body">
                        <asp:TextBox ID="SignInEmail" PlaceHolder="Email" runat="server" CssClass="form-control-plaintext"></asp:TextBox>
                        <asp:TextBox ID="SignInPassword" PlaceHolder="Password" runat="server" CssClass="form-control-plaintext"></asp:TextBox>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="SignInLogIn" runat="server" Text="Sign In"  CssClass="btn btn-primary"/>
                        <asp:Button ID="SignInClose" runat="server" Text="Close" CssClass="btn" />
                    </div>
                </div>
            </div>
        </div>
</asp:Content>