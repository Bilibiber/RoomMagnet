<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="ManageSearchProperties.aspx.cs" Inherits="WebPages_ManageSearchProperties" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Property Search Results
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">

    <body>
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

                                                </nav>
                                            </div>
                                        </div>



                                        <!-- start .author-area -->
                                        <div class="author-area">
                                            <div class="author__access_area">
                                                <ul class="d-flex list-unstyled align-items-center">

                                                    <li class="signup-padding">
                                                        <a href="" class="btn btn-xs btn-gradient btn-gradient-two access-link" data-toggle="modal" data-target="#signup_modal">Sign Up</a>
                                                    </li>
                                                    <li>
                                                        <a href="" class="btn btn-xs btn-gradient btn-gradient-two access-link" data-toggle="modal" data-target="#login_modal">Login</a>

                                                    </li>

                                                </ul>
                                            </div>
                                        </div>
                                        <!-- end .author-area -->
                                    </div>
                                </div>

                                <div class="atbd_listing_info">
                                    <div class="atbd_content_upper">
                                        <h4 class="atbd_listing_title">
                                            <a href="">Property 1</a>
                                        </h4>
                                        <div class="atbd_listing_meta">
                                            <span class="atbd_meta atbd_listing_rating">4.5<i class="la la-star"></i></span>
                                            <span class="atbd_meta atbd_listing_price">$1,100</span>
                                        </div>
                                        <!-- End atbd listing meta -->
                                        <div class="atbd_listing_data_list">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                        </div>
                                        <!-- End atbd listing meta -->
                                    </div>
                                    <!-- end .atbd_content_upper -->
                                    <div class="atbd_listing_bottom_content">
                                        <div class="atbd_content_left">
                                            <div class="atbd_listing_category">
                                                <a href=""><span class="la la-bed"></span>1 Bed</a>
                                                <a href=""><span class="la la-bath"></span>1 Bathroom</a>
                                            </div>
                                        </div>
                                        <ul class="atbd_content_right">
                                            <li>
                                                <div class="atbd_author atbd_author--thumb">
                                                    <a href="">
                                                        <img src="img/author-thumb2.jpg" alt="Author Image">
                                                        <span class="custom-tooltip">Name, Owner</span>
                                                    </a>
                                                    &nbsp;&nbsp;
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                    <!-- end .atbd_listing_bottom_content -->
                                </div>

                            </div>
                            <!-- end /.row -->
                        </div>
                        <!-- end /.container -->
                    </div>


                    <!-- end  -->
                </div>
            </div>
            <!-- ends: .mainmenu-wrapper -->
        </section>
    </body>

        <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Search Results</title>
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

</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="Body">
    <p>
        Amenities:
    </p>
    <p>
        Available:
    </p>
    <p>
        Reviews:
    </p>
    <p>
        &nbsp;
    </p>
</asp:Content>


