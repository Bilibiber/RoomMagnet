<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="Host.aspx.cs" Inherits="WebPages_Host" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="Server">
    <section class="section-bg p-bottom-70">
        <div class="row">
            <div class="col-md-2 no-padding">
                <div id="sidebar-wrapper">

                    <div class="profile-userpic admin-pic text-center">
                        <asp:Image ID="imgpreview" runat="server" Height="120" Width="120" ImageUrl="http://cliquecities.com/assets/no-image-e3699ae23f866f6cbdf8ba2443ee5c4e.jpg" Style="border-width: 0px; border-radius: 50%;" />
                        <br />
                        <asp:Label ID="userstatus" runat="server" BackColor="#CC3300" BorderStyle="None" Font-Size="X-Large" ForeColor="White" Style="text-align: center; width: 150px;"></asp:Label>

                        <div class="">
                            <asp:Label ID="hellow" runat="server" Text="Hello, world" Font-Size="2em" Font-Bold="True" ForeColor="White"></asp:Label>
                            <p class="">Host<span><i class="icon-space"></i></span></p>
                        </div>

                        <ul class="sidebar-nav list-unstyled">
                            <li class="nav-item">
                                <asp:LinkButton ID="hostprofile" runat="server" Style="font-size: 1.5em;" OnClick="hostProfile_Click"> <i class="la la-user icon-space" style="font-size:1em;"></i>My Profile</asp:LinkButton>
                            </li>
                            <li class="nav-item">
                                <asp:LinkButton ID="hostproperty" runat="server" Style="font-size: 1.5em;" OnClick="hostproperty_Click"><i class="la la-home icon-space" style="font-size:1em;"></i>Manage Property</asp:LinkButton>
                            </li>
                            <li class="nav-item" style="margin-top: 0px">
                                <asp:LinkButton ID="hostConnections" runat="server" Style="font-size: 1.5em;" OnClick="hostConnections_Click"><i class="la la-users icon-space" style="font-size:1em;"></i>Connections</asp:LinkButton>
                            </li>
                            <li class="nav-item">
                                <asp:LinkButton ID="hostMessage" runat="server" Style="font-size: 1.5em;" OnClick="hostMessage_Click"><i class="la la-comments icon-space" style="font-size:1em;"></i>Messages</asp:LinkButton>
                            </li>
                        </ul>
                    </div>

                    <%--                    <div class="renter-host ">
                        <a href="" class="btn btn-primary"></span>Switch to Renter</a>
                    </div>--%>
                </div>
                <!-- /#sidebar-wrapper -->
            </div>

            <div class="col-md-9 mx-auto ">

                <%--renter profile--%>
                <asp:Panel ID="panelprofile" runat="server">
                    <h1 class="update-title">My Profile
                        <asp:Button ID="editprofile" runat="server" Text="Edit" class="btn btn-primary" OnClick="editprofile_Click" Style="float: right;" /></h1>

                    <div class="atbd_author_module">
                        <div class="atbd_content_module">

                            <div class="atbdb_content_module_contents">
                                <div class="user_info_wrap">
                                    <div class="row">

                                        <div class="profile-des">
                                            <div class="">
                                                <h5>About</h5>
                                                <asp:Label ID="userDes" runat="server" Text=""> </asp:Label>
                                                <br />
                                                <br />
                                            </div>
                                            <div>
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
                                </div>
                            </div>
                        </div>
                    </div>
                </asp:Panel>

                <%--host property--%>
                <asp:Panel ID="panelfavorites" runat="server" Visible="False">
                    <div class="col-md-9 mx-auto ">
                        <h1 class="update-title">Manage property
                            <asp:Button ID="addproperty" runat="server" Text="+Add" class="btn btn-primary" OnClick="addproperty_Click" Style="float: right;" />
                        </h1>

                        <div class="atbd_author_module">
                            <div class="atbd_content_module">

                                <div class="atbdb_content_module_contents">
                                    <div class="user_info_wrap">
                                        <div class="row">
                                            <div id="Property1Space" runat="server" class="col-lg-12">
                                                <div class="atbd_single_listing atbd_listing_list">
                                                    <article class="atbd_single_listing_wrapper">
                                                        <figure class="atbd_listing_thumbnail_area">
                                                            <div class="atbd_listing_image fill">
                                                                <asp:ImageButton ID="Property1Image" OnClick="Property1Image_Click" runat="server" CssClass="imgfill" Height="220px" Width="350" BorderColor="Silver" BorderStyle="Solid" BorderWidth="2px" />
                                                            </div>
                                                            <!-- ends: .atbd_listing_image -->
                                                        </figure>
                                                        <!-- ends: .atbd_listing_thumbnail_area -->
                                                        <div class="atbd_listing_info">
                                                            <div class="atbd_content_upper">
                                                                <h4 class="atbd_listing_title">
                                                                    <asp:Label ID="Property1Title" Visible="false" runat="server" Text="Label"></asp:Label>
                                                                </h4>
                                                                <div class="mt-0 form-label">
                                                                    <asp:Label ID="Property1CityState" runat="server" Text="Label"></asp:Label>
                                                                </div>
                                                                <div class="atbd_listing_meta" style="float: right;">
                                                                    <span class="atbd_meta atbd_listing_rating">
                                                                        <asp:Label ID="Property1Rating" runat="server" Text="4.5" Style="float: right;"></asp:Label><i class="la la-star"></i></span>
                                                                </div>
                                                                <!-- End atbd listing meta -->
                                                                <div class="atbd_listing_data_list">
                                                                    <div class="mt-0 form-label">
                                                                        <asp:Label ID="Property1RentPrice" runat="server" Text="Label"></asp:Label><br />
                                                                        <asp:Label ID="Property1StartDate" runat="server" Text="Label"></asp:Label><br />
                                                                        <asp:Label ID="Property1EndDate" runat="server" Text="Label"></asp:Label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!-- End atbd listing meta -->

                                                            <!-- end .atbd_content_upper -->
                                                            <div class="atbd_listing_bottom_content">
                                                                <div class="atbd_content_left">
                                                                    <div class="atbd_listing_category">
                                                                        <span class="fas fa-bed icon-padding"></span>
                                                                        <div class="numberCircle">
                                                                            <asp:Label runat="server" ID="Property1Bed" Text="1 Bed" CssClass="icon-padding"></asp:Label>
                                                                        </div>
                                                                        <span class="fas fa-bath icon-padding"></span>
                                                                        <div class="numberCircle">
                                                                            <asp:Label runat="server" ID="Property1Bath" Text="1 Bathroom" CssClass="icon-padding"></asp:Label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <asp:Button ID="Button1" runat="server" Text="Edit" class="btn btn-primary" Style="float: right" OnClick="updateproperty1_Click" />
                                                            </div>
                                                        </div>
                                                    </article>
                                                </div>
                                            </div>
                                            <div id="Property2Space" runat="server" class="col-lg-12">
                                                <div class="atbd_single_listing atbd_listing_list">
                                                    <article class="atbd_single_listing_wrapper">
                                                        <figure class="atbd_listing_thumbnail_area">
                                                            <div class="atbd_listing_image fill">
                                                                <asp:ImageButton ID="Property2Image" OnClick="Property2Image_Click" runat="server" CssClass="imgfill" Height="220px" Width="350" BorderColor="Silver" BorderStyle="Solid" BorderWidth="2px" />
                                                            </div>
                                                            <!-- ends: .atbd_listing_image -->
                                                        </figure>
                                                        <!-- ends: .atbd_listing_thumbnail_area -->
                                                        <div class="atbd_listing_info">
                                                            <div class="atbd_content_upper">
                                                                <h4 class="atbd_listing_title">
                                                                    <asp:Label ID="Property2Title" Visible="false" runat="server" Text="Label"></asp:Label>
                                                                </h4>
                                                                <div class="mt-0 form-label">
                                                                    <asp:Label ID="Property2CityState" runat="server" Text="Label"></asp:Label>
                                                                </div>
                                                                <div class="atbd_listing_meta" style="float: right;">
                                                                    <span class="atbd_meta atbd_listing_rating">
                                                                        <asp:Label ID="Property2Rating" runat="server" Text="4.5"></asp:Label><i class="la la-star"></i></span>
                                                                </div>
                                                                <!-- End atbd listing meta -->
                                                                <div class="atbd_listing_data_list">
                                                                    <div class="mt-0 form-label">
                                                                        <asp:Label ID="Property2RentPrice" runat="server" Text="Label"></asp:Label><br />
                                                                        <asp:Label ID="Property2StartDate" runat="server" Text="Label"></asp:Label><br />
                                                                        <asp:Label ID="Property2EndDate" runat="server" Text="Label"></asp:Label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!-- End atbd listing meta -->

                                                            <!-- end .atbd_content_upper -->
                                                            <div class="atbd_listing_bottom_content">
                                                                <div class="atbd_content_left">
                                                                    <div class="atbd_listing_category">
                                                                        <span class="fas fa-bed icon-padding"></span>
                                                                        <div class="numberCircle">
                                                                            <asp:Label runat="server" ID="Property2Bed" Text="1 Bed" CssClass="icon-padding"></asp:Label>
                                                                        </div>
                                                                        <span class="fas fa-bath icon-padding"></span>
                                                                        <div class="numberCircle">
                                                                            <asp:Label runat="server" ID="Property2Bath" Text="1 Bathroom" CssClass="icon-padding"></asp:Label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <asp:Button ID="edit1" runat="server" Text="Edit" class="btn btn-primary" Style="float: right" OnClick="updateproperty2_Click" />
                                                            </div>
                                                        </div>
                                                    </article>
                                                </div>
                                            </div>
                                            <div id="Property3Space" runat="server" class="col-lg-12">
                                                <div class="atbd_single_listing atbd_listing_list">
                                                    <article class="atbd_single_listing_wrapper">
                                                        <figure class="atbd_listing_thumbnail_area">
                                                            <div class="atbd_listing_image fill">
                                                                <asp:ImageButton ID="Property3Image" OnClick="Property3Image_Click" runat="server" CssClass="imgfill" Height="220px" Width="350" BorderColor="Silver" BorderStyle="Solid" BorderWidth="2px" />
                                                            </div>
                                                            <!-- ends: .atbd_listing_image -->
                                                        </figure>
                                                        <!-- ends: .atbd_listing_thumbnail_area -->
                                                        <div class="atbd_listing_info">
                                                            <div class="atbd_content_upper">
                                                                <h4 class="atbd_listing_title">
                                                                    <asp:Label ID="Property3Title" Visible="false" runat="server" Text="Label"></asp:Label>
                                                                </h4>
                                                                <div class="mt-0 form-label">
                                                                    <asp:Label ID="Property3CityState" runat="server" Text="Label"></asp:Label>
                                                                </div>
                                                                <div class="atbd_listing_meta" style="float: right;">
                                                                    <span class="atbd_meta atbd_listing_rating">
                                                                        <asp:Label ID="Property3Rating" runat="server" Text="4.5"></asp:Label><i class="la la-star"></i></span>
                                                                </div>
                                                                <!-- End atbd listing meta -->
                                                                <div class="atbd_listing_data_list">
                                                                    <div class="mt-0 form-label">
                                                                        <asp:Label ID="Property3RentPrice" runat="server" Text="Label"></asp:Label><br />
                                                                        <asp:Label ID="Property3StartDate" runat="server" Text="Label"></asp:Label><br />
                                                                        <asp:Label ID="Property3EndDate" runat="server" Text="Label"></asp:Label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!-- End atbd listing meta -->

                                                            <!-- end .atbd_content_upper -->
                                                            <div class="atbd_listing_bottom_content">
                                                                <div class="atbd_content_left">
                                                                    <div class="atbd_listing_category">
                                                                        <span class="fas fa-bed icon-padding"></span>
                                                                        <div class="numberCircle">
                                                                            <asp:Label runat="server" ID="Property3Bed" Text="1 Bed" CssClass="icon-padding"></asp:Label>
                                                                        </div>
                                                                        <span class="fas fa-bath icon-padding"></span>
                                                                        <div class="numberCircle">
                                                                            <asp:Label runat="server" ID="Property3Bath" Text="1 Bathroom" CssClass="icon-padding"></asp:Label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <asp:Button ID="Button2" runat="server" Text="Edit" class="btn btn-primary" Style="float: right" OnClick="updateproperty3_Click" />
                                                            </div>
                                                        </div>
                                                    </article>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </asp:Panel>

                <%--host connections--%>
                <asp:Panel ID="panelconnections" runat="server" Visible="False">
                    <div class="col-md-9 mx-auto ">
                        <h1 class="update-title">Connections</h1>

                        <div class="atbd_author_module">
                            <div class="atbd_content_module">

                                <div class="atbdb_content_module_contents">
                                    <div class="user_info_wrap">
                                        <div class="row">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </asp:Panel>

                <%--renter message--%>
                <asp:Panel ID="panelmessage" runat="server" Visible="False">
                    <div class="col-md-9 mx-auto ">
                        <h1 class="update-title">Messages</h1>
                        <div class="atbd_author_module">
                            <div class="atbd_content_module">

                                <div class="atbdb_content_module_contents">
                                    <div class="user_info_wrap">
                                        <div class="row">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </asp:Panel>
    </section>
</asp:Content>