<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="Host.aspx.cs" Inherits="WebPages_Host" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="Server">
    <div class="container">
        <div class="row profile">
            <div class="col-md-3">
                <div class="profile-sidebar">
                    <!-- SIDEBAR USERPIC -->
                    <div class="profile-userpic text-center">
                        <asp:Image ID="imgpreview" runat="server" Height="200" Width="200" ImageUrl="http://cliquecities.com/assets/no-image-e3699ae23f866f6cbdf8ba2443ee5c4e.jpg" Style="border-width: 0px; border-radius: 50%;" />
                        <br />
                        <asp:Label ID="userstatus" runat="server" BackColor="#CC3300" BorderStyle="None" Font-Size="X-Large" ForeColor="White" Style="text-align: center; width: 150px;"></asp:Label>
                    </div>
                    <!-- END SIDEBAR USERPIC -->

                    <!-- SIDEBAR MENU -->
                    <div class="profile-usermenu dashboard-size nav flex-column">
                        <div class="text-center name-about">

                            <asp:Label ID="hellow" runat="server" Text="Hello, world" Font-Size="2em" Font-Bold="True"></asp:Label>
                            <br />
                        </div>
                        <ul class="list-unstyled">
                            <li class="nav-item">
                                <asp:LinkButton ID="hostprofile" runat="server" Style="font-size: 1.5em;" OnClick="hostProfile_Click" BackColor="#C6D6E2"> <i class="la la-user" style="font-size:1em;"></i>My Profile</asp:LinkButton>
                            </li>
                            <li class="nav-item">
                                <asp:LinkButton ID="hostproperty" runat="server" Style="font-size: 1.5em;" OnClick="hostproperty_Click"><i class="la la-home" style="font-size:1em;"></i>Manage Property</asp:LinkButton>
                            </li>
                            <li class="nav-item" style="margin-top: 0px">
                                <asp:LinkButton ID="hostConnections" runat="server" Style="font-size: 1.5em;" OnClick="hostConnections_Click"><i class="la la-users" style="font-size:1em;"></i>Connections</asp:LinkButton>
                            </li>
                            <li class="nav-item">
                                <asp:LinkButton ID="hostMessage" runat="server" Style="font-size: 1.5em;" OnClick="hostMessage_Click"><i class="la la-comments" style="font-size:1em;"></i>Messages</asp:LinkButton>
                            </li>
                        </ul>
                    </div>
                    <!-- END MENU -->
                </div>
            </div>

            <div class="col-md-9">
                <%--host profile--%>
                <asp:Panel ID="panelprofile" runat="server">
                    <div class="profile-content atbd_content_module">
                        <div class="atbd_content_module__tittle_area about-titles">
                            <div class="atbd_area_title">
                                <h4 style="font-size: 2em;"><span class="la la-user" style="font-size: 1em; color: black;"></span> My Profile </h4>
                                <asp:LinkButton ID="editprofile" runat="server" OnClick="editprofile_Click">Edit</asp:LinkButton>
                            </div>
                        </div>
                        <div class="profile-des">
                            <div class="">
                                <h5>&nbsp;</h5>
                                <h5>About</h5>
                                <asp:Label ID="userDes" runat="server" Text=""></asp:Label>
                                <br />
                                <br />
                            </div>
                            <div>
                                <h5 style="display: inline">Age</h5>
                                <asp:Label ID="userAge" runat="server" Text="" Style="display: inline"></asp:Label>
                                <br />
                                <br />
                            </div>
                            <div class="about-des">
                                <h5 style="display: inline">Gender</h5>
                                <asp:Label ID="userGender" runat="server" Text="" Style="display: inline"></asp:Label>
                                <br />
                                <br />
                            </div>
                            <div class="about-des">
                                <h5 style="display: inline">Occupation</h5>
                                <asp:Label ID="userOccu" runat="server" Text="" Style="display: inline"></asp:Label>
                            </div>
                        </div>
                    </div>
                </asp:Panel>

                <%--host property--%>
                <asp:Panel ID="panelfavorites" runat="server" Visible="False">
                    <div class="profile-content atbd_content_module">
                        <div class="atbd_content_module__tittle_area about-titles">
                            <div class="atbd_area_title">
                                <h4 style="font-size: 2em; color: black;"><span class="la la-home" style="font-size: 1em; color: black;"> Manage Property</span></h4>
                                <%--<a href="add-listing.html" class="btn btn-primary"><span class="la la-plus"></span> Add</a>--%>
                                <asp:Button ID="addproperty" runat="server" Text="+Add" class="btn btn-primary" OnClick="addproperty_Click" />
                            </div>
                        </div>
                    </div>
                </asp:Panel>

                <%--host connections--%>
                <asp:Panel ID="panelconnections" runat="server" Visible="False">
                    <div class="profile-content atbd_content_module">
                        <div class="atbd_content_module__tittle_area about-titles">
                            <div class="atbd_area_title">
                                <h4 style="font-size: 2em; color: black;"><span class="la la-users" style="font-size: 1em; color: black"> Connections</span></h4>
                            </div>
                        </div>
                    </div>
                </asp:Panel>

                <%--host message--%>
                <asp:Panel ID="panelmessage" runat="server" Visible="False">
                    <div class="profile-content atbd_content_module">
                        <div class="atbd_content_module__tittle_area about-titles">
                            <div class="atbd_area_title">
                                <h4 style="font-size: 2em; color: black;"><span class="la la-comments" style="font-size: 1em; color: black"> Messages</span></h4>
                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>