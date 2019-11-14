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
                        <asp:image id="imgpreview" runat="server" height="200" width="200" imageurl="http://cliquecities.com/assets/no-image-e3699ae23f866f6cbdf8ba2443ee5c4e.jpg" style="border-width: 0px; border-radius: 50%;" />
                        <br />
                        <asp:label id="userstatus" runat="server" backcolor="#CC3300" borderstyle="None" font-size="X-Large" forecolor="White" style="text-align: center; width: 150px;"></asp:label>
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
                                <asp:LinkButton ID="renterprofile" runat="server" style="font-size:1.5em;" OnClick="renterProfile_Click" BackColor="#C6D6E2"> <i class="la la-user" style="font-size:1em;"></i>My Profile</asp:LinkButton>
                            </li>
                            <li class="nav-item">
                                <asp:LinkButton ID="renterFavorites" runat="server" style="font-size:1.5em;" OnClick="renterFavorites_Click"><i class="la la-home" style="font-size:1em;"></i>My Favorites</asp:LinkButton>
                            </li>
                            <li class="nav-item" style="margin-top: 0px">
                                <asp:LinkButton ID="renterConnections" runat="server" style="font-size:1.5em;" onclick="renterConnections_Click"><i class="la la-users" style="font-size:1em;"></i>Connections</asp:LinkButton>
                            </li>
                            <li class="nav-item">
                                <asp:LinkButton ID="renterMessage" runat="server" style="font-size:1.5em;" onclick="renterMessage_Click"><i class="la la-comments" style="font-size:1em;"></i>Message</asp:LinkButton>
                            </li>
                        </ul>
                        <asp:button id="rentertohost" runat="server" class="btn btn-primary" text="Become a Host" borderstyle="None" onclick="rentertohost_Click" style="font-size:1.5em;"></asp:button>
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
                            <h4 style="font-size:2em;"><span class="la la-user" style="font-size:1em; color:black;"></span >My Profile </h4>
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
                        <div>
                            <h5 style="display: inline">Age</h5>
                            <asp:Label ID="userAge" runat="server" Text="" style="display: inline"></asp:Label>
                            <br />
                            <br />
                        </div>
                        <div class="about-des">
                            <h5 style="display: inline">Gender</h5>
                            <asp:Label ID="userGender" runat="server" Text="" style="display: inline"></asp:Label>
                            <br />
                            <br />
                        </div>
                        <div class="about-des">
                            <h5 style="display: inline">Occupation</h5>
                            <asp:Label ID="userOccu" runat="server" Text="" style="display: inline"></asp:Label>
                        </div>
                    </div>
                </div>
                </asp:Panel>

                <%--renter favorites--%>
                <asp:Panel ID="panelfavorites" runat="server" Visible="False">
                    <div class="profile-content atbd_content_module">
                    <div class="atbd_content_module__tittle_area about-titles">
                        <div class="atbd_area_title">
                            <h4 style="font-size:2em; color:black;"><span class="la la-home" style="font-size:1em; color:black;"> My Favorites</span ></h4>
                        </div>
                    </div>
                </div>
                </asp:Panel>

                <%--renter connections--%>
                 <asp:Panel ID="panelconnections" runat="server" Visible="False">
                    <div class="profile-content atbd_content_module">
                    <div class="atbd_content_module__tittle_area about-titles">
                        <div class="atbd_area_title">
                            <h4 style="font-size:2em; color:black;"><span class="la la-users" style="font-size:1em; color:black"> Connections</span ></h4>
                        </div>
                    </div>
                </div>
                </asp:Panel>

                 <%--renter message--%>
                 <asp:Panel ID="panelmessage" runat="server" Visible="False">
                    <div class="profile-content atbd_content_module">
                    <div class="atbd_content_module__tittle_area about-titles">
                        <div class="atbd_area_title">
                            <h4 style="font-size:2em; color:black;"><span class="la la-comments" style="font-size:1em; color:black"> Messages</span ></h4>
                        </div>
                    </div>
                </div>
                </asp:Panel>
            </div>


    </div>
    </div>
</asp:Content>