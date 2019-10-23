<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="TellMeAboutYourself.aspx.cs" Inherits="WebPages_TellMeAboutYourself" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" Runat="Server">

    <asp:TextBox ID="BioFirstName" runat="server" PlaceHolder="First Name"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorFirstName" runat="server" ErrorMessage="(Required)" ControlToValidate="BioFirstName" Display="Dynamic" ValidationGroup="TellMeAboutYourself"></asp:RequiredFieldValidator>
    <asp:TextBox ID="BioLastName" runat="server" PlaceHolder="Last Name"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorLastName" runat="server" ErrorMessage="(Required)" ControlToValidate="BioLastName" Display="Dynamic" ValidationGroup="TellMeAboutYourself"></asp:RequiredFieldValidator>
    Birthday <asp:DropDownList ID="BioMonth" runat="server">
    </asp:DropDownList>
    <asp:DropDownList ID="BioDay" runat="server">
    </asp:DropDownList>
    <asp:DropDownList ID="BioYear" runat="server">
    </asp:DropDownList>

    <asp:RadioButtonList ID="BioGender" runat="server">
        <asp:ListItem>Male</asp:ListItem>
        <asp:ListItem>Female</asp:ListItem>
        <asp:ListItem>Other</asp:ListItem>
    </asp:RadioButtonList>
    <asp:TextBox ID="BioOther" runat="server"></asp:TextBox>

    <asp:TextBox ID="BioOccupation" runat="server" PlaceHolder="Occupation"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorOccupation" runat="server" ErrorMessage="(Required)" ControlToValidate="BioOccupation" Display="Dynamic" ValidationGroup="TellMeAboutYourself"></asp:RequiredFieldValidator>

    <textarea id="BioDescription" cols="60" name="S1" rows="10"></textarea>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorDescription" runat="server" ErrorMessage="(Required)" ControlToValidate="BioDescription" Display="Dynamic" ValidationGroup="TellMeAboutYourself"></asp:RequiredFieldValidator>

</asp:Content>

