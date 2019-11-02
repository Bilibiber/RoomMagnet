<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="FAQ.aspx.cs" Inherits="WebPages_FAQ" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="Server">

    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>FAQ</title>
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
            <div class="bg_image_holder">
                <img src="img/rm/home-1.jpg" alt="home"></div>
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
                                                    <img src="img/rm/logo-2.png" alt="logo image" class="img-fluid"></a>
                                            </div>
                                        </div>
                                        <!-- ends: .logo-wrapper -->
                                        <div class="menu-container order-lg-1 order-sm-0">
                                            <div class="d_menu">
                                                <nav class="navbar navbar-expand-lg mainmenu__menu">
                                                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#direo-navbar-collapse" aria-controls="direo-navbar-collapse" aria-expanded="false" aria-label="Toggle navigation">
                                                        <span class="navbar-toggler-icon icon-menu"><i class="la la-reorder"></i></span>
                                                    </button>
                                                    <!-- Collect the nav links, forms, and other content for toggling -->
                                                    <div class="collapse navbar-collapse" id="direo-navbar-collapse">
                                                        <ul class="navbar-nav">


                                                            <!-- /.navbar-collapse -->
                                                </nav>
                                            </div>
                                        </div>


                                        <!-- start .author-area -->
                                        <div class="author-area">
                                            <div class="author__access_area">
                                                <ul class="d-flex list-unstyled align-items-center">
                                                    <li>
                                                        <a href="about.html">About</a>
                                                    </li>
                                                    <li>
                                                        <a href="" class="btn btn-xs btn-gradient btn-gradient-two access-link" data-toggle="modal" data-target="#signup_modal">Sign Up</a>
                                                    </li>
                                                    <li>
                                                        <a href="" class="btn btn-xs btn-gradient btn-gradient-two access-link" data-toggle="modal" data-target="#login_modal">Login</a>

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
                                                </div>
                                                <!-- ends: .search_area -->
                                            </div>
                                            <!-- ends: .author-info -->
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
                                    <li class="breadcrumb-item active" aria-current="page">FAQ</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ends: .breadcrumb-wrapper -->
        </section>
        <section class="faq-wrapper section-padding border-bottom">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-title">
                            <h2>What can we help you with?</h2>
                        </div>
                    </div>
                    <!-- ends: .col-lg-12 -->
                    <div class="col-lg-12">
                        <div class="faq-contents">
                            <div class="atbd_content_module atbd_faqs_module">
                                <div class="atbd_content_module__tittle_area">
                                    <div class="atbd_area_title">
                                        <h4><span class="la la-question-circle"></span>FAQs</h4>
                                    </div>
                                </div>
                                <div class="atbdb_content_module_contents">
                                    <div class="atbdp-accordion">

                                        <!-- change questions at the h3 tags -->
                                        <!-- replace latin text with your answers -->

                                        <div class="accordion-single selected">
                                            <h3 class="faq-title"><a href="#">What makes RoomMagnet different?</a></h3>
                                            <p class="ac-body" style="display: block;">
                                                RoomMagnet provides an easy to use platform where pre-screened Tenants and Hosts come together, and in exchange for a 
                                            modest cost and/or in exchange for light domestic duties, enjoy reduced rent. It’s a win-win! Hosts monetize their extra living space and if they wish get a 
                                            little help around the house. Tenants enjoy affordable housing.
                                            </p>
                                        </div>
                                        <div class="accordion-single">
                                            <h3 class="faq-title"><a href="#">Who can use RoomMagnet?</a></h3>
                                            <p class="ac-body" style="display: block;">
                                                Roommagnet users must be at least 18 years of age and are seeking a minimum of 30 days stay in Host lodging. 
                                            While Roommagnet is open to all who meet their minimum requirements we specialize in connecting Hosts with professional and semi-professionals such as, 
                                            graduate students, international students, doctoral and nursing interns as well as college students seeking affordable off campus housing.
                                            </p>
                                        </div>
                                        
                                        <div class="accordion-single">
                                            <h3 class="faq-title"><a href="#">Who are host families?</a></h3>
                                            <p class="ac-body" style="display: block;">
                                                Host families are those who have room in their home, empty-nesters and people of advanced age who wish to age in place, 
                                            and wish to monetize their empty space. In cases where hosts are interested in getting a little help around the house and tenants are willing  provide assistance 
                                            with things such as light domestic or outdoor work, running errands, as well as companionship a further rent discount will be offered by the host and negotiated between host and tenant.
                                            </p>
                                        </div>
                                        <div class="accordion-single">
                                            <h3 class="faq-title"><a href="#">What is the advantage of a host family?</a></h3>
                                            <p class="ac-body" style="display: block;">
                                                Roommagnet connects host families who wish to share empty space in their home with responsible inter-generational adults who seek 
                                            affordable housing in order to continue their careers. These may be advanced college students, doctoral and nursing interns, international students or professionals. Host 
                                            families have the assurance that Tenants are carefully screened.  Hosts who need assistance with light domestic duties (i.e. shopping, household odd jobs, daily maintenance 
                                            or just companionship) will offer further discount for assistance.
                                            </p>
                                        </div>
                                        <div class="accordion-single">
                                            <h3 class="faq-title"><a href="#">Why is there a need for RoomMagnet?</a></h3>
                                            <p class="ac-body" style="display: block;">
                                                As the cost of housing increases and become more scare in highly populated areas, it becomes harder for responsible students, as well as 
                                            professional and semi-professionals (ie: doctoral interns, and interning nurses) to find suitable and affordable housing. Likewise, International students not only have the added 
                                            expense of international living, but also must adjust to the cultural landscape of the U.S., which living with a host family can greatly reduce.
                                            </p>
                                        </div>

                                        <div class="accordion-single">
                                            <h3 class="faq-title"><a href="#">What is RoomMagnet’s HomeshareSmarter® Living option?</a></h3>
                                            <p class="ac-body" style="display: block;">
                                                Tenants who are open to assisting host families with some basic chores like running errands, doing yard work or just providing companionship or
                                            personal assistance will receive a discount on their housing. We call this HomeShareSmarter® Living.
                                            </p>
                                        </div>

                                        <div class="accordion-single">
                                            <h3 class="faq-title"><a href="#">Who are RoomMagnet's advisors?</a></h3>
                                            <p class="ac-body" style="display: block;">
                                                Our advisors are available to assist hosts who would rather sit back and experience the benefits of the RoomMagnet program but not the hassle of 
                                            getting set up. E-mail us today and let us set up a personal meeting with one of our advisors to walk you through the process. It’s that easy!
                                            </p>
                                        </div>

                                        <div class="accordion-single">
                                            <h3 class="faq-title"><a href="#">What is RoomMagnet's background screening process?</a></h3>
                                            <p class="ac-body" style="display: block;">
                                                We require all RoomMagnet users ( Tenants and Hosts) who wish to connect on our platform  to initiate a background check. 
                                            We ask this so that our users feel secure in taking advantage of the benefits of RoomMagnet. Hosts or Tenants may request, and rely upon one or more consumer reports 
                                            or investigative consumer reports to determine a compatible living arrangement. Should either Host or Tenants not choose to initiate a background screen, 
                                            either party may continue to search the site to find a compatible match, however before a match is consummated a background screen must be initiated.
                                            </p>
                                        </div>

                                        <div class="accordion-single">
                                            <h3 class="faq-title"><a href="#">What is the cost of my criminal background check?</a></h3>
                                            <p class="ac-body" style="display: block;">
                                                RoomMagnet has selected a criminal background company that follows the Federal Credit Reporting Act (FCRA) regulations.
                                            The background information is obtained from the consumer reporting agency, IntelliCorp Records, Inc. which can be contacted by mail at 3000 Auburn Dr, Suite 410;Beachwood, OH 44122; 
                                            or phone: 1-888-946-8355; or website: www.intellicorp.net. The cost of securing your criminal background check with Intellicorp is $24.95. (Use this link to
                                            begin your criminal background check. Be sure to enter the password located below link:
                                            Intellicorp Records will provide a link to request copy of your background report once it is completed .
                                            </p>
                                        </div>

                                        <div class="accordion-single">
                                            <h3 class="faq-title"><a href="#">What is the cost of becoming part of the RoomMagnet community?</a></h3>
                                            <p class="ac-body" style="display: block;">
                                                RoomMagnet does not charge either Tenants or Hosts a fee to register, develop a profile, list a property or search.
                                            Upon a confirmed letter of intent, tenants will be required to pay the first and last month’s rent. RoomMagnet earns a match fee of one month’s rent once Host 
                                            and Tenants connect and initiate the company’s letter of intent indicating a desirable match and a start date for occupancy. Such commission will be deducted 
                                            from the first month’s base rental rate with the balance then forwarded to the host. On Lease agreements that are sixty (60) days or less Roommagnet will only require 
                                            a 30% commission of the total lease term rental.
                                            </p>
                                        </div>

                                        <div class="accordion-single">
                                            <h3 class="faq-title"><a href="#">Why do we use stripe to disperse our payments?</a></h3>
                                            <p class="ac-body" style="display: block;">
                                                Stripe is a recognized secure payment platform that works similar to Paypal in that it collects payments from RoomMagnet Renters
                                            (Tenants) and automatically disperses funds to Landlords (Hosts). In order for RoomMagnet to disperse funds, landlords (hosts) will need to set up a simple stripe account. 
                                            This will enable RoomMagnet to distribute funds directly and quickly to the account provided. 
                                            Stripe is a network with redundant security encryption, and all information is kept strictly confidential. For more information on stripe visit www.stripe.com.
                                            </p>
                                        </div>

                                        <div class="accordion-single">
                                            <h3 class="faq-title"><a href="#">How can I get involved with RoomMagnet?</a></h3>
                                            <p class="ac-body" style="display: block;">
                                                We are currently looking for people with strong writing skills to use their talents to write articles to be featured on
                                            www.RoomMagnet.com. Put your journalistic talents to the test by writing about topics that would appeal to our community. If you have a burning desire to vent on 
                                            social news, sports, college life, then let’s talk. Send us an e mail, tell us a little about yourself ,send us an example of your writing and we’ll get back to you. 
                                            And if you’re unsure about your writing, we have great people here at RoomMagnet that will help turn your pieces into first rate work. Come on! We’re waiting for you.
                                            </p>
<%--                                        </div>--%>
                                    </div>
                                </div>
                            </div>
                            <!-- ends: .atbd_content_module 
                        </div>
                        <!-- ends: .faq-contents -->
                    </div>
                    <!-- ends: .col-lg-12 -->
                </div>
            </div>
        </section>
        <!-- ends: .faq-wrapper -->

        <!-- begin footer -->
        <footer class="footer-three footer-grey footer-links">
            <div class="footer-top">
                <div class="container">
                    <div class="row">

                        <div class="col-lg-3 ">
                            <div class="widget widget_pages">
                                <h2 class="widget-title">Company Info</h2>
                                <ul class="list-unstyled">
                                    <li class="page-item"><a href="About.aspx">About Us</a></li>
                                    <li class="page-item"><a href="Contact.aspx">Conact Us</a></li>
                                    <li class="page-item"><a href="Terms.aspx">Terms</a></li>
                                    <li class="page-item"><a href="privacy.aspx">Privacy Policy</a></li>
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
        </div>
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

