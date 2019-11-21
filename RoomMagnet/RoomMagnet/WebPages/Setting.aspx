<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="Setting.aspx.cs" Inherits="WebPages_Setting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Setting
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">

    <!-- inject:css-->
    <link rel="stylesheet" href="vendor_assets/css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="vendor_assets/css/brands.css">
    <link rel="stylesheet" href="vendor_assets/css/fontawesome.min.css">
    <link rel="stylesheet" href="vendor_assets/css/jquery-ui.css">
    <link rel="stylesheet" href="vendor_assets/css/jquery.mCustomScrollbar.css">
    <link rel="stylesheet" href="vendor_assets/css/line-awesome.min.css">
    <link rel="stylesheet" href="vendor_assets/css/magnific-popup.css">
    <link rel="stylesheet" href="vendor_assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="vendor_assets/css/select2.min.css">
    <link rel="stylesheet" href="vendor_assets/css/slick.css">
    <link rel="stylesheet" href="style.css">
    <!-- endinject -->
    <link rel="icon" type="image/png" sizes="32x32" href="img/fevicon.png">

    <!-- inject:js-->
    <script>
        $(document).ready(function () {
            $('[data-toggle="popover"]').popover();
        });
    </script>

    <script type="text/javascript">
        function openModal() {
            $('#notification').modal({ show: true });
        }
    </script>

    <script src="vendor_assets/js/jquery/jquery-1.12.3.js"></script>
    <script src="vendor_assets/js/bootstrap/popper.js"></script>
    <script src="vendor_assets/js/bootstrap/bootstrap.min.js"></script>
    <script src="vendor_assets/js/jquery-ui.min.js"></script>
    <script src="vendor_assets/js/jquery.barrating.min.js"></script>
    <script src="vendor_assets/js/jquery.counterup.min.js"></script>
    <script src="vendor_assets/js/jquery.magnific-popup.min.js"></script>
    <script src="vendor_assets/js/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="vendor_assets/js/jquery.waypoints.min.js"></script>
    <script src="vendor_assets/js/masonry.pkgd.min.js"></script>
    <script src="vendor_assets/js/owl.carousel.min.js"></script>
    <script src="vendor_assets/js/select2.full.min.js"></script>
    <script src="vendor_assets/js/slick.min.js"></script>
    <script src="theme_assets/js/locator.js"></script>
    <script src="theme_assets/js/main.js"></script>
    <script src="theme_assets/js/map.js"></script>

    <!-- endinject-->

    <%--    <script type="text/javascript">
        function ShowPopup() {
            $("#btnShowPopup").click();
        }
    </script>--%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="Server">
    <section class="dashboard-wrapper section-bg p-bottom-70">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center settings-title">
                    <h1>Profile Settings</h1>
                </div>
            </div>
        </div>
        <div class="container ">
            <div class="row">
                <div class="col-lg-3 col-md-4 mb-5 mb-lg-0">
                    <div class="user_pro_img_area">

                        <asp:Image ID="imgpreview" runat="server" Height="200" Width="200" ImageUrl="http://cliquecities.com/assets/no-image-e3699ae23f866f6cbdf8ba2443ee5c4e.jpg" Style="border-width: 0px; border-radius: 50%;" />
                        <br />
                        <br />
                        <asp:Button ID="Upload" runat="server" Text="Upload New Image" class="btn btn-sm btn-secondary form-control-file" OnClick="Upload_Click" /><br />
                        <br />
                        <asp:Button runat="server" class="btn btn-xs btn-gradient btn-gradient-two access-link m-right-10" Text="Populate" ID="Populate" OnClick="Populate_Click" ></asp:Button>
                    </div>
                </div>
                <div class="col-lg-9 col-md-8">
                    <div class="atbd_author_module">
                        <div class="atbd_content_module">

                            <div class="atbdb_content_module_contents">
                                <div class="user_info_wrap">
                                    <!--Full name-->
                                    <div class="row">

                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label runat="server" Text="First Name*" class="not_empty" Font-Bold="true"></asp:Label>
                                                <asp:TextBox ID="setfirstname" runat="server" MaxLength="20" class="form-control" placeholder="First Name"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="Requiredfirstname" runat="server" ErrorMessage="Required" ControlToValidate="setfirstname" ForeColor="Red" ValidationGroup="settings" OnDataBinding="updateusersetting_Click" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">

                                                <asp:Label runat="server" Text="Middle Name" class="not_empty" Font-Bold="true"></asp:Label>
                                                <asp:TextBox ID="setmiddlename" runat="server" MaxLength="20" class="form-control" placeholder="Middle Name"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <asp:Label runat="server" Text="Last Name*" class="not_empty" Font-Bold="true"></asp:Label>
                                                <asp:TextBox ID="setlastname" runat="server" MaxLength="20" class="form-control" placeholder="Last Name"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="Requiredlastname" runat="server" ErrorMessage="Required" ControlToValidate="setlastname" ForeColor="Red" ValidationGroup="settings" OnDataBinding="updateusersetting_Click" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <asp:Label runat="server" Text="Occupation" class="not_empty" Font-Bold="true"></asp:Label>
                                                <asp:TextBox ID="setOccupation" runat="server" MaxLength="50" class="form-control" placeholder="Occupation"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <asp:Label runat="server" Text="Gender" class="not_empty" Font-Bold="true"></asp:Label>

                                                <asp:DropDownList ID="setgender" runat="server" class="form-control">
                                                    <asp:ListItem Value=""></asp:ListItem>
                                                    <asp:ListItem Value="male">Male</asp:ListItem>
                                                    <asp:ListItem Value="female">Female</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <asp:Label runat="server" Text="Reset Password" class="not_empty" Font-Bold="true"></asp:Label>
                                                <asp:TextBox ID="setpassword" runat="server" type="password" class="form-control" placeholder="Password"></asp:TextBox>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorPasswordLowerCase" runat="server" ControlToValidate="setpassword" Display="Dynamic" ErrorMessage="Password must be at least 8 characters long and contains at least one: Lower Case, Upper Case, Special Character" ForeColor="Red" ValidationExpression="^((?=.*[a-z])(?=.*[A-Z])(?=.*\d)|(?=.*[a-z])(?=.*[A-Z])(?=.*[^A-Za-z0-9])|(?=.*[a-z])(?=.*\d)(?=.*[^A-Za-z0-9])|(?=.*[A-Z])(?=.*\d)(?=.*[^A-Za-z0-9]))([A-Za-z\d@#$%^&amp;£*\-_+=[\]{}|\\:',?/`~();!]|\.(?!@)){8,16}$" ValidationGroup="settings"></asp:RegularExpressionValidator>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <asp:Label runat="server" Text="Confirm Password" class="not_empty" Font-Bold="true"></asp:Label>
                                                <asp:TextBox ID="setconfirmpass" runat="server" type="password" class="form-control" placeholder="Re-enter Password"></asp:TextBox>
                                                <asp:CompareValidator ID="ComparePass" runat="server" ControlToValidate="setconfirmpass" Display="Dynamic" ErrorMessage="Password does not match" ForeColor="Red" ValidationGroup="settings" ControlToCompare="setpassword"></asp:CompareValidator>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <asp:Label runat="server" Text="Add Description" class="not_empty" Font-Bold="true"></asp:Label>
                                                <asp:TextBox ID="setdescription" runat="server" class="wp-editor-area form-control" autocomplete="off" placeholder="Describe yourself" multiline="true" Height="100" TextMode="MultiLine"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <asp:Label runat="server" Text="Street" class="not_empty" Font-Bold="true"></asp:Label>
                                                <asp:TextBox ID="setStreet" runat="server" class="form-control" MaxLength="50"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <asp:Label runat="server" Text="City" class="not_empty" Font-Bold="true"></asp:Label>
                                                <asp:TextBox ID="setCity" runat="server" class="form-control" MaxLength="30"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <asp:Label runat="server" Text="Country" class="not_empty" Font-Bold="true"></asp:Label>
                                                <asp:DropDownList ID="setCountry" runat="server" AppendDataBoundItems="True" AutoPostBack="True" class="form-control">
                                                    <asp:ListItem Value=""></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <asp:Label runat="server" Text="State" class="not_empty" Font-Bold="true"></asp:Label>
                                                <asp:DropDownList runat="server" ID="setState" class="form-control">
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
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <asp:Label runat="server" Text="Zip Code" class="not_empty" Font-Bold="true"></asp:Label>
                                                <asp:TextBox ID="setZip" runat="server" class="form-control" MaxLength="10" ControlToValidate="setZip" ViewStateMode="Inherit"></asp:TextBox>
                                                <asp:CompareValidator ID="CompareZip" runat="server" ErrorMessage="Invalid" Text="Invalid" ControlToValidate="setZip" Display="Dynamic" ForeColor="Red" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                            </div>
                                        </div>
                                    </div>
                                    <!--ends social info .row-->
                                    <asp:Button ID="updateusersetting" runat="server" class="btn btn-primary" data-toggle="modal" data-target="#myModal" Text="Update" OnClick="updateusersetting_Click" ValidationGroup="settings" />

                                    <%--modal--%>
                                    <%--<div class="modal fade" id="myModal" tabindex="-1" role="dialog">
                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <asp:Image ID="ModalImage" runat="server" ImageUrl="~/img/roommagnet-text.png" CssClass="mx-auto image-padding" />
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span></button>
                                                </div>
                                                <div class="modal-body text-center">
                                                    <asp:Label ID="lblMessage" runat="server" Text="Changes Saved" />
                                                </div>
                                                <div class="modal-footer" style="align-content:center; margin:auto; ">
                                                    <asp:Button runat="server" Text="Dashboard" class="btn btn-xs btn-gradient btn-gradient-two access-link" OnClick="goDashboard_Click" />
                                                </div>
                                            </div>
                                            <!-- /.modal-content -->
                                        </div>
                                        <!-- /.modal-dialog -->
                                    </div>--%>
                                    <!-- /.modal -->

                                    <div class="modal fade" id="notification" tabindex="-1" role="dialog" aria-labelledby="login_modal_label" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">

                                                    <asp:Image ID="Image2" runat="server" ImageUrl="~/img/roommagnet-text.png" CssClass="mx-auto image-padding" />

                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body text-center">
                                                    <h3>Changes Saved</h3>
                                                    <p></p>
                                                </div>
                                                <div class="modal-footer mx-auto">
                                                    <div class="form-excerpts">
                                                        <ul class="list-unstyled">
                                                            <li></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ends: .atbd_author_module -->
            </div>
        </div>
        </div>
    </section>
</asp:Content>