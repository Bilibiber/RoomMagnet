<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Home
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="Server">
    <section class="intro-wrapper bgimage overlay--dark overlay">
        <div class="home-image">
            <asp:Image ID="HomeImage" runat="server" ImageUrl="~/img/home-2-large.png" alt="" />
        </div>
        <div class="directory_content_area">
            <div class="container">
                <div class="row">
                    <div class="col-lg-10 offset-lg-1">
                        <div class="search_title_area">
                            <h2 class="title">START INTERGENERATIONAL HOMESHARING WITH CONFIDENCE TODAY</h2>
                        </div>
                        <div class="atbd_seach_fields_wrapper input-group">
                            <div class="single_search_field search_query">
                                <asp:TextBox ID="HomePageSearchText" runat="server" CssClass="form-control search_fields border rounded-pill-left border-right-0" placeholder="Enter a city or zip code"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required" ValidationGroup="HomePageSearch" ControlToValidate="HomePageSearchText" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>

                            <div class="atbd_submit_btn input-group-append">
                                <asp:Button ID="HomePageSearchButton" runat="server" Text="Search" CssClass="btn btn-block btn-gradient btn-gradient-one btn-sm btn_search border rounded-pill-right border-left-0" OnClick="HomePageSearchButton_Click" ValidationGroup="HomePageSearch" />
                            </div>
                        </div>
                    </div>
                    <!-- ends: .col-lg-10 -->
                </div>
            </div>
        </div>
        <!-- ends: .directory_search_area -->
    </section>
    <!-- ends: .intro-wrapper -->
    <section class="categories-cards section-padding-two">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="section-title text-left">
                        <h2>THE SECURE AND RELIABLE WAY TO RENT YOUR UNUSED ROOM.</h2>
                        <p>Earn income renting to qualified adults.</p>
                    </div>
                    <div class="section-title text-left">
                        <asp:Button ID="HomePageBecome" runat="server" Text="Become a Host" CssClass="btn btn-xs btn-gradient btn-gradient-two access-link " data-toggle="modal" data-target="#signup_modal" OnClientClick="return false" />
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="image">
                        <asp:Image ID="OldAndYoung" runat="server" CssClass="img-fluid" ImageUrl="~/img/rm/young-old.jpg" alt="young man and old man" />
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-sm-6">
                </div>
                <!-- ends: .col -->
            </div>
        </div>
    </section>
    <!-- ends: .categories-cards -->
    <section class="listing-cards section-bg section-padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>Here's how it works</h2>
                        <p>Explore the popular listings around the world</p>
                    </div>
                </div>
                <div class="listing-cards-wrapper col-lg-12">
                    <div class="row">
                        <div class="col-lg-3 ">
                            <div class="atbd_single_listing ">
                                <article class="atbd_single_listing_wrapper">
                                    <figure class="atbd_listing_thumbnail_area">
                                        <div class="atbd_listing_image">

                                            <asp:Image ID="Image1" runat="server" ImageUrl="~/img/step1.png" />
                                        </div>
                                        <!-- ends: .atbd_listing_image -->
                                    </figure>
                                    <!-- ends: .atbd_listing_thumbnail_area -->
                                    <div class="atbd_listing_info text-center">
                                        <div class="atbd_content_upper">
                                            <h4 class="atbd_listing_title">
                                                <a href="">Step 1</a>
                                            </h4>
                                            <div class="atbd_listing_data_list">
                                                <ul>
                                                    <li>
                                                        <p>Create an account to become a host or renter and complete your profile</p>
                                                    </li>
                                                </ul>
                                            </div>
                                            <!-- End atbd listing meta -->
                                        </div>
                                        <!-- end .atbd_content_upper -->
                                    </div>
                                    <!-- ends: .atbd_listing_info -->
                                </article>
                                <!-- atbd_single_listing_wrapper -->
                            </div>
                        </div>
                        <!-- ends: .col-lg-3 -->
                        <div class="col-lg-3 ">
                            <div class="atbd_single_listing ">
                                <article class="atbd_single_listing_wrapper">
                                    <figure class="atbd_listing_thumbnail_area">
                                        <div class="atbd_listing_image">
                                            <asp:Image ID="Image2" runat="server" ImageUrl="~/img/step2.png" />
                                        </div>
                                        <!-- ends: .atbd_listing_image -->
                                    </figure>
                                    <!-- ends: .atbd_listing_thumbnail_area -->
                                    <div class="atbd_listing_info text-center">
                                        <div class="atbd_content_upper">
                                            <h4 class="atbd_listing_title">Step 2
                                            </h4>
                                            <div class="atbd_listing_data_list">
                                                <ul>
                                                    <li>
                                                        <p>Hosts will list their property for rent</p>
                                                    </li>
                                                    <br>
                                                </ul>
                                            </div>
                                            <!-- End atbd listing meta -->
                                        </div>
                                        <!-- end .atbd_content_upper -->
                                    </div>
                                    <!-- ends: .atbd_listing_info -->
                                </article>
                                <!-- atbd_single_listing_wrapper -->
                            </div>
                        </div>
                        <!-- ends: .col-lg-3 -->
                        <div class="col-lg-3 ">
                            <div class="atbd_single_listing ">
                                <article class="atbd_single_listing_wrapper">
                                    <figure class="atbd_listing_thumbnail_area">
                                        <div class="atbd_listing_image">

                                            <asp:Image ID="Image3" runat="server" ImageUrl="~/img/step3.png" />
                                        </div>
                                        <!-- ends: .atbd_listing_image -->
                                    </figure>
                                    <!-- ends: .atbd_listing_thumbnail_area -->
                                    <div class="atbd_listing_info text-center">
                                        <div class="atbd_content_upper">
                                            <h4 class="atbd_listing_title">
                                                <a href="">Step 3</a>
                                            </h4>
                                            <div class="atbd_listing_data_list">
                                                <ul>
                                                    <li>
                                                        <p>Potential renters search for listings and connect with hosts via our secure site</p>
                                                    </li>
                                                </ul>
                                            </div>
                                            <!-- End atbd listing meta -->
                                        </div>
                                        <!-- end .atbd_content_upper -->
                                    </div>
                                    <!-- ends: .atbd_listing_info -->
                                </article>
                                <!-- atbd_single_listing_wrapper -->
                            </div>
                        </div>
                        <!-- ends: .col-lg-3 -->
                        <div class="col-lg-3 ">
                            <div class="atbd_single_listing ">
                                <article class="atbd_single_listing_wrapper">
                                    <figure class="atbd_listing_thumbnail_area">
                                        <div class="atbd_listing_image">

                                            <asp:Image ID="Image4" runat="server" ImageUrl="~/img/step4.png" />
                                        </div>
                                        <!-- ends: .atbd_listing_image -->
                                    </figure>
                                    <!-- ends: .atbd_listing_thumbnail_area -->
                                    <div class="atbd_listing_info text-center">
                                        <div class="atbd_content_upper">
                                            <h4 class="atbd_listing_title">
                                                <a href="">Step 4</a>
                                            </h4>
                                            <div class="atbd_listing_data_list">
                                                <ul>
                                                    <li>
                                                        <p>Renter pays host through our secure payment</p>
                                                    </li>
                                                    <br>
                                                </ul>
                                            </div>
                                            <!-- End atbd listing meta -->
                                        </div>
                                        <!-- end .atbd_content_upper -->
                                    </div>
                                    <!-- ends: .atbd_listing_info -->
                                </article>
                                <!-- atbd_single_listing_wrapper -->
                            </div>
                        </div>
                        <!-- ends: .col-lg-3 -->

                        <div class="col-lg-12 text-center m-top-20">
                            <asp:Button ID="HomePageLearnMore" runat="server" Text="Learn More" CssClass="btn btn-gradient btn-gradient-two" PostBackUrl="~/WebPages/About.aspx" />
                        </div>
                    </div>
                </div>
                <!-- ends: .listing-cards-wrapper -->
            </div>
        </div>
    </section>
    <!-- ends: .listing-cards -->

    <!-- begins .cta -->
    <section class="cta section-padding border-bottom">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>Why use <span>RoomMagnet</span>?</h2>
                        <p>We make it safe and easy!</p>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="row align-items-center">
                        <div class="col-lg-6 col-md-6">
                            <asp:Image ID="Imageillustration" runat="server" ImageUrl="~/img/svg/illustration-1.svg" CssClass="svg" alt="" />
                        </div>
                        <div class="col-lg-5 offset-lg-1 col-md-6 mt-5 mt-md-0">
                            <ul class="feature-list-wrapper list-unstyled">
                                <li>
                                    <div class="icon"><span class="circle-secondary"><i class="la la-check-circle"></i></span></div>
                                    <div class="list-content">
                                        <h4>Qualified Users</h4>
                                        <p>Renters and hosts have to go through a background screening and renters have to favorite a property before a connection can be made.</p>
                                    </div>
                                </li>
                                <li>
                                    <div class="icon"><span class="circle-success"><i class="la la-money"></i></span></div>
                                    <div class="list-content">
                                        <h4>Secured Payments</h4>
                                        <p>RoomMagnet utilizes the stripe payment system to provide secure payments and comfort to renters and hosts.</p>
                                    </div>
                                </li>
                                <li>
                                    <div class="icon"><span class="circle-info"><i class="la la-tasks"></i></span></div>
                                    <div class="list-content">

                                        <h4>Tailored Agreements</h4>
                                        <p>RoomMagnet provides flexibility for renters and hosts to make their own contracts, but also provides samples for those that would like one.</p>
                                    </div>
                                </li>
                                <li>
                                    <div class="icon"><span class="circle-primary"><i class="la la-lock"></i></span></div>
                                    <div class="list-content">
                                        <h4>Safety and Security</h4>
                                        <p>Renters and hosts must go through a rigorous background screening and video conferencing meeting with RoomMagnet as a third party before any formal arrangements can be made.</p>
                                    </div>
                                </li>
                            </ul>
                            <!-- ends: .feature-list-wrapper -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>