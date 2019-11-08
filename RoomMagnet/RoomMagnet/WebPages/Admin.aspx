<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="WebPages_Admin" %>

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

            <div class="userimage">
            </div>
            <%--<img src="https://pbs.twimg.com/profile_images/988775660163252226/XpgonN0X_400x400.jpg" class="rounded mx-auto d-block" alt="userimage" style="width: 300px;" />--%>
            <br />
            
            <br />
            <asp:Button ID="adminDashboard" runat="server" Text="Dashboard" Font-Size="XX-Large" ForeColor="Red" BackColor="Gray" BorderStyle="None" OnClick="adminDashboard_Click"></asp:Button>
            <br />
            <asp:Button ID="adminStatistics" runat="server" Text="Statistics" Font-Size="XX-Large" ForeColor="White" BackColor="Gray" BorderStyle="None" OnClick="adminStatistics_Click"></asp:Button>
            <br />
            <asp:Button ID="adminEmployee" runat="server" Text="Employee" Font-Size="XX-Large" ForeColor="White" BackColor="Gray" BorderStyle="None" OnClick="adminEmployee_Click"></asp:Button>
            <br />
            <asp:Button ID="adminTasks" runat="server" Text="Tasks" Font-Size="XX-Large" ForeColor="White" BackColor="Gray" BorderStyle="None" OnClick="adminTasks_Click"></asp:Button>
            <br />
            <%--<asp:Button ID="rentertohost" runat="server" Text="Become a Host" Font-Size="XX-Large" ForeColor="White" BackColor="Gray" BorderStyle="None" OnClick="rentertohost_Click"></asp:Button>
            <br />--%>
            <asp:Button ID="adminSettings" runat="server" Text="Settings" Font-Size="XX-Large" ForeColor="White" BackColor="Gray" BorderStyle="None" OnClick="adminSetting_Click"></asp:Button>
            <br />
        </div>
        <div class="col-md-8">
            <!-- Your second column here -->
            <br />
            <hr />
            <asp:Panel runat="server" ID="renterinfor">
                <asp:Label ID="Hello" runat="server" Text="" ForeColor="#CC3300" Font-Size="3em" Font-Bold="True"></asp:Label>
                <br />
                <br />
            </asp:Panel>



            <hr />

            <%-- saved id panel--%>
            <asp:Panel runat="server" ID="adminHomePanel">
                <div id="saveSearch">
                    <asp:Label ID="Home" runat="server" Text="Home" ForeColor="#CC3300" Font-Size="3em" Font-Bold="True"></asp:Label>
                    <br />
                    <asp:Button ID="adminHomeButton" runat="server" BackColor="White" BorderStyle="None" ForeColor="#666666" Text="Edit" />
                </div>
            </asp:Panel>


            <%--message panel--%>
            <asp:Panel runat="server" ID="adminStatisticsPanel" Visible="False">
                <div id="Statistics">
                    <asp:Label ID="statisticsPanel" runat="server" Text="Statistics" ForeColor="#CC3300" Font-Size="3em" Font-Bold="True"></asp:Label>
                </div>
            </asp:Panel>

            <%--connection panel--%>
            <asp:Panel runat="server" ID="adminEmployeesPanel" Visible="False">
                <div>
                    <asp:Label runat="server" Text="Employees" ForeColor="#CC3300" Font-Size="3em" Font-Bold="True"></asp:Label>
                </div>
            </asp:Panel>

            <%--preference panel--%>
            <asp:Panel runat="server" ID="adminTasksPanel" Visible="False">
                <div>
                    <asp:Label runat="server" Text="Tasks" ForeColor="#CC3300" Font-Size="3em" Font-Bold="True"></asp:Label>
                </div>
            </asp:Panel>


        </div>
    </div>
</asp:Content>

