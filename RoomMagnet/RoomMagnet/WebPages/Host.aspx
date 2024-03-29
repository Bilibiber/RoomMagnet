﻿<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="Host.aspx.cs" Inherits="WebPages_Host" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Host DashBoard
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <style>
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="Server">
    <section class="section-bg">
        <div class="row">
            <div class="col-md-2 no-padding">
                <div id="sidebar-wrapper">

                    <div class="profile-userpic admin-pic text-center">
                        <asp:Image ID="imgpreview" runat="server" Height="120" Width="120" ImageUrl="http://cliquecities.com/assets/no-image-e3699ae23f866f6cbdf8ba2443ee5c4e.jpg" Style="border-width: 0px; border-radius: 50%;" />
                        <br />

                        <div class="" style="padding-bottom: 20px;">
                            <asp:Label ID="hellow" runat="server" Text="Hello, world" Font-Size="2em" Font-Bold="True" ForeColor="White"></asp:Label>
                            <p class="">Host<span><i class="icon-space"></i></span></p>
                            <asp:Label ID="userstatus" runat="server" BackColor="#bd2026" BorderStyle="None" Font-Size="X-Large" ForeColor="White" Style="text-align: center; width: 150px; border-radius: 100px;"></asp:Label>
                        </div>

                        <ul class="sidebar-nav list-unstyled">
                            <li class="nav-item">
                                <asp:LinkButton ID="hostprofile" runat="server" Style="font-size: 1.5em;" OnClick="hostProfile_Click"> <i class="la la-user icon-space" style="font-size:1em;"></i>My Profile</asp:LinkButton>
                            </li>
                            <li class="nav-item">
                                <asp:LinkButton ID="hostproperty" runat="server" Style="font-size: 1.5em;" OnClick="hostproperty_Click"><i class="la la-home icon-space" style="font-size:1em;"></i>Manage Property</asp:LinkButton>
                            </li>
                            <li class="nav-item" style="margin-top: 0px">
                                <asp:LinkButton ID="hostConnections" runat="server" Style="font-size: 1.5em;" OnClick="hostConnections_Click"><i class="la la-users icon-space" style="font-size:1em;"></i>Requests</asp:LinkButton>
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

            <div class="col-md-9 mx-auto dashboard-padding">

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
                                            <div runat="server" visible="false"> 
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
                    <div class="col-md-12 mx-auto ">
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
                                                                <asp:ImageButton ID="Property1Image" OnClick="Property1Image_Click" runat="server" CssClass="imgfill" Height="220px" Width="300" BorderColor="Silver" BorderStyle="Solid" BorderWidth="2px" />
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
                                                                <div class="atbd_listing_meta" style="float: right;" runat="server" id="rating1" visible="false">
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
                                                                <asp:ImageButton ID="Property2Image" OnClick="Property2Image_Click" runat="server" CssClass="imgfill" Height="220px" Width="300" BorderColor="Silver" BorderStyle="Solid" BorderWidth="2px" />
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
                                                                <div class="atbd_listing_meta" style="float: right;" runat="server" id="rating2" visible="false">
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
                                                                <asp:ImageButton ID="Property3Image" OnClick="Property3Image_Click" runat="server" CssClass="imgfill" Height="220px" Width="300" BorderColor="Silver" BorderStyle="Solid" BorderWidth="2px" />
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
                                                                <div class="atbd_listing_meta" style="float: right;" runat="server" id="rating3" visible="false">
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
                    <div class="col-md-12 mx-auto">
                        <h1 class="update-title">
                            <asp:Label ID="RequestHeader" runat="server" Text="Renter Requests"></asp:Label>
                        </h1>
                        <div class="container">
                            <div class="col-md-12">
                                <div class=" p-bottom-25">
                                    <div class="card border" id="request1" runat="server" visible="false">
                                        <div class="card-header">
                                            Request Application
                                        </div>
                                        <div class="card-body">
                                            <div class="col-md-9 left_col-1">
                                                <p class="card-text">
                                                    <asp:Label ID="request1des" runat="server" Text="Label"></asp:Label>
                                                </p>
                                            </div>
                                            <div class="col-md-3 right_col-1">
                                                <asp:Button ID="AcceptButton1" runat="server" Text="Accept" CssClass="btn btn-secondary requests-btn inline" OnClick="AcceptButton1_Click" />
                                                <asp:Button ID="DeclineButton1" runat="server" Text="Decline" CssClass="btn btn-secondary inline" OnClick="DeclineButton1_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class=" p-bottom-25">
                                    <div class="card border" id="request2" runat="server" visible="false">
                                        <div class="card-header">
                                            Request Application
                                        </div>
                                        <div class="card-body">
                                            <div class="col-md-9 left_col-1 ">
                                                <p class="card-text">
                                                    <asp:Label ID="request2des" runat="server" Text="Label"></asp:Label>
                                                </p>
                                            </div>
                                            <div class="col-md-3  right_col-1">
                                                <asp:Button ID="AcceptButton2" runat="server" Text="Accept" CssClass="btn btn-secondary requests-btn inline" OnClick="AcceptButton2_Click" />
                                                <asp:Button ID="DeclineButton2" runat="server" Text="Decline" CssClass="btn btn-secondary inline" OnClick="DeclineButton2_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class=" p-bottom-25">
                                    <div class="card border" id="request3" runat="server" visible="false">
                                        <div class="card-header">
                                            Request Application
                                        </div>
                                        <div class="card-body">
                                            <div class="col-md-9 left_col-1">
                                                <p class="card-text">
                                                    <asp:Label ID="request3des" runat="server" Text="Label"></asp:Label>
                                                </p>
                                            </div>
                                            <div class="col-md-3 right_col-1">
                                                <asp:Button ID="AcceptButton3" runat="server" Text="Accept" CssClass="btn btn-secondary requests-btn inline" OnClick="AcceptButton3_Click" />
                                                <asp:Button ID="DeclineButton3" runat="server" Text="Decline" CssClass="btn btn-secondary inline" OnClick="DeclineButton3_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class=" p-bottom-25">
                                    <div class="card border" id="request4" runat="server" visible="false">
                                        <div class="card-header">
                                            Request Application
                                        </div>
                                        <div class="card-body">
                                            <div class="col-md-9 left_col-1">
                                                <p class="card-text">
                                                    <asp:Label ID="request4des" runat="server" Text="Label"></asp:Label>
                                                </p>
                                            </div>
                                            <div class="col-md-3 right_col-1">
                                                <asp:Button ID="AcceptButton4" runat="server" Text="Accept" CssClass="btn btn-secondary requests-btn inline" OnClick="AcceptButton4_Click" />
                                                <asp:Button ID="DeclineButton4" runat="server" Text="Decline" CssClass="btn btn-secondary inline" OnClick="DeclineButton4_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class=" p-bottom-25">
                                    <div class="card border" id="request5" runat="server" visible="false">
                                        <div class="card-header">
                                            Request Application
                                        </div>
                                        <div class="card-body">
                                            <div class="col-md-9 left_col-1">
                                                <p class="card-text">
                                                    <asp:Label ID="request5des" runat="server" Text="Label"></asp:Label>
                                                </p>
                                            </div>
                                            <div class="col-md-3 right_col-1">
                                                <asp:Button ID="AcceptButton5" runat="server" Text="Accept" CssClass="btn btn-secondary requests-btn inline" OnClick="AcceptButton5_Click" />
                                                <asp:Button ID="DeclineButton5" runat="server" Text="Decline" CssClass="btn btn-secondary inline" OnClick="DeclineButton5_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </asp:Panel>

                <%--renter message--%>
                <asp:Panel ID="panelmessage" runat="server" Visible="False">
                    <div class="col-md-12 mx-auto">
                        <h1 class="update-title">
                            <asp:Label ID="Label1" runat="server" Text="Messages" Visible="false"></asp:Label><asp:Label ID="errorLabel" Visible="false" runat="server" Text="Label"></asp:Label>
                        </h1>
                        <div class="row">
                            <div class="col-md-9 no-padding">
                                <div class="form-group">
                                    <asp:DropDownList ID="RenterNames" runat="server" AutoPostBack="true" OnTextChanged="RenterNames_TextChanged" Visible="false" CssClass="form-control">
                                        <asp:ListItem Value="No One">Select Contact</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="p-bottom-30">
                                <div class="col-md-12">
                                    <asp:TextBox ID="Messages" TextMode="MultiLine" runat="server" CssClass="form-control" ReadOnly="true" Width="1050px" Height="250px"></asp:TextBox>
                                </div>
                            </div>
                            <hr />
                            <div class="type_msg">
                                <div class="input_msg_write">
                                    <div class="input-group">
                                        <asp:TextBox ID="txtsend" runat="server" CssClass="form-control" placeholder="Type a message" Width="500px"></asp:TextBox>
                                        <div class="atbd_submit_btn input-group-append searchtxt-padding">
                                            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Send" Font-Bold="True" CssClass="btn btn-primary" />
                                        </div>
                                        <div class="atbd_submit_btn input-group-append searchtxt-padding">
                                            <asp:Button ID="SkypeButton" runat="server" Text="Skype" CssClass="btn btn-primary" PostBackUrl="https://login.live.com/login.srf?wa=wsignin1.0&rpsnv=13&ct=1576017549&rver=7.1.6819.0&wp=MBI_SSL&wreply=https%3A%2F%2Flw.skype.com%2Flogin%2Foauth%2Fproxy%3Fclient_id%3D360605%26redirect_uri%3Dhttps%253A%252F%252Fsecure.skype.com%252Fportal%252Flogin%253Freturn_url%253Dhttps%25253A%25252F%25252Fsecure.skype.com%25252Fportal%25252Foverview%26response_type%3Dpostgrant%26state%3D63fc25257b83bc128cb53cbf%26site_name%3Dlw.skype.com&lc=1033&id=293290&mkt=en-US&psi=skype&lw=1&cobrandid=2befc4b5-19e3-46e8-8347-77317a16a5a5&client_flight=ReservedFlight33%2CReservedFlight67" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
    </section>
</asp:Content>