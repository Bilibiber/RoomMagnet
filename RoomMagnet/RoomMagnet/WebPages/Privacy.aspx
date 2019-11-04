<%@ Page Title="Privacy" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="Privacy.aspx.cs" Inherits="WebPages_Privacy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">
    RoomMagnet Privacy Policy
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
        <title>Privacy Policy</title>
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
            <div class="bg_image_holder"><img src="img/rm/home-5.jpg" alt="home"></div>
            

            <div class="breadcrumb-wrapper content_above">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 text-center">
                            <h1 class="page-title">Privacy Policy</h1>
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Privacy Policy</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div><!-- ends: .breadcrumb-wrapper -->
        </section>
        <section class=" section-padding border-bottom">
            <div class="container">
                <div class="row">

                    <!-- replace Heading with appropriate titles at the h3 tags -->
                    <!-- replace latin text with your text -->
                    <!-- add or delete any necesary sections -->


                    <div class="col-lg-12">
                        <h3>1. INTRODUCTION</h3>
                    </div><!-- ends: .col-lg-12 -->
                    <div class="col-lg-12 privacy title">
                      <p>Thank you for using RoomMagnet! Your trust is important to us and we are committed to protecting the privacy and security of your personal information. The information that's shared with us helps us to provide a great experience with RoomMagnet. We have a dedicated privacy team that is committed to protecting all the personal information we collect and help ensure that personal information is handled properly world wide.</p>
                      <p>This Privacy Policy describes how we collect, use, process, and disclose your personal information, in conjunction with your access to and use of the RoomMagnet Platform and Stripe Payment Services. This privacy policy describes our privacy practices for all websites, platforms, and services that link to it. Please read the privacy policy on the applicable site.</p>
                    </div>

                    <div class="col-lg-12">
                        <h3>2. ANALYZING COMMUNICATIONS</h3>
                    </div><!-- ends: .col-lg-12 -->
                    <div class="col-lg-12">
                      <p>We may review, scan, or analyze your communications on the RoomMagnet Platform for fraud prevention, risk assessment regulatory compliance, investigation, product development, research, analytics, and customer support purposes. For example, as part of our fraud prevention efforts, we scan and analyze messages to mask contact information and references to other websites. </p>
                      <p>In some cases, we may also scan, review, or analyze messages to debug, improve, and expand product offerings. We use automated methods where reasonably possible. However, occasionally we may need to manually review some communications, such as fraud investigations and customer support, or to assess and improve the functionality of these automated tools. We will not review, scan, or analyze your messaging communications to send third party messages to you, and we will not sell reviews or analyses of these communications.</p>
                    </div>
                </div>
            </div>
        </section><!-- ends: .faq-wrapper -->

        

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

