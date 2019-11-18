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

        .auto-style1 {
            float: right;
            margin-top: 0;
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
    <div class="container">
        <div class="row profile">
            <div class="col-md-3">
                <div class="profile-sidebar">
                    <!-- SIDEBAR USERPIC -->
                    <div class="profile-userpic text-center">
                        <asp:image id="imgpreview" runat="server" height="200" width="200" imageurl="http://cliquecities.com/assets/no-image-e3699ae23f866f6cbdf8ba2443ee5c4e.jpg" style="border-width: 0px; border-radius: 50%;" />
                        <br />
                        <asp:label id="userstatus" runat="server" backcolor="#CC3300" borderstyle="None" font-size="X-Large" forecolor="White" style="text-align: center; width: 150px;"></asp:label>
                    </div>
                    <!-- END SIDEBAR USERPIC -->

                    <!-- SIDEBAR MENU -->
                    <div class="profile-usermenu dashboard-size nav flex-column">
                        <div class="text-center name-about">

                            <asp:label id="hellow" runat="server" text="Hello, world" font-size="2em" font-bold="True"></asp:label>
                            <br />
                        </div>
                        <ul class="list-unstyled">
                            <li class="nav-item">
                                <asp:linkbutton id="renterprofile" runat="server" style="font-size: 1.5em;" onclick="renterProfile_Click" backcolor="#C6D6E2"> <i class="la la-user" style="font-size:1em;"></i>My Profile</asp:linkbutton>
                            </li>
                            <li class="nav-item">
                                <asp:linkbutton id="renterFavorites" runat="server" style="font-size: 1.5em;" onclick="renterFavorites_Click"><i class="la la-home" style="font-size:1em;"></i>My Favorites</asp:linkbutton>
                            </li>
                            <li class="nav-item" style="margin-top: 0px">
                                <asp:linkbutton id="renterConnections" runat="server" style="font-size: 1.5em;" onclick="renterConnections_Click"><i class="la la-users" style="font-size:1em;"></i>Connections</asp:linkbutton>
                            </li>
                            <li class="nav-item">
                                <asp:linkbutton id="renterMessage" runat="server" style="font-size: 1.5em;" onclick="renterMessage_Click"><i class="la la-comments" style="font-size:1em;"></i>Messages</asp:linkbutton>
                            </li>
                            <li class="nav-item">
                                <asp:linkbutton id="renterHistory" runat="server" style="font-size: 1.5em;" onclick="renterHistory_Click"><i class="la la-home" style="font-size:1em;"></i>History</asp:linkbutton>
                            </li>
                        </ul>
                        <asp:button id="rentertohost" runat="server" class="btn btn-primary" text="Become a Host" borderstyle="None" onclick="rentertohost_Click" style="font-size: 1.5em;"></asp:button>
                    </div>
                    <!-- END MENU -->
                </div>
            </div>

            <div class="col-md-9">
                <%--renter profile--%>
                <asp:panel id="panelprofile" runat="server">
                    <div class="profile-content atbd_content_module">
                        <div class="atbd_content_module__tittle_area about-titles">
                            <div class="atbd_area_title">
                                <h4 style="font-size: 2em;"><span class="la la-user" style="font-size: 1em; color: black;"></span>My Profile </h4>
                                <asp:Button ID="editprofile" runat="server" Text="Edit" class="btn btn-primary" OnClick="editprofile_Click" />
                            </div>
                        </div>
                        <div class="profile-des">
                            <div class="">
                                <h5>&nbsp;</h5>
                                <h5>About</h5>
                                <asp:Label ID="userDes" runat="server" Text=""></asp:Label>
                                <br />
                                <br />
                            </div>
                            <div class="about-des">
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
                </asp:panel>

                <%--renter favorites--%>
                <asp:panel id="panelfavorites" runat="server" visible="False">
                    <div id="favorites">
                        <div class="profile-content atbd_content_module">
                            <div class="atbd_content_module__tittle_area about-titles">
                                <div class="atbd_area_title">
                                    <h4 style="font-size: 2em; color: black;"><span class="la la-home" style="font-size: 1em; color: black">My Favorites</span></h4>
                                </div>
                            </div>
                        </div>
                        <br />
                        <div id="Property1Space" runat="server" class="col-lg-12">
                            <div class="atbd_single_listing atbd_listing_list">
                                <article class="atbd_single_listing_wrapper">
                                    <figure class="atbd_listing_thumbnail_area">
                                        <div class="atbd_listing_image fill">

                                            <asp:ImageButton ID="Property1Image" OnClick="Property1Image_Click" runat="server" CssClass="imgfill" Height="200px" Width="200" BorderColor="Silver" BorderStyle="Solid" BorderWidth="2px" />
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
                                            <div class="atbd_listing_meta">
                                                <span class="atbd_meta atbd_listing_rating">

                                                    <asp:Label ID="Property1Rating" runat="server" Text="4.5"></asp:Label><i class="la la-star"></i></span>
                                            </div>
                                            <!-- End atbd listing meta -->
                                            <div class="atbd_listing_data_list">

                                                <div class="mt-0 form-label">
                                                    <asp:Label ID="Property1RentPrice" runat="server" Text="Label"></asp:Label>
                                                    <div class="row">
                                                        <asp:Label ID="Property1StartDate" runat="server" Text="Label"></asp:Label>

                                                        <asp:Label ID="Property1EndDate" runat="server" Text="Label"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End atbd listing meta -->
                                    </div>
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
                                        <ul class="atbd_content_right">
                                        </ul>
                                    </div>
                                    <!-- end .atbd_listing_bottom_content -->
                                </article>
                            </div>
                            <!-- ends: .atbd_listing_info -->

                            <!-- atbd_single_listing_wrapper -->
                        </div>
                        <div id="Property2Space" runat="server" class="col-lg-12">
                            <div class="atbd_single_listing atbd_listing_list">
                                <article class="atbd_single_listing_wrapper">
                                    <figure class="atbd_listing_thumbnail_area">
                                        <div class="atbd_listing_image fill">

                                            <asp:ImageButton ID="Property2Image" OnClick="Property2Image_Click" runat="server" CssClass="imgfill" Height="200px" Width="200" BorderColor="Silver" BorderStyle="Solid" BorderWidth="2px" />
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
                                            <div class="atbd_listing_meta">
                                                <span class="atbd_meta atbd_listing_rating">
                                                    <asp:Label ID="Property2Rating" runat="server" Text="4.5"></asp:Label><i class="la la-star"></i></span>
                                            </div>
                                            <!-- End atbd listing meta -->
                                            <div class="atbd_listing_data_list">

                                                <div class="mt-0 form-label">
                                                    <asp:Label ID="Property2RentPrice" runat="server" Text="Label"></asp:Label>
                                                    <div class="row">
                                                        <asp:Label ID="Property2StartDate" runat="server" Text="Label"></asp:Label>

                                                        <asp:Label ID="Property2EndDate" runat="server" Text="Label"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- End atbd listing meta -->
                                        </div>
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
                                            <ul class="atbd_content_right">
                                                <li></li>
                                            </ul>
                                        </div>
                                        <!-- end .atbd_listing_bottom_content -->
                                    </div>
                                    <!-- ends: .atbd_listing_info -->
                                </article>
                                <!-- atbd_single_listing_wrapper -->
                            </div>
                        </div>
                        <!-- ends: .col-lg-12 -->
                        <div id="Property3Space" runat="server" class="col-lg-12">
                            <div class="atbd_single_listing atbd_listing_list">
                                <article class="atbd_single_listing_wrapper">
                                    <figure class="atbd_listing_thumbnail_area">
                                        <div class="atbd_listing_image fill">

                                            <asp:ImageButton ID="Property3Image" OnClick="Property3Image_Click" runat="server" CssClass="imgfill" Height="200px" Width="200" BorderColor="Silver" BorderStyle="Solid" BorderWidth="2px" />
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
                                            <div class="atbd_listing_meta">
                                                <span class="atbd_meta atbd_listing_rating">
                                                    <asp:Label ID="Property3Rating" runat="server" Text="4.5"></asp:Label><i class="la la-star"></i></span>
                                            </div>
                                            <!-- End atbd listing meta -->
                                            <div class="atbd_listing_data_list">

                                                <div class="mt-0 form-label">
                                                    <asp:Label ID="Property3RentPrice" runat="server" Text="Label"></asp:Label>
                                                    <div class="row">
                                                        <asp:Label ID="Property3StartDate" runat="server" Text="Label"></asp:Label>
                                                        <asp:Label ID="Property3EndDate" runat="server" Text="Label"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- End atbd listing meta -->
                                        </div>
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
                                            <ul class="atbd_content_right">
                                                <li></li>
                                            </ul>
                                        </div>
                                        <!-- end .atbd_listing_bottom_content -->
                                    </div>
                                    <!-- ends: .atbd_listing_info -->
                                </article>
                                <!-- atbd_single_listing_wrapper -->
                            </div>
                        </div>
                        <!-- ends: .col-lg-12 -->
                    </div>
                    <!-- ends: .col-lg-12 -->
                </asp:panel>

                <%--renter connections--%>
                <asp:panel id="panelconnections" runat="server" visible="False">
                    <div class="profile-content atbd_content_module">
                        <div class="atbd_content_module__tittle_area about-titles">
                            <div class="atbd_area_title">
                                <h4 style="font-size: 2em; color: black;"><span class="la la-users" style="font-size: 1em; color: black">Connections</span></h4>
                            </div>
                        </div>
                    </div>
                </asp:panel>

                <%--renter message--%>
                <asp:panel id="panelmessage" runat="server" visible="False">
                    <div class="profile-content atbd_content_module">
                        <div class="atbd_content_module__tittle_area about-titles">
                            <div class="atbd_area_title">
                                <h4 style="font-size: 2em; color: black;"><span class="la la-comments" style="font-size: 1em; color: black">Messages</span></h4>
                            </div>
                        </div>
                    </div>
                </asp:panel>

                <%--renter history--%>
                <asp:panel id="panelhistory" runat="server" visible="False">
                    <div id="history">
                        <div class="profile-content atbd_content_module">
                            <div class="atbd_content_module__tittle_area about-titles">
                                <div class="atbd_area_title">
                                    <h4 style="font-size: 2em; color: black;"><span class="la la-home" style="font-size: 1em; color: black">Rent History</span></h4>
                                </div>
                            </div>
                            <div id="history1" runat="server" class="col-lg-12">
                            <div class="atbd_single_listing atbd_listing_list">
                                <article class="atbd_single_listing_wrapper">
                                    <figure class="atbd_listing_thumbnail_area">
                                        <div class="atbd_listing_image fill">

                                            <asp:ImageButton ID="history1img" OnClick="Property1Image_Click" runat="server" CssClass="imgfill" Height="200px" Width="200" BorderColor="Silver" BorderStyle="Solid" BorderWidth="2px" />
                                        </div>
                                        <!-- ends: .atbd_listing_image -->
                                    </figure>
                                    <!-- ends: .atbd_listing_thumbnail_area -->

                                    <div class="atbd_listing_info">
                                        <div class="atbd_content_upper">
                                            <span class="atbd_listing_meta" style="float:right;">
                                                <span class="atbd_meta atbd_listing_rating">
                                                <asp:Label ID="history1rating" runat="server" Text="4.5"></asp:Label><i class="la la-star"></i></span>
                                            </span>
                                            <h4 class="atbd_listing_title">
                                                <asp:Label ID="history1title" Visible="false" runat="server" Text="Label"></asp:Label>
                                            </h4>
                                            <div class="mt-0 form-label">
                                                <asp:Label ID="history1city" runat="server" Text="Label"></asp:Label>
                                            </div>

                                            <!-- End atbd listing meta -->
                                            <div class="atbd_listing_data_list">
                                                <div class="mt-0 form-label">
                                                    <asp:Label ID="history1price" runat="server" Text="Label"></asp:Label><br />
                                                    <asp:Label ID="history1start" runat="server" Text="Label"></asp:Label><br />
                                                    <asp:Label ID="history1end" runat="server" Text="Label"></asp:Label>
                                                </div>
                                        </div>
                                        <!-- End atbd listing meta -->
                                    </div>
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
                                        <ul class="atbd_content_right">
                                            <li></li>
                                        </ul>
                                        <asp:Button ID="review" runat="server" Text="Review" class="btn btn-primary" style="float:right" OnClick="review_Click" data-toggle="modal" data-target="#myModal" OnClientClick="return false"/>
                                    </div>
                                    <!-- end .atbd_listing_bottom_content -->
                            </div>
                            <!-- ends: .atbd_listing_info -->
                            </article>
                                <!-- atbd_single_listing_wrapper -->
                        </div>
                    </div>
                        <div id="Div2" runat="server" class="col-lg-12">
                            <div class="atbd_single_listing atbd_listing_list">
                                <article class="atbd_single_listing_wrapper">
                                    <figure class="atbd_listing_thumbnail_area">
                                        <div class="atbd_listing_image fill">

                                            <asp:ImageButton ID="ImageButton2" OnClick="Property2Image_Click" runat="server" CssClass="imgfill" Height="200px" Width="200" BorderColor="Silver" BorderStyle="Solid" BorderWidth="2px" />
                                        </div>
                                        <!-- ends: .atbd_listing_image -->
                                    </figure>
                                    <!-- ends: .atbd_listing_thumbnail_area -->

                                    <div class="atbd_listing_info">
                                        <div class="atbd_content_upper">
                                            <span class="atbd_listing_meta" style="float:right;">
                                                <span class="atbd_meta atbd_listing_rating">
                                                <asp:Label ID="Label9" runat="server" Text="4.5"></asp:Label><i class="la la-star"></i></span>
                                            </span>
                                            <h4 class="atbd_listing_title">
                                                <asp:Label ID="Label10" Visible="false" runat="server" Text="Label"></asp:Label>
                                            </h4>
                                            <div class="mt-0 form-label">
                                                <asp:Label ID="Label11" runat="server" Text="Label"></asp:Label>
                                            </div>

                                            <!-- End atbd listing meta -->
                                            <div class="atbd_listing_data_list">
                                                <div class="mt-0 form-label">
                                                    <asp:Label ID="Label12" runat="server" Text="Label"></asp:Label><br />
                                                    <asp:Label ID="Label13" runat="server" Text="Label"></asp:Label><br />
                                                    <asp:Label ID="Label14" runat="server" Text="Label"></asp:Label>
                                                </div>
                                        </div>
                                        <!-- End atbd listing meta -->
                                    </div>
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
                                        <ul class="atbd_content_right">
                                            <li></li>
                                        </ul>
                                    </div>
                                    <!-- end .atbd_listing_bottom_content -->
                            </div>
                            <!-- ends: .atbd_listing_info -->
                            </article>
                                <!-- atbd_single_listing_wrapper -->
                        </div>
                    </div>
                    <!-- ends: .col-lg-12 -->

                    <div id="Div3" runat="server" class="col-lg-12">
                            <div class="atbd_single_listing atbd_listing_list">
                                <article class="atbd_single_listing_wrapper">
                                    <figure class="atbd_listing_thumbnail_area">
                                        <div class="atbd_listing_image fill">

                                            <asp:ImageButton ID="ImageButton3" OnClick="Property2Image_Click" runat="server" CssClass="imgfill" Height="200px" Width="200" BorderColor="Silver" BorderStyle="Solid" BorderWidth="2px" />
                                        </div>
                                        <!-- ends: .atbd_listing_image -->
                                    </figure>
                                    <!-- ends: .atbd_listing_thumbnail_area -->

                                    <div class="atbd_listing_info">
                                        <div class="atbd_content_upper">
                                            <span class="atbd_listing_meta" style="float:right;">
                                                <span class="atbd_meta atbd_listing_rating">
                                                <asp:Label ID="Label17" runat="server" Text="4.5"></asp:Label><i class="la la-star"></i></span>
                                            </span>
                                            <h4 class="atbd_listing_title">
                                                <asp:Label ID="Label18" Visible="false" runat="server" Text="Label"></asp:Label>
                                            </h4>
                                            <div class="mt-0 form-label">
                                                <asp:Label ID="Label19" runat="server" Text="Label"></asp:Label>
                                            </div>

                                            <!-- End atbd listing meta -->
                                            <div class="atbd_listing_data_list">
                                                <div class="mt-0 form-label">
                                                    <asp:Label ID="Label20" runat="server" Text="Label"></asp:Label><br />
                                                    <asp:Label ID="Label21" runat="server" Text="Label"></asp:Label><br />
                                                    <asp:Label ID="Label22" runat="server" Text="Label"></asp:Label>
                                                </div>
                                        </div>
                                        <!-- End atbd listing meta -->
                                    </div>
                                    <!-- end .atbd_content_upper -->
                                    <div class="atbd_listing_bottom_content">
                                        <div class="atbd_content_left">
                                            <div class="atbd_listing_category">
                                                <span class="fas fa-bed icon-padding"></span>
                                                <div class="numberCircle">
                                                    <asp:Label runat="server" ID="Label23" Text="1 Bed" CssClass="icon-padding"></asp:Label>
                                                </div>
                                                <span class="fas fa-bath icon-padding"></span>
                                                <div class="numberCircle">
                                                    <asp:Label runat="server" ID="Label24" Text="1 Bathroom" CssClass="icon-padding"></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                        <ul class="atbd_content_right">
                                            <li></li>
                                        </ul>
                                    </div>
                                    <!-- end .atbd_listing_bottom_content -->
                            </div>
                            <!-- ends: .atbd_listing_info -->
                            </article>
                                <!-- atbd_single_listing_wrapper -->
                        </div>
                    </div>
                        </div>
                        <br />
                        <!-- ends: .col-lg-12 -->
                    </div>
                    <!-- ends: .col-lg-12 -->
                </asp:panel>
            </div>
        </div>
    </div>
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
                                                  <asp:dropdownlist runat="server" class="give_rating" id="reviewStar">
                                                      <asp:ListItem Value="1">1</asp:ListItem>
                                                      <asp:ListItem Value="2">2</asp:ListItem>
                                                      <asp:ListItem Value="3">3</asp:ListItem>
                                                      <asp:ListItem Value="4">4</asp:ListItem>
                                                      <asp:ListItem Value="5">5</asp:ListItem>
                                                  </asp:dropdownlist>
                                              </div>
                                          </div>
                                      </div><!-- ends: .atbd_review_update_rating -->
                                  </div><!-- ends: .atbd_review_rating_area -->
                                  <div class="form-group">
                                      <br />
                                      <asp:textbox runat="server" class="form-control" textmode="multiline" Height="100px" id="reviewdes"></asp:textbox>
                                  </div>
                                  <asp:button runat="server" text="Submit Review" class="btn btn-primary" id="submitReview" onclick="submitReview_Click" />
                              </form>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
            <!-- /.modal -->  
</asp:Content>