<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="Renter.aspx.cs" Inherits="WebPages_Renter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 117px;
        }
        .auto-style2 {
            width: 898px;
        }
        .auto-style3 {
            width: 758px;
        }
    </style>
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
      <asp:Label ID="hellow" runat="server" Text="Hello, world" ForeColor="#CC3300" Font-Size="2em" Font-Bold="True"></asp:Label>
      <br />
      <br />
      <table>
          <tr>
              <td>
                  &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="renterabout" runat="server" Text="About" Font-Bold="True"></asp:Label> 
              </td>
              <td class="auto-style1">

              </td>
              <td class="auto-style2">
                  My husband and I are looking for someone to fill the extra room in our house and would love the extra company!
              </td>
              <td class="auto-style3">
                  
              </td>
          </tr>
          <tr>
              <td>
                  &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="renterAge" runat="server" Text="Age" Font-Bold="True"></asp:Label>              </td>
              <td class="auto-style1">

              </td>
              <td class="auto-style2">
                  <p>
                      72
                  </p>
              </td>
              <td class="auto-style3">
                  
              </td>
          </tr>
                    <tr>
              <td>
                     
                  &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="renterGender" runat="server" Text="Gender" Font-Bold="True"></asp:Label>              </td>
              <td class="auto-style1">

              </td>
              <td class="auto-style2">
                  <p>
                      Female
                  </p>
              </td>
                        <td class="auto-style3">
                  
              </td>
          </tr>
                    <tr>
              <td>
                  
                &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="renterOccupation" runat="server" Text="Occupation" Font-Bold="True"></asp:Label>              </td>
              <td class="auto-style1">

              </td>
              <td class="auto-style2">
                  <p>
                      Married
                  </p>
              </td>
                        <td class="auto-style3">
                  
              </td>
          </tr>

      </table>

      <hr />
      <div id="saveSearch">
      <asp:Label ID="save" runat="server" Text="Saved Searches" ForeColor="#CC3300" Font-Size="2em" Font-Bold="True"></asp:Label>
      </div>
  </div>
</div>
    </asp:Content>

