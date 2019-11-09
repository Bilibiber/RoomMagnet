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
        .auto-style1 {
            width: 117px;
        }

        .auto-style2 {
            width: 898px;
        }

        .auto-style3 {
            width: 758px;
        }

        .auto-style4 {
            width: 200px;
        }

        .auto-style6 {
            width: 40px;
        }

        .auto-style7 {
            width: 20px;
        }

        .auto-style8 {
            width: 25px;
            height: 74px;
        }

        .auto-style9 {
            width: 200px;
            height: 74px;
        }

        .auto-style10 {
            height: 74px;
        }

        .auto-style11 {
            width: 120px;
        }

        .auto-style12 {
            position: relative;
            width: 100%;
            -ms-flex: 0 0 33.333333%;
            flex: 0 0 33.333333%;
            max-width: 33.333333%;
            left: 0px;
            top: 0px;
            padding-left: 15px;
            padding-right: 15px;
        }

        .auto-style13 {
            width: 20px;
            height: 33px;
        }

        .auto-style14 {
            width: 200px;
            height: 33px;
        }

        .auto-style15 {
            height: 33px;
        }

        .auto-style16 {
            width: 120px;
            height: 33px;
        }

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
    <div class="modal-body row">
        <div class="auto-style12" style="border-style: none; background-color: gray; text-align: center; background-repeat: repeat;">
            <!-- Your first column here -->

            <br />

            <asp:image id="imgpreview" runat="server" height="200" width="200" imageurl="http://cliquecities.com/assets/no-image-e3699ae23f866f6cbdf8ba2443ee5c4e.jpg" style="border-width: 0px; border-radius: 50%;" />

            <br />
            <br />
            <asp:label id="userstatus" runat="server" backcolor="#CC3300" borderstyle="None" font-size="XX-Large" forecolor="White" style="text-align: center; width: 200px;"></asp:label>
            <br />
            <br />
            <asp:button id="renterSavedSearch" runat="server" text="Saved Searches" font-size="XX-Large" forecolor="Red" backcolor="Gray" borderstyle="None" onclick="renterSavedSearch_Click"></asp:button>
            <br />
            <asp:button id="renterMessage" runat="server" text="My Message" font-size="XX-Large" forecolor="White" backcolor="Gray" borderstyle="None" onclick="renterMessage_Click"></asp:button>
            <br />
            <asp:button id="renterConnections" runat="server" text="Connections" font-size="XX-Large" forecolor="White" backcolor="Gray" borderstyle="None" onclick="renterConnections_Click"></asp:button>
            <br />
            <asp:button id="renterPreference" runat="server" text="Preferences" font-size="XX-Large" forecolor="White" backcolor="Gray" borderstyle="None" onclick="renterPreference_Click"></asp:button>
            <br />
            <asp:button id="rentertohost" runat="server" text="Become a Host" font-size="XX-Large" forecolor="White" backcolor="Gray" borderstyle="None" onclick="rentertohost_Click"></asp:button>
            <br />
            <asp:button id="renterSetting" runat="server" text="Settings" font-size="XX-Large" forecolor="White" backcolor="Gray" borderstyle="None" onclick="renterSetting_Click"></asp:button>
            <br />
        </div>
        <div class="col-md-8">
            <!-- Your second column here -->
            <br />
            <hr />
            <asp:panel runat="server" id="renterinfor">
                <asp:Label ID="hellow" runat="server" Text="Hello, world" ForeColor="#CC3300" Font-Size="3em" Font-Bold="True"></asp:Label>
                <br />
                <br />
                <table>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="renterabout" runat="server" Text="About" Font-Bold="True"></asp:Label>
                        </td>
                        <td class="auto-style1"></td>
                        <td class="auto-style2">
                            <asp:Label ID="userDes" runat="server" Text=""></asp:Label>
                        </td>
                        <td class="auto-style3"></td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="renterAge" runat="server" Text="Age" Font-Bold="True"></asp:Label>
                        </td>
                        <td class="auto-style1"></td>
                        <td class="auto-style2">
                            <p>
                                <asp:Label ID="userAge" runat="server" Text=""></asp:Label>
                            </p>
                        </td>
                        <td class="auto-style3"></td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="renterGender" runat="server" Text="Gender" Font-Bold="True"></asp:Label>
                        </td>
                        <td class="auto-style1"></td>
                        <td class="auto-style2">
                            <p>
                                <asp:Label ID="userGender" runat="server" Text=""></asp:Label>
                            </p>
                        </td>
                        <td class="auto-style3"></td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="renterOccupation" runat="server" Text="Occupation" Font-Bold="True"></asp:Label>
                        </td>
                        <td class="auto-style1"></td>
                        <td class="auto-style2">
                            <p>
                                <asp:Label ID="userOccu" runat="server" Text=""></asp:Label>
                            </p>
                        </td>
                        <td class="auto-style3"></td>
                    </tr>
                </table>
            </asp:panel>

            <hr />

            <%-- saved id panel--%>
            <asp:panel runat="server" id="rentersearch">
                <div id="saveSearch">
                    <asp:Label ID="save" runat="server" Text="Saved Searches" ForeColor="#CC3300" Font-Size="3em" Font-Bold="True"></asp:Label>
                    <br />
                    <asp:Button ID="renterEditSearch" runat="server" BackColor="White" BorderStyle="None" ForeColor="#666666" Text="Edit" />
                </div>
            </asp:panel>

            <%--message panel--%>
            <asp:panel runat="server" id="rentermymessage" visible="False">
                <div id="message">
                    <asp:Label ID="mymessage" runat="server" Text="My Message" ForeColor="#CC3300" Font-Size="3em" Font-Bold="True"></asp:Label>
                </div>
            </asp:panel>

            <%--connection panel--%>
            <asp:panel runat="server" id="renterconnection" visible="False">
                <div>
                    <asp:Label runat="server" Text="Connection" ForeColor="#CC3300" Font-Size="3em" Font-Bold="True"></asp:Label>
                </div>
            </asp:panel>

            <%--preference panel--%>
            <asp:panel runat="server" id="renterpreferences" visible="False">
                <div>
                    <asp:Label runat="server" Text="Preference" ForeColor="#CC3300" Font-Size="3em" Font-Bold="True"></asp:Label>
                </div>
            </asp:panel>
        </div>
    </div>
</asp:Content>