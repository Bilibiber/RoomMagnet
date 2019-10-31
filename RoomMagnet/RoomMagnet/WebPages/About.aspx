<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="WebPages_About" %>

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
    <title>About</title>
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
    <section class="about-wrapper bg-gradient-ps">
        <div class="mainmenu-wrapper">
            <div class="menu-area menu1">
                <div class="top-menu-area">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="menu-fullwidth">
                                    <div class="logo-wrapper order-lg-0 order-sm-1">
                                        <div class="logo logo-top">
                                            <a href="index.html"><img src="img/rm/logo-2.png" alt="logo image" class="img-fluid"></a>
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
        <div class="about-intro content_above">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-5 col-md-6">
                        <h1>Put call to action here to become a host</h1>
                        <a href="" class="btn btn-gradient btn-gradient-two">Become a Host</a>
                        </a>
                    </div>
                    <div class="col-lg-6 offset-lg-1 col-md-6 offset-md-0 col-sm-8 offset-sm-2">
                        <img src="img/about-illustration.png" alt="">
                    </div>
                </div>
            </div>
        </div><!-- ends: .about-intro -->
    </section><!-- ends: .intro-wrapper -->
    <section class="about-contents section-padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 contents-wrapper">
                    <div class="contents">
                        <div class="row align-items-center">
                            <div class="col-lg-5 col-sm-6">
                                <img src="img/about-img1.png" alt="">
                            </div>
                            <div class="col-lg-6 offset-lg-1 col-sm-6 mt-5 mt-md-0">
                                <h1>About Us</h1>
                                <p>
                                   Why did we create RoomMagnet?
                                   RoomMagnet brings together a solution to two social problems that are of major concern to society and continue to escalate internationally.
                                   The first is the cost of affordable housing. Costs for college students, interns and young professionals  continues to escalate at an alarming pace, making it more difficult to get a start on their careers.
                                   Secondly, older adults and empty-nesters, as they get older, wish to age in place, and often need additional income and at times assistance with light domestic duties such as shopping, household duties, daily maintenance or just companionship.
                                   Our goal is to bring professional and semi-professionals such as, graduate students, international students, doctoral and nursing interns as well as college students seeking affordable housing together with hosts who have extra room to share. 
                                   Students can do light housekeeping and chores in exchange for reduced rent, while hosts enjoy having help available and earning income from their extra living space.
                                   A common sense solution
                                   RoomMagnet connects tenants that have limited financial capital with hosts who wish to monetize their extra living space by having someone live in and assist either financially or in exchange for some light domestic duties.
                                   How does RoomMagnet bring together two vastly different groups of people? We accomplish this by providing a beautifully designed, fully functional digital platform that matches tenants with hosts, enabling them to form a mutually beneficial relationship.
                                   Tenants
                                   Everyone has a right to affordable living.
                                   Hosts
                                   We share the world and we share our space.
                                   Hosts develop lasting friendships, helping each other through the sharing economy
                                   It's a win-win
                                </p>
                            </div>
                        </div>
                    </div><!-- ends: .contents -->
                    <div class="contents">
                        <div class="row align-items-center">
                            <div class="col-lg-5 col-sm-6">
                                <h1>Why List on <span>RoomMagnet</span>?</h1>
                                <ul class="list-unstyled list-features p-top-15">
                                    <li>
                                        <div class="list-count"><span>1</span></div>
                                        <div class="list-content">
                                            <h4>reason 1</h4>
                                            <p>Excepteur sint occaecat cupidatat non proident sunt in culpa officia deserunt mollit.</p>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="list-count"><span>2</span></div>
                                        <div class="list-content">
                                            <h4>reason 2</h4>
                                            <p>Excepteur sint occaecat cupidatat non proident sunt in culpa officia deserunt mollit.</p>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="list-count"><span>3</span></div>
                                        <div class="list-content">
                                            <h4>reason 3</h4>
                                            <p>Excepteur sint occaecat cupidatat non proident sunt in culpa officia deserunt mollit.</p>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-lg-6 offset-lg-1 text-right col-sm-6 mt-5 mt-md-0">
                                <img src="img/about-img2.png" alt="">
                            </div>
                        </div>
                    </div><!-- ends: .contents -->
                </div><!-- ends: .content-block -->
            </div>
        </div>
    </section><!-- ends: .about-contents -->

    <!-- begin: footer -->
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
                      </div><!-- ends: .col-lg-3 -->

                      <div class="col-lg-3 ">
                          <div class="widget widget_pages">
                              <h2 class="widget-title">Helpful Links</h2>
                              <ul class="list-unstyled">
                                  <li class="page-item"><a href="">Sign In</a></li>
                                  <li class="page-item"><a href="">FAQ</a></li>
                              </ul>
                          </div>
                      </div><!-- ends: .col-lg-3 -->

                      <div class="col-lg-3 " >
                          <div class="widget widget_social">
                              <h2 class="widget-title">Connect with Us</h2>
                              <ul class="list-unstyled social-list">
                                  <li><a href=""><span class="mail"><i class="la la-envelope"></i></span> Contact Support</a></li>
                                  <li><a href="https://www.instagram.com/roommagnet/"><span class="instagram"><i class="fab fa-instagram"></i></span> Instagram</a></li>
                              </ul>
                          </div><!-- ends: .widget -->
                      </div><!-- ends: .col-lg-3 -->

                      <div class="col-lg-3 " >
                          <div class="footer-logo">
                              <img src="img/rm/logo-2.png">
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
      </div><!-- ends: .footer -->

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

