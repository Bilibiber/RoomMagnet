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
        .auto-style15 {
            height: 32px;
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
            <%--Tableau Dashboard--%>
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

            <%--Add Employee Panel--%>
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

            <%--                            <asp:RequiredFieldValidator ID="stateValidator" runat="server" ControlToValidate="stateDropDown" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addEmployee" Display="Dynamic">Required</asp:RequiredFieldValidator>--%>

            <asp:Panel runat="server" ID="adminAddEmployeePanel" Visible="False">
                <div>
                    <asp:Label ID="addEmployeePanel" runat="server" Text="Add Employee to System" ForeColor="#CC3300" Font-Size="3em" Font-Bold="true"></asp:Label>
                    <br />
                    <br />
                    <table>
                    <tr>
                        <td class="auto-style15">&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="firstNameLabel" runat="server" Text="First Name" Font-Bold="True"></asp:Label>
                        </td>
                        <td class="auto-style15"></td>
                        <td class="auto-style15">
                            <asp:TextBox ID="firstNameText" runat="server" Text=""></asp:TextBox>
                            <asp:RequiredFieldValidator ID="firstNameValidator" runat="server" ControlToValidate="firstNameText" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addEmployee" Display="Dynamic">Required</asp:RequiredFieldValidator>
                        </td>
                        <td class="auto-style15"></td>
                        <td class="auto-style15">&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lastNameLabel" runat="server" Text="Last Name" Font-Bold="True"></asp:Label>
                        <td class="auto-style15"></td>
                        <td class="auto-style15">
                            <asp:TextBox ID="lastNameText" runat="server" Text=""></asp:TextBox>
                            <asp:RequiredFieldValidator ID="lastNameValidator" runat="server" ControlToValidate="lastNameText" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addEmployee" Display="Dynamic">Required</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="streetAddressLbl" runat="server" Text="StreetAddress" Font-Bold="True"></asp:Label>
                        </td>
                        <td class="auto-style1"></td>
                        <td class="auto-style2">
                            <p>
                                <asp:TextBox ID="streetAddressText" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="streetAddressValidator" runat="server" ControlToValidate="streetAddressText" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addEmployee" Display="Dynamic">Required</asp:RequiredFieldValidator>
                            </p>
                        </td>
                        <td class="auto-style1"></td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="cityLbl" runat="server" Text="City" Font-Bold="True"></asp:Label></td>
                        <td class="auto-style1"></td>
                        <td class="auto-style2">
                            <asp:TextBox ID="cityText" runat="server" Text=""></asp:TextBox>
                            <asp:RequiredFieldValidator ID="cityValidator" runat="server" ControlToValidate="cityText" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addEmployee" Display="Dynamic">Required</asp:RequiredFieldValidator>
                        </td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="stateLbl" runat="server" Text="State" Font-Bold="true"></asp:Label></td>
                        <td class="auto-style1>"></td>
                        <td class="auto-style2">
                             <asp:DropDownList ID="stateDropDown" runat="server">
                                <asp:ListItem Value=""></asp:ListItem>
	                            <asp:ListItem Value="AL">Alabama</asp:ListItem>
	                            <asp:ListItem Value="AK">Alaska</asp:ListItem>
	                            <asp:ListItem Value="AZ">Arizona</asp:ListItem>
	                            <asp:ListItem Value="AR">Arkansas</asp:ListItem>
	                            <asp:ListItem Value="CA">California</asp:ListItem>
	                            <asp:ListItem Value="CO">Colorado</asp:ListItem>
	                            <asp:ListItem Value="CT">Connecticut</asp:ListItem>
	                            <asp:ListItem Value="DC">District of Columbia</asp:ListItem>
	                            <asp:ListItem Value="DE">Delaware</asp:ListItem>
	                            <asp:ListItem Value="FL">Florida</asp:ListItem>
	                            <asp:ListItem Value="GA">Georgia</asp:ListItem>
	                            <asp:ListItem Value="HI">Hawaii</asp:ListItem>
	                            <asp:ListItem Value="ID">Idaho</asp:ListItem>
	                            <asp:ListItem Value="IL">Illinois</asp:ListItem>
	                            <asp:ListItem Value="IN">Indiana</asp:ListItem>
	                            <asp:ListItem Value="IA">Iowa</asp:ListItem>
	                            <asp:ListItem Value="KS">Kansas</asp:ListItem>
	                            <asp:ListItem Value="KY">Kentucky</asp:ListItem>
	                            <asp:ListItem Value="LA">Louisiana</asp:ListItem>
	                            <asp:ListItem Value="ME">Maine</asp:ListItem>
	                            <asp:ListItem Value="MD">Maryland</asp:ListItem>
	                            <asp:ListItem Value="MA">Massachusetts</asp:ListItem>
	                            <asp:ListItem Value="MI">Michigan</asp:ListItem>
	                            <asp:ListItem Value="MN">Minnesota</asp:ListItem>
	                            <asp:ListItem Value="MS">Mississippi</asp:ListItem>
	                            <asp:ListItem Value="MO">Missouri</asp:ListItem>
	                            <asp:ListItem Value="MT">Montana</asp:ListItem>
	                            <asp:ListItem Value="NE">Nebraska</asp:ListItem>
	                            <asp:ListItem Value="NV">Nevada</asp:ListItem>
	                            <asp:ListItem Value="NH">New Hampshire</asp:ListItem>
	                            <asp:ListItem Value="NJ">New Jersey</asp:ListItem>
	                            <asp:ListItem Value="NM">New Mexico</asp:ListItem>
	                            <asp:ListItem Value="NY">New York</asp:ListItem>
	                            <asp:ListItem Value="NC">North Carolina</asp:ListItem>
	                            <asp:ListItem Value="ND">North Dakota</asp:ListItem>
	                            <asp:ListItem Value="OH">Ohio</asp:ListItem>
	                            <asp:ListItem Value="OK">Oklahoma</asp:ListItem>
	                            <asp:ListItem Value="OR">Oregon</asp:ListItem>
	                            <asp:ListItem Value="PA">Pennsylvania</asp:ListItem>
	                            <asp:ListItem Value="RI">Rhode Island</asp:ListItem>
	                            <asp:ListItem Value="SC">South Carolina</asp:ListItem>
	                            <asp:ListItem Value="SD">South Dakota</asp:ListItem>
	                            <asp:ListItem Value="TN">Tennessee</asp:ListItem>
	                            <asp:ListItem Value="TX">Texas</asp:ListItem>
	                            <asp:ListItem Value="UT">Utah</asp:ListItem>
	                            <asp:ListItem Value="VT">Vermont</asp:ListItem>
	                            <asp:ListItem Value="VA">Virginia</asp:ListItem>
	                            <asp:ListItem Value="WA">Washington</asp:ListItem>
	                            <asp:ListItem Value="WV">West Virginia</asp:ListItem>
	                            <asp:ListItem Value="WI">Wisconsin</asp:ListItem>
	                            <asp:ListItem Value="WY">Wyoming</asp:ListItem>
                             </asp:DropDownList>
                        </td>
                    </tr>

                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="countryLbl" runat="server" Text="Country" Font-Bold="True"></asp:Label></td>
                        <td class="auto-style1"></td>
                        <td class="auto-style2">
                            <asp:TextBox ID="countryText" runat="server" Text=""></asp:TextBox>
                            <asp:RequiredFieldValidator ID="countryValidator" runat="server" ControlToValidate="countryText" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addEmployee" Display="Dynamic">Required</asp:RequiredFieldValidator>
                        </td>
                        <td class="auto-style1"></td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="zipCodeLbl" runat="server" Text="Zip Code" Font-Bold="True"></asp:Label></td>
                        <td class="auto-style1"></td>
                        <td class="auto-style2">
                            <asp:TextBox ID="zipCodeText" runat="server" Text=""></asp:TextBox>
                            <asp:RequiredFieldValidator ID="zipCodeValidator" runat="server" ControlToValidate="zipCodeText" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addEmployee" Display="Dynamic">Required</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="emailAddressLbl" runat="server" Text="Email Address" Font-Bold="True"></asp:Label>
                        </td>
                        <td class="auto-style1"></td>
                        <td class="auto-style2">
                            <p>
                                <asp:TextBox ID="emailAddressText" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="emailValidator" runat="server" ControlToValidate="emailAddressText" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addEmployee" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                <asp:CustomValidator ID="AdminEmployeeCustomValidator" runat="server" ErrorMessage="Email already exists" ControlToValidate="emailAddressText" ForeColor="Red" ValidationGroup="addEmployee" Display="Dynamic" OnServerValidate="SignUpEmailCustomValidator_ServerValidate"></asp:CustomValidator>
                            </p>
                        </td>
                        <td class="auto-style1">
                            <asp:Label ID="ErrorMessage" runat="server"></asp:Label>
                        </td>
                        <td class="auto-style13">&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="positionLbl" runat="server" Text="Position" Font-Bold="True"></asp:Label>
                        </td>
                        <td class="auto-style13"></td>
                        <td class="auto-style13">
                            <p>
                                <asp:TextBox ID="positionText" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="positionValidator" runat="server" ControlToValidate="positionText" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addEmployee" Display="Dynamic">Required</asp:RequiredFieldValidator>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="insertBtn" runat="server" OnClick="insertBtn_Click" Text="Create New Employee" ValidationGroup="addEmployee"></asp:Button></td>
                        <td class="auto-style2">
                            &nbsp;</td>
                    </tr>

                    </table>
                </div>
            </asp:Panel>
            
            <%--Verification panel--%>
            <asp:Panel runat="server" ID="adminEmployeesPanel" Visible="False">
                <div>
                    <asp:Label ID ="updateEmployeePanel" runat="server" Text="Update Employee Info" ForeColor="#CC3300" Font-Size="3em" Font-Bold="True"></asp:Label>
                    <br />
                    <br />
                    <asp:DropDownList ID="emailDropDown" runat="server" AppendDataBoundItems="true" DataTextField="Email" OnTextChanged="adminEmployee_Click" OnSelectedIndexChanged="adminEmployee_Click"></asp:DropDownList>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <table>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="updateFirstNameLbl" runat="server" Text="First Name" Font-Bold="True"></asp:Label>
                        </td>
                        <td class="auto-style1"></td>
                        <td class="auto-style2">
                            <asp:TextBox ID="updateFirstNameText" runat="server" Text=""></asp:TextBox>
                        </td>
                        <td class="auto-style1"></td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="updateLastNameLbl" runat="server" Text="Last Name" Font-Bold="True"></asp:Label>
                        <td class="auto-style1"></td>
                        <td class="auto-style2">
                            <asp:TextBox ID="updateLastNameText" runat="server" Text=""></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="updateStreetAddressLbl" runat="server" Text="Street Address" Font-Bold="True"></asp:Label>
                        </td>
                        <td class="auto-style1"></td>
                        <td class="auto-style2">
                            <p>
                                <asp:TextBox ID="updateStreetAddressText" runat="server"></asp:TextBox>
                            </p>
                        </td>
                        <td class="auto-style1"></td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="updateCityLbl" runat="server" Text="City" Font-Bold="True"></asp:Label></td>
                        <td class="auto-style1"></td>
                        <td class="auto-style2">
                            <asp:TextBox ID="updateCityText" runat="server" Text=""></asp:TextBox>
                        </td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="updateStateLbl" runat="server" Text="State" Font-Bold="true"></asp:Label></td>
                        <td class="auto-style1>"></td>
                        <td class="auto-style2">
                             <asp:DropDownList ID="updateStateDropDownList" runat="server">
                                <asp:ListItem Value=""></asp:ListItem>
	                            <asp:ListItem Value="AL">Alabama</asp:ListItem>
	                            <asp:ListItem Value="AK">Alaska</asp:ListItem>
	                            <asp:ListItem Value="AZ">Arizona</asp:ListItem>
	                            <asp:ListItem Value="AR">Arkansas</asp:ListItem>
	                            <asp:ListItem Value="CA">California</asp:ListItem>
	                            <asp:ListItem Value="CO">Colorado</asp:ListItem>
	                            <asp:ListItem Value="CT">Connecticut</asp:ListItem>
	                            <asp:ListItem Value="DC">District of Columbia</asp:ListItem>
	                            <asp:ListItem Value="DE">Delaware</asp:ListItem>
	                            <asp:ListItem Value="FL">Florida</asp:ListItem>
	                            <asp:ListItem Value="GA">Georgia</asp:ListItem>
	                            <asp:ListItem Value="HI">Hawaii</asp:ListItem>
	                            <asp:ListItem Value="ID">Idaho</asp:ListItem>
	                            <asp:ListItem Value="IL">Illinois</asp:ListItem>
	                            <asp:ListItem Value="IN">Indiana</asp:ListItem>
	                            <asp:ListItem Value="IA">Iowa</asp:ListItem>
	                            <asp:ListItem Value="KS">Kansas</asp:ListItem>
	                            <asp:ListItem Value="KY">Kentucky</asp:ListItem>
	                            <asp:ListItem Value="LA">Louisiana</asp:ListItem>
	                            <asp:ListItem Value="ME">Maine</asp:ListItem>
	                            <asp:ListItem Value="MD">Maryland</asp:ListItem>
	                            <asp:ListItem Value="MA">Massachusetts</asp:ListItem>
	                            <asp:ListItem Value="MI">Michigan</asp:ListItem>
	                            <asp:ListItem Value="MN">Minnesota</asp:ListItem>
	                            <asp:ListItem Value="MS">Mississippi</asp:ListItem>
	                            <asp:ListItem Value="MO">Missouri</asp:ListItem>
	                            <asp:ListItem Value="MT">Montana</asp:ListItem>
	                            <asp:ListItem Value="NE">Nebraska</asp:ListItem>
	                            <asp:ListItem Value="NV">Nevada</asp:ListItem>
	                            <asp:ListItem Value="NH">New Hampshire</asp:ListItem>
	                            <asp:ListItem Value="NJ">New Jersey</asp:ListItem>
	                            <asp:ListItem Value="NM">New Mexico</asp:ListItem>
	                            <asp:ListItem Value="NY">New York</asp:ListItem>
	                            <asp:ListItem Value="NC">North Carolina</asp:ListItem>
	                            <asp:ListItem Value="ND">North Dakota</asp:ListItem>
	                            <asp:ListItem Value="OH">Ohio</asp:ListItem>
	                            <asp:ListItem Value="OK">Oklahoma</asp:ListItem>
	                            <asp:ListItem Value="OR">Oregon</asp:ListItem>
	                            <asp:ListItem Value="PA">Pennsylvania</asp:ListItem>
	                            <asp:ListItem Value="RI">Rhode Island</asp:ListItem>
	                            <asp:ListItem Value="SC">South Carolina</asp:ListItem>
	                            <asp:ListItem Value="SD">South Dakota</asp:ListItem>
	                            <asp:ListItem Value="TN">Tennessee</asp:ListItem>
	                            <asp:ListItem Value="TX">Texas</asp:ListItem>
	                            <asp:ListItem Value="UT">Utah</asp:ListItem>
	                            <asp:ListItem Value="VT">Vermont</asp:ListItem>
	                            <asp:ListItem Value="VA">Virginia</asp:ListItem>
	                            <asp:ListItem Value="WA">Washington</asp:ListItem>
	                            <asp:ListItem Value="WV">West Virginia</asp:ListItem>
	                            <asp:ListItem Value="WI">Wisconsin</asp:ListItem>
	                            <asp:ListItem Value="WY">Wyoming</asp:ListItem>
                             </asp:DropDownList>
                        </td>
                    </tr>

                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="updateCountryLbl" runat="server" Text="Country" Font-Bold="True"></asp:Label></td>
                        <td class="auto-style1"></td>
                        <td class="auto-style2">
                            <asp:TextBox ID="updateCountryText" runat="server" Text=""></asp:TextBox>
                        </td>
                        <td class="auto-style1"></td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="updateZipCodeLbl" runat="server" Text="Zip Code" Font-Bold="True"></asp:Label></td>
                        <td class="auto-style1"></td>
                        <td class="auto-style2">
                            <asp:TextBox ID="updateZipCodeText" runat="server" Text=""></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="updateEmailLbl" runat="server" Text="Email Address" Font-Bold="True"></asp:Label>
                        </td>
                        <td class="auto-style1"></td>
                        <td class="auto-style2">
                            <p>
                                <asp:TextBox ID="updateEmailText" runat="server"></asp:TextBox>
                            </p>
                        </td>
                        <td class="auto-style1"></td>
                        <td class="auto-style13">&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="updatePositionLbl" runat="server" Text="Position" Font-Bold="True"></asp:Label>
                        </td>
                        <td class="auto-style13"></td>
                        <td class="auto-style13">
                            <p>
                                <asp:TextBox ID="updatePositionText" runat="server" ViewStateMode="Disabled"></asp:TextBox>
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

