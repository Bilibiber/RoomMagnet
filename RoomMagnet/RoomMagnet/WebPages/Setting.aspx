<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="Setting.aspx.cs" Inherits="WebPages_Setting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">

    <%--user image--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

    <%--    <%--update button show notification--%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

    <style>
        #settingpage, #settingAddress {
            width: 70%;
            margin: auto;
        }

        body {
            background-color: #f5f5f5;
        }

        .imagePreview {
            width: 200%;
            height: 180px;
            background-position: center center;
            background: url(http://cliquecities.com/assets/no-image-e3699ae23f866f6cbdf8ba2443ee5c4e.jpg);
            background-color: #fff;
            background-size: cover;
            background-repeat: no-repeat;
            display: inline-block;
            box-shadow: 0px -3px 6px 2px rgba(0,0,0,0.2);
        }

        .btn-primary {
            width: 200%;
            display: block;
            border-radius: 0px;
            box-shadow: 0px 4px 6px 2px rgba(0,0,0,0.2);
            margin-top: -5px;
        }

        .imgUp {
            margin-bottom: 15px;
        }

        .del {
            position: absolute;
            top: 0px;
            right: 15px;
            width: 30px;
            height: 30px;
            text-align: center;
            line-height: 30px;
            background-color: rgba(255,255,255,0.6);
            cursor: pointer;
        }

        .imgAdd {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            background-color: #4bd7ef;
            color: #fff;
            box-shadow: 0px 0px 2px 1px rgba(0,0,0,0.2);
            text-align: center;
            line-height: 30px;
            margin-top: 0px;
            cursor: pointer;
            font-size: 15px;
        }

        .container {
        }

        .1 {
            width: 300px;
        }

        .2 {
            width: 483px;
        }

        .auto-style1 {
            width: 250px;
        }
        .auto-style2 {
            width: 120px;
        }
        .auto-style3 {
            width: 151px;
        }
        .auto-style4 {
            width: 217px;
        }
        .auto-style5 {
            width: 238px;
        }
        .auto-style6 {
            width: 198px;
        }

        </style>

    <%--user image--%>
    <script>
        $(".imgAdd").click(function () {
            $(this).closest(".row").find('.imgAdd').before('<div class="col-sm-2 imgUp"><div class="imagePreview"></div><label class="btn btn-primary">Upload<input type="file" class="uploadFile img" value="Upload Photo" style="width:0px;height:0px;overflow:hidden;"></label><i class="fa fa-times del"></i></div>');
        });
        $(document).on("click", "i.del", function () {
            $(this).parent().remove();
        });
        $(function () {
            $(document).on("change", ".uploadFile", function () {
                var uploadFile = $(this);
                var files = !!this.files ? this.files : [];
                if (!files.length || !window.FileReader) return; // no file selected, or no FileReader support

                if (/^image/.test(files[0].type)) { // only image file
                    var reader = new FileReader(); // instance of the FileReader
                    reader.readAsDataURL(files[0]); // read the local file

                    reader.onloadend = function () { // set image data as background of div
                        //alert(uploadFile.closest(".upimage").find('.imagePreview').length);
                        uploadFile.closest(".imgUp").find('.imagePreview').css("background-image", "url(" + this.result + ")");
                    }
                }

            });
        });
    </script>

    <script type="text/javascript">
        function openModal() {
            $('#updatesuccess').modal({ show: true });
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="Server">

    <div class="accordion" id="accordionExample">
        <div class="card">
            <div class="card-header" id="headingOne">
                <h5 class="mb-0">
                    <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" style="font-size: 2em; font-weight: bold; color: #bd2026;">
                        General Settings
                    </button>
                </h5>
            </div>

            <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
                <div class="card-body">
                    <div id="settingpage">
                        <br />
                        <br />
                        <div class="container">
                            <div class="row">
                                <div class="col-sm-2 imgUp">
                                    <div class="imagePreview"></div>
                                    <label class="btn btn-primary" style="background-color: #bd2026;">
                                        Upload<input type="file" class="uploadFile img" value="Upload Photo" style="width: 0px; height: 0px; overflow: hidden;">
                                    </label>
                                </div>
                                <!-- col-2 -->
                            </div>
                            <!-- row -->
                        </div>
                        <!-- container -->

                        <br />

                        <table>
                            <tr>
                                <td class="w-auto">
                                    <asp:label runat="server" text="First Name"></asp:label>
                                </td>
                                <td class="w-auto">
                                    <asp:textbox id="firstNameTxt" runat="server" maxlength="25" width="150px"></asp:textbox>
                                    <asp:requiredfieldvalidator id="Requiredfirstname" runat="server" errormessage="Required" controltovalidate="firstNameTxt" forecolor="Red" validationgroup="settings" ondatabinding="updateusersetting_Click">Required</asp:requiredfieldvalidator>
                                </td>
                                
                                <td class="w-auto">
                                    <asp:label runat="server" text="Middle Name"></asp:label>
                                    
                                </td>
                                <td class="w-auto">
                                    <asp:textbox id="setmiddlename" runat="server" maxlength="30" width="150px"></asp:textbox>
                                </td>
                                <td class="w-auto">
                                    <asp:label runat="server" text="Last Name " ID="label2"></asp:label>
                                    &nbsp;</td>
                                <td class="w-auto">
                                    <asp:textbox id="setlastname" runat="server" maxlength="30" width="150px"></asp:textbox>
                                    <asp:requiredfieldvalidator id="Requiredlastname0" runat="server" errormessage="Required" controltovalidate="setlastname" forecolor="Red" validationgroup="settings" ondatabinding="updateusersetting_Click">Required</asp:requiredfieldvalidator>
                                </td>
                                
                                
                            </tr>

                            <tr>
                               
                                <td class="auto-style3">
                                    <asp:label runat="server" text="Gender"></asp:label>
                                </td>
                                <td class="auto-style1">
                                    <asp:dropdownlist id="setgender" runat="server">
                                <asp:ListItem Value=""></asp:ListItem>
                                <asp:ListItem Value="Male">Male</asp:ListItem>
                                <asp:ListItem Value="Female">Female</asp:ListItem>
                            </asp:dropdownlist>
                                </td>
                                <td class="auto-style2">
                                    <asp:label runat="server" text="Occupation"></asp:label>
                                </td>
                                
                                <td class="auto-style4">
                                    <asp:textbox id="setOccupation" runat="server" maxlength="25" width="150px"></asp:textbox>
                                </td>
                                
                            </tr>
                            <tr>
                                
                                <td class="auto-style3">

                                    <asp:Label ID="LblStreetAddress" runat="server" text="Street Address "></asp:Label>

                                </td>
                                <td class="auto-style1">

                                    <asp:TextBox ID="streetAddressTxt" runat="server" MaxLength="50" width="150px"></asp:TextBox>

                                </td>
                                <td class="auto-style2">
                                    <asp:Label ID="LblCity" runat="server" text="City "></asp:Label>
                                </td>
                                <td class="auto-style4">

                                    <asp:TextBox ID="cityTxt" runat="server" MaxLength="50" width="150px"></asp:TextBox>

                                </td>
                                <td class="auto-style6">

                                    <asp:Label ID="LblState" runat="server" Text="State "></asp:Label>

                                </td>
                                <td class="auto-style5">

                                    <asp:TextBox ID="stateTxt" runat="server"></asp:TextBox>

                                </td>

                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblCountry" runat="server" Text="Country "></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="countryTxt" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label ID="lblZipCode" runat="server" Text="Zip Code"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="zipCodeTxt" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                
                                <td class="auto-style3">
                                    <asp:label runat="server" text="Reset Password"></asp:label>
                                </td>
                                <td class="auto-style1">
                                    <asp:textbox id="setpassword" runat="server" type="password"></asp:textbox>
                                    <asp:regularexpressionvalidator id="RegularExpressionValidatorPasswordLowerCase" runat="server" controltovalidate="setpassword" display="Dynamic" errormessage="Password must be at least 8 characters long and contains at least one: Lower Case, Upper Case, Special Character" forecolor="Red" validationexpression="^((?=.*[a-z])(?=.*[A-Z])(?=.*\d)|(?=.*[a-z])(?=.*[A-Z])(?=.*[^A-Za-z0-9])|(?=.*[a-z])(?=.*\d)(?=.*[^A-Za-z0-9])|(?=.*[A-Z])(?=.*\d)(?=.*[^A-Za-z0-9]))([A-Za-z\d@#$%^&amp;£*\-_+=[\]{}|\\:',?/`~();!]|\.(?!@)){8,16}$" validationgroup="settings"></asp:regularexpressionvalidator>
                                </td>
                                <td class="auto-style2">
                                    <asp:label runat="server" text="Confirm Password" ID="label3"></asp:label>
                                </td>
                                <td class="auto-style4">
                                    <asp:textbox id="setconfirmpass" runat="server" type="password"></asp:textbox>
                                    <asp:comparevalidator id="ComparePass" runat="server" controltovalidate="setconfirmpass" display="Dynamic" errormessage="Password does not match" forecolor="Red" validationgroup="settings" controltocompare="setpassword"></asp:comparevalidator>
                                </td>
                                <td class="auto-style6">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                
                                <td class="auto-style3">&nbsp;</td>
                            </tr>
                        </table>
                        <br />
                        &nbsp;&nbsp;&nbsp;
                <asp:label runat="server" text="Add Description: "></asp:label>
                        <br />
                        &nbsp;&nbsp;&nbsp;
                <asp:textbox id="setdescription" runat="server" height="104px" width="634px" maxlength="150"></asp:textbox>
                        <br />
                        <br />
                        &nbsp;&nbsp;&nbsp;
                <asp:button id="updateusersetting" runat="server" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" text="Update" onclick="updateusersetting_Click" validationgroup="settings" style="background-color: #bd2026;" />
                        &nbsp;
                  <br />
                        <!-- Modal -->
                        <div class="modal fade" id="updatesuccess" role="dialog" aria-hidden="true">
                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content" style="width: 100%;">
                                    <div class="modal-header">
                                        <h4 class="modal-title">Update successfull!</h4>
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>
                                    <div class="modal-body">
                                        <p>Go to dashboard to see changes</p>
                                    </div>
                                    <div class="modal-footer">
                                        <asp:button runat="server" text="Dashboard" class="btn btn-default" style="background-color: #bd2026;" onclick="goDashboard_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%--<div class="card">
        <div class="card-header" id="headingTwo">
          <h5 class="mb-0">
            <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo" style="font-size: 2em; font-weight:bold;">
              Add Mailing Address</button>
          </h5>
        </div>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
          <div class="card-body">
              <div id="settingAddress">
                <br />

                <table>
                    <tr>
                        <td></td>
                        <td class="4">
                            <asp:Label runat="server" Text="Street Address: "></asp:Label>
                        </td>
                        <td class="1">
                            <asp:TextBox ID="setStreet" runat="server" Width="250px" MaxLength="30"></asp:TextBox>
                            </td>
                        <td></td>
                        <td>
                            &nbsp;</td>
                        <td class="2">
                            &nbsp;</td>
                    </tr>

                    <tr>
                        <td class="5"></td>
                        <td class="6">
                            <asp:Label runat="server" Text="City"></asp:Label>
                            </td>
                        <td class="7">
                            <asp:TextBox ID="setCity" runat="server"></asp:TextBox>
                        </td>
                        <td class="5"></td>
                        <td class="5">
                            </td>
                        <td class="7">
                            </td>
                    </tr>

                    <tr>
                        <td>
                        </td>
                        <td class="4">
                            <asp:Label runat="server" Text="Country"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="setCountry" runat="server" AppendDataBoundItems="True" AutoPostBack="True">
                                <asp:ListItem Value=""></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td class="4">
                            <asp:Label runat="server" Text="Home State"></asp:Label>
                        </td>
                        <td class="1">
                            <asp:DropDownList ID="setState" runat="server" Width="80px">
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
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <asp:Label runat="server" Text="ZipCode"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="setZip" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                </table>
                <br />

                <asp:Button ID="updateAddress" runat="server" class="btn btn-danger" Text="Update" OnClick="updateusersetting_Click" ValidationGroup="settings" />
                &nbsp;
            </div>
          </div>
        </div>
      </div>--%>
    </div>
</asp:Content>