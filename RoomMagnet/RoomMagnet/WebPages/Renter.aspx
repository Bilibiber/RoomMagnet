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
                        <asp:Image ID="imgpreview" runat="server" Height="200" Width="200" ImageUrl="http://cliquecities.com/assets/no-image-e3699ae23f866f6cbdf8ba2443ee5c4e.jpg" Style="border-width: 0px; border-radius: 50%;" />
                        <br />
                        <asp:Label ID="userstatus" runat="server" BackColor="#CC3300" BorderStyle="None" Font-Size="X-Large" ForeColor="White" Style="text-align: center; width: 150px;"></asp:Label>
                    </div>
                    <!-- END SIDEBAR USERPIC -->

                    <!-- SIDEBAR MENU -->
                    <div class="profile-usermenu dashboard-size nav flex-column">
                        <div class="text-center name-about">

                            <asp:Label ID="hellow" runat="server" Text="Hello, world" Font-Size="2em" Font-Bold="True"></asp:Label>
                            <br />
                        </div>
                        <ul class="list-unstyled">
                            <li class="nav-item">
                                <asp:LinkButton ID="renterprofile" runat="server" Style="font-size: 1.5em;" OnClick="renterProfile_Click" BackColor="#C6D6E2"> <i class="la la-user" style="font-size:1em;"></i>My Profile</asp:LinkButton>
                            </li>
                            <li class="nav-item">
                                <asp:LinkButton ID="renterFavorites" runat="server" Style="font-size: 1.5em;" OnClick="renterFavorites_Click"><i class="la la-home" style="font-size:1em;"></i>My Favorites</asp:LinkButton>
                            </li>
                            <li class="nav-item" style="margin-top: 0px">
                                <asp:LinkButton ID="renterConnections" runat="server" Style="font-size: 1.5em;" OnClick="renterConnections_Click"><i class="la la-users" style="font-size:1em;"></i>Connections</asp:LinkButton>
                            </li>
                            <li class="nav-item">
                                <asp:LinkButton ID="renterMessage" runat="server" Style="font-size: 1.5em;" OnClick="renterMessage_Click"><i class="la la-comments" style="font-size:1em;"></i>Messages</asp:LinkButton>
                            </li>
                        </ul>
                        <asp:Button ID="rentertohost" runat="server" class="btn btn-primary" Text="Become a Host" BorderStyle="None" OnClick="rentertohost_Click" Style="font-size: 1.5em;"></asp:Button>
                    </div>
                    <!-- END MENU -->
                </div>
            </div>

            <div class="col-md-9">
                <%--renter profile--%>
                <asp:Panel ID="panelprofile" runat="server">
                    <div class="profile-content atbd_content_module">
                        <div class="atbd_content_module__tittle_area about-titles">
                            <div class="atbd_area_title">
                                <h4 style="font-size: 2em;"><span class="la la-user" style="font-size: 1em; color: black;"></span>My Profile </h4>
                                <asp:LinkButton ID="editprofile" runat="server" OnClick="editprofile_Click">Edit</asp:LinkButton>
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
                </asp:Panel>

                <%--renter favorites--%>
                <asp:Panel ID="panelfavorites" runat="server" Visible="False">
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

                                            <asp:ImageButton ID="Property1Image" OnClick="Property1Image_Click" runat="server" CssClass="imgfill" />
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
                    </div>
                    <!-- ends: .col-lg-12 -->
                    <div id="Property2Space" runat="server" class="col-lg-12">
                        <div class="atbd_single_listing atbd_listing_list">
                            <article class="atbd_single_listing_wrapper">
                                <figure class="atbd_listing_thumbnail_area">
                                    <div class="atbd_listing_image fill">

                                        <asp:ImageButton ID="Property2Image" OnClick="Property2Image_Click" runat="server" CssClass="imgfill" />
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

                                        <asp:ImageButton ID="Property3Image" OnClick="Property3Image_Click" runat="server" CssClass="imgfill" />
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
                </asp:Panel>

                <%--renter connections--%>
                <asp:Panel ID="panelconnections" runat="server" Visible="False">
                    <div class="profile-content atbd_content_module">
                        <div class="atbd_content_module__tittle_area about-titles">
                            <div class="atbd_area_title">
                                <h4 style="font-size: 2em; color: black;"><span class="la la-users" style="font-size: 1em; color: black">Connections</span></h4>
                            </div>
                        </div>
                    </div>
                </asp:Panel>

                <%--renter message--%>
                <asp:Panel ID="panelmessage" runat="server" Visible="False">
                    <div class="profile-content atbd_content_module">
                        <div class="atbd_content_module__tittle_area about-titles">
                            <div class="atbd_area_title">
                                <h4 style="font-size: 2em; color: black;"><span class="la la-comments" style="font-size: 1em; color: black">Messages</span></h4>
                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>