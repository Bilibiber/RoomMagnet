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

        .auto-style1 {
            width: 300px;
        }

        .auto-style2 {
            width: 300px;
        }

        .auto-style3 {
            width: 129px;
        }

        .imgpreview {
        }
    </style>

    <script src="http://code.jquery.com/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function showpreview(input) {

            if (input.files && input.files[0]) {

                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#imgpreview').css('visibility', 'visible');
                    $('#imgpreview').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }

        }
    </script>

    <script type="text/javascript">
        function ShowPopup() {
            $("#btnShowPopup").click();
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
                        <%--                        <div id="viewimage">
                            <asp:Image runat="server" id="imgpreview" Height="200" Width="200" imageurl="http://cliquecities.com/assets/no-image-e3699ae23f866f6cbdf8ba2443ee5c4e.jpg" Style="border-width: 0px; border-radius: 50%;" />
                            <asp:FileUpload ID="fuimage" runat="server" onchange="showpreview(this);" />
                        </div>--%>

                        <asp:Image ID="imgpreview" runat="server" Height="200" Width="200" ImageUrl="http://cliquecities.com/assets/no-image-e3699ae23f866f6cbdf8ba2443ee5c4e.jpg" Style="border-width: 0px; border-radius: 50%;" />
                        <br />
                        <asp:Button ID="Upload" runat="server" Text="Upload" OnClick="Upload_Click" />
                        <button type="button" style="display: none;" id="btnShowPopup" class="btn btn-primary btn-lg"
                            data-toggle="modal" data-target="#myModal">
                            Launch demo modal
                        </button>
                        <%--<div class="container">
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
                        </div>--%>
                        <!-- container -->
                        <br />

                        <table>
                            <tr>
                                <td></td>
                                <td class="auto-style3">
                                    <asp:Label runat="server" Text="First Name"></asp:Label>
                                </td>
                                <td class="auto-style1">
                                    <asp:TextBox ID="setfirstname" runat="server" MaxLength="25" Width="147px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="Requiredfirstname" runat="server" ErrorMessage="Required" ControlToValidate="setfirstname" ForeColor="Red" ValidationGroup="settings" OnDataBinding="updateusersetting_Click">Required</asp:RequiredFieldValidator>
                                </td>
                                <td></td>
                                <td>
                                    <asp:Label runat="server" Text="Middle Name"></asp:Label>
                                </td>
                                <td class="auto-style2">
                                    <asp:TextBox ID="setmiddlename" runat="server" MaxLength="30"></asp:TextBox>
                                </td>
                                <td></td>
                                <td>
                                    <asp:Label runat="server" Text="Last Name"></asp:Label>
                                </td>
                                <td class="auto-style2">
                                    <asp:TextBox ID="setlastname" runat="server" MaxLength="30"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="Requiredlastname" runat="server" ErrorMessage="Required" ControlToValidate="setlastname" ForeColor="Red" ValidationGroup="settings" OnDataBinding="updateusersetting_Click">Required</asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <td></td>
                                <td class="auto-style3">
                                    <asp:Label runat="server" Text="Gender"></asp:Label>
                                </td>
                                <td class="auto-style1">
                                    <asp:DropDownList ID="setgender" runat="server">
                                        <asp:ListItem Value=""></asp:ListItem>
                                        <asp:ListItem Value="male">Male</asp:ListItem>
                                        <asp:ListItem Value="Female">Female</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td></td>
                                <td>
                                    <asp:Label runat="server" Text="Occupation"></asp:Label>
                                </td>
                                <td class="auto-style2">
                                    <asp:TextBox ID="setOccupation" runat="server" MaxLength="25"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <td></td>
                                <td class="auto-style3">
                                    <asp:Label runat="server" Text="Reset Password"></asp:Label>
                                </td>
                                <td class="auto-style1">
                                    <asp:TextBox ID="setpassword" runat="server" type="password"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorPasswordLowerCase" runat="server" ControlToValidate="setpassword" Display="Dynamic" ErrorMessage="Password must be at least 8 characters long and contains at least one: Lower Case, Upper Case, Special Character" ForeColor="Red" ValidationExpression="^((?=.*[a-z])(?=.*[A-Z])(?=.*\d)|(?=.*[a-z])(?=.*[A-Z])(?=.*[^A-Za-z0-9])|(?=.*[a-z])(?=.*\d)(?=.*[^A-Za-z0-9])|(?=.*[A-Z])(?=.*\d)(?=.*[^A-Za-z0-9]))([A-Za-z\d@#$%^&amp;£*\-_+=[\]{}|\\:',?/`~();!]|\.(?!@)){8,16}$" ValidationGroup="settings"></asp:RegularExpressionValidator>
                                </td>
                                <td></td>
                                <td>
                                    <asp:Label runat="server" Text="Confirm Password"></asp:Label>
                                </td>
                                <td class="auto-style2">
                                    <asp:TextBox ID="setconfirmpass" runat="server" type="password"></asp:TextBox>
                                    <asp:CompareValidator ID="ComparePass" runat="server" ControlToValidate="setconfirmpass" Display="Dynamic" ErrorMessage="Password does not match" ForeColor="Red" ValidationGroup="settings" ControlToCompare="setpassword"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td class="auto-style3">&nbsp;</td>
                            </tr>
                        </table>
                        <br />
                        &nbsp;&nbsp;&nbsp;
                <asp:Label runat="server" Text="Add Description: "></asp:Label>
                        <br />
                        &nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="setdescription" runat="server" Height="104px" Width="634px" MaxLength="150"></asp:TextBox>
                        <br />
                        <br />
                        &nbsp;&nbsp;&nbsp;
                <asp:Button ID="updateusersetting" runat="server" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" Text="Update" OnClick="updateusersetting_Click" ValidationGroup="settings" Style="background-color: #bd2026;" />
                        &nbsp;
                  <br />

                        <div class="modal fade" id="myModal">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title">Update done Successfully</h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span></button>
                                    </div>
                                    <div class="modal-body">
                                        <asp:Label ID="lblMessage" runat="server" Text="Go Dashabord to see all changes" />
                                    </div>
                                    <div class="modal-footer">
                                        <asp:Button runat="server" Text="Dashboard" class="btn btn-default" Style="background-color: #bd2026;" OnClick="goDashboard_Click" />
                                    </div>
                                </div>
                                <!-- /.modal-content -->
                            </div>
                            <!-- /.modal-dialog -->
                        </div>
                        <!-- /.modal -->
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
                        <td class="auto-style4">
                            <asp:Label runat="server" Text="Street Address: "></asp:Label>
                        </td>
                        <td class="auto-style1">
                            <asp:TextBox ID="setStreet" runat="server" Width="250px" MaxLength="30"></asp:TextBox>
                            </td>
                        <td></td>
                        <td>
                            &nbsp;</td>
                        <td class="auto-style2">
                            &nbsp;</td>
                    </tr>

                    <tr>
                        <td class="auto-style5"></td>
                        <td class="auto-style6">
                            <asp:Label runat="server" Text="City"></asp:Label>
                            </td>
                        <td class="auto-style7">
                            <asp:TextBox ID="setCity" runat="server"></asp:TextBox>
                        </td>
                        <td class="auto-style5"></td>
                        <td class="auto-style5">
                            </td>
                        <td class="auto-style7">
                            </td>
                    </tr>

                    <tr>
                        <td>
                        </td>
                        <td class="auto-style4">
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
                        <td class="auto-style4">
                            <asp:Label runat="server" Text="Home State"></asp:Label>
                        </td>
                        <td class="auto-style1">
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