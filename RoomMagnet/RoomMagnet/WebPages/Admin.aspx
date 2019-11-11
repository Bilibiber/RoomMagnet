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
        .auto-style13 {
            height: 24px;
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
            <%--connection panel--%>
            <br />
            
            <br />
            <asp:Button ID="adminDashboard" runat="server" Text="Dashboard" Font-Size="XX-Large" BackColor="Gray" BorderStyle="None" OnClick="adminDashboard_Click"></asp:Button>              
            <br />
            <asp:Button ID="adminStatistics" runat="server" Text="Statistics" Font-Size="XX-Large" BackColor="Gray" BorderStyle="None" OnClick="adminStatistics_Click"></asp:Button>
            <br />
            <asp:Button ID="adminEmployee" runat="server" Text="Employee" Font-Size="XX-Large" BackColor="Gray" BorderStyle="None" OnClick="adminEmployee_Click"></asp:Button>
            <br />
            <asp:Button ID="adminVerification" runat="server" Text="Verification" Font-Size="XX-Large" BackColor="Gray" BorderStyle="None" OnClick="adminVerification_Click"></asp:Button>
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

            <%--Dashboard panel--%>
            <asp:Panel runat="server" ID="adminDashboardPanel">
                <div id="adminDashboard1">
                    <asp:Label ID="Dashboard" runat="server" Text="Dashboard" ForeColor="#CC3300" Font-Size="3em" Font-Bold="True"></asp:Label>
                    <br />
                    <div class='tableauPlaceholder' id='viz1573326382746' style='position: relative'>
                <noscript><a href='#'>
                    <img alt=' ' src='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Ta&#47;TabeleauforRoomMagnet&#47;Sheet1&#47;1_rss.png'  style='border: none' />
                          </a>
                </noscript>

                <object class='tableauViz' style='display:none;'>
                    <param name='host_url' value='https%3A%2F%2Fpublic.tableau.com%2F' /> 
                    <param name='embed_code_version' value='3' /> 
                    <param name='site_root' value='' />
                    <param name='name' value='TabeleauforRoomMagnet&#47;Sheet1' />
                    <param name='tabs' value='no' />
                    <param name='toolbar' value='yes' />
                    <param name='static_image' value='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Ta&#47;TabeleauforRoomMagnet&#47;Sheet1&#47;1.png' /> 
                    <param name='animate_transition' value='yes' />
                    <param name='display_static_image' value='yes' />
                    <param name='display_spinner' value='yes' />
                    <param name='display_overlay' value='yes' />
                    <param name='display_count' value='yes' />
                    <param name='filter' value='publish=yes' />
                </object>

                </div>                
            <script 
                type='text/javascript'> 
                var divElement = document.getElementById('viz1573326382746');
                var vizElement = divElement.getElementsByTagName('object')[0];
                vizElement.style.width = '100%';
                vizElement.style.height = (divElement.offsetWidth * 0.75) + 'px';
                var scriptElement = document.createElement('script');
                scriptElement.src = 'https://public.tableau.com/javascripts/api/viz_v1.js';
                vizElement.parentNode.insertBefore(scriptElement, vizElement);               
            </script>
                </div>
            </asp:Panel>


            <%--Statistics panel--%>
            <asp:Panel runat="server" ID="adminStatisticsPanel" Visible="False">
                <div id="Statistics">
                    <asp:Label ID="statisticsPanel" runat="server" Text="Statistics" ForeColor="#CC3300" Font-Size="3em" Font-Bold="True"></asp:Label>
                    
                </div>
            </asp:Panel>

            <%--Employees panel--%>
            <asp:Panel runat="server" ID="adminEmployeesPanel" Visible="False">
                <div>
                    <asp:Label ID ="employeePanel" runat="server" Text="Employees" ForeColor="#CC3300" Font-Size="3em" Font-Bold="True"></asp:Label>
                    <br />
                    <br />
                    <asp:DropDownList ID="emailDropDown" runat="server" AppendDataBoundItems="true" DataTextField="Email" OnTextChanged="adminEmployee_Click" OnSelectedIndexChanged="adminEmployee_Click"></asp:DropDownList>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <table>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="employeeName" runat="server" Text="Name" Font-Bold="True"></asp:Label>
                        </td>
                        <td class="auto-style1"></td>
                        <td class="auto-style2">
                            <asp:TextBox ID="employeeName1" runat="server" Text=""></asp:TextBox>
                        </td>
                        <td class="auto-style3"></td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="adminAge" runat="server" Text="Age" Font-Bold="True"></asp:Label>
                        </td>
                        <td class="auto-style1"></td>
                        <td class="auto-style2">
                            <p>
                                <asp:TextBox ID="employeeAge" runat="server"></asp:TextBox>
                            </p>
                        </td>
                        <td class="auto-style3"></td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="employeeGenderLbl" runat="server" Text="Gender" Font-Bold="True"></asp:Label>
                        </td>
                        <td class="auto-style1"></td>
                        <td class="auto-style2">
                            <p>
                                <asp:TextBox ID="employeeGender" runat="server"></asp:TextBox>
                            </p>
                        </td>
                        <td class="auto-style3"></td>
                    </tr>
                    <tr>
                        <td class="auto-style13">&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="employeeOccupation" runat="server" Text="Occupation" Font-Bold="True"></asp:Label>
                        </td>
                        <td class="auto-style13"></td>
                        <td class="auto-style13">
                            <p>
                                <asp:TextBox ID="employeeOccu" runat="server" ViewStateMode="Disabled"></asp:TextBox>
                            </p>
                        </td>
                        <td class="auto-style13"></td>
                    </tr>

                </table>
                    <br />
                    <asp:Button ID="ViewBtn" runat="server" OnClick="view_Btn" Text="View Data" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="UpdateBtn" runat="server" OnClick="update_Btn" Text="Update Data" />
                    <br />
                </div>
            </asp:Panel>

            <%--Verification panel--%>
            <asp:Panel runat="server" ID="adminVerificationPanel" Visible="False">
                <div>
                    <asp:Label ID="verificationPanel" runat="server" Text="Verification" ForeColor="#CC3300" Font-Size="3em" Font-Bold="True"></asp:Label>
                    <br />
                    <asp:DropDownList ID="UnverifiedDropDown" runat="server" AppendDataBoundItems="true" DataTextField="Email" OnTextChanged="adminVerification_Click" OnSelectedIndexChanged="adminVerification_Click"></asp:DropDownList>
                    <br />
                    <asp:Button ID="VerificationButton" runat="server" Text="Change" OnClick="VerificationButton_Click" />
                </div>
            </asp:Panel>


        </div>
    </div>
</asp:Content>

