<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="Renter.aspx.cs" Inherits="WebPages_Renter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <%--renter update image--%>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <!------ Include the above in your HEAD tag ---------->

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

    <style type="text/css">
        .userimage {
            width: 200px;
            height: 180px;
            background-position: center center;
            background: url(http://cliquecities.com/assets/no-image-e3699ae23f866f6cbdf8ba2443ee5c4e.jpg);
            background-color: #fff;
            background-size: cover;
            background-repeat: no-repeat;
            display: inline-block;
            box-shadow: 0px -3px 6px 2px rgba(0,0,0,0.2);
        }

        /*upload images*/
        .preview-images-zone {
            width: 100%;
            border: 1px solid #ddd;
            min-height: 180px;
            /* display: flex; */
            padding: 5px 5px 0px 5px;
            position: relative;
            overflow: auto;
        }

            .preview-images-zone > .preview-image:first-child {
                height: 185px;
                width: 185px;
                position: relative;
                margin-right: 5px;
            }

            .preview-images-zone > .preview-image {
                height: 90px;
                width: 90px;
                position: relative;
                margin-right: 5px;
                float: left;
                margin-bottom: 5px;
            }

                .preview-images-zone > .preview-image > .image-zone {
                    width: 100%;
                    height: 100%;
                }

                    .preview-images-zone > .preview-image > .image-zone > img {
                        width: 100%;
                        height: 100%;
                    }

                .preview-images-zone > .preview-image > .tools-edit-image {
                    position: absolute;
                    z-index: 100;
                    color: #fff;
                    bottom: 0;
                    width: 100%;
                    text-align: center;
                    margin-bottom: 10px;
                    display: none;
                }

                .preview-images-zone > .preview-image > .image-cancel {
                    font-size: 18px;
                    position: absolute;
                    top: 0;
                    right: 0;
                    font-weight: bold;
                    margin-right: 10px;
                    cursor: pointer;
                    display: none;
                    z-index: 100;
                }

        .preview-image:hover > .image-zone {
            cursor: move;
            opacity: .5;
        }

        .preview-image:hover > .tools-edit-image,
        .preview-image:hover > .image-cancel {
            display: block;
        }

        .ui-sortable-helper {
            width: 90px !important;
            height: 90px !important;
        }

        .container {
            padding-top: 50px;
        }
    </style>

    <script type="text/javascript">
        function ShowPopup() {
            $("#btnShowPopup").click();
        }
    </script>
    <script>
        $(document).ready(function () {
            document.getElementById('pro-image').addEventListener('change', readImage, false);

            $(".preview-images-zone").sortable();

            $(document).on('click', '.image-cancel', function () {
                let no = $(this).data('no');
                $(".preview-image.preview-show-" + no).remove();
            });
        });

        var num = 4;
        function readImage() {
            if (window.File && window.FileList && window.FileReader) {
                var files = event.target.files; //FileList object
                var output = $(".preview-images-zone");

                for (let i = 0; i < files.length; i++) {
                    var file = files[i];
                    if (!file.type.match('image')) continue;

                    var picReader = new FileReader();

                    picReader.addEventListener('load', function (event) {
                        var picFile = event.target;
                        var html = '<div class="preview-image preview-show-' + num + '">' +
                            '<div class="image-cancel" data-no="' + num + '">x</div>' +
                            '<div class="image-zone"><img id="pro-img-' + num + '" src="' + picFile.result + '"></div>' +
                            '<div class="tools-edit-image"><a href="javascript:void(0)" data-no="' + num + '" class="btn btn-light btn-edit-image">edit</a></div>' +
                            '</div>';

                        output.append(html);
                        num = num + 1;
                    });

                    picReader.readAsDataURL(file);
                }
                $("#pro-image").val('');
            } else {
                console.log('Browser not support');
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="Server">
    <section class="section-bg">
        <div class="row no-padding">
            <div class="col-md-2 no-padding ">
                <div id="sidebar-wrapper">

                    <div class="profile-userpic admin-pic text-center">
                        <asp:Image ID="imgpreview" runat="server" Height="120" Width="120" ImageUrl="http://cliquecities.com/assets/no-image-e3699ae23f866f6cbdf8ba2443ee5c4e.jpg" Style="border-width: 0px; border-radius: 50%;" />
                        <br />
                        <div class="" style="padding-bottom: 20px;">
                            <asp:Label ID="hellow" runat="server" Text="Hello, world" Font-Size="2em" Font-Bold="True" ForeColor="White"></asp:Label>
                            <p class="">Renter<span><i class="icon-space"></i></span></p>
                            <asp:Label ID="userstatus" runat="server" BackColor="#CC3300" BorderStyle="None" Font-Size="X-Large" ForeColor="White" Style="text-align: center; width: 150px; border-radius: 100px;"></asp:Label>
                        </div>

                        <ul class="sidebar-nav list-unstyled">
                            <li class="nav-item">
                                <asp:LinkButton ID="renterprofile" runat="server" Style="font-size: 1.5em;" OnClick="renterProfile_Click"> <i class="la la-user icon-space" style="font-size:1em;"></i>My Profile</asp:LinkButton>
                            </li>
                            <li class="nav-item">
                                <asp:LinkButton ID="renterFavorites" runat="server" Style="font-size: 1.5em;" OnClick="renterFavorites_Click"><i class="la la-home icon-space" style="font-size:1em;"></i>My Favorites</asp:LinkButton>
                            </li>
                            <li class="nav-item">
                                <asp:LinkButton ID="renterConnections" runat="server" Style="font-size: 1.5em;" OnClick="renterConnections_Click"><i class="la la-users icon-space" style="font-size:1em;"></i>Requests</asp:LinkButton>
                            </li>
                            <li class="nav-item">
                                <asp:LinkButton ID="renterMessage" runat="server" Style="font-size: 1.5em;" OnClick="renterMessage_Click"><i class="la la-comments icon-space" style="font-size:1em;"></i>Messages</asp:LinkButton>
                            </li>
                            <li class="nav-item">
                                <asp:LinkButton ID="renterHistory" runat="server" Style="font-size: 1.5em;" OnClick="renterHistory_Click"><i class="la la-home icon-space" style="font-size:1em;"></i>History</asp:LinkButton>
                            </li>
                        </ul>
                    </div>
                    <div class="renter-host p-bottom-30 text-center" style="text-align: center;">
                        <asp:Button ID="rentertohost" runat="server" class="btn btn-primary" Text="Become a Host" BorderStyle="None" OnClick="rentertohost_Click" Style="font-size: 1.5em;"></asp:Button>
                    </div>
                </div>
                <!-- /#sidebar-wrapper -->
            </div>

            <div class="col-md-9 mx-auto ">

                <%--renter profile--%>
                <asp:Panel ID="panelprofile" runat="server">
                    <h1 class="update-title">My Profile
                        <asp:Button ID="editprofile" runat="server" Text="Edit" class="btn btn-primary" OnClick="editprofile_Click" Style="float: right;" /></h1>

                    <div class="atbd_author_module">
                        <div class="atbd_content_module">

                            <div class="atbdb_content_module_contents">
                                <div class="user_info_wrap">
                                    <div class="row">

                                        <div class="profile-des">
                                            <div class="">
                                                <h5>About</h5>
                                                <asp:Label ID="userDes" runat="server" Text=""> </asp:Label>
                                                <br />
                                                <br />
                                            </div>
                                            <div>
                                                <h5 style="display: inline">Gender</h5>
                                                <asp:Label ID="userGender" runat="server" Text="" Style="display: inline"></asp:Label>
                                                <br />
                                                <br />
                                            </div>
                                            <div class="about-des">
                                                <h5 style="display: inline">Occupation</h5>
                                                <asp:Label ID="userOccu" runat="server" Text="" Style="display: inline"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </asp:Panel>

                <%--renter favorites--%>
                <asp:Panel ID="panelfavorites" runat="server" Visible="False">

                    <h1 class="update-title">My Favorites
                    </h1>

                    <div class="atbd_author_module">
                        <div class="atbd_content_module">

                            <div class="atbdb_content_module_contents">
                                <div class="user_info_wrap">
                                    <div class="row">
                                        <div id="Property1Space" runat="server">
                                            <div class="atbd_single_listing atbd_listing_list">
                                                <article class="atbd_single_listing_wrapper">
                                                    <figure class="atbd_listing_thumbnail_area">
                                                        <div class="atbd_listing_image fill">
                                                            <asp:ImageButton ID="Property1Image" OnClick="Property1Image_Click" runat="server" CssClass="imgfill" Height="220px" Width="350" BorderColor="Silver" BorderStyle="Solid" BorderWidth="2px" />
                                                        </div>
                                                        <!-- ends: .atbd_listing_image -->
                                                    </figure>
                                                    <!-- ends: .atbd_listing_thumbnail_area -->
                                                    <div class="atbd_listing_info">
                                                        <div class="atbd_content_upper">
                                                            <h4 class="atbd_listing_title">
                                                                <asp:Label ID="Property1Title" Visible="false" runat="server" Text="Label"></asp:Label>
                                                            </h4>
                                                            <div class="mt-0 form-label">
                                                                <asp:Label ID="Property1CityState" runat="server" Text="Label"></asp:Label>
                                                            </div>
                                                            <div class="atbd_listing_meta" style="float: right;">
                                                                <span class="atbd_meta atbd_listing_rating">
                                                                    <asp:Label ID="Property1Rating" runat="server" Text="4.5" Style="float: right;"></asp:Label><i class="la la-star"></i></span>
                                                            </div>
                                                            <!-- End atbd listing meta -->
                                                            <div class="atbd_listing_data_list">
                                                                <div class="mt-0 form-label">
                                                                    <asp:Label ID="Property1RentPrice" runat="server" Text="Label"></asp:Label><br />
                                                                    <asp:Label ID="Property1StartDate" runat="server" Text="Label"></asp:Label><br />
                                                                    <asp:Label ID="Property1EndDate" runat="server" Text="Label"></asp:Label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- End atbd listing meta -->

                                                        <!-- end .atbd_content_upper -->
                                                        <div class="atbd_listing_bottom_content">
                                                            <div class="atbd_content_left">
                                                                <div class="atbd_listing_category">
                                                                    <span class="fas fa-bed icon-padding"></span>
                                                                    <div class="numberCircle">
                                                                        <asp:Label runat="server" ID="Property1Bed" Text="1 Bed" CssClass="icon-padding"></asp:Label>
                                                                    </div>
                                                                    <span class="fas fa-bath icon-padding"></span>
                                                                    <div class="numberCircle">
                                                                        <asp:Label runat="server" ID="Property1Bath" Text="1 Bathroom" CssClass="icon-padding"></asp:Label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </article>
                                            </div>
                                        </div>
                                        <div id="Property2Space" runat="server" class="col-lg-12">
                                            <div class="atbd_single_listing atbd_listing_list">
                                                <article class="atbd_single_listing_wrapper">
                                                    <figure class="atbd_listing_thumbnail_area">
                                                        <div class="atbd_listing_image fill">
                                                            <asp:ImageButton ID="Property2Image" OnClick="Property2Image_Click" runat="server" CssClass="imgfill" Height="220px" Width="350" BorderColor="Silver" BorderStyle="Solid" BorderWidth="2px" />
                                                        </div>
                                                        <!-- ends: .atbd_listing_image -->
                                                    </figure>
                                                    <!-- ends: .atbd_listing_thumbnail_area -->
                                                    <div class="atbd_listing_info">
                                                        <div class="atbd_content_upper">
                                                            <h4 class="atbd_listing_title">
                                                                <asp:Label ID="Property2Title" Visible="false" runat="server" Text="Label"></asp:Label>
                                                            </h4>
                                                            <div class="mt-0 form-label">
                                                                <asp:Label ID="Property2CityState" runat="server" Text="Label"></asp:Label>
                                                            </div>
                                                            <div class="atbd_listing_meta" style="float: right;">
                                                                <span class="atbd_meta atbd_listing_rating">
                                                                    <asp:Label ID="Property2Rating" runat="server" Text="4.5"></asp:Label><i class="la la-star"></i></span>
                                                            </div>
                                                            <!-- End atbd listing meta -->
                                                            <div class="atbd_listing_data_list">
                                                                <div class="mt-0 form-label">
                                                                    <asp:Label ID="Property2RentPrice" runat="server" Text="Label"></asp:Label><br />
                                                                    <asp:Label ID="Property2StartDate" runat="server" Text="Label"></asp:Label><br />
                                                                    <asp:Label ID="Property2EndDate" runat="server" Text="Label"></asp:Label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- End atbd listing meta -->

                                                        <!-- end .atbd_content_upper -->
                                                        <div class="atbd_listing_bottom_content">
                                                            <div class="atbd_content_left">
                                                                <div class="atbd_listing_category">
                                                                    <span class="fas fa-bed icon-padding"></span>
                                                                    <div class="numberCircle">
                                                                        <asp:Label runat="server" ID="Property2Bed" Text="1 Bed" CssClass="icon-padding"></asp:Label>
                                                                    </div>
                                                                    <span class="fas fa-bath icon-padding"></span>
                                                                    <div class="numberCircle">
                                                                        <asp:Label runat="server" ID="Property2Bath" Text="1 Bathroom" CssClass="icon-padding"></asp:Label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </article>
                                            </div>
                                        </div>
                                        <div id="Property3Space" runat="server" class="col-lg-12">
                                            <div class="atbd_single_listing atbd_listing_list">
                                                <article class="atbd_single_listing_wrapper">
                                                    <figure class="atbd_listing_thumbnail_area">
                                                        <div class="atbd_listing_image fill">
                                                            <asp:ImageButton ID="Property3Image" OnClick="Property3Image_Click" runat="server" CssClass="imgfill" Height="220px" Width="350" BorderColor="Silver" BorderStyle="Solid" BorderWidth="2px" />
                                                        </div>
                                                        <!-- ends: .atbd_listing_image -->
                                                    </figure>
                                                    <!-- ends: .atbd_listing_thumbnail_area -->
                                                    <div class="atbd_listing_info">
                                                        <div class="atbd_content_upper">
                                                            <h4 class="atbd_listing_title">
                                                                <asp:Label ID="Property3Title" Visible="false" runat="server" Text="Label"></asp:Label>
                                                            </h4>
                                                            <div class="mt-0 form-label">
                                                                <asp:Label ID="Property3CityState" runat="server" Text="Label"></asp:Label>
                                                            </div>
                                                            <div class="atbd_listing_meta" style="float: right;">
                                                                <span class="atbd_meta atbd_listing_rating">
                                                                    <asp:Label ID="Property3Rating" runat="server" Text="4.5"></asp:Label><i class="la la-star"></i></span>
                                                            </div>
                                                            <!-- End atbd listing meta -->
                                                            <div class="atbd_listing_data_list">
                                                                <div class="mt-0 form-label">
                                                                    <asp:Label ID="Property3RentPrice" runat="server" Text="Label"></asp:Label><br />
                                                                    <asp:Label ID="Property3StartDate" runat="server" Text="Label"></asp:Label><br />
                                                                    <asp:Label ID="Property3EndDate" runat="server" Text="Label"></asp:Label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- End atbd listing meta -->

                                                        <!-- end .atbd_content_upper -->
                                                        <div class="atbd_listing_bottom_content">
                                                            <div class="atbd_content_left">
                                                                <div class="atbd_listing_category">
                                                                    <span class="fas fa-bed icon-padding"></span>
                                                                    <div class="numberCircle">
                                                                        <asp:Label runat="server" ID="Property3Bed" Text="1 Bed" CssClass="icon-padding"></asp:Label>
                                                                    </div>
                                                                    <span class="fas fa-bath icon-padding"></span>
                                                                    <div class="numberCircle">
                                                                        <asp:Label runat="server" ID="Property3Bath" Text="1 Bathroom" CssClass="icon-padding"></asp:Label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </article>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </asp:Panel>

                <%--renter connections--%>
                <asp:Panel ID="panelconnections" runat="server" Visible="False">
                    <div class="col-md-12 mx-auto">
                        <h1 class="update-title">
                            <asp:Label ID="RequestHeader" runat="server" Text="Renter Requests"></asp:Label>
                        </h1>
                        <div class="atbd_author_module">
                            <div class="atbd_content_module">

                                <div class="atbdb_content_module_contents">
                                    <div class="user_info_wrap">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="p-bottom-25">
                                                    <div class="card border" id="request1" runat="server" visible="false">
                                                        <div class="card-header">
                                                            Request Application
                                                        </div>
                                                        <div class="card-body">
                                                            <div class="col-md-9 left_col-1">
                                                                <p class="card-text">
                                                                    <asp:Label ID="request1des" runat="server" Text="Label"></asp:Label>
                                                                    <asp:Label ID="RequestedRoomPrice1" runat="server" Visible="false" Text="Label"></asp:Label>
                                                                </p>
                                                            </div>
                                                            <div class="col-md-3 right_col-1">
                                                                <div id="StriptPay1" runat="server">
                                                                    <script
                                                                        src="https://checkout.stripe.com/checkout.js"
                                                                        class="stripe-button"
                                                                        data-key="pk_test_8atXfTcBVA0b0Y50HniGdHw0000kgvHhmz"
                                                                        data-amount="50000.00"
                                                                        data-name="RoomMagnet"
                                                                        data-description="Rent"
                                                                        data-image="https://stripe.com/img/documentation/checkout/marketplace.png"
                                                                        data-locale="auto"
                                                                        data-zip-code="true"
                                                                        data-currency="usd">
                                                                    </script>
                                                                    
                                                                </div>
                                                                <asp:Button ID="DeleteButton1" runat="server" Text="Delete" CssClass="btn btn-secondary inline" OnClick="DeleteButton1_Click" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class=" p-bottom-25">
                                                    <div class="card border" id="request2" runat="server" visible="false">
                                                        <div class="card-header">
                                                            Request Application
                                                        </div>
                                                        <div class="card-body">
                                                            <div class="col-md-9 left_col-1">
                                                                <p class="card-text">
                                                                    <asp:Label ID="request2des" runat="server" Text="Label"></asp:Label>
                                                                    <asp:Label ID="RequestedRoomPrice2" runat="server" Visible="false" Text="Label"></asp:Label>
                                                                </p>
                                                            </div>
                                                            <div class="col-md-3 right_col-1">
                                                                <div id="StriptPay2" runat="server">
                                                                    <script
                                                                        src="https://checkout.stripe.com/checkout.js"
                                                                        class="stripe-button"
                                                                        data-key="pk_test_8atXfTcBVA0b0Y50HniGdHw0000kgvHhmz"
                                                                        data-amount="50000.00"
                                                                        data-name="RoomMagnet"
                                                                        data-description="Rent"
                                                                        data-image="https://stripe.com/img/documentation/checkout/marketplace.png"
                                                                        data-locale="auto"
                                                                        data-zip-code="true"
                                                                        data-currency="usd">
                                                                    </script>
                                                                    
                                                                </div>
                                                                <asp:Button ID="DeleteButton2" runat="server" Text="Delete" CssClass="btn btn-secondary inline" OnClick="DeleteButton2_Click" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class=" p-bottom-25">
                                                    <div class="card border" id="request3" runat="server" visible="false">
                                                        <div class="card-header">
                                                            Request Application
                                                        </div>
                                                        <div class="card-body">
                                                            <div class="col-md-9 left_col-1">
                                                                <p class="card-text">
                                                                    <asp:Label ID="request3des" runat="server" Text="Label"></asp:Label>
                                                                    <asp:Label ID="RequestedRoomPrice3" Visible="false" runat="server" Text="Label"></asp:Label>
                                                                </p>
                                                            </div>
                                                            <div class="col-md-3 right_col-1">
                                                                <div id="StriptPay3" runat="server">
                                                                    <script
                                                                        src="https://checkout.stripe.com/checkout.js"
                                                                        class="stripe-button"
                                                                        data-key="pk_test_8atXfTcBVA0b0Y50HniGdHw0000kgvHhmz"
                                                                        data-amount="50000.00"
                                                                        data-name="RoomMagnet"
                                                                        data-description="Rent"
                                                                        data-image="https://stripe.com/img/documentation/checkout/marketplace.png"
                                                                        data-locale="auto"
                                                                        data-zip-code="true"
                                                                        data-currency="usd">
                                                                    </script>
                                                                    
                                                                </div>
                                                                <asp:Button ID="DeleteButton3" runat="server" Text="Delete" CssClass="btn btn-secondary inline" OnClick="DeleteButton3_Click" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class=" p-bottom-25">
                                                    <div class="card border" id="request4" runat="server" visible="false">
                                                        <div class="card-header">
                                                            Request Application
                                                        </div>
                                                        <div class="card-body">
                                                            <div class="col-md-9 left_col-1">
                                                                <p class="card-text">
                                                                    <asp:Label ID="request4des" runat="server" Text="Label"></asp:Label>
                                                                    <asp:Label ID="RequestedRoomPrice4" Visible="false" runat="server" Text="Label"></asp:Label>
                                                                </p>
                                                            </div>
                                                            <div class="col-md-3 right_col-1">
                                                                <div id="StriptPay4" runat="server">
                                                                    <script
                                                                        src="https://checkout.stripe.com/checkout.js"
                                                                        class="stripe-button"
                                                                        data-key="pk_test_8atXfTcBVA0b0Y50HniGdHw0000kgvHhmz"
                                                                        data-amount="50000.00"
                                                                        data-name="RoomMagnet"
                                                                        data-description="Rent"
                                                                        data-image="https://stripe.com/img/documentation/checkout/marketplace.png"
                                                                        data-locale="auto"
                                                                        data-zip-code="true"
                                                                        data-currency="usd">
                                                                    </script>
                                                                    
                                                                </div>
                                                                <asp:Button ID="DeleteButton4" runat="server" Text="Delete" CssClass="btn btn-secondary inline" OnClick="DeleteButton4_Click" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class=" p-bottom-25">
                                                    <div class="card border" id="request5" runat="server" visible="false">
                                                        <div class="card-header">
                                                            Request Application
                                                        </div>
                                                        <div class="card-body">
                                                            <div class="col-md-9 left_col-1">
                                                                <p class="card-text">
                                                                    <asp:Label ID="request5des" runat="server" Text="Label"></asp:Label>
                                                                    <asp:Label ID="RequestedRoomPrice5" Visible="false" runat="server" Text="Label"></asp:Label>
                                                                </p>
                                                            </div>
                                                            <div class="col-md-3 right_col-1">
                                                                <div id="StriptPay5" runat="server">
                                                                    <script
                                                                        src="https://checkout.stripe.com/checkout.js"
                                                                        class="stripe-button"
                                                                        data-key="pk_test_8atXfTcBVA0b0Y50HniGdHw0000kgvHhmz"
                                                                        data-amount="50000.00"
                                                                        data-name="RoomMagnet"
                                                                        data-description="Rent"
                                                                        data-image="https://stripe.com/img/documentation/checkout/marketplace.png"
                                                                        data-locale="auto"
                                                                        data-zip-code="true"
                                                                        data-currency="usd">
                                                                    </script>
                                                                    
                                                                </div>
                                                                <asp:Button ID="DeleteButton5" runat="server" Text="Delete" CssClass="btn btn-secondary inline" OnClick="DeleteButton5_Click" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </asp:Panel>

                <%--renter message--%>
                <asp:Panel ID="panelmessage" runat="server" Visible="False">
                    <div class="col-md-12 mx-auto ">
                        <h1 class="update-title">Messages
                            <asp:Label ID="errorLabel" runat="server" Text="Label" Visible="false"></asp:Label></h1>
                        <div class="row">
                            <div class="col-md-12 no-padding">
                                <div class="form-group">
                                    <asp:DropDownList ID="HostNames" runat="server" AutoPostBack="true" OnTextChanged="HostNames_TextChanged" CssClass="form-control">
                                        <asp:ListItem Value="No One">Select Contact</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="p-bottom-30">
                                <div class="col-md-12">
                                    <asp:TextBox ID="Messages" TextMode="MultiLine" runat="server" CssClass="form-control" ReadOnly="true" Width="1070px" Height="250px"></asp:TextBox>
                                </div>
                            </div>
                            <hr />
                            <div class="type_msg">
                                <div class="input_msg_write">
                                    <div class="input-group">
                                        <asp:TextBox ID="txtsend" runat="server" CssClass="form-control" placeholder="Type a message" Width="500px"></asp:TextBox>
                                        <div class="atbd_submit_btn input-group-append searchtxt-padding">
                                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Send" Font-Bold="True" CssClass="btn btn-primary" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </asp:Panel>

                <%--history--%>
                <asp:Panel ID="panelhistory" runat="server" Visible="False">
                    <h1 class="update-title">Rent History
                    </h1>

                    <div class="atbd_author_module">
                        <div class="atbd_content_module">

                            <div class="atbdb_content_module_contents">
                                <div class="user_info_wrap">
                                    <div class="row">
                                        <div id="history1" runat="server" class="col-lg-12">
                                            <div class="atbd_single_listing atbd_listing_list">
                                                <article class="atbd_single_listing_wrapper">
                                                    <figure class="atbd_listing_thumbnail_area">
                                                        <div class="atbd_listing_image fill">
                                                            <asp:ImageButton ID="history1img" OnClick="historyproperty1_Click" runat="server" CssClass="imgfill" Height="220px" Width="350" BorderColor="Silver" BorderStyle="Solid" BorderWidth="2px" />
                                                        </div>
                                                        <!-- ends: .atbd_listing_image -->
                                                    </figure>
                                                    <!-- ends: .atbd_listing_thumbnail_area -->
                                                    <div class="atbd_listing_info">
                                                        <div class="atbd_content_upper">
                                                            <h4 class="atbd_listing_title">
                                                                <asp:Label ID="history1title" Visible="false" runat="server" Text="Label"></asp:Label>
                                                            </h4>
                                                            <div class="mt-0 form-label">
                                                                <asp:Label ID="history1city" runat="server" Text="Label"></asp:Label>
                                                            </div>
                                                            <div class="atbd_listing_meta" style="float: right;">
                                                                <span class="atbd_meta atbd_listing_rating">
                                                                    <asp:Label ID="history1rating" runat="server" Text="4.5" Style="float: right;"></asp:Label><i class="la la-star"></i></span>
                                                            </div>
                                                            <!-- End atbd listing meta -->
                                                            <div class="atbd_listing_data_list">
                                                                <div class="mt-0 form-label">
                                                                    <asp:Label ID="history1price" runat="server" Text="Label"></asp:Label><br />
                                                                    <asp:Label ID="history1start" runat="server" Text="Label"></asp:Label><br />
                                                                    <asp:Label ID="history1end" runat="server" Text="Label"></asp:Label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- End atbd listing meta -->

                                                        <!-- end .atbd_content_upper -->
                                                        <div class="atbd_listing_bottom_content">
                                                            <div class="atbd_content_left">
                                                                <div class="atbd_listing_category">
                                                                    <span class="fas fa-bed icon-padding"></span>
                                                                    <div class="numberCircle">
                                                                        <asp:Label runat="server" ID="history1bed" Text="1 Bed" CssClass="icon-padding"></asp:Label>
                                                                    </div>
                                                                    <span class="fas fa-bath icon-padding"></span>
                                                                    <div class="numberCircle">
                                                                        <asp:Label runat="server" ID="history1bath" Text="1 Bathroom" CssClass="icon-padding"></asp:Label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <asp:Button ID="review" runat="server" Text="Review" class="btn btn-primary" Style="float: right;" OnClick="review_Click" data-toggle="modal" data-target="#myModal" OnClientClick="return false" />
                                                        </div>
                                                    </div>
                                                </article>
                                            </div>
                                        </div>
                                        <div id="Div2" runat="server" class="col-lg-12">
                                            <div class="atbd_single_listing atbd_listing_list">
                                                <article class="atbd_single_listing_wrapper">
                                                    <figure class="atbd_listing_thumbnail_area">
                                                        <div class="atbd_listing_image fill">
                                                            <asp:ImageButton ID="ImageButton1" OnClick="Property1Image_Click" runat="server" CssClass="imgfill" Height="220px" Width="350" BorderColor="Silver" BorderStyle="Solid" BorderWidth="2px" />
                                                        </div>
                                                        <!-- ends: .atbd_listing_image -->
                                                    </figure>
                                                    <!-- ends: .atbd_listing_thumbnail_area -->
                                                    <div class="atbd_listing_info">
                                                        <div class="atbd_content_upper">
                                                            <h4 class="atbd_listing_title">
                                                                <asp:Label ID="Label1" Visible="false" runat="server" Text="Label"></asp:Label>
                                                            </h4>
                                                            <div class="mt-0 form-label">
                                                                <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                                                            </div>
                                                            <div class="atbd_listing_meta">
                                                                <span class="atbd_meta atbd_listing_rating">
                                                                    <asp:Label ID="Label3" runat="server" Text="4.5"></asp:Label><i class="la la-star"></i></span>
                                                            </div>
                                                            <!-- End atbd listing meta -->
                                                            <div class="atbd_listing_data_list">
                                                                <div class="mt-0 form-label">
                                                                    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label><br />
                                                                    <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label><br />
                                                                    <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- End atbd listing meta -->

                                                        <!-- end .atbd_content_upper -->
                                                        <div class="atbd_listing_bottom_content">
                                                            <div class="atbd_content_left">
                                                                <div class="atbd_listing_category">
                                                                    <span class="fas fa-bed icon-padding"></span>
                                                                    <div class="numberCircle">
                                                                        <asp:Label runat="server" ID="Label7" Text="1 Bed" CssClass="icon-padding"></asp:Label>
                                                                    </div>
                                                                    <span class="fas fa-bath icon-padding"></span>
                                                                    <div class="numberCircle">
                                                                        <asp:Label runat="server" ID="Label8" Text="1 Bathroom" CssClass="icon-padding"></asp:Label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </article>
                                            </div>
                                        </div>
                                        <div id="Div3" runat="server" class="col-lg-12">
                                            <div class="atbd_single_listing atbd_listing_list">
                                                <article class="atbd_single_listing_wrapper">
                                                    <figure class="atbd_listing_thumbnail_area">
                                                        <div class="atbd_listing_image fill">
                                                            <asp:ImageButton ID="ImageButton2" OnClick="Property1Image_Click" runat="server" CssClass="imgfill" Height="220px" Width="350" BorderColor="Silver" BorderStyle="Solid" BorderWidth="2px" />
                                                        </div>
                                                        <!-- ends: .atbd_listing_image -->
                                                    </figure>
                                                    <!-- ends: .atbd_listing_thumbnail_area -->
                                                    <div class="atbd_listing_info">
                                                        <div class="atbd_content_upper">
                                                            <h4 class="atbd_listing_title">
                                                                <asp:Label ID="Label9" Visible="false" runat="server" Text="Label"></asp:Label>
                                                            </h4>
                                                            <div class="mt-0 form-label">
                                                                <asp:Label ID="Label10" runat="server" Text="Label"></asp:Label>
                                                            </div>
                                                            <div class="atbd_listing_meta">
                                                                <span class="atbd_meta atbd_listing_rating">
                                                                    <asp:Label ID="Label11" runat="server" Text="4.5"></asp:Label><i class="la la-star"></i></span>
                                                            </div>
                                                            <!-- End atbd listing meta -->
                                                            <div class="atbd_listing_data_list">
                                                                <div class="mt-0 form-label">
                                                                    <asp:Label ID="Label12" runat="server" Text="Label"></asp:Label><br />
                                                                    <asp:Label ID="Label13" runat="server" Text="Label"></asp:Label><br />
                                                                    <asp:Label ID="Label14" runat="server" Text="Label"></asp:Label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- End atbd listing meta -->

                                                        <!-- end .atbd_content_upper -->
                                                        <div class="atbd_listing_bottom_content">
                                                            <div class="atbd_content_left">
                                                                <div class="atbd_listing_category">
                                                                    <span class="fas fa-bed icon-padding"></span>
                                                                    <div class="numberCircle">
                                                                        <asp:Label runat="server" ID="Label15" Text="1 Bed" CssClass="icon-padding"></asp:Label>
                                                                    </div>
                                                                    <span class="fas fa-bath icon-padding"></span>
                                                                    <div class="numberCircle">
                                                                        <asp:Label runat="server" ID="Label16" Text="1 Bathroom" CssClass="icon-padding"></asp:Label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </article>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </asp:Panel>
    </section>

    <%--review modal--%>
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="review_modal_label" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="review_modal"><span class="la la-star"></span>Add a Review</h3>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="/" id="atbdp_review_form" method="post">
                        <div class="atbd_review_rating_area">
                            <!--It should be displayed on the left side -->
                            <div class="atbd_review_update_rating">
                                <span>Rating: </span>
                                <div class="atbd_rating_stars">
                                    <div class="br-wrapper br-theme-fontawesome-stars m-left-15">
                                        <asp:DropDownList runat="server" class="give_rating" ID="reviewStar">
                                            <asp:ListItem Value="1">1</asp:ListItem>
                                            <asp:ListItem Value="2">2</asp:ListItem>
                                            <asp:ListItem Value="3">3</asp:ListItem>
                                            <asp:ListItem Value="4">4</asp:ListItem>
                                            <asp:ListItem Value="5">5</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <!-- ends: .atbd_review_update_rating -->
                        </div>
                        <!-- ends: .atbd_review_rating_area -->
                        <div class="form-group">
                            <br />
                            <asp:TextBox runat="server" class="form-control" TextMode="multiline" Height="100px" ID="reviewdes" ControlToValidate="reviewdes"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="Requiredreview" runat="server" ErrorMessage="Required" ControlToValidate="reviewdes" ForeColor="Red" ValidationGroup="reivew" Display="Dynamic">Required</asp:RequiredFieldValidator>
                        </div>
                        <asp:Button runat="server" Text="Submit Review" class="btn btn-primary" ID="submitReview" OnClick="submitReview_Click" ValidationGroup="reivew" />
                    </form>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
</asp:Content>