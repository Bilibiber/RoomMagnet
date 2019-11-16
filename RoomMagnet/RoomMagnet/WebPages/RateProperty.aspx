<%@ Page Title="Rate Property" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="RateProperty.aspx.cs" Inherits="WebPages_RateProperty" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <link href="../Css/star-rating.css" rel="stylesheet" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="../Css/star-rating.js"></script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="Server">
    <div class="container">
            <input id="input-21b" value="4" type="text" class="rating" data-min="0" data-max="5" data-step="0.2" data-size="lg"
                required title="">
            <div class="form-group" style="margin-top: 10px">
                <asp:Button ID="RatingSubmit" runat="server" Text="Submit" CssClass="btn btn-primary"/>
            </div>
        <hr>

    </div>
</asp:Content>