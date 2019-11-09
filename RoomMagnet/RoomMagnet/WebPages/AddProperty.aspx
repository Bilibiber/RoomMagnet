<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="AddProperty.aspx.cs" Inherits="WebPages_AddProperty" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">

    <title>Add Property</title>
    <link href="https://fonts.googleapis.com/css?family=Muli:400,400i,600,700" rel="stylesheet">
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

    <%--renter update image--%>
    <%--    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <!------ Include the above in your HEAD tag ---------->

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

    <style>
        /*upload images*/
        .preview-images-zone {
            width: 72%;
            border: 1px solid #ddd;
            min-height: 180px;
            /* display: flex; */
            padding: 5px 5px 0px 5px;
            position: relative;
            overflow: auto;
            top: 0px;
            left: 0px;
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

        .auto-style1 {
            height: 28px;
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
    </script>--%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="Server">
    <%--renter Amenities panel--%>
    <section class="add-listing-wrapper border-bottom section-bg ">

        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center settings-title">
                    <h1>Add Property</h1>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-lg-10 offset-lg-1">
                    <div class="atbd_content_module">
                        <div class="atbd_content_module__tittle_area">
                            <div class="atbd_area_title">
                                <h4><span class="la la-home"></span>Property Information</h4>
                            </div>
                        </div>
                        <div class="atbdb_content_module_contents">
                            <form action="/">
                                <div class="form-group">
                                    <asp:Label runat="server" for="title" class="form-label">Title</asp:Label>
                                    <asp:TextBox runat="server" ID="addtitle" class="form-control" placeholder="Enter Title" MaxLength="50"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="requireTitle" runat="server" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addproperty" ControlToValidate="addtitle" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group ">
                                    <asp:Label runat="server" Text="Street Address" class="form-label"></asp:Label>
                                    <asp:TextBox runat="server" ID="addStreet" placeholder="Street Address" class="form-control" MaxLength="50"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="requireStreet" runat="server" ControlToValidate="addStreet" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addproperty" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group ">
                                    <asp:Label runat="server" Text="City" class="form-label"></asp:Label>
                                    <asp:TextBox runat="server" ID="addCity" placeholder="City" class="form-control" MaxLength="30"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="requireCity" runat="server" ControlToValidate="addCity" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addproperty" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <asp:Label runat="server" Text="State" class="form-label"></asp:Label>
                                    <asp:DropDownList runat="server" ID="replacestate" class="custom-select" enable="false"></asp:DropDownList>
                                    <asp:DropDownList runat="server" ID="addState" class="custom-select" Visible="False">
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

                                <div class="form-group ">
                                    <asp:Label runat="server" class="form-label " Text="Zip"></asp:Label>
                                    <asp:TextBox ID="addZip" runat="server" placeholder="Zip Code" class="form-control" MaxLength="10"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="requireZip" runat="server" ControlToValidate="addZip" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addproperty" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CompareZip" runat="server" ErrorMessage="Invalid" Text="Invalid" ControlToValidate="addZip" Display="Dynamic" ForeColor="Red" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                </div>

                                <div class="form-group">

                                    <asp:Label runat="server" Text="Country" class="form-label"></asp:Label>
                                    <div class="input-group">

                                        <asp:DropDownList ID="addCountry" runat="server" AppendDataBoundItems="True" AutoPostBack="True" class="custom-select">
                                            <asp:ListItem Value=""></asp:ListItem>
                                        </asp:DropDownList>
                                        <br />
                                        <asp:RequiredFieldValidator ID="requireCountry" runat="server" ControlToValidate="addCountry" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addproperty" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <asp:Label runat="server" Text="Square Footage of House" class="form-label"></asp:Label>

                                    <asp:TextBox ID="addSquare" runat="server" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="requireSquare" runat="server" ControlToValidate="addSquare" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addproperty" Display="Dynamic">Required</asp:RequiredFieldValidator>

                                    <asp:CompareValidator ID="Comparesquare" runat="server" ControlToValidate="addSquare" Display="Dynamic" ErrorMessage="Invalid" ForeColor="Red" Operator="DataTypeCheck" Text="Invalid" Type="Integer"></asp:CompareValidator>
                                </div>

                                <div class="form-group">
                                    <asp:Label runat="server" Text="Rent Price/Month" class="form-label"></asp:Label>
                                    <div class="pricing-option-inputs">

                                        <asp:TextBox ID="addPrice" runat="server" class="form-control" placeholder="Rent Price/Month"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="requirePrice" runat="server" ControlToValidate="addPrice" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addproperty" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                        <asp:CompareValidator ID="Compareprice" runat="server" ControlToValidate="addPrice" Display="Dynamic" ErrorMessage="Invalid" ForeColor="Red" Operator="DataTypeCheck" Text="Invalid" Type="Integer"></asp:CompareValidator>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:Label runat="server" Text="Avaliable Bedrooms" class="form-label"></asp:Label>
                                    <asp:DropDownList ID="addBedrooms" runat="server" class="custom-select">
                                        <asp:ListItem Value=""></asp:ListItem>
                                        <asp:ListItem Value="1">1</asp:ListItem>
                                        <asp:ListItem Value="2">2</asp:ListItem>
                                        <asp:ListItem Value="3">3</asp:ListItem>
                                        <asp:ListItem Value="4">4</asp:ListItem>
                                        <asp:ListItem Value="5">5</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="requireBedroom" runat="server" ControlToValidate="addBedrooms" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addproperty" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <asp:Label runat="server" Text="Available Date" class="form-label"></asp:Label>
                                    <asp:TextBox ID="addstartdate" runat="server" TextMode="Date" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="requirestart" runat="server" ControlToValidate="addstartdate" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addproperty" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                </div>

                                <div class="form-group">
                                    <asp:Label runat="server" Text="End Date" class="form-label"></asp:Label>
                                    <asp:TextBox ID="addenddate" runat="server" TextMode="Date" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="requireend" runat="server" ControlToValidate="addenddate" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addproperty" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                </div>
                        </div>
                        <!-- ends: .form-group -->
                        </form>
                    </div>
                    <!-- ends: .atbdb_content_module_contents -->
                </div>
                <!-- ends: .atbd_content_module -->
            </div>
            <!-- ends: .col-lg-10 -->

            <div class="container">
                <div class="row">

                    <div class="col-lg-10 offset-lg-1">
                        <div class="atbd_content_module">
                            <div class="atbd_content_module__tittle_area">
                                <div class="atbd_area_title">
                                    <h4><span class="la la-calendar-check-o"></span>Images</h4>
                                </div>
                            </div>
                            <div class="atbdb_content_module_contents">
                                <div id="_listing_gallery">
                                    <div class="add_listing_form_wrapper" id="gallery_upload">

                                        <div class="form-group text-center">
                                            <!-- image container, which can be manipulated with js -->

                                            <!--  add & remove image links -->
                                            <a href="#" id="listing_image_btn" class="btn btn-xs btn-primary m-right-10">Upload Images</a>
                                        </div>
                                    </div>
                                    <!--ends add_listing_form_wrapper-->
                                </div>
                            </div>
                            <!-- ends: .atbdb_content_module_contents -->
                        </div>
                        <!-- ends: .atbd_content_module -->
                    </div>
                    <!-- ends: .col-lg-10 -->
                </div>
            </div>

            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center ">
                        <a href="#" id="listing_image_btn" class="btn btn-xs btn-gradient btn-gradient-two access-link m-right-10">Post</a>
                        <asp:Button runat="server" class="btn btn-xs btn-gradient btn-gradient-two access-link m-right-10" Text="Post" ValidationGroup="addproperty" ID="Button1" OnClick="post_Click"></asp:Button>
                        <asp:Button runat="server" Text="Cancel" class="btn btn-xs btn-gradient btn-gradient-two access-link m-right-10" ID="cancel" OnClick="cancel_Click"></asp:Button>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="login_modal" tabindex="-1" role="dialog" aria-labelledby="login_modal_label" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="login_modal_label"><i class="la la-lock"></i>Sign In</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="/" id="login-form">
                                <input type="text" class="form-control" placeholder="Username or Email" required>
                                <input type="password" class="form-control" placeholder="Password" required>
                                <div class="keep_signed custom-control custom-checkbox checkbox-outline checkbox-outline-primary">
                                    <input type="checkbox" class="custom-control-input" name="keep_signed_in" value="1" id="keep_signed_in">
                                    <label for="keep_signed_in" class="not_empty custom-control-label">Keep me signed in</label>
                                </div>
                                <button type="submit" class="btn btn-block btn-lg btn-gradient btn-gradient-two">Sign In</button>
                            </form>
                            <div class="form-excerpts">
                                <ul class="list-unstyled">
                                    <li>Not a member? <a href="">Sign up</a></li>
                                    <li><a href="">Recover Password</a></li>
                                </ul>
                                <div class="social-login">
                                    <span>Or connect with</span>
                                    <p><a href="" class="btn btn-outline-secondary"><i class="fab fa-facebook-f"></i>Facebook</a><a href="" class="btn btn-outline-danger"><i class="fab fa-google-plus-g"></i> Google</a></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="signup_modal" tabindex="-1" role="dialog" aria-labelledby="signup_modal_label" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="signup_modal_label"><i class="la la-lock"></i>Sign Up</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="/" id="signup-form">
                                <input type="email" class="form-control" placeholder="Email" required>
                                <input type="password" class="form-control" placeholder="Password" required>
                                <button type="submit" class="btn btn-block btn-lg btn-gradient btn-gradient-two">Sign Up</button>
                            </form>
                            <div class="form-excerpts">
                                <ul class="list-unstyled">
                                    <li>Already a member? <a href="">Sign In</a></li>
                                    <li><a href="">Recover Password</a></li>
                                </ul>
                                <div class="social-login">
                                    <span>Or Signup with</span>
                                    <p><a href="" class="btn btn-outline-secondary"><i class="fab fa-facebook-f"></i>Facebook</a><a href="" class="btn btn-outline-danger"><i class="fab fa-google-plus-g"></i> Google</a></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA0C5etf1GVmL_ldVAichWwFFVcDfa1y_c"></script>
            <!-- inject:js-->
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

            <%--renter Amenities panel--%>

            <asp:Panel runat="server" ID="renteraddAmenities" Visible="true">
                <div>
                    <asp:Label runat="server" Text="Amenities" ForeColor="#CC3300" Font-Size="3em" Font-Bold="True"></asp:Label>
                    <br />
                </div>
                <table>
                    <tr>
                        <td class="auto-style6"></td>
                        <td>
                            <asp:CheckBox ID="checkcondition" runat="server" Text=" Air Conditioning" />
                        </td>
                        <td class="auto-style6"></td>
                        <td>
                            <asp:CheckBox ID="checkcarbondetector" runat="server" Text=" Carbon Monoxide Detector" />
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:CheckBox ID="checkheating" runat="server" Text=" Heating" />
                        </td>
                        <td></td>
                        <td>
                            <asp:CheckBox ID="checksomkedetector" runat="server" Text=" Smoke Detector" />
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:CheckBox ID="checkLaundry" runat="server" Text=" On-Site Laundry" />
                        </td>
                        <td></td>
                        <td>
                            <asp:CheckBox ID="checkspeentrance" runat="server" Text=" Separate Entrance" />
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:CheckBox ID="checkParking" runat="server" Text=" Parking" />
                        </td>
                        <td></td>
                        <td>
                            <asp:CheckBox ID="checkWifi" runat="server" Text=" Wi-Fi" />
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:CheckBox ID="checkFurnished" runat="server" Text=" Furnished" />
                        </td>
                        <td></td>
                        <td>
                            <asp:CheckBox ID="checkTV" runat="server" Text=" TV" />
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:CheckBox ID="checkpet" runat="server" Text=" Pet-Friendly" />
                        </td>
                        <td></td>
                        <td>
                            <asp:CheckBox ID="checkspebath" runat="server" Text="Separate Bathroom" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1"></td>
                        <td class="auto-style1">
                            <asp:CheckBox ID="checkOther" runat="server" Text="Other(s)" AutoPostBack="True" />
                        </td>
                        <td class="auto-style1"></td>
                        <td class="auto-style1">
                            <asp:TextBox runat="server" Enabled="False" ID="othertextbox"></asp:TextBox>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:Button runat="server" class="btn btn-danger btn-lg" Text="Post" ValidationGroup="addproperty" ID="post" OnClick="post_Click"></asp:Button>
            </asp:Panel>
    </section>
</asp:Content>