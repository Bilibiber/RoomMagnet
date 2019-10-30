<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="Renter.aspx.cs" Inherits="WebPages_Renter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" Runat="Server">
    <div class="modal-body row" >
  <div class="col-md-4" style="background-color:gray; text-align:center" >
    <!-- Your first column here -->

      <br />
      <br />
      <br />
      <br />
      <br />
      <br />
      <br />
      <br />
      <br />
      <br />
      <br />

      <asp:Label ID="renterSavedSearch" runat="server" Text="Saved Searches" Font-Size="XX-Large" ForeColor="White"></asp:Label>
      <br />
      <asp:Label ID="renterMessage" runat="server" Text="My Message" Font-Size="XX-Large" ForeColor="White"></asp:Label>
      <br />
      <asp:Label ID="renterConnections" runat="server" Text="Connections" Font-Size="XX-Large" ForeColor="White"></asp:Label>
      <br />
      <asp:Label ID="renterPreference" runat="server" Text="Preferences" Font-Size="XX-Large" ForeColor="White"></asp:Label>
      <br />
      <asp:Label ID="rentertohost" runat="server" Text="Become a Host" Font-Size="XX-Large" ForeColor="White"></asp:Label>
      <br />
      <asp:Label ID="renterSetting" runat="server" Text="Setting" Font-Size="XX-Large" ForeColor="White"></asp:Label>
      <br />
      <asp:Label ID="renterLogOut" runat="server" Text="Log Out" Font-Size="XX-Large" ForeColor="White"></asp:Label>
  </div>
  <div class="col-md-8">
    <!-- Your second column here -->
      <br />
      <hr />
      <asp:Label ID="hellow" runat="server" Text="Hello, world" ForeColor="#CC3300" Font-Size="1.5em" Font-Bold="True"></asp:Label>
      <br />
      <br />
      &nbsp;&nbsp;&nbsp;
      <asp:Label ID="renterabout" runat="server" Text="About" Font-Bold="True"></asp:Label>

      <br />
      <br />
      &nbsp;&nbsp;&nbsp;
      <asp:Label ID="renterAge" runat="server" Text="Age" Font-Bold="True"></asp:Label>

      <br />
      <br />
      &nbsp;&nbsp;&nbsp;
      <asp:Label ID="renterGender" runat="server" Text="Gender" Font-Bold="True"></asp:Label>

      <br />
      <br />
      &nbsp;&nbsp;&nbsp;
      <asp:Label ID="renterOccupation" runat="server" Text="Occupation" Font-Bold="True"></asp:Label>

      <br />
      <hr />
  </div>
</div>
    </asp:Content>

