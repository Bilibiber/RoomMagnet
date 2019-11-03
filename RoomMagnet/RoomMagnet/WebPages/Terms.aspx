<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="Terms.aspx.cs" Inherits="WebPages_Terms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">
    Terms & Conditions
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
        <title>Terms & Conditions</title>
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
                            <h1 class="page-title">Terms & Conditions</h1>
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Terms</li>
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
                        <h3>Heading</h3>
                    </div><!-- ends: .col-lg-12 -->
                    <div class="col-lg-12 privacy title">
                      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                      <p>Ultrices eros in cursus turpis. Commodo viverra maecenas accumsan lacus vel facilisis volutpat. Cras sed felis eget velit. Libero justo laoreet sit amet. Magna etiam tempor orci eu lobortis elementum nibh. Et magnis dis parturient montes nascetur. Laoreet non curabitur gravida arcu ac tortor. Sit amet aliquam id diam maecenas. Et leo duis ut diam quam. Iaculis at erat pellentesque adipiscing commodo elit at imperdiet dui. Vitae tortor condimentum lacinia quis vel eros donec ac odio. Risus viverra adipiscing at in tellus integer feugiat. Ut venenatis tellus in metus vulputate. Id aliquet lectus proin nibh nisl. Ultrices sagittis orci a scelerisque.</p>
                    </div>

                    <div class="col-lg-12">
                        <h3>Heading</h3>
                    </div><!-- ends: .col-lg-12 -->

                    <!-- use this if you need to add bullet points, if not delete -->
                    <div class="col-lg-12">
                      <ul>
                          <li>item 1</li>
                          <li>item 2</li>
                          <li>item3</li>
                        </ul>
                    </div>

                    <!-- use this if you need to add numbered lists, if not delete -->
                    <div class="col-lg-12">
                      <ol>
                        <li>item 1</li>
                        <li>item 2</li>
                        <li>item 3</li>
                      </ol>
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

