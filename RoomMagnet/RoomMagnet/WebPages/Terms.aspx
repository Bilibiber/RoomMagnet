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
                        <h3>Example Drug Free Statement</h3>
                    </div><!-- ends: .col-lg-12 -->
                    <div class="col-lg-12 privacy title">
                      <p>In consideration of the execution or renewal of a lease of the dwelling unit identified in the Rental/Lease Agreement, 
                          Owner/Agent and Resident agree as follows:1.Tenant 's, and any guest or other persons under the Resident ’s control shall 
                          not engage in criminal activity , including drug -related criminal activity , on or near property premises . "Drug-related criminal activity " 
                          means the illegal manufacture , sale, distribution , use, or possession with intent to manufacture, sell, distribute, or use of a controlled substance 
                          (as defined in section 102 of the Controlled Substance Act (21 U.S.C. 802)).2.Tenant, and any guest or other persons under the Tenant’s control shall not 
                          engage in any act intended to facilitate criminal activity, including drug-related criminal activity, on or near property premises.3.Tenant, guests or other 
                          persons under the Tenant 's controlwill not permit the dwelling unit to be used for, or to facilitate , criminal activity, including drug-related criminal activity, 
                          regardless of whether the individual engaging in such activity is a member of the household or a guest.4.Tenant and members of the household will not engage in the manufacture, 
                          sale, or distribution of illegal drugs at any location, on ornear premises and property or otherwise which includes the use of cannabis or medical cannabis. Host may terminate this 
                          agreement if tenant and/or guests engage in such activities and tenant's may be subject to charges, damages and eviction.5.Tenant, or a guest or other person under the Tenant's’s control 
                          shall not engage in acts of disruptive drunkenness,violence or threats of violence, including, but not limited to the unlawful discharge of firearms on or near property/premises.6.VIOLATION 
                          OF ANY OF THE ABOVE PROVISIONS SHALL BE A MATERIAL VIOLATION OF THE RENTALAGREEMENT AND GOOD CAUSE FOR TERMINATION OF TENANCY.A single violation of any of the provisions of this Addendum 
                          shall be deemed a serious and material violation of the Rental/Lease Agreement. It sunderstood and agreed that a single violation shall be good cause for termination of the Rental Agreement. 
                          Unless otherwise provided by law, proof of violation shall not require criminal conviction, but shall be by a preponderance of the evidence.7.In case of conflict between the provisions of this 
                          Addendum and any other provisions of the Rental Agreement, the provisions of this Addendum shall govern.8.This Addendum is incorporated into the Rental Agreement executed or renewed this day between 
                          Host and Tenant.Date___________________________Tenant____________________Date___________________________Host______________________</p>
                      <p></p>

                    </div>

                    <div class="col-lg-12">
                        <h3>Fair Housing Policy</h3>
                    </div><!-- ends: .col-lg-12 -->
                    <div class="col-lg-12 privacy title">
                   <p>The Fair HousingAct (Title VIII of the Civil Rights Act of 1968), prohibits discrimination in the rental of housing based on race, color, national origin, religion,handicap (disability),sex,
                    familial status (including children under the age of 18 living with parents of legal custodians, pregnant women, and people securing custody of children under the age of 18).We encourage all 
                    RoomMagnet users to comply, in all respects, with all laws, rules, and regulations regarding landlord and tenant, including the requirements imposed by the Fair Housing Act.</p>
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

