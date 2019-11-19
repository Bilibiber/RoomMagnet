<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="Stripe.aspx.cs" Inherits="WebPages_Stripe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" Runat="Server">
    
      <script
    src="https://checkout.stripe.com/checkout.js" class="stripe-button"
    data-key="pk_test_8atXfTcBVA0b0Y50HniGdHw0000kgvHhmz"
    data-amount="50000.00"
    data-name="RoomMagnet"
    data-description="Rent"
    data-image="https://stripe.com/img/documentation/checkout/marketplace.png"
    data-locale="auto"
    data-zip-code="true"
    data-currency="usd">
  </script>
</asp:Content>

