<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Home
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="Server">
    <div id="carousel-example-2" class="carousel slide carousel-fade" data-ride="carousel">
        <!--Indicators-->
        <ol class="carousel-indicators">
            <li data-target="#carousel-example-2" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-2" data-slide-to="1"></li>
            <li data-target="#carousel-example-2" data-slide-to="2"></li>
        </ol>
        <!--/.Indicators-->
        <!--Slides-->
        <div class="carousel-inner" role="listbox">
            <div class="carousel-item active">
                <div class="view">
                    <asp:Image ID="Image5" runat="server" ImageUrl="~/img/rm/home-2.png" CssClass="d-block w-100" alt="First slide" />
                    <div class="mask rgba-black-light"></div>
                </div>
                <div class="container">
                    <div class="carousel-caption text-center">
                        <h1>A <i class="light-heading">SIMPLE,</i> <i class="light-heading">SECURE,</i> <i class="light-heading">EASY-TO-USE</i> WAY TO HOMESHARE GENERATIONALLY.</h1>
                        <hr class="style-six">
                        <p class="text-light">Hosts can offer reduced rent in exchange for the regular completion of household tasks.</p>

                        <p class="call-action-btn"><a class="btn btn-primary" role="button" href="#learnmore">LEARN MORE</a></p>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <!--Mask color-->
                <div class="view">
                    <asp:Image ID="Image6" runat="server" ImageUrl="~/img/rm/friends.jpg" CssClass="d-block w-100" alt="Second slide" />
                    <div class="mask rgba-"></div>
                </div>
                <div class="container">
                    <div class="carousel-caption text-right">
                        <h1>A <i class="light-heading">TRUSTED</i> COMMUNITY MARKETPLACE.</h1>
                        <p>
                            Becoming a verified tenant is a great option for international students,<br>
                            graduate students and individuals looking for affordable housing.
                        </p>
                        <p class="call-action-btn"><a class="btn btn-primary" data-toggle="modal" data-target="#signup_modal" role="button">GET STARTED</a></p>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <!--Mask color-->
                <div class="view">
                    <asp:Image ID="Image7" runat="server" CssClass="d-block w-100" ImageUrl="~/img/rm/street.jpg" alt="Third slide" />
                    <div class="mask rgba-black-slight"></div>
                </div>
                <div class="container">
                    <div class="carousel-caption text-center">
                        <h1>FIND YOUR NEW HOME.</h1>
                        <p>We provide for the listing, discovery , and rental of flexible, affordable co-living situations.</p>
                        <div class="directory_content_area">

                            <div class="col-lg-10 offset-lg-1">

                                <div class="search_title_area">

                                    <div class="atbd_seach_fields_wrapper no-padding">
                                        <div class="single_search_field search_query">
                                            <asp:TextBox ID="HomePageSearchText" runat="server" CssClass="form-control search_fields border rounded-pill-left border-right-0" type="text" placeholder="Enter a city or zip code"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required" ValidationGroup="HomePageSearch" ControlToValidate="HomePageSearchText" Display="Dynamic"></asp:RequiredFieldValidator>
                                        </div>

                                        <div class="atbd_submit_btn">
                                            <asp:Button ID="HomePageSearchButton" runat="server" Text="Search" CssClass="btn btn-primary btn_search border rounded-pill-right border-left-0" OnClick="HomePageSearchButton_Click" ValidationGroup="HomePageSearch" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--/.Slides-->
        <!--Controls-->
        <a class="carousel-control-prev" href="#carousel-example-2" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carousel-example-2" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
        <!--/.Controls-->
    </div>
    <section class="listing-cards section-bg section-padding-two" id="learnmore">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>Here's How It Works</h2>
                        <p>RoomMagnet is a great option for many people trying to find rooms!</p>
                    </div>
                </div>
                <div class="listing-cards-wrapper col-lg-12">
                    <div class="row">
                        <div class="col-lg-3 bounce">
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
                                            <h4 class="atbd_listing_title">Step 1
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
                        <div class="col-lg-3 bounce">
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
                        <div class="col-lg-3 bounce">
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
                                            <h4 class="atbd_listing_title">Step 3
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
                        <div class="col-lg-3 bounce">
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
                                            <h4 class="atbd_listing_title">Step 4
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
                            <asp:Button ID="HomePageLearnMore" runat="server" Text="About Us" CssClass="btn btn-gradient btn-gradient-two" PostBackUrl="~/WebPages/About.aspx" />
                        </div>
                    </div>
                </div>
                <!-- ends: .listing-cards-wrapper -->
            </div>
        </div>
    </section>
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
                            <div class="text-right">
                                <asp:Image ID="Image8" runat="server" ImageUrl="~/img/rm/friends-1.jpg" CssClass="about-img img-fluid" />
                            </div>
                            <div class="text-left more-img">
                                <asp:Image ID="Image9" runat="server" CssClass="about-img img-fluid" ImageUrl="~/img/rm/young-old.jpg" />
                            </div>
                        </div>
                        <div class="col-lg-5 offset-lg-1 col-md-6 mt-5 mt-md-0">
                            <ul class="feature-list-wrapper list-unstyled">
                                <li>
                                    <div class="icon"><span class="circle-secondary"><i class="la la-check-circle"></i></span></div>
                                    <div class="list-content">
                                        <h4>Qualified Renters</h4>
                                        <p>Renters and hosts have to go through a background screening and renters have to favorite a property before a connection can be made.</p>
                                    </div>
                                </li>
                                <li>
                                    <div class="icon"><span class="circle-secondary"><i class="la la-money"></i></span></div>
                                    <div class="list-content">
                                        <h4>Secured Payments</h4>
                                        <p>RoomMagnet utilizes the stripe payment system to provide secure payments and comfort to renters and hosts.</p>
                                    </div>
                                </li>
                                <li>
                                    <div class="icon"><span class="circle-secondary"><i class="la la-tasks"></i></span></div>
                                    <div class="list-content">

                                        <h4>Tailored Agreements</h4>
                                        <p>RoomMagnet provides flexibility for renters and hosts to make their own contracts, but also provides samples for those that would like one.</p>
                                    </div>
                                </li>
                                <li>
                                    <div class="icon"><span class="circle-secondary"><i class="la la-lock"></i></span></div>
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
    <div class="container-fluid faq-home align-items-center">
        <div class="row">
            <div class="col-md-12">
                <asp:Image ID="Image10" runat="server" CssClass="img-fluid" ImageUrl="~/img/rm/dark-kitchen.png" />
                <div class="col-md-12">
                    <div class=" faq-info text-center">
                        <h1 class="">Still have questions?</h1>
                        <h1>Visit our FAQ page for more information.</h1>
                        <p class="call-action-btn"><a class="btn btn-primary" role="button" href="FAQ.aspx">SEE FAQ</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="p-bottom-30">
    </div>
</asp:Content>