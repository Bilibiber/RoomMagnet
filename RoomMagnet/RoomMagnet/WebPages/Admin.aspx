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
            <%--Employee Update panel--%>
            <br />
            
            <br />
            <asp:Button ID="adminDashboard" runat="server" Text="Dashboard" Font-Size="XX-Large" BackColor="Gray" BorderStyle="None" OnClick="adminDashboard_Click"></asp:Button>              
            <br />
            <asp:Button ID="adminAddEmployee" runat="server" Text="Add Employee" Font-Size="XX-Large" BackColor="Gray" BorderStyle="None" OnClick="adminAddEmployee_Click"></asp:Button>
            <br />
            <asp:Button ID="adminEmployee" runat="server" Text="Update Employee" Font-Size="XX-Large" BackColor="Gray" BorderStyle="None" OnClick="adminEmployee_Click"></asp:Button>
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

            <%--Verification panel--%>
            <asp:Panel runat="server" ID="adminDashboardPanel">
                <div id="adminDashboard1">
                    <asp:Label ID="Dashboard" runat="server" Text="Dashboard" ForeColor="#CC3300" Font-Size="3em" Font-Bold="True"></asp:Label>
                    <br />
                    <script type='text/javascript' src='https://prod-useast-a.online.tableau.com/javascripts/api/viz_v1.js'></script>
                    <div class='tableauPlaceholder' style='width: 1000px; height: 827px;'>
                        <object class='tableauViz' width='1000' height='827' style='display:none;'>
                            <param name='host_url' value='https%3A%2F%2Fprod-useast-a.online.tableau.com%2F' /> 
                            <param name='embed_code_version' value='3' /> 
                            <param name='site_root' value='&#47;t&#47;ottisbishoptableaudashboard' />
                            <param name='name' value='CIS484TableauDashboard&#47;Dashboard1' />
                            <param name='tabs' value='no' />
                            <param name='toolbar' value='yes' />
                            <param name='showAppBanner' value='false' />
                        </object>
                    </div>
                </div>
            </asp:Panel>

            <%--Add Employee Panel--%>

            <asp:Panel runat="server" ID="adminAddEmployeePanel" Visible="False">
                <div>
                    <asp:Label ID="addEmployeePanel" runat="server" Text="Add Employee to System" ForeColor="#CC3300" Font-Size="3em" Font-Bold="true"></asp:Label>
                    <br />
                    <br />
                    <table>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="firstNameLabel" runat="server" Text="First Name" Font-Bold="True"></asp:Label>
                        </td>
                        <td class="auto-style1"></td>
                        <td class="auto-style2">
                            <asp:TextBox ID="firstNameText" runat="server" Text=""></asp:TextBox>
                        </td>
                        <td class="auto-style1"></td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lastNameLabel" runat="server" Text="Last Name" Font-Bold="True"></asp:Label>
                        <td class="auto-style1"></td>
                        <td class="auto-style2">
                            <asp:TextBox ID="lastNameText" runat="server" Text=""></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="streetAddressLbl" runat="server" Text="Age" Font-Bold="True"></asp:Label>
                        </td>
                        <td class="auto-style1"></td>
                        <td class="auto-style2">
                            <p>
                                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                            </p>
                        </td>
                        <td class="auto-style1"></td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label1" runat="server" Text="Last Name" Font-Bold="True"></asp:Label>
                        <td class="auto-style1"></td>
                        <td class="auto-style2">
                            <asp:TextBox ID="TextBox1" runat="server" Text=""></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label3" runat="server" Text="Gender" Font-Bold="True"></asp:Label>
                        </td>
                        <td class="auto-style1"></td>
                        <td class="auto-style2">
                            <p>
                                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style13">&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label4" runat="server" Text="Occupation" Font-Bold="True"></asp:Label>
                        </td>
                        <td class="auto-style13"></td>
                        <td class="auto-style13">
                            <p>
                                <asp:TextBox ID="TextBox4" runat="server" ViewStateMode="Disabled"></asp:TextBox>
                            </p>
                        </td>
                    </tr>

                </table>
                </div>
            </asp:Panel>
            
            <%--Employee Update panel--%>
            <asp:Panel runat="server" ID="adminEmployeesPanel" Visible="False">
                <div>
                    <asp:Label ID ="updateEmployeePanel" runat="server" Text="Update Employee Info" ForeColor="#CC3300" Font-Size="3em" Font-Bold="True"></asp:Label>
                    <br />
                    <br />
                    <asp:DropDownList ID="emailDropDown" runat="server" AppendDataBoundItems="true" DataTextField="Email" OnTextChanged="adminEmployee_Click" OnSelectedIndexChanged="adminEmployee_Click"></asp:DropDownList>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <table>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="employeeName" runat="server" Text="Name" Font-Bold="True"></asp:Label>
                        </td>
                        <td class="auto-style1"></td>
                        <td class="auto-style2">
                            <asp:TextBox ID="employeeName1" runat="server" Text=""></asp:TextBox>
                        </td>
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
                    </tr>

                </table>
                    <br />
                    <asp:Button ID="ViewBtn" runat="server" OnClick="view_Btn" Text="View Data" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="UpdateDataBtn" runat="server" OnClick="updateData_Btn" Text="Update Data" />
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
                    <asp:Button ID="VerificationButton" runat="server" Text="Verify" OnClick="VerificationButton_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="DeleteButton" runat="server" Text="Delete" OnClick="DeleteButton_Click" />
                </div>
            </asp:Panel>


        </div>
    </div>
</asp:Content>

