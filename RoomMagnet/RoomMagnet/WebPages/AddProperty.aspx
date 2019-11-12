<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="AddProperty.aspx.cs" Inherits="WebPages_AddProperty" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">

    <title>Add Property</title>
    <link href="https://fonts.googleapis.com/css?family=Muli:400,400i,600,700" rel="stylesheet">
    <%--    <!-- inject:css-->
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
    <link rel="icon" type="image/png" sizes="32x32" href="img/fevicon.png">--%>

    <%--   <script>
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
    <script src="../jquery/jquery-3.2.1.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#File1").change(function () {

                var previewimages = $("#showimage");
                previewimages.html("");
                $($(this)[0].files).each(function () {
                    var file = $(this);
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        var img = $("<img />");
                        img.attr("style", "height:150px;width: 150px;");
                        img.attr("src", e.target.result);
                        previewimages.append(img);
                    }
                    reader.readAsDataURL(file[0]);
                });

            });
        });
    </script>
    <style type="text/css">
        .auto-style1 {
            position: relative;
            display: block;
            padding-left: 1.25rem;
            left: 0px;
            top: 0px;
        }
    </style>
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
                                    <asp:label runat="server" for="title" class="form-label">Title</asp:label>
                                    <asp:textbox runat="server" id="addtitle" class="form-control" placeholder="Enter Title" maxlength="50"></asp:textbox>
                                    <asp:requiredfieldvalidator id="requireTitle" runat="server" errormessage="Required" forecolor="Red" validationgroup="addproperty" controltovalidate="addtitle" display="Dynamic">Required</asp:requiredfieldvalidator>
                                </div>
                                <div class="form-group ">
                                    <asp:label runat="server" text="Street Address" class="form-label"></asp:label>
                                    <asp:textbox runat="server" id="addStreet" placeholder="Street Address" class="form-control" maxlength="50"></asp:textbox>
                                    <asp:requiredfieldvalidator id="requireStreet" runat="server" controltovalidate="addStreet" errormessage="Required" forecolor="Red" validationgroup="addproperty" display="Dynamic">Required</asp:requiredfieldvalidator>
                                </div>
                                <div class="form-group ">
                                    <asp:label runat="server" text="City" class="form-label"></asp:label>
                                    <asp:textbox runat="server" id="addCity" placeholder="City" class="form-control" maxlength="30"></asp:textbox>
                                    <asp:requiredfieldvalidator id="requireCity" runat="server" controltovalidate="addCity" errormessage="Required" forecolor="Red" validationgroup="addproperty" display="Dynamic">Required</asp:requiredfieldvalidator>
                                </div>
                                <div class="form-group">

                                    <asp:label runat="server" text="Country" class="form-label"></asp:label>
                                    <div class="input-group">

                                        <asp:dropdownlist id="addCountry" runat="server" appenddatabounditems="True" autopostback="True" class="custom-select">
                                            <asp:ListItem Value=""></asp:ListItem>
                                        </asp:dropdownlist>
                                        <br />
                                        <asp:requiredfieldvalidator id="requireCountry" runat="server" controltovalidate="addCountry" errormessage="Required" forecolor="Red" validationgroup="addproperty" display="Dynamic">Required</asp:requiredfieldvalidator>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:label runat="server" text="State" class="form-label"></asp:label>
                                    <asp:dropdownlist runat="server" id="replacestate" class="custom-select" enable="false"></asp:dropdownlist>
                                    <asp:dropdownlist runat="server" id="addState" class="custom-select" visible="False">
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
                                    </asp:dropdownlist>
                                </div>

                                <div class="form-group ">
                                    <asp:label runat="server" class="form-label " text="Zip"></asp:label>
                                    <asp:textbox id="addZip" runat="server" placeholder="Zip Code" class="form-control" maxlength="10"></asp:textbox>
                                    <asp:requiredfieldvalidator id="requireZip" runat="server" controltovalidate="addZip" errormessage="Required" forecolor="Red" validationgroup="addproperty" display="Dynamic">Required</asp:requiredfieldvalidator>
                                    <asp:comparevalidator id="CompareZip" runat="server" errormessage="Invalid" text="Invalid" controltovalidate="addZip" display="Dynamic" forecolor="Red" operator="DataTypeCheck" type="Integer"></asp:comparevalidator>
                                </div>

                                <div class="form-group">
                                    <asp:label runat="server" text="Square Footage of House" class="form-label"></asp:label>

                                    <asp:textbox id="addSquare" runat="server" class="form-control"></asp:textbox>
                                    <asp:requiredfieldvalidator id="requireSquare" runat="server" controltovalidate="addSquare" errormessage="Required" forecolor="Red" validationgroup="addproperty" display="Dynamic">Required</asp:requiredfieldvalidator>

                                    <asp:comparevalidator id="Comparesquare" runat="server" controltovalidate="addSquare" display="Dynamic" errormessage="Invalid" forecolor="Red" operator="DataTypeCheck" text="Invalid" type="Integer"></asp:comparevalidator>
                                </div>

                                <div class="form-group">
                                    <asp:label runat="server" text="Rent Price/Month" class="form-label"></asp:label>
                                    <div class="pricing-option-inputs">

                                        <asp:textbox id="addPrice" runat="server" class="form-control" placeholder="Rent Price/Month"></asp:textbox>
                                        <asp:requiredfieldvalidator id="requirePrice" runat="server" controltovalidate="addPrice" errormessage="Required" forecolor="Red" validationgroup="addproperty" display="Dynamic">Required</asp:requiredfieldvalidator>
                                        <asp:comparevalidator id="Compareprice" runat="server" controltovalidate="addPrice" display="Dynamic" errormessage="Invalid" forecolor="Red" operator="DataTypeCheck" text="Invalid" type="Integer"></asp:comparevalidator>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:label runat="server" text="Avaliable Bedrooms" class="form-label"></asp:label>
                                    <asp:dropdownlist id="addBedrooms" runat="server" class="custom-select">
                                        <asp:ListItem Value=""></asp:ListItem>
                                        <asp:ListItem Value="1">1</asp:ListItem>
                                        <asp:ListItem Value="2">2</asp:ListItem>
                                        <asp:ListItem Value="3">3</asp:ListItem>
                                        <asp:ListItem Value="4">4</asp:ListItem>
                                        <asp:ListItem Value="5">5</asp:ListItem>
                                    </asp:dropdownlist>
                                    <asp:requiredfieldvalidator id="requireBedroom" runat="server" controltovalidate="addBedrooms" errormessage="Required" forecolor="Red" validationgroup="addproperty" display="Dynamic">Required</asp:requiredfieldvalidator>
                                </div>
                                <div class="form-group">
                                    <asp:label runat="server" text="Available Date" class="form-label"></asp:label>
                                    <asp:textbox id="addstartdate" runat="server" textmode="Date" class="form-control"></asp:textbox>
                                    <asp:requiredfieldvalidator id="requirestart" runat="server" controltovalidate="addstartdate" errormessage="Required" forecolor="Red" validationgroup="addproperty" display="Dynamic">Required</asp:requiredfieldvalidator>
                                </div>

                                <div class="form-group">
                                    <asp:label runat="server" text="End Date" class="form-label"></asp:label>
                                    <asp:textbox id="addenddate" runat="server" textmode="Date" class="form-control"></asp:textbox>
                                    <asp:requiredfieldvalidator id="requireend" runat="server" controltovalidate="addenddate" errormessage="Required" forecolor="Red" validationgroup="addproperty" display="Dynamic">Required</asp:requiredfieldvalidator>
                                </div>
                        </div>
                        <!-- ends: .form-group -->
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-10 offset-lg-1">
                                    <div class="atbd_content_module">
                                        <div class="atbd_content_module__tittle_area">
                                            <div class="atbd_area_title">
                                                <h4><span class="la la-thumbs-up"></span>Amenities (Check all that apply)</h4>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-lg-10 amenities-checks">
                                                <div class="form-check">
                                                    <asp:CheckBox ID="checkcondition" runat="server" class="form-check-input" Text="  Air Conditioning" /><br />
                                                </div>
                                                <div class="form-check">
                                                    <asp:CheckBox ID="checkheating" runat="server" class="form-check-input" Text="  Heating" /><br />
                                                </div>
                                                <div class="form-check">
                                                    <asp:CheckBox ID="checkLaundry" runat="server" class="form-check-input" Text="  On-Site Laundry" /><br />
                                                </div>
                                                <div class="form-check">
                                                    <asp:CheckBox ID="checkParking" runat="server" class="form-check-input" Text=" Parking" /><br />
                                                </div>
                                                <div class="form-check">
                                                    <asp:CheckBox ID="checkFurnished" runat="server" class="form-check-input" Text=" Furnished" /><br />
                                                </div>
                                                <div class="form-check">
                                                    <asp:CheckBox ID="checkpet" runat="server" class="form-check-input" Text=" Pet-Friendly" /><br />
                                                </div>
                                                <div class="form-check">
                                                    <asp:CheckBox ID="checkcarbondetector" runat="server" class="form-check-input" Text=" Carbon Monoxide Detector" /><br />
                                                </div>
                                                <div class="form-check">
                                                    <asp:CheckBox ID="checksomkedetector" runat="server" class="form-check-input" Text=" Smoke Detector" /><br />
                                                </div>
                                                <div class="form-check">
                                                    <asp:CheckBox ID="checkspeentrance" runat="server" class="form-check-input" Text=" Separate Entrance" /><br />
                                                </div>
                                                <div class="form-check">
                                                    <asp:CheckBox ID="checkWifi" runat="server" class="form-check-input" Text=" Wi-Fi" /><br />
                                                </div>
                                                <div class="form-check">
                                                    <asp:CheckBox ID="checkTV" runat="server" class="form-check-input" Text=" TV" /><br />
                                                </div>
                                                <div class="form-check">
                                                    <asp:CheckBox ID="checkspebath" runat="server" class="form-check-input" Text="Separate Bathroom" /><br />
                                                </div>
                                                <div class="form-check">
                                                    <asp:CheckBox ID="checkOther" class="form-check-input" runat="server" Text="Other(s)" AutoPostBack="True" /><br />
                                                    <asp:TextBox runat="server" class="form-control" Enabled="False" ID="othertextbox"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
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
                                <br />
                                <asp:image id="imgpreview1" runat="server" height="100" width="100" imageurl="" style="border-width: 0px;" visible="False" />
                                <asp:image id="imgpreview2" runat="server" height="100" width="100" imageurl="" style="border-width: 0px;" visible="False" />
                                <asp:image id="imgpreview3" runat="server" height="100" width="100" imageurl="" style="border-width: 0px;" visible="False" />
                                <asp:image id="imgpreview4" runat="server" height="100" width="100" imageurl="" style="border-width: 0px;" visible="False" />
                                <asp:image id="imgpreview5" runat="server" height="100" width="100" imageurl="" style="border-width: 0px;" visible="False" />
                                <asp:image id="imgpreview6" runat="server" height="100" width="100" imageurl="" style="border-width: 0px;" visible="False" />
                                <asp:image id="imgpreview7" runat="server" height="100" width="100" imageurl="" style="border-width: 0px;" visible="False" />
                                <br />
                                <br />
                                <asp:button id="Upload" runat="server" text="Upload New Image" class="btn btn-sm btn-secondary form-control-file" onclick="Upload_Click" />
                            </div>

                            <%--    <input type="file" multiple="multiple" name="File1" id="File1" accept="image/*" />
    <br /><br />
    <div id="showimage">
    </div>
    <hr />
    <asp:Button ID="Button2" runat="server" Text="Upload and Save"  OnClick="uploadImages_Click" />

    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>--%>
                            <%--                            <div class="atbdb_content_module_contents">
                                <div id="_listing_gallery">
                                    <div class="add_listing_form_wrapper" id="gallery_upload">

                                        <div class="form-group text-center">
                                            <!-- image container, which can be manipulated with js -->
                                            <input type="file" multiple="multiple" name="File1" id ="File1" accept="image/*" />
                                            <br /><br />
                                            <div id="showimage"></div>
                                            <!--  add & remove image links -->
                                            <asp:Button ID="uploadImages" runat="server" Text="Upload Images" class="btn btn-xs btn-primary m-right-10" OnClick="uploadImages_Click" />
                                        </div>
                                    </div>
                                    <!--ends add_listing_form_wrapper-->
                                </div>
                            </div>--%>
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
                        <asp:Button runat="server" class="btn btn-xs btn-gradient btn-gradient-two access-link m-right-10" Text="Post" ValidationGroup="addproperty" ID="post" OnClick="post_Click"></asp:Button>
                        <asp:button runat="server" text="Cancel" class="btn btn-xs btn-gradient btn-gradient-two access-link m-right-10" id="cancel" onclick="cancel_Click"></asp:button>
                        <%--<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>--%>
                    </div>
                </div>
            </div>

          <%--  <div class="modal fade" id="login_modal" tabindex="-1" role="dialog" aria-labelledby="login_modal_label" aria-hidden="true">
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
            <!-- endinject-->--%>

                <br />
                
    </section>
</asp:Content>