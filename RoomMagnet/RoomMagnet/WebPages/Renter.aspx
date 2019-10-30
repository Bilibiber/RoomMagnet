<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="Renter.aspx.cs" Inherits="WebPages_Renter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
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

        .auto-style4 {
            width: 200px;
        }

        .auto-style5 {
            width: 150px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="Server">
    <div class="modal-body row">
        <div class="col-md-4" style="border-style: none; background-color: gray; text-align: center; background-repeat: repeat;">
            <!-- Your first column here -->


            <br />


            <img src="https://timedotcom.files.wordpress.com/2018/09/bill-gates-africa.jpg" style="width: 300px;" />
            <br />
            <br />
            <asp:button id="unverified" text="UNVERIFIED" runat="server" backcolor="#CC3300" borderstyle="None" font-size="XX-Large" forecolor="White" style="text-align: center; width: 200px;" onclick="unverified_Click"> </asp:button>
            <asp:textbox id="pending" runat="server" backcolor="#CC3300" borderstyle="None" font-size="XX-Large" forecolor="White" style="text-align: center; width: 200px;" enabled="False" visible="False">PENDING</asp:textbox>
            <asp:textbox id="verified" runat="server" backcolor="#CC3300" borderstyle="None" font-size="XX-Large" forecolor="White" style="text-align: center; width: 200px;" enabled="False" visible="False">VERIFIED</asp:textbox>

            <br />
            <br />
            <asp:button id="renterSavedSearch" runat="server" text="Saved Searches" font-size="XX-Large" forecolor="White" backcolor="Gray" borderstyle="None" onclick="renterSavedSearch_Click"></asp:button>
            <br />
            <asp:button id="renterMessage" runat="server" text="My Message" font-size="XX-Large" forecolor="White" backcolor="Gray" borderstyle="None" onclick="renterMessage_Click"></asp:button>
            <br />
            <asp:button id="renterConnections" runat="server" text="Connections" font-size="XX-Large" forecolor="White" backcolor="Gray" borderstyle="None" onclick="renterConnections_Click"></asp:button>
            <br />
            <asp:button id="renterPreference" runat="server" text="Preferences" font-size="XX-Large" forecolor="White" backcolor="Gray" borderstyle="None" onclick="renterPreference_Click"></asp:button>
            <br />
            <asp:button id="rentertohost" runat="server" text="Become a Host" font-size="XX-Large" forecolor="White" backcolor="Gray" borderstyle="None" onclick="rentertohost_Click"></asp:button>
            <br />
            <asp:button id="renterSetting" runat="server" text="Setting" font-size="XX-Large" forecolor="White" backcolor="Gray" borderstyle="None"></asp:button>
            <br />
            <asp:button id="renterLogOut" runat="server" text="Log Out" font-size="XX-Large" forecolor="White" backcolor="Gray" borderstyle="None"></asp:button>
        </div>
        <div class="col-md-8">
            <!-- Your second column here -->
            <br />
            <hr />
            <asp:panel runat="server" id="renterinfor">
            <asp:label id="hellow" runat="server" text="Hello, world" forecolor="#CC3300" font-size="3em" font-bold="True"></asp:label>
            <br />
            <asp:button runat="server" text="Edit my profile" id="rentereditprofile" forecolor="#666666" backcolor="White" borderstyle="None"></asp:button>
            <br />
            <br />
            <table>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;<asp:label id="renterabout" runat="server" text="About" font-bold="True"></asp:label>
                    </td>
                    <td class="auto-style1"></td>
                    <td class="auto-style2">My husband and I are looking for someone to fill the extra room in our house and would love the extra company!
                    </td>
                    <td class="auto-style3"></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;<asp:label id="renterAge" runat="server" text="Age" font-bold="True"></asp:label>
                    </td>
                    <td class="auto-style1"></td>
                    <td class="auto-style2">
                        <p>
                            72
                        </p>
                    </td>
                    <td class="auto-style3"></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;<asp:label id="renterGender" runat="server" text="Gender" font-bold="True"></asp:label>
                    </td>
                    <td class="auto-style1"></td>
                    <td class="auto-style2">
                        <p>
                            Female
                        </p>
                    </td>
                    <td class="auto-style3"></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;<asp:label id="renterOccupation" runat="server" text="Occupation" font-bold="True"></asp:label>
                    </td>
                    <td class="auto-style1"></td>
                    <td class="auto-style2">
                        <p>
                            Married
                        </p>
                    </td>
                    <td class="auto-style3"></td>
                </tr>

            </table>
            </asp:panel>

            <%--become a host panel--%>
            <asp:panel runat="server" id="renterbecomehost" visible="False">
            <div>
                <asp:label runat="server" text="Add property" forecolor="#CC3300" font-size="3em" font-bold="True"></asp:label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:button runat="server" text="Cancle" class="btn btn-secondary btn-sm" OnClick="Unnamed2_Click"></asp:button>
                <br />
                <table>
                    <tr>
                        <td class="auto-style4">
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label runat="server" Text="Title:" Font-Bold="True"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td class="auto-style4">
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label runat="server" Text="Street Address:" Font-Bold="True"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server"></asp:TextBox>
                        </td>
                        <td class="auto-style5">
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label runat="server" Text="City:" Font-Bold="True"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td class="auto-style4">
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label runat="server" Text="State:" Font-Bold="True"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList runat="server" Width="100px"></asp:DropDownList>
                        </td>
                        <td class="auto-style5">
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label runat="server" Text="Zip:" Font-Bold="True"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox runat="server"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td class="auto-style4">
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label runat="server" Text="Square Footage of House:" Font-Bold="True"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        </td>
                        <td class="auto-style5">
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label runat="server" Text="Permanent Residences:" Font-Bold="True"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server" Width="100px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </div>
            </asp:panel>

            <hr />

            <%-- saved id panel--%>
            <asp:panel runat="server" id="rentersearch">
                <div id="saveSearch">
                <asp:label id="save" runat="server" text="Saved Searches" forecolor="#CC3300" font-size="3em" font-bold="True"></asp:label>
                    <br />
                    <asp:Button ID="renterEditSearch" runat="server" backcolor="White" borderstyle="None" forecolor="#666666" text="Edit" />
            </div>
            </asp:panel>


            <%--message panel--%>
            <asp:panel runat="server" id="rentermymessage" visible="False">
                <div id="message">
                <asp:label id="mymessage" runat="server" text="My Message" forecolor="#CC3300" font-size="3em" font-bold="True"></asp:label>
                </div>
            </asp:panel>

            <%--connection panel--%>
            <asp:panel runat="server" id="renterconnection" visible="False">
                <div>
                <asp:label runat="server" text="Connection" forecolor="#CC3300" font-size="3em" font-bold="True"></asp:label>
            </div>
            </asp:panel>

            <%--preference panel--%>
            <asp:panel runat="server" id="renterpreferences" visible="False">
            <div>
                <asp:label runat="server" text="Preference" forecolor="#CC3300" font-size="3em" font-bold="True"></asp:label>
            </div>
            </asp:panel>

            <%--renter Amenities panel--%>
            <asp:panel runat="server" id="renteraddAmenities" visible="False">
            <div>
                <asp:label runat="server" text="Amenities" forecolor="#CC3300" font-size="3em" font-bold="True"></asp:label>
            </div>
            </asp:panel>

        </div>
    </div>
</asp:Content>

