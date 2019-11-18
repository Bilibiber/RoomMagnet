<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="ManageSearchProperties.aspx.cs" Inherits="WebPages_ManageSearchProperties" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <%--<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Property Page</title>
    <link href="https://fonts.googleapis.com/css?family=Muli:400,400i,600,700" rel="stylesheet">
    <!-- inject:css-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="vendor_assets/css/brands.css">
    <link rel="stylesheet" href="vendor_assets/css/fontawesome.min.css">
    <link rel="stylesheet" href="vendor_assets/css/jquery-ui.css">
    <link rel="stylesheet" href="vendor_assets/css/jquery.mCustomScrollbar.css">
    <link rel="stylesheet" href="vendor_assets/css/line-awesome.min.css">
    <link rel="stylesheet" href="vendor_assets/css/magnific-popup.css">
    <link rel="stylesheet" href="vendor_assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="vendor_assets/css/select2.min.css">
    <link rel="stylesheet" href="vendor_assets/css/slick.css">
    <link rel="stylesheet" href="style.css">
    <!-- endinject -->
    <link rel="icon" type="image/png" sizes="32x32" href="img/fevicon.png">
    <script src="https://kit.fontawesome.com/0731522562.js" crossorigin="anonymous"></script>--%>
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="Server">
    <section class="header-breadcrumb bgimage overlay overlay--dark">
        <div class="mainmenu-wrapper">
            <div class="menu-area menu1 ">
                <div class="top-menu-area">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="menu-fullwidth">
                                    <div class="logo-wrapper order-lg-0 order-sm-1">
                                        <div class="logo logo-top">
                                            <a href="index.html">
                                                <%--<img src="img/rm/logo-2.png" alt="logo image" class="img-fluid">--%></a>
                                        </div>
                                    </div>
                                    <!-- ends: .logo-wrapper -->
                                    <div class="author-area">
                                        <div class="author__access_area">
                                            <ul class="d-flex list-unstyled align-items-center">
                                                <%--<li class="signup-padding">
                                                    <a href="" class="btn btn-xs btn-gradient btn-gradient-two access-link" data-toggle="modal" data-target="#signup_modal">Sign Up</a>
                                                </li>
                                                <li>
                                                    <a href="" class="btn btn-xs btn-gradient btn-gradient-two access-link" data-toggle="modal" data-target="#login_modal">Login</a>
                                                </li>--%>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- end .author-area -->

                                    <div class="menu-container order-lg-1 order-sm-0">
                                        <div class="d_menu">
                                            <nav class="navbar navbar-expand-lg mainmenu__menu">
                                                <div class="offcanvas-menu  collapse navbar-collpase">

                                                    <ul class="nav navbar-nav">

                                                        <li class="nav-item dropdown ml-auto">
                                                            <a href="#" class="nav-link dropdown-toggle" id="navbarDropDownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                <%--                                                                <img src="img/author-avatar.png" alt="" class="rounded-circle img-fluid">--%>
                                                            </a>
                                                            <div class="dropdown-menu" aria-labelledby="navbarDropDownMenuLink">
                                                                <a class="dropdown-item" href="#">Dashboard</a>
                                                                <a class="dropdown-item" href="#">Settings</a>
                                                                <div class="dropdown-divider"></div>
                                                                <a class="dropdown-item" href="#">Logout</a>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </div>
                                                <!-- ends: .author-info -->
                                                <!-- /.navbar-collapse -->
                                            </nav>
                                        </div>
                                    </div>


                                    <!-- end .author-area -->

                                </div>
                                <!-- ends: .author-info -->

                                <!-- end .author-area -->

                            </div>
                            <!-- ends: .offcanvas-menu -->
                        </div>
                        <!-- ends: .menu-right -->
                    </div>
                </div>
            </div>
            <!-- end /.row -->
        </div>
        <!-- end /.container -->
    </section>

    <div class="section-bg property-title">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 property-action">
                    <div class="atbd_content_module  title-padding action ">

                        <asp:Label ID="titleLbl" runat="server" Text="Title: " />
                        <%--                        <a href="" class="atbdp-favourites text-right action-space"><span class="la la-heart-o"></span>Save</a>--%>

                        <asp:Label ID="cityLbl" runat="server" Text="" />
                        <asp:Label ID="homeStateLbl" runat="server" Text="Home State" />
                        <asp:Label ID="zipCodeLbl" runat="server" Text="ZipCode" />



                        <%--                        <a href="" class="action-space" data-toggle="modal" data-target="#atbdp-report-abuse-modal"><span class="la la-flag-o"></span>Report</a>--%>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="atbdp-report-abuse-modal" tabindex="-1" role="dialog" aria-hidden="true" aria-labelledby="atbdp-report-abuse-modal-label">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <form action="/" id="atbdp-report-abuse-form" class="form-vertical">
                    <div class="modal-header">
                        <h3 class="modal-title" id="atbdp-report-abuse-modal-label">Report Abuse</h3>
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span></button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="atbdp-report-abuse-message" class="not_empty">Your Complaint<span class="atbdp-star">*</span></label>
                            <textarea class="form-control" id="atbdp-report-abuse-message" rows="4" placeholder="Message..." required=""></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-secondary btn-sm">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <section class="directory_listiing_detail_area single_area section-bg property-padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">

                    <div class="atbd_content_module atbd_listing_gallery">
                        <div class="atbd_content_module__tittle_area">
                            <div class="atbd_area_title">
                                <h4><span class="la la-image"></span>Gallery</h4>
                            </div>
                        </div>
                        <div class="atbdb_content_module_contents">
                            <div class="gallery-wrapper">
                                <div class="gallery-images">
                                    <div class="container">
                                        <asp:Image ID="propertyImage1" runat="server" Height="371px" Width="381px" />
                                        <asp:Image ID="propertyImage2" runat="server" Height="373px" Width="250px" />
                                        <asp:Image ID="propertyImage3" runat="server" Width="325px" />
                                        <asp:Image ID="propertyImage4" runat="server" Height="369px" Width="321px" />
                                    </div>
                                </div>
                                <!-- ends: .gallery-images -->
                                <div class="gallery-thumbs">
                                    <div class="single-thumb">
                                        <img src="img/gt1.jpg" alt="">
                                    </div>
                                    <div class="single-thumb">
                                        <img src="img/gt2.jpg" alt="">
                                    </div>
                                    <div class="single-thumb">
                                        <img src="img/gt3.jpg" alt="">
                                    </div>
                                    <div class="single-thumb">
                                        <img src="img/gt4.jpg" alt="">
                                    </div>
                                    <div class="single-thumb">
                                        <img src="img/gt5.jpg" alt="">
                                    </div>
                                    <div class="single-thumb">
                                        <img src="img/gt3.jpg" alt="">
                                    </div>
                                </div>
                                <!-- ends: .gallery-thumbs -->
                            </div>
                            <!-- ends: .gallery-wrapper -->


                        </div>
                    </div>
                    <!-- ends: .atbd_content_module -->

                    <div class="atbd_content_module atbd_listing_details">
                        <div class="atbd_content_module__tittle_area">
                            <div class="atbd_area_title">
                                <h4><span class="la la-file-text-o"></span>Property Description</h4>
                            </div>
                        </div>
                        <div class="atbdb_content_module_contents">
                            <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa kequi officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusan tium dolorem que laudantium, totam rem aperiam the eaque ipsa quae abillo was inventore veritatis keret quasi aperiam architecto beatae vitae dicta sunt explicabo. Nemo ucxqui officia voluptatem accu santium doloremque laudantium, totam rem ape dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas.</p>
                        </div>
                    </div>
                    <!-- ends: .atbd_content_module -->



                    <div class="atbd_content_module atbd_review_module">
                        <div class="atbd_content_module__tittle_area">
                            <div class="atbd_area_title">
                                <h4><span class="la la-star-o"></span>2 Reviews</h4>
                                <%--                                <label for="review_content" class="btn btn-secondary btn-icon-left btn-sm not_empty" data-toggle="modal" data-target="#review_modal"><span class="la la-star-o"></span>Add a review</label>--%>
                            </div>
                        </div>
                        <div class="atbdb_content_module_contents">
                            <div id="client_review_list">
                                <div class="atbd_single_review atbdp_static">
                                    <div class="atbd_review_top">
                                        <div class="atbd_avatar_wrapper">
                                            <div class="atbd_review_avatar">
                                                <img alt="" src="img/review-author-thumb.jpg" class="avatar avatar-32 photo">
                                            </div>
                                            <div class="atbd_name_time">
                                                <p>Mark Rose</p>
                                                <span class="review_time">6 hours ago</span>
                                            </div>
                                        </div>
                                        <div class="atbd_rated_stars">
                                            <ul>
                                                <li><span class="rate_active"></span></li>
                                                <li><span class="rate_active"></span></li>
                                                <li><span class="rate_active"></span></li>
                                                <li><span class="rate_active"></span></li>
                                                <li><span class="rate_disable"></span></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="review_content">
                                        <p>Lacinia eget consectetur sed, convallis at tellus. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Curabitur non nulla sit amet nisl tempus</p>
                                    </div>


                                </div>
                                <!-- ends:.atbd_single_review -->
                                <div class="atbd_single_review atbdp_static">
                                    <div class="atbd_review_top">
                                        <div class="atbd_avatar_wrapper">
                                            <div class="atbd_review_avatar">
                                                <img alt="" src="img/review-author-thumb3.jpg" class="avatar avatar-32 photo">
                                            </div>
                                            <div class="atbd_name_time">
                                                <p>Conrad Jane</p>
                                                <span class="review_time">6 hours ago</span>
                                            </div>
                                        </div>
                                        <div class="atbd_rated_stars">
                                            <ul>
                                                <li><span class="rate_active"></span></li>
                                                <li><span class="rate_active"></span></li>
                                                <li><span class="rate_active"></span></li>
                                                <li><span class="rate_active"></span></li>
                                                <li><span class="rate_active"></span></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="review_content">
                                        <p>Lacinia eget consectetur sed, convallis at tellus. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Curabitur non nulla sit amet nisl tempus</p>
                                    </div>

                                </div>
                                <!-- ends: .atbd_single_review -->
                            </div>
                            <!-- ends: .client_review_list -->
                        </div>
                    </div>
                    <!-- ends: .atbd_content_module -->



                </div>

                <div class="modal" id="review_modal" tabindex="-1" role="dialog" aria-labelledby="review_modal_label" aria-hidden="true">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content ">
                            <div class="modal-header">
                                <h3 class="modal-title" id="review_modal"><span class="la la-star"></span>Add a Review</h3>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="atbdb_content_module_contents atbd_give_review_area">
                                    <div class="atbd_notice alert alert-info" role="alert">
                                        <span class="la la-info" aria-hidden="true"></span>
                                        You need to <a href="">Login</a> or <a href="">Register</a> to submit a review
                                    </div>
                                    <!-- ends: .atbd_notice -->
                                    <form action="/" id="atbdp_review_form" method="post">
                                        <div class="atbd_review_rating_area">
                                            <!--It should be displayed on the left side -->
                                            <div class="atbd_review_update_rating">
                                                <span>Rating: </span>
                                                <div class="atbd_rating_stars">
                                                    <div class="br-wrapper br-theme-fontawesome-stars m-left-15">
                                                        <select class="give_rating">
                                                            <!-- now hidden -->
                                                            <option value="1">1</option>
                                                            <option value="2">2</option>
                                                            <option value="3">3</option>
                                                            <option value="4">4</option>
                                                            <option value="5">5</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- ends: .atbd_review_update_rating -->
                                        </div>
                                        <!-- ends: .atbd_review_rating_area -->
                                        <div class="form-group">
                                            <textarea name="content" id="review_content" class="form-control" placeholder="Message" required></textarea>
                                        </div>

                                        <button class="btn btn-primary" type="submit" id="atbdp_review_form_submit">Submit Review</button>
                                        <!-- submit button -->
                                    </form>
                                </div>
                                <!-- ends: .atbd_give_review_area -->

                            </div>

                        </div>
                    </div>
                </div>

                <!-- begin: side information -->
                <div class="col-lg-4 mt-5 mt-lg-0">
                    <div class="widget atbd_widget widget-card">
                        <div class="atbd_widget_title">
                            <h4><span class="la la-user"></span>Host Info</h4>
                        </div>
                        <!-- ends: .atbd_widget_title -->
                        <div class="widget-body atbd_author_info_widget">
                            <div class="atbd_avatar_wrapper">
                                <div class="atbd_review_avatar">
<%--                                    <img src="img/avatar-60x60.jpg" alt="Avatar Image">--%>
                                </div>
                                <div class="atbd_name_time">
                                    <h4>Name<span class="verified" data-toggle="tooltip" data-placement="top" title="Verified"></span></h4>
                                    <span class="review_time">Posted 6 days ago</span>
                                </div>
                            </div>
                            <!-- ends: .atbd_avatar_wrapper -->
                            <asp:Button CssClass="btn btn-primary btn-block" runat="server" Text="Message" OnClick="message_OnClick" />
                            <asp:Button CssClass="btn btn-primary btn-block" runat="server" Text="Save to Favorites" OnClick="SavetoFav_OnClick" />

                        </div>
                        <!-- ends: .widget-body -->
                    </div>
                    <!-- ends: .widget -->



                   

                    <div class="modal" id="amenities_modal" tabindex="-1" role="dialog" aria-labelledby="amenities_modal_label" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
<%--                                    <h1 class="modal-title" id="amenities_modal">Amenities</h1>--%>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <%--<h4>Basic</h4>
                                    <ul class="list-unstyled amenities-list">
                                    </ul>--%>
                                    <%--<h4>Safety Measures</h4>
                                    <ul class="list-unstyled amenities-list">
                                        <li>Smoke Detector
                                        </li>
                                        <li>Carbon Monoxide Detector
                                        </li>
                                        <li>Fire Extinguisher
                                        </li>
                                        <li>First Aid Kit
                                        </li>
                                    </ul>--%>
                                </div>

                            </div>
                        </div>
                    </div>

                    <div class="widget atbd_widget widget-card">
                        <div class="atbd_widget_title">
                            <h4><span class="la la-map-marker"></span>Amenities Available: </h4>
                        </div>
                        <!-- ends: .atbd_widget_title -->
                        <div class="widget-body atbdb_content_module_contents">
                            <div class="map" id="map-two"></div>

<%--                            <div class="item-container">--%>
<%--                                <div id="amenitiesLbl" runat="server" text="Amenities: " visible="false">--%>
                                    <br />
<%--                                    <h3>Ameneties: </h3>--%>
                                    <asp:Label ID="airConditioningLbl" runat="server" Text="Air Conditioning " Visible="false"></asp:Label> </br>
                                    <asp:Label ID="heatingLbl" runat="server" Text="Heating " Visible="false"></asp:Label></br>
                                    <asp:Label ID="onSiteLaundryLbl" runat="server" Text="On Site Laundry " Visible="false"></asp:Label></br>
                                    <asp:Label ID="parkingLbl" runat="server" Text="Parking " Visible="false"></asp:Label></br>
                                    <asp:Label ID="furnishedLbl" runat="server" Text="Furnished " Visible=" false"></asp:Label></br>
                                    <asp:Label ID="petFriendlyLbl" runat="server" Text="Pet Friendly " Visible="false"></asp:Label></br>
                                    <asp:Label ID="carbonMonoxideDetectorLbl" runat="server" Text="Carbon Monoxide Detector " Visible="false"></asp:Label></br>
                                    <asp:Label ID="smokeDetectorLbl" runat="server" Text="Smoke Detector " Visible="false"></asp:Label></br>
                                    <asp:Label ID="seperateEntranceLbl" runat="server" Text="Seperate Entrance " Visible="false"></asp:Label></br>
                                    <asp:Label ID="wifiLbl" runat="server" Text="WiFi " Visible="false"></asp:Label></br>
                                    <asp:Label ID="tvLbl" runat="server" Text="TV " Visible="false"></asp:Label></br>
                                    <asp:Label ID="seperateBathroomLbl" runat="server" Text="Seperate Bathroom " Visible="false"></asp:Label></br>
<%--                                </div>--%>
                                <br />
<%--                            </div>--%>
                            <!-- ends: .atbdb_content_module_contents -->
                        </div>

                         <div class="widget atbd_widget widget-card">
                        <div class="atbd_widget_title">
                            <h4><span class="la la-bookmark"></span>Property Room Details: </h4>
                        </div>
                        <!-- ends: /.atbd_widget_title -->
                        <div class="widget-body atbdp-widget-categories">
                            <ul class="atbdp_parent_category">
                                <li>
                                    <div class="item-section">
                                        <asp:Label runat="server" Text="Rent Price: "></asp:Label>
                                        <asp:Label ID="rentPriceLbl" runat="server"></asp:Label>
                                    </div>
                                </li>
                                <li>
                                    <div class="item-section">
                                        <asp:Label runat="server" Text="Start Date: "></asp:Label>
                                        <asp:Label ID="startDateLbl" runat="server"></asp:Label>
                                    </div>
                                </li>
                                <li>
                                    <div class="item-section">
                                        <asp:Label runat="server" Text="End Date: "></asp:Label>
                                        <asp:Label ID="endDateLbl" runat="server"></asp:Label>
                                    </div>
                                </li>
                                <li>
                                    <div class="item-section">
                                        <asp:Label runat="server" Text="Available Bathrooms: "></asp:Label>
                                        <asp:Label ID="availableBathroomsLbl" runat="server"></asp:Label>
                                    </div>
                                </li>
                                <li>
                                    <div class="item-section">
                                        <asp:Label ID="descriptionsLbl" runat="server"></asp:Label>
                                    </div>
                                </li>
                                <li>
                                    <div class="item-section">
                                        <asp:Label runat="server" Text="Number of Stars: "></asp:Label>
                                        <asp:Label ID="numStarsLbl" runat="server"></asp:Label>
                                    </div>
                                </li>
                            </ul>
                            <ul class="list-unstyled amenities-list">
                                <li>
                                    <div class="item-section">
                                        <asp:Label runat="server" Text="Last Updated: "></asp:Label>
                                        <asp:Label ID="lastUpdatedLbl" runat="server"></asp:Label>
                                    </div>

                                </li>
                            </ul>
                        </div>
                        <!-- ends: .atbdp -->
                    </div>
                    <!-- ends: .widget -->
                        <!-- ends: widget -->


                    </div>
                </div>
            </div>
    </section>
    <!-- ends: .directory_listiing_detail_area -->

    <!-- begin footer -->
    <footer class="footer-three footer-grey footer-links">
        <div class="footer-top">
            <div class="container">
                <div class="row">

                    <div class="col-lg-3 ">
                        <div class="widget widget_pages">
                            <h2 class="widget-title">Company Info</h2>
                            <ul class="list-unstyled">
                                <li class="page-item"><a href="">About Us</a></li>
                                <li class="page-item"><a href="">Conact Us</a></li>
                                <li class="page-item"><a href="">Terms</a></li>
                                <li class="page-item"><a href="">Privacy Policy</a></li>
                            </ul>
                        </div>
                    </div>
                    <!-- ends: .col-lg-3 -->

                    <div class="col-lg-3 ">
                        <div class="widget widget_pages">
                            <h2 class="widget-title">Helpful Links</h2>
                            <ul class="list-unstyled">
                                <li class="page-item"><a href="">Sign In</a></li>
                                <li class="page-item"><a href="">FAQ</a></li>
                            </ul>
                        </div>
                    </div>
                    <!-- ends: .col-lg-3 -->

                    <div class="col-lg-3 ">
                        <div class="widget widget_social">
                            <h2 class="widget-title">Connect with Us</h2>
                            <ul class="list-unstyled social-list">
                                <li><a href=""><span class="mail"><i class="la la-envelope"></i></span>Contact Support</a></li>
                                <li><a href="https://www.instagram.com/roommagnet/"><span class="instagram"><i class="fab fa-instagram"></i></span>Instagram</a></li>
                            </ul>
                        </div>
                        <!-- ends: .widget -->
                    </div>
                    <!-- ends: .col-lg-3 -->

                    <div class="col-lg-3 ">
                        <div class="footer-logo">
                            <img src="img/rm/logo-2.png">
                        </div>
                        <!-- ends: .widget -->
                    </div>
                    <!-- ends: .col-lg-3 -->

                </div>
            </div>
        </div>
        <!-- ends: .footer-top -->
        <div class="footer-bottom">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="footer-bottom--content">
                            <div class="col-lg-4">
                            </div>

                            <div class="col-lg-4 align-items-center mx-auto text-center">
                                <p class="m-0 copy-text">©2019 RoomMagnet</p>
                                <img src="img/rm/luminous-trans-small.png">
                            </div>

                            <div class="col-lg-4">
                                <ul class="list-unstyled lng-list">
                                    <li><a href="">English</a></li>
                                </ul>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ends: .footer-bottom -->
    </footer>
    <!-- ends: .footer -->
    <div class="modal fade" id="login_modal" tabindex="-1" role="dialog" aria-labelledby="login_modal_label" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="login_modal_label"><i class="la la-lock"></i>Sign In</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="/" id="login-form">
                        <input type="text" class="form-control" placeholder="Username or Email" required>
                        <input type="password" class="form-control" placeholder="Password" required>
                        <div class="keep_signed custom-control custom-checkbox checkbox-outline checkbox-outline-primary">
                            <input type="checkbox" class="custom-control-input" name="keep_signed_in" value="1" id="keep_signed_in">
                            <label for="keep_signed_in" class="not_empty custom-control-label">Keep me signed in</label>
                        </div>
                        <button type="submit" class="btn btn-block btn-lg btn-gradient btn-gradient-two">Sign In</button>
                    </form>
                    <div class="form-excerpts">
                        <ul class="list-unstyled">
                            <li>Not a member? <a href="">Sign up</a></li>
                            <li><a href="">Recover Password</a></li>
                        </ul>
                        <div class="social-login">
                            <span>Or connect with</span>
                            <p><a href="" class="btn btn-outline-secondary"><i class="fab fa-facebook-f"></i>Facebook</a><a href="" class="btn btn-outline-danger"><i class="fab fa-google-plus-g"></i> Google</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="signup_modal" tabindex="-1" role="dialog" aria-labelledby="signup_modal_label" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="signup_modal_label"><i class="la la-lock"></i>Sign Up</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="/" id="signup-form">
                        <input type="email" class="form-control" placeholder="Email" required>
                        <input type="password" class="form-control" placeholder="Password" required>
                        <button type="submit" class="btn btn-block btn-lg btn-gradient btn-gradient-two">Sign Up</button>
                    </form>
                    <div class="form-excerpts">
                        <ul class="list-unstyled">
                            <li>Already a member? <a href="">Sign In</a></li>
                            <li><a href="">Recover Password</a></li>
                        </ul>
                        <div class="social-login">
                            <span>Or Signup with</span>
                            <p><a href="" class="btn btn-outline-secondary"><i class="fab fa-facebook-f"></i>Facebook</a><a href="" class="btn btn-outline-danger"><i class="fab fa-google-plus-g"></i> Google</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA0C5etf1GVmL_ldVAichWwFFVcDfa1y_c"></script>
        <!-- inject:js-->
        <script>
            $(document).ready(function () {
                $('[data-toggle="popover"]').popover();
            });
        </script>
        <script src="vendor_assets/js/jquery/jquery-1.12.3.js"></script>
        <script src="vendor_assets/js/bootstrap/popper.js"></script>
        <script src="vendor_assets/js/bootstrap/bootstrap.min.js"></script>
        <script src="vendor_assets/js/jquery-ui.min.js"></script>
        <script src="vendor_assets/js/jquery.barrating.min.js"></script>
        <script src="vendor_assets/js/jquery.counterup.min.js"></script>
        <script src="vendor_assets/js/jquery.magnific-popup.min.js"></script>
        <script src="vendor_assets/js/jquery.mCustomScrollbar.concat.min.js"></script>
        <script src="vendor_assets/js/jquery.waypoints.min.js"></script>
        <script src="vendor_assets/js/masonry.pkgd.min.js"></script>
        <script src="vendor_assets/js/owl.carousel.min.js"></script>
        <script src="vendor_assets/js/select2.full.min.js"></script>
        <script src="vendor_assets/js/slick.min.js"></script>
        <script src="theme_assets/js/locator.js"></script>
        <script src="theme_assets/js/main.js"></script>
        <script src="theme_assets/js/map.js"></script>
        <!-- endinject-->
</asp:Content>

