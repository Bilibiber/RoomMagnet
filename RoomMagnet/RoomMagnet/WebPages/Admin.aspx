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
            <div id="sidebar-wrapper">

              <div class="profile-userpic admin-pic text-center">
                  <img class="mx-auto d-block admin-img" src="../img/mason-user.png" alt="" >
                  <div>
                    <h4 class="admin-space">
                        <asp:label id="WelcomeMessage" runat="server" text="Hello, world" font-size="2em" font-bold="True" forecolor="White"></asp:label>

                    </h4>
                    <p>Admin</p>
                  </div>
              <ul class="sidebar-nav list-unstyled">
                <li class="nav-item">
                    <asp:linkbutton id="adminDashboard" runat="server" style="font-size: 1.5em;" onclick="adminDashboard_Click"> <i class="la la-home icon-space" style="font-size:1em;"></i>Dashboard</asp:linkbutton>
                </li>
                <li class="nav-item">
                    <asp:linkbutton id="adminAddEmployee" runat="server" style="font-size: 1.5em;" onclick="adminAddEmployee_Click"> <i class="la la-plus icon-space" style="font-size:1em;"></i>Add Employee</asp:linkbutton>
                </li>
                <li class=" nav-item">
                    <asp:linkbutton id="adminEmployee" runat="server" style="font-size: 1.5em;" onclick="adminEmployee_Click"> <i class="la la-edit icon-space" style="font-size:1em;"></i>Update Employee</asp:linkbutton>
                </li>
                <li class=" nav-item">
                    <asp:linkbutton id="adminVerification" runat="server" style="font-size: 1.5em;" onclick="adminVerification_Click"> <i class="la la-check-circle icon-space" style="font-size:1em;"></i>Verification</asp:linkbutton>
                </li>    
              </ul>
              </div>
            </div> <!-- /#sidebar-wrapper -->
         </div>

        <div class="col-md-10 mx-auto no-padding">
            <div class="atbd_author_module">            
                <div class="user_info_wrap">
                    <div class="row">
                        <asp:Panel runat="server" ID="adminDashboardPanel" style="padding-left:15px;">
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
            <%--Tableau Dashboard--%>

    
            
            <asp:Panel runat="server" ID="adminAddEmployeePanel" Visible="False">
                <section class="section-bg">
                <div class="col-md-16 mx-auto" style="padding-left:15px;">
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
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorFirstName" runat="server" ErrorMessage="First Name Required" ControlToValidate="firstNameText" ValidationGroup="AdminAdd" Display="Dynamic"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorFirstName" runat="server" ErrorMessage="Special characters are not allowed. For example:% & , ; = $" ValidationExpression="[^%&,;>=$]+" ControlToValidate="firstNameText" Display="Dynamic" ValidationGroup="AdminAdd"></asp:RegularExpressionValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorFirstNameLetters" runat="server" ErrorMessage="Numeric values are not allowed" ValidationExpression="^([^0-9]*)$" ControlToValidate="firstNameText" Display="Dynamic" ValidationGroup="AdminAdd"></asp:RegularExpressionValidator>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="last_name" class="not_empty">Last Name</label>
                                                <asp:TextBox runat="server" CssClass="form-control" id="lastNameText" type="text" placeholder="Last Name" ></asp:TextBox>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorLastName" runat="server" ErrorMessage="Special characters are not allowed. For example: % & ’ , ; = $" ValidationExpression="[^%&,;>=$]+" ControlToValidate="lastNameText" Display="Dynamic" ValidationGroup="AdminAdd"></asp:RegularExpressionValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorLastNameLetters" runat="server" ErrorMessage="Numeric values are not allowed" ValidationExpression="^([^0-9]*)$" ControlToValidate="lastNameText" Display="Dynamic" ValidationGroup="AdminAdd"></asp:RegularExpressionValidator>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorLastName" runat="server" ErrorMessage="Last Name Required" ControlToValidate="lastNameText" ValidationGroup="AdminAdd" Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="street" class="not_empty">Street Address</label>
                                                <asp:TextBox runat="server" CssClass="form-control" id="streetAddressText" type="text" placeholder="Street Address" ></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Street Address Required" ControlToValidate="streetAddressText" ValidationGroup="AdminAdd" Display="Dynamic"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Special characters are not allowed. For example:% & , ; = $" ValidationExpression="[^%&,;>=$]+" ControlToValidate="streetAddressText" Display="Dynamic" ValidationGroup="AdminAdd"></asp:RegularExpressionValidator>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="city" class="not_empty">City</label>
                                                <asp:TextBox runat="server" CssClass="form-control" id="cityText" type="text" placeholder="City" ></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="City Required" ControlToValidate="cityText" ValidationGroup="AdminAdd" Display="Dynamic"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Special characters are not allowed. For example:% & , ; = $" ValidationExpression="[^%&,;>=$]+" ControlToValidate="cityText" Display="Dynamic" ValidationGroup="AdminAdd"></asp:RegularExpressionValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Numeric values are not allowed" ValidationExpression="^([^0-9]*)$" ControlToValidate="cityText" Display="Dynamic" ValidationGroup="AdminAdd"></asp:RegularExpressionValidator>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group ">
                                                <label for="zip" class="form-label ">Zip Code</label>
                                                <asp:TextBox runat="server" CssClass="form-control" id="zipCodeText" type="text" placeholder="Zip Code" ></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="City Required" ControlToValidate="zipCodeText" ValidationGroup="AdminAdd" Display="Dynamic"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="Special characters are not allowed. For example:% & , ; = $" ValidationExpression="[^%&,;>=$]+" ControlToValidate="zipCodeText" Display="Dynamic" ValidationGroup="AdminAdd"></asp:RegularExpressionValidator>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="state" class="form-label">State</label>
                                                <div class="input-group">
                                                    <asp:DropDownList CssClass="custom-select" ID="stateDropDown" runat="server">
                                                        <asp:ListItem Value=""></asp:ListItem>
                                                        <asp:ListItem Value="AL">AL</asp:ListItem>
                                                        <asp:ListItem Value="AK">AK</asp:ListItem>
                                                        <asp:ListItem Value="AZ">AZ</asp:ListItem>
                                                        <asp:ListItem Value="AR">AR</asp:ListItem>
                                                        <asp:ListItem Value="CA">CA</asp:ListItem>
                                                        <asp:ListItem Value="CO">CO</asp:ListItem>
                                                        <asp:ListItem Value="CT">CT</asp:ListItem>
                                                        <asp:ListItem Value="DC">DC</asp:ListItem>
                                                        <asp:ListItem Value="DE">DE</asp:ListItem>
                                                        <asp:ListItem Value="FL">FL</asp:ListItem>
                                                        <asp:ListItem Value="GA">GA</asp:ListItem>
                                                        <asp:ListItem Value="HI">HI</asp:ListItem>
                                                        <asp:ListItem Value="ID">ID</asp:ListItem>
                                                        <asp:ListItem Value="IL">IL</asp:ListItem>
                                                        <asp:ListItem Value="IN">IN</asp:ListItem>
                                                        <asp:ListItem Value="IA">IA</asp:ListItem>
                                                        <asp:ListItem Value="KS">KS</asp:ListItem>
                                                        <asp:ListItem Value="KY">KY</asp:ListItem>
                                                        <asp:ListItem Value="LA">LA</asp:ListItem>
                                                        <asp:ListItem Value="ME">ME</asp:ListItem>
                                                        <asp:ListItem Value="MD">MD</asp:ListItem>
                                                        <asp:ListItem Value="MA">MA</asp:ListItem>
                                                        <asp:ListItem Value="MI">MI</asp:ListItem>
                                                        <asp:ListItem Value="MN">MN</asp:ListItem>
                                                        <asp:ListItem Value="MS">MS</asp:ListItem>
                                                        <asp:ListItem Value="MO">MO</asp:ListItem>
                                                        <asp:ListItem Value="MT">MT</asp:ListItem>
                                                        <asp:ListItem Value="NE">NE</asp:ListItem>
                                                        <asp:ListItem Value="NV">NV</asp:ListItem>
                                                        <asp:ListItem Value="NH">NH</asp:ListItem>
                                                        <asp:ListItem Value="NJ">NJ</asp:ListItem>
                                                        <asp:ListItem Value="NM">NM</asp:ListItem>
                                                        <asp:ListItem Value="NY">NY</asp:ListItem>
                                                        <asp:ListItem Value="NC">NC</asp:ListItem>
                                                        <asp:ListItem Value="ND">ND</asp:ListItem>
                                                        <asp:ListItem Value="OH">OH</asp:ListItem>
                                                        <asp:ListItem Value="OK">OK</asp:ListItem>
                                                        <asp:ListItem Value="OR">OR</asp:ListItem>
                                                        <asp:ListItem Value="PA">PA</asp:ListItem>
                                                        <asp:ListItem Value="RI">RI</asp:ListItem>
                                                        <asp:ListItem Value="SC">SC</asp:ListItem>
                                                        <asp:ListItem Value="SD">SD</asp:ListItem>
                                                        <asp:ListItem Value="TN">TN</asp:ListItem>
                                                        <asp:ListItem Value="TX">TX</asp:ListItem>
                                                        <asp:ListItem Value="UT">UT</asp:ListItem>
                                                        <asp:ListItem Value="VT">VT</asp:ListItem>
                                                        <asp:ListItem Value="VA">VA</asp:ListItem>
                                                        <asp:ListItem Value="WA">WA</asp:ListItem>
                                                        <asp:ListItem Value="WV">WV</asp:ListItem>
                                                        <asp:ListItem Value="WI">WI</asp:ListItem>
                                                        <asp:ListItem Value="WY">WY</asp:ListItem>
                                                    </asp:DropDownList>                                                   
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="country" class="form-label">Country</label>
                                                <div class="input-group">
                                                    <asp:DropDownList CssClass="custom-select" ID="countryDropDown" runat="server">
                                                        <asp:ListItem Value=""></asp:ListItem>
                                                        <asp:ListItem Value="Ireland">Ireland</asp:ListItem> 
                                                        <asp:ListItem Value="United Kingdom">United Kingdom</asp:ListItem>
                                                        <asp:ListItem Value="United States">United States</asp:ListItem>                                                      
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Age Range Required" ControlToValidate="countryDropDown" Display="Dynamic" ValidationGroup="AddAdmin"></asp:RequiredFieldValidator>
                                                    <asp:CustomValidator ID="countryValidator" runat="server" ErrorMessage="Please Select A Country" ControlToValidate="countryDropDown" Display="Dynamic" ValidationGroup="AddAdmin" OnServerValidate="countryValidator_ServerValidate"></asp:CustomValidator>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="email" class="not_empty">Email Address</label>
                                                <asp:TextBox runat="server" CssClass="form-control" id="emailAddressText" type="text" placeholder="Email Address"></asp:TextBox>
                                                <asp:CustomValidator ID="SignUpEmailCustomValidator" runat="server" ErrorMessage="Email already exists" ControlToValidate="emailAddressText" ValidationGroup="AdminAdd" Display="Dynamic" OnServerValidate="SignUpEmailCustomValidator_ServerValidate"></asp:CustomValidator>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ErrorMessage="Email Required" ControlToValidate="emailAddressText" ValidationGroup="AdminAdd" Display="Dynamic"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" runat="server" ErrorMessage="Invalid Email Address" ControlToValidate="emailAddressText" Display="Dynamic" ValidationGroup="AdminAdd" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="position" class="not_empty">Position</label>
                                                <asp:TextBox runat="server" CssClass="form-control" id="positionText" type="text" placeholder="Position" ></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="First Name Required" ControlToValidate="firstNameText" ValidationGroup="AdminAdd" Display="Dynamic"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Special characters are not allowed. For example:% & , ; = $" ValidationExpression="[^%&,;>=$]+" ControlToValidate="positionText" Display="Dynamic" ValidationGroup="AdminAdd"></asp:RegularExpressionValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Numeric values are not allowed" ValidationExpression="^([^0-9]*)$" ControlToValidate="positionText" Display="Dynamic" ValidationGroup="AdminAdd"></asp:RegularExpressionValidator>
                                            </div>
                                        </div>
                                        <div class="col-md-2 inline">
                                            <asp:Button ID="CreateBtn" runat="server" CssClass="btn btn-sm btn-secondary form-control-file" Text="Create" OnClick="insertBtn_Click" ValidationGroup="AdminAdd"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </section>
            </asp:Panel>
            
            
        

            <%--Add Employee Panel--%>
            

            <%--                            <asp:RequiredFieldValidator ID="stateValidator" runat="server" ControlToValidate="stateDropDown" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addEmployee" Display="Dynamic">Required</asp:RequiredFieldValidator>--%>

            
            
            <%--Verification panel--%>
            <asp:Panel runat="server" ID="adminEmployeesPanel" Visible="False">
                <section class="section-bg">
                <div class="col-md-16 mx-auto" style="padding-left:15px;">
                    <h1 class="update-title">Add Employee</h1>
                    <div class="atbd_author_module">
                        <div class="atbd_content_module">
                            <div class="atbdb_content_module_contents">
                                <div class="user_info_wrap">                                 
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="employee" class="form-label">Choose Employee</label>
                                                <div class="input-group">
                                                    <asp:DropDownList ID="emailDropDown" runat="server" CssClass="custom-select"></asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <asp:Label ID="updateFirstNameLbl" runat="server" Text="First Name" CssClass="form-label"></asp:Label>
                                                <asp:TextBox runat="server" CssClass="form-control" id="updateFirstNameText" type="text" placeholder="First Name" ></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="First Name Required" ControlToValidate="firstNameText" ValidationGroup="AdminUpdate" Display="Dynamic"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ErrorMessage="Special characters are not allowed. For example:% & , ; = $" ValidationExpression="[^%&,;>=$]+" ControlToValidate="firstNameText" Display="Dynamic" ValidationGroup="AdminUpdate"></asp:RegularExpressionValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ErrorMessage="Numeric values are not allowed" ValidationExpression="^([^0-9]*)$" ControlToValidate="firstNameText" Display="Dynamic" ValidationGroup="AdminUpdate"></asp:RegularExpressionValidator>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <asp:Label ID="updateLastNameLbl" runat="server" Text="Last Name" CssClass="form-label"></asp:Label>
                                                <asp:TextBox runat="server" CssClass="form-control" id="updateLastNameText" type="text" placeholder="Last Name" ></asp:TextBox>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ErrorMessage="Special characters are not allowed. For example: % & ’ , ; = $" ValidationExpression="[^%&,;>=$]+" ControlToValidate="lastNameText" Display="Dynamic" ValidationGroup="AdminUpdate"></asp:RegularExpressionValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server" ErrorMessage="Numeric values are not allowed" ValidationExpression="^([^0-9]*)$" ControlToValidate="lastNameText" Display="Dynamic" ValidationGroup="AdminUpdate"></asp:RegularExpressionValidator>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Last Name Required" ControlToValidate="lastNameText" ValidationGroup="AdminUpdate" Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <asp:Label ID="updateStreetAddressLbl" runat="server" Text="Street Address" CssClass="form-label"></asp:Label>
                                                <asp:TextBox runat="server" CssClass="form-control" id="updateStreetAddressText" type="text" placeholder="Street Address" ></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Street Address Required" ControlToValidate="streetAddressText" ValidationGroup="AdminUpdate" Display="Dynamic"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator11" runat="server" ErrorMessage="Special characters are not allowed. For example:% & , ; = $" ValidationExpression="[^%&,;>=$]+" ControlToValidate="streetAddressText" Display="Dynamic" ValidationGroup="AdminUpdate"></asp:RegularExpressionValidator>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <asp:Label ID="updateCityLbl" runat="server" Text="City" CssClass="form-label"></asp:Label>
                                                <asp:TextBox runat="server" CssClass="form-control" id="updateCityText" type="text" placeholder="City" ></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="City Required" ControlToValidate="cityText" ValidationGroup="AdminUpdate" Display="Dynamic"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator12" runat="server" ErrorMessage="Special characters are not allowed. For example:% & , ; = $" ValidationExpression="[^%&,;>=$]+" ControlToValidate="cityText" Display="Dynamic" ValidationGroup="AdminUpdate"></asp:RegularExpressionValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator13" runat="server" ErrorMessage="Numeric values are not allowed" ValidationExpression="^([^0-9]*)$" ControlToValidate="cityText" Display="Dynamic" ValidationGroup="AdminUpdate"></asp:RegularExpressionValidator>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group ">
                                                <asp:Label ID="updateZipCodeLbl" runat="server" Text="Zip Code" CssClass="form-label"></asp:Label>
                                                <asp:TextBox runat="server" CssClass="form-control" id="updateZipCodeText" type="text" placeholder="Zip Code" ></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="City Required" ControlToValidate="zipCodeText" ValidationGroup="AdminUpdate" Display="Dynamic"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator14" runat="server" ErrorMessage="Special characters are not allowed. For example:% & , ; = $" ValidationExpression="[^%&,;>=$]+" ControlToValidate="zipCodeText" Display="Dynamic" ValidationGroup="AdminUpdate"></asp:RegularExpressionValidator>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <asp:Label ID="updateStateLbl" runat="server" Text="State" CssClass="form-label">State</asp:Label>
                                                <div class="input-group">
                                                    <asp:DropDownList CssClass="custom-select" ID="updateStateDropDownList" runat="server">
                                                        <asp:ListItem Value="State"></asp:ListItem>
                                                        <asp:ListItem Value="AL">AL</asp:ListItem>
                                                        <asp:ListItem Value="AK">AK</asp:ListItem>
                                                        <asp:ListItem Value="AZ">AZ</asp:ListItem>
                                                        <asp:ListItem Value="AR">AR</asp:ListItem>
                                                        <asp:ListItem Value="CA">CA</asp:ListItem>
                                                        <asp:ListItem Value="CO">CO</asp:ListItem>
                                                        <asp:ListItem Value="CT">CT</asp:ListItem>
                                                        <asp:ListItem Value="DC">DC</asp:ListItem>
                                                        <asp:ListItem Value="DE">DE</asp:ListItem>
                                                        <asp:ListItem Value="FL">FL</asp:ListItem>
                                                        <asp:ListItem Value="GA">GA</asp:ListItem>
                                                        <asp:ListItem Value="HI">HI</asp:ListItem>
                                                        <asp:ListItem Value="ID">ID</asp:ListItem>
                                                        <asp:ListItem Value="IL">IL</asp:ListItem>
                                                        <asp:ListItem Value="IN">IN</asp:ListItem>
                                                        <asp:ListItem Value="IA">IA</asp:ListItem>
                                                        <asp:ListItem Value="KS">KS</asp:ListItem>
                                                        <asp:ListItem Value="KY">KY</asp:ListItem>
                                                        <asp:ListItem Value="LA">LA</asp:ListItem>
                                                        <asp:ListItem Value="ME">ME</asp:ListItem>
                                                        <asp:ListItem Value="MD">MD</asp:ListItem>
                                                        <asp:ListItem Value="MA">MA</asp:ListItem>
                                                        <asp:ListItem Value="MI">MI</asp:ListItem>
                                                        <asp:ListItem Value="MN">MN</asp:ListItem>
                                                        <asp:ListItem Value="MS">MS</asp:ListItem>
                                                        <asp:ListItem Value="MO">MO</asp:ListItem>
                                                        <asp:ListItem Value="MT">MT</asp:ListItem>
                                                        <asp:ListItem Value="NE">NE</asp:ListItem>
                                                        <asp:ListItem Value="NV">NV</asp:ListItem>
                                                        <asp:ListItem Value="NH">NH</asp:ListItem>
                                                        <asp:ListItem Value="NJ">NJ</asp:ListItem>
                                                        <asp:ListItem Value="NM">NM</asp:ListItem>
                                                        <asp:ListItem Value="NY">NY</asp:ListItem>
                                                        <asp:ListItem Value="NC">NC</asp:ListItem>
                                                        <asp:ListItem Value="ND">ND</asp:ListItem>
                                                        <asp:ListItem Value="OH">OH</asp:ListItem>
                                                        <asp:ListItem Value="OK">OK</asp:ListItem>
                                                        <asp:ListItem Value="OR">OR</asp:ListItem>
                                                        <asp:ListItem Value="PA">PA</asp:ListItem>
                                                        <asp:ListItem Value="RI">RI</asp:ListItem>
                                                        <asp:ListItem Value="SC">SC</asp:ListItem>
                                                        <asp:ListItem Value="SD">SD</asp:ListItem>
                                                        <asp:ListItem Value="TN">TN</asp:ListItem>
                                                        <asp:ListItem Value="TX">TX</asp:ListItem>
                                                        <asp:ListItem Value="UT">UT</asp:ListItem>
                                                        <asp:ListItem Value="VT">VT</asp:ListItem>
                                                        <asp:ListItem Value="VA">VA</asp:ListItem>
                                                        <asp:ListItem Value="WA">WA</asp:ListItem>
                                                        <asp:ListItem Value="WV">WV</asp:ListItem>
                                                        <asp:ListItem Value="WI">WI</asp:ListItem>
                                                        <asp:ListItem Value="WY">WY</asp:ListItem>
                                                    </asp:DropDownList>                                                   
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <asp:Label ID="updateCountryLbl" runat="server" Text="Country" CssClass="form-label"></asp:Label>
                                                <div class="input-group">
                                                    <asp:DropDownList CssClass="custom-select" ID="updateCountryDropDown" runat="server">
                                                        <asp:ListItem Value="Country"></asp:ListItem>
                                                        <asp:ListItem Value="Ireland">Ireland</asp:ListItem> 
                                                        <asp:ListItem Value="United Kingdom">United Kingdom</asp:ListItem>
                                                        <asp:ListItem Value="United States">United States</asp:ListItem>                                                      
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="Country Required" ControlToValidate="countryDropDown" Display="Dynamic" ValidationGroup="AddUpdate"></asp:RequiredFieldValidator>
                                                    <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Please Select A Country" ControlToValidate="countryDropDown" Display="Dynamic" ValidationGroup="AddUpdate" OnServerValidate="countryValidator_ServerValidate"></asp:CustomValidator>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <asp:Label ID="updateEmailLbl" runat="server" Text="Email" CssClass="form-label"></asp:Label>
                                                <asp:TextBox runat="server" CssClass="form-control" id="updateEmailText" type="text" placeholder="Email Address"></asp:TextBox>
                                                <asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="Email already exists" ControlToValidate="emailAddressText" ValidationGroup="AdminUpdate" Display="Dynamic" OnServerValidate="SignUpEmailCustomValidator_ServerValidate"></asp:CustomValidator>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="Email Required" ControlToValidate="emailAddressText" ValidationGroup="AdminUpdate" Display="Dynamic"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator15" runat="server" ErrorMessage="Invalid Email Address" ControlToValidate="emailAddressText" Display="Dynamic" ValidationGroup="AdminUpdate" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <asp:Label ID="updatePositionLbl" runat="server" Text="Position" CssClass="form-label"></asp:Label>
                                                <asp:TextBox runat="server" CssClass="form-control" id="updatePositionText" type="text" placeholder="Position" ></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="First Name Required" ControlToValidate="firstNameText" ValidationGroup="AdminUpdate" Display="Dynamic"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator16" runat="server" ErrorMessage="Special characters are not allowed. For example:% & , ; = $" ValidationExpression="[^%&,;>=$]+" ControlToValidate="positionText" Display="Dynamic" ValidationGroup="AdminUpdate"></asp:RegularExpressionValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator17" runat="server" ErrorMessage="Numeric values are not allowed" ValidationExpression="^([^0-9]*)$" ControlToValidate="positionText" Display="Dynamic" ValidationGroup="AdminUpdate"></asp:RegularExpressionValidator>
                                            </div>
                                        </div>
                                        <div class="col-md-2 inline">
                                            <asp:Button ID="viewButton" runat="server" CssClass="btn btn-sm btn-secondary form-control-file" Text="View Data" OnClick="view_Btn"/>
                                        </div>
                                        <div class="col-md-2 inline">
                                            <asp:Button ID="UpdateData_Btn" runat="server" CssClass="btn btn-sm btn-secondary form-control-file" Text="Update Data" OnClick="updateData_Btn" ValidationGroup="AdminUpdate"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>                 
                    </div>
                </div>
                </section>
            </asp:Panel>

            <%--Verification panel--%>

        <div>
            <asp:Panel ID="adminVerificationPanel" runat="server" Visible="false">
                <section class="section-bg">                               
                        <div class="col-md-9 mx-auto no-margin">
                            <h1 class="update-title">Verification</h1>
                            <div class="atbd_author_module">
                                <div class="atbd_content_module">
                                    <div class="atbdb_content_module_contents">
                                        <div class="user_info_wrap">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label for="user" class="form-label">Choose User</label>
                                                        <div class="input-group">
                                                            <asp:DropDownList ID="UnverifiedDropDown" runat="server" CssClass="custom-select"></asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-2 inline">
                                                    <asp:Button ID="VerifyBtn" runat="server" CssClass="btn btn-sm btn-secondary form-control-file" Text="Verify" OnClick="VerificationButton_Click"/>
                                                </div>
                                                <div class="col-md-2 inline">
                                                    <asp:Button ID="DeleteButton" runat="server" CssClass="btn btn-sm btn-secondary form-control-file" Text="Delete" OnClick="DeleteButton_Click"/>
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
        </div>        
    </div>
</asp:Content>

