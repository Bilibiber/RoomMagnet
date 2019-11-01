<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="Message.aspx.cs" Inherits="WebPages_Message" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" Runat="Server">

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Direo Template</title>
    <link href="https://fonts.googleapis.com/css?family=Muli:400,400i,600,700" rel="stylesheet">
    <!-- inject:css-->
    <link rel="stylesheet" href="vendor_assets/css/bootstrap/bootstrap.css">
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
</head>

<body>
    <section class="header-breadcrumb bgimage overlay overlay--dark">
        <div class="bg_image_holder"><img src="img/breadcrumb1.jpg" alt=""></div>
        <div class="mainmenu-wrapper">
            <div class="menu-area menu1 menu--light">
                <div class="top-menu-area">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="menu-fullwidth">
                                    <div class="logo-wrapper order-lg-0 order-sm-1">
                                        <div class="logo logo-top">
                                            <a href="index.html"><img src="img/logo-white.png" alt="logo image" class="img-fluid"></a>
                                        </div>
                                    </div><!-- ends: .logo-wrapper -->
                                    <div class="menu-container order-lg-1 order-sm-0">
                                        <div class="d_menu">
                                            <nav class="navbar navbar-expand-lg mainmenu__menu">
                                                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#direo-navbar-collapse" aria-controls="direo-navbar-collapse" aria-expanded="false" aria-label="Toggle navigation">
                                                    <span class="navbar-toggler-icon icon-menu"><i class="la la-reorder"></i></span>
                                                </button>
                                                <!-- Collect the nav links, forms, and other content for toggling -->
                                                <div class="collapse navbar-collapse" id="direo-navbar-collapse">
                                                    <ul class="navbar-nav">
                                                        <li>
                                                            <a href="index.html">Home</a>
                                                        </li>
                                                        <li class="dropdown has_dropdown">
                                                            <a href="#" class="dropdown-toggle" id="drop3" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Listings</a>
                                                            <ul class="dropdown-menu" aria-labelledby="drop3">
                                                                <li><a href="all-listings-grid.html">Listing Grid</a></li>
                                                                <li><a href="all-listings-list.html">Listing List</a></li>
                                                                <li><a href="listing-details.html">Listing Details</a></li>
                                                                <li><a href="add-listing.html">Add Listing</a></li>
                                                            </ul>
                                                        </li>
                                                        <li class="dropdown has_dropdown">
                                                            <a href="#" class="dropdown-toggle" id="drop4" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Categories</a>
                                                            <ul class="dropdown-menu" aria-labelledby="drop4">
                                                                <li><a href="all-categories.html">All Categories</a></li>
                                                                <li><a href="all-locations.html">All Locations</a></li>
                                                            </ul>
                                                        </li>
                                                        <li class="dropdown has_dropdown">
                                                            <a class="dropdown-toggle" href="#" id="drop2" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                Pages
                                                            </a>
                                                            <ul class="dropdown-menu" aria-labelledby="drop2">
                                                                <li><a href="author-profile.html">Author Profile</a></li>
                                                                <li><a href="dashboard-listings.html">Author Dashboard</a></li>
                                                                <li><a href="pricing-plans.html">Pricing Plans</a></li>
                                                                <li><a href="checkout.html">Checkout</a></li>
                                                                <li><a href="invoice.html">Invoice</a></li>
                                                                <li><a href="faqs.html">FAQ</a></li>
                                                                <li><a href="about.html">About</a></li>
                                                                <li><a href="contact.html">Contact</a></li>
                                                                <li><a href="cards.html">Products Cards</a></li>
                                                                <li><a href="headers.html">Header Styles</a></li>
                                                            </ul>
                                                        </li>
                                                        <li class="dropdown has_dropdown">
                                                            <a class="dropdown-toggle" href="#" id="drop1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                Blog
                                                            </a>
                                                            <ul class="dropdown-menu" aria-labelledby="drop1">
                                                                <li><a href="blog-right-sidebar.html">Blog Right Sidebar</a></li>
                                                                <li><a href="blog-grid.html">Blog Grid Layout</a></li>
                                                                <li><a href="blog-details-standard.html">Blog Details</a></li>
                                                                <!-- dropdowns example -->
                                                                <li class="dropdown-menu--inner">
                                                                    <a href="#">Dropdown Levels</a>
                                                                    <ul class="list-unstyled">
                                                                        <li><a href="">Places</a></li>
                                                                        <li><a href="">Shop</a></li>
                                                                        <li><a href="">Business</a></li>
                                                                    </ul>
                                                                </li>
                                                            </ul>
                                                        </li>
                                                    </ul>
                                                </div>
                                                <!-- /.navbar-collapse -->
                                            </nav>
                                        </div>
                                    </div>
                                    <div class="menu-right order-lg-2 order-sm-2">
                                        <div class="search-wrapper">
                                            <div class="nav_right_module search_module">
                                                <span class="icon-left" id="basic-addon9"><i class="la la-search"></i></span>
                                                <div class="search_area">
                                                    <form action="/">
                                                        <div class="input-group input-group-light">
                                                            <input type="text" class="form-control search_field top-search-field" placeholder="What are you looking for?" autocomplete="off">
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                            <div class="search-categories">
                                                <ul class="list-unstyled">
                                                    <li><a href=""><span class="la la-glass bg-danger"></span> Food & Drinks</a></li>
                                                    <li><a href=""><span class="la la-cutlery bg-primary"></span> Restaurants</a></li>
                                                    <li><a href=""><span class="la la-map-marker bg-success"></span> Places</a></li>
                                                    <li><a href=""><span class="la la-shopping-cart bg-secondary"></span> Shopping & Store</a></li>
                                                    <li><a href=""><span class="la la-bed bg-info"></span> Hotels</a></li>
                                                    <li><a href=""><span class="la la-bank bg-warning"></span> Art & History</a></li>
                                                </ul>
                                            </div>
                                        </div><!-- ends: .search-wrapper -->
                                        <!-- start .author-area -->
                                        <div class="author-area">
                                            <div class="author__access_area">
                                                <ul class="d-flex list-unstyled align-items-center">
                                                    <li>
                                                        <a href="add-listing.html" class="btn btn-xs btn-gradient btn-gradient-two">
                                                            <span class="la la-plus"></span> Add Listing
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="" class="access-link" data-toggle="modal" data-target="#login_modal">Login</a>
                                                        <span>or</span>
                                                        <a href="" class="access-link" data-toggle="modal" data-target="#signup_modal">Register</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <!-- end .author-area -->
                                        <div class="offcanvas-menu d-none">
                                            <a href="" class="offcanvas-menu__user"><i class="la la-user"></i></a>
                                            <div class="offcanvas-menu__contents">
                                                <a href="" class="offcanvas-menu__close"><i class="la la-times-circle"></i></a>
                                                <div class="author-avatar">
                                                    <img src="img/author-avatar.png" alt="" class="rounded-circle">
                                                </div>
                                                <ul class="list-unstyled">
                                                    <li><a href="dashboard-listings.html">My Profile</a></li>
                                                    <li><a href="dashboard-listings.html">My Listing</a></li>
                                                    <li><a href="dashboard-listings.html">Favorite Listing</a></li>
                                                    <li><a href="add-listing.html">Add Listing</a></li>
                                                    <li><a href="">Logout</a></li>
                                                </ul>
                                                <div class="search_area">
                                                    <form action="/">
                                                        <div class="input-group input-group-light">
                                                            <input type="text" class="form-control search_field" placeholder="Search here..." autocomplete="off">
                                                        </div>
                                                        <button type="submit" class="btn btn-sm btn-secondary">Search</button>
                                                    </form>
                                                </div><!-- ends: .search_area -->
                                            </div><!-- ends: .author-info -->
                                        </div><!-- ends: .offcanvas-menu -->
                                    </div><!-- ends: .menu-right -->
                                </div>
                            </div>
                        </div>
                        <!-- end /.row -->
                    </div>
                    <!-- end /.container -->
                </div>
                <!-- end  -->
            </div>
        </div><!-- ends: .mainmenu-wrapper -->
        <div class="breadcrumb-wrapper content_above">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <h1 class="page-title">FAQs</h1>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">All Listings</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div><!-- ends: .breadcrumb-wrapper -->
    </section>
    <section class="faq-wrapper section-padding border-bottom">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>Your Questions Answered</h2>
                        <p>Eiusmod temporeum dicant partem scripserit</p>
                    </div>
                </div><!-- ends: .col-lg-12 -->
                <div class="col-lg-12">
                    <div class="faq-contents">
                        <div class="atbd_content_module atbd_faqs_module">
                            <div class="atbd_content_module__tittle_area">
                                <div class="atbd_area_title">
                                    <h4><span class="la la-question-circle"></span>Lisiitng FAQ's</h4>
                                </div>
                            </div>
                            <div class="atbdb_content_module_contents">
                                <div class="atbdp-accordion">
                                    <div class="accordion-single selected">
                                        <h3 class="faq-title"><a href="#">How to open an account?</a></h3>
                                        <p class="ac-body" style="display: block;">Excepteur sint occaecat cupidatat non proident, sunt in culpa kequi officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusan tium doloremque laudantium, totam rem aperiam the eaque ipsa quae abillo was inventore veritatis keret quasi aperiam architecto beatae vitae dicta sunt explicabo. Nemo ucxqui officia voluptatem accusantium.</p>
                                    </div>
                                    <div class="accordion-single">
                                        <h3 class="faq-title"><a href="#">How to add listing?</a></h3>
                                        <p class="ac-body" style="display: none;">Ensuring productivity and growth is essential for architecture and engineering teams. The industry requires a high.</p>
                                    </div>
                                    <div class="accordion-single">
                                        <h3 class="faq-title"><a href="#">What is featured listing?</a></h3>
                                        <p class="ac-body" style="display: none;">Ensuring productivity and growth is essential for architecture and engineering teams. The industry requires a high.</p>
                                    </div>
                                    <div class="accordion-single">
                                        <h3 class="faq-title"><a href="#">How to add listing?</a></h3>
                                        <p class="ac-body" style="display: none;">Ensuring productivity and growth is essential for architecture and engineering teams. The industry requires a high.</p>
                                    </div>
                                    <div class="accordion-single">
                                        <h3 class="faq-title"><a href="#">What is featured listing?</a></h3>
                                        <p class="ac-body" style="display: none;">Ensuring productivity and growth is essential for architecture and engineering teams. The industry requires a high.</p>
                                    </div>
                                </div>
                            </div>
                        </div><!-- ends: .atbd_content_module -->
                    </div><!-- ends: .faq-contents -->
                </div><!-- ends: .col-lg-12 -->
            </div>
        </div>
    </section><!-- ends: .faq-wrapper -->
    <footer class="footer-three footer-grey p-top-95">
        <div class="footer-top p-bottom-25">
            <div class="container">
                <div class="row">
                    <div class="col-lg-2 col-sm-6">
                        <div class="widget widget_pages">
                            <h2 class="widget-title">Company Info</h2>
                            <ul class="list-unstyled">
                                <li class="page-item"><a href="">About Us</a></li>
                                <li class="page-item"><a href="">Conact Us</a></li>
                                <li class="page-item"><a href="">Our Listings</a></li>
                                <li class="page-item"><a href="">Our Pricings</a></li>
                                <li class="page-item"><a href="">Support</a></li>
                                <li class="page-item"><a href="">Privacy Policy</a></li>
                            </ul>
                        </div>
                    </div><!-- ends: .col-lg-3 -->
                    <div class="col-lg-3 d-flex justify-content-lg-center  col-sm-6">
                        <div class="widget widget_pages">
                            <h2 class="widget-title">Helpful Links</h2>
                            <ul class="list-unstyled">
                                <li class="page-item"><a href="">Join Direo</a></li>
                                <li class="page-item"><a href="">Sign In</a></li>
                                <li class="page-item"><a href="">How it Work</a></li>
                                <li class="page-item"><a href="">Advantages</a></li>
                                <li class="page-item"><a href="">Direo App</a></li>
                                <li class="page-item"><a href="">Packages</a></li>
                            </ul>
                        </div>
                    </div><!-- ends: .col-lg-3 -->
                    <div class="col-lg-3 col-sm-6">
                        <div class="widget widget_social">
                            <h2 class="widget-title">Connect with Us</h2>
                            <ul class="list-unstyled social-list">
                                <li><a href=""><span class="mail"><i class="la la-envelope"></i></span> Contact Support</a></li>
                                <li><a href=""><span class="twitter"><i class="fab fa-twitter"></i></span> Twitter</a></li>
                                <li><a href=""><span class="facebook"><i class="fab fa-facebook-f"></i></span> Facebook</a></li>
                                <li><a href=""><span class="instagram"><i class="fab fa-instagram"></i></span> Instagram</a></li>
                                <li><a href=""><span class="gplus"><i class="fab fa-google-plus-g"></i></span> Google+</a></li>
                            </ul>
                        </div><!-- ends: .widget -->
                    </div><!-- ends: .col-lg-3 -->
                    <div class="col-lg-4 col-sm-6">
                        <div class="widget widget_text">
                            <h2 class="widget-title">Direo on Mobile</h2>
                            <div class="textwidget">
                                <p>Download the Direo app today so you can find your events anytime, anywhere.</p>
                                <ul class="list-unstyled store-btns">
                                    <li><a href="" class="btn-gradient btn-gradient-two btn btn-md btn-icon icon-left"><span class="fab fa-apple"></span> App Store</a></li>
                                    <li><a href="" class="btn btn-dark btn-md btn-icon btn-icon"><span class="fab fa-android"></span> Google Play</a></li>
                                </ul>
                            </div>
                        </div><!-- ends: .widget -->
                    </div><!-- ends: .col-lg-3 -->
                </div>
            </div>
        </div><!-- ends: .footer-top -->
        <div class="footer-bottom">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="footer-bottom--content">
                            <a href="" class="footer-logo"><img src="img/logo.png" alt=""></a>
                            <p class="m-0 copy-text">©2019 Direo. Made with <span class="la la-heart-o"></span> by <a href="">Aazztech</a></p>
                            <ul class="list-unstyled lng-list">
                                <li><a href="">English</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div><!-- ends: .footer-bottom -->
    </footer><!-- ends: .footer -->
    <div class="modal fade" id="login_modal" tabindex="-1" role="dialog" aria-labelledby="login_modal_label" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="login_modal_label"><i class="la la-lock"></i> Sign In</h5>
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
                            <p><a href="" class="btn btn-outline-secondary"><i class="fab fa-facebook-f"></i> Facebook</a><a href="" class="btn btn-outline-danger"><i class="fab fa-google-plus-g"></i> Google</a></p>
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
                    <h5 class="modal-title" id="signup_modal_label"><i class="la la-lock"></i> Sign Up</h5>
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
                            <p><a href="" class="btn btn-outline-secondary"><i class="fab fa-facebook-f"></i> Facebook</a><a href="" class="btn btn-outline-danger"><i class="fab fa-google-plus-g"></i> Google</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA0C5etf1GVmL_ldVAichWwFFVcDfa1y_c"></script>
    <!-- inject:js-->
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
</body>

</html>

    </asp:Content>
