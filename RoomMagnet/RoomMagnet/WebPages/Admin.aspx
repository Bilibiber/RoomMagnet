<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="WebPages_Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
 
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
        <div class="col-md-2 no-padding" >
            <div id="sidebar-wrapper" style="background-color:slategray">

              <div class="profile-userpic admin-pic text-center">
                  <img class="mx-auto d-block admin-img" src="../img/rm/two-people.jpg" alt="" >
                  <div>
                    <h4 class="admin-space">
                        <asp:Label ID="WelcomeMessage" runat="server" Text="" ForeColor="White" Font-Size="Small" Font-Bold="True"></asp:Label>
                    </h4>
                    <p>Admin</p>
                  </div>
              <ul class="sidebar-nav list-unstyled">
                <li class="active nav-item"> <a href="#"><i class="la la-home"></i><asp:Button ID="adminDashboard" runat="server" Text="Dashboard" Font-Size="Medium" BackColor="#8a8c8f" BorderStyle="None" OnClick="adminDashboard_Click"></asp:Button> </a></li>
                <li class="nav-item"><a href="#"><i class="la la-plus"></i><asp:Button ID="adminAddEmployee" runat="server" Text="Add Employee" Font-Size="Medium" BackColor="Gray" BorderStyle="None" OnClick="adminAddEmployee_Click"></asp:Button></a></li>
                <li class=" nav-item"><a href="#"><i class="la la-edit"></i><asp:Button ID="adminEmployee" runat="server" Text="Update Employee" Font-Size="Medium" BackColor="Gray" BorderStyle="None" OnClick="adminEmployee_Click"></asp:Button></a></li>
                <li class=" nav-item"><a href="#"><i class="la la-check-circle"></i><asp:Button ID="adminVerification" runat="server" Text="Verification" Font-Size="Medium" BackColor="Gray" BorderStyle="None" OnClick="adminVerification_Click"></asp:Button></a></li>    
              </ul>
              </div>
            </div> <!-- /#sidebar-wrapper -->
         </div>
        <div class="col-md-8 mx-auto ">
        <h1 class="update-title">Dashboard</h1>
        <div class="atbd_author_module">
            <div class="atbd_content_module">
                <div class="atbdb_content_module_contents">
                    <div class="user_info_wrap">
                        <div class="row">
                            <asp:Panel runat="server" ID="adminDashboardPanel">
                                <div id="adminDashboard1">
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
                        </div>
                    </div>
                </div>
            </div>
            <asp:Panel runat="server" ID="adminAddEmployeePanel" Visible="False">
                <section>
                <div class="col-md-9 mx-auto ">
                    <h1 class="update-title">Add Employee</h1>
                    <div class="atbd_author_module">
                        <div class="atbd_content_module">
                            <div class="atbdb_content_module_contents">
                                <div class="user_info_wrap">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="firstNameLbl" class="not_empty">First Name</label>
                                                <asp:TextBox runat="server" CssClass="form-control" id="firstNameText" type="text" placeholder="First Name" ></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="last_name" class="not_empty">Last Name</label>
                                                <asp:TextBox runat="server" CssClass="form-control" id="lastNameText" type="text" placeholder="Last Name" ></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="street" class="not_empty">Street Address</label>
                                                <asp:TextBox runat="server" CssClass="form-control" id="streetAddressText" type="text" placeholder="Street Address" ></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="city" class="not_empty">City</label>
                                                <asp:TextBox runat="server" CssClass="form-control" id="cityText" type="text" placeholder="City" ></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group ">
                                                <label for="zip" class="form-label ">Zip Code</label>
                                                <asp:TextBox runat="server" CssClass="form-control" id="zipCodeText" type="text" placeholder="Zip Code" ></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="state" class="form-label">State</label>
                                                <div class="input-group">
                                                    <asp:DropDownList CssClass="custom-select" ID="stateDropDown" runat="server"></asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="country" class="form-label">Country</label>
                                                <div class="input-group">
                                                    <asp:DropDownList CssClass="custom-select" ID="countryDropDown" runat="server"></asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="email" class="not_empty">Email Address</label>
                                                <asp:TextBox runat="server" CssClass="form-control" id="emailAddressText" type="text" placeholder="Email Address"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="position" class="not_empty">Position</label>
                                                <asp:TextBox runat="server" CssClass="form-control" id="positionText" type="text" placeholder="Position" ></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-2 inline">
                                            <label class="btn btn-sm btn-secondary form-control-file">Create</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </div>
                        </div>
                    </div>
                </section>
            </asp:Panel>
    </div>                
            <%--Tableau Dashboard--%>

    
            

            
            
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
            

            <%--                            <asp:RequiredFieldValidator ID="stateValidator" runat="server" ControlToValidate="stateDropDown" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addEmployee" Display="Dynamic">Required</asp:RequiredFieldValidator>--%>

            
            
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
        <div>
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
    <section class="section-bg p-bottom-70">
<div class="row">
    

      </div>
    </div>
</section>
    </div>
    </div>
</asp:Content>

