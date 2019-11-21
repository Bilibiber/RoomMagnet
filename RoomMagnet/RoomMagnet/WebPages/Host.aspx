<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="Host.aspx.cs" Inherits="WebPages_Host" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="Server">
    <section class="section-bg">
        <div class="row">
            <div class="col-md-2 no-padding">
                <div id="sidebar-wrapper">

                    <div class="profile-userpic admin-pic text-center">
                        <asp:image id="imgpreview" runat="server" height="120" width="120" imageurl="http://cliquecities.com/assets/no-image-e3699ae23f866f6cbdf8ba2443ee5c4e.jpg" style="border-width: 0px; border-radius: 50%;" />
                        <br />

                        <div class="" style="padding-bottom: 20px;">
                            <asp:label id="hellow" runat="server" text="Hello, world" font-size="2em" font-bold="True" forecolor="White"></asp:label>
                            <p class="">Host<span><i class="icon-space"></i></span></p>
                            <asp:label id="userstatus" runat="server" backcolor="#bd2026" borderstyle="None" font-size="X-Large" forecolor="White" style="text-align: center; width: 150px; border-radius:100px;"></asp:label>
                        </div>

                        <ul class="sidebar-nav list-unstyled">
                            <li class="nav-item">
                                <asp:linkbutton id="hostprofile" runat="server" style="font-size: 1.5em;" onclick="hostProfile_Click"> <i class="la la-user icon-space" style="font-size:1em;"></i>My Profile</asp:linkbutton>
                            </li>
                            <li class="nav-item">
                                <asp:linkbutton id="hostproperty" runat="server" style="font-size: 1.5em;" onclick="hostproperty_Click"><i class="la la-home icon-space" style="font-size:1em;"></i>Manage Property</asp:linkbutton>
                            </li>
                            <li class="nav-item" style="margin-top: 0px">
                                <asp:linkbutton id="hostConnections" runat="server" style="font-size: 1.5em;" onclick="hostConnections_Click"><i class="la la-users icon-space" style="font-size:1em;"></i>Requests</asp:linkbutton>
                            </li>
                            <li class="nav-item">
                                <asp:linkbutton id="hostMessage" runat="server" style="font-size: 1.5em;" onclick="hostMessage_Click"><i class="la la-comments icon-space" style="font-size:1em;"></i>Messages</asp:linkbutton>
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
                <asp:panel id="panelprofile" runat="server">
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
                </asp:panel>

                <%--host property--%>
                <asp:panel id="panelfavorites" runat="server" visible="False">
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
                                                                <div class="atbd_listing_meta" style="float: right;" runat="server" id="rating2">
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
                </asp:panel>

                <%--host connections--%>
                <asp:panel id="panelconnections" runat="server" visible="False">
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
                                                    <asp:Label ID="request1des" runat="server" Text="Label"></asp:Label></p>
                                            </div>
                                            <div class="col-md-3 right_col-1">
                                                <asp:Button ID="AcceptButton1" runat="server" Text="Accept" CssClass="btn btn-secondary requests-btn inline" OnClick="AcceptButton1_Click" />
                                                <asp:Button ID="DeclineButton1" runat="server" Text="Decline" CssClass="btn btn-secondary inline"  OnClick="DeclineButton1_Click" />
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
                                                <p class="card-text"> <asp:Label ID="request2des" runat="server" Text="Label"></asp:Label>
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
                                                    <asp:Label ID="request3des" runat="server" Text="Label"></asp:Label></p>
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
                                                    <asp:Label ID="request4des" runat="server" Text="Label"></asp:Label></p>
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
                                                    <asp:Label ID="request5des" runat="server" Text="Label"></asp:Label></p>
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
                </asp:panel>

                <%--renter message--%>
                <asp:panel id="panelmessage" runat="server" visible="False">
                    <div class="col-md-12 mx-auto">
                        <h1 class="update-title">Messages<asp:Label ID="errorLabel" Visible="false" runat="server" Text="Label"></asp:Label>
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
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </asp:panel>
            </div>
        </div>
    </section>
</asp:Content>