<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="AddProperty.aspx.cs" Inherits="WebPages_AddProperty" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">

    <title>Add Property</title>
    <link href="https://fonts.googleapis.com/css?family=Muli:400,400i,600,700" rel="stylesheet">

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
                        var img = $("<image />");
                        img.attr("style", "height:150px;width: 150px;");
                        img.attr("src", e.target.result);
                        previewimages.append(img);
                    }
                    reader.readAsDataURL(file[0]);
                });

            });
        });
    </script>
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

                                        <asp:dropdownlist id="addCountry" runat="server" appenddatabounditems="True" autopostback="True" class="form-control">
                                            <asp:ListItem Value=""></asp:ListItem>
                                        </asp:dropdownlist>
                                        <br />
                                        <asp:requiredfieldvalidator id="requireCountry" runat="server" controltovalidate="addCountry" errormessage="Required" forecolor="Red" validationgroup="addproperty" display="Dynamic">Required</asp:requiredfieldvalidator>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:label runat="server" text="State" class="form-label"></asp:label>
                                    <asp:dropdownlist runat="server" id="replacestate" class="form-control" enable="false"></asp:dropdownlist>
                                    <asp:dropdownlist runat="server" id="addState" class="form-control" visible="False">
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
                                    <asp:label runat="server" text="Total Bathroom" class="form-label"></asp:label>
                                    <asp:dropdownlist id="addbath" runat="server" class="form-control">
                                        <asp:ListItem Value=""></asp:ListItem>
                                        <asp:ListItem Value="1">1</asp:ListItem>
                                        <asp:ListItem Value="2">2</asp:ListItem>
                                        <asp:ListItem Value="3">3</asp:ListItem>
                                        <asp:ListItem Value="4">4</asp:ListItem>
                                    </asp:dropdownlist>
                                    <asp:requiredfieldvalidator id="requireBath" runat="server" controltovalidate="addbath" errormessage="Required" forecolor="Red" validationgroup="addproperty" display="Dynamic">Required</asp:requiredfieldvalidator>
                                </div>
                                <div class="form-group">
                                    <asp:label runat="server" text="Avaliable Bedrooms" class="form-label"></asp:label>
                                    <asp:dropdownlist id="addBedrooms" runat="server" class="form-control" autopostback="True" onselectedindexchanged="addBedrooms_SelectedIndexChanged">
                                        <asp:ListItem Value=""></asp:ListItem>
                                        <asp:ListItem Value="1">1</asp:ListItem>
                                        <asp:ListItem Value="2">2</asp:ListItem>
                                        <asp:ListItem Value="3">3</asp:ListItem>
                                        <asp:ListItem Value="4">4</asp:ListItem>
                                    </asp:dropdownlist>
                                    <asp:requiredfieldvalidator id="requireBedroom" runat="server" controltovalidate="addBedrooms" errormessage="Required" forecolor="Red" validationgroup="addproperty" display="Dynamic">Required</asp:requiredfieldvalidator>
                                </div>
                                <hr />
                                <asp:panel runat="server" id="room1">
                                    <asp:Label runat="server" Text="Please enter room information" class="form-label"></asp:Label><br />
                                    <asp:Label runat="server" Text="Room 1 information" class="form-label"></asp:Label>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:label runat="server" text="Rent Price/Month" class="form-label"></asp:label>
                                                <div class="pricing-option-inputs">
                                                    <asp:textbox id="roomprice1" runat="server" class="form-control" placeholder="Rent Price/Month"></asp:textbox>
                                                    <asp:requiredfieldvalidator id="Requiredroomprice1" runat="server" controltovalidate="roomprice1" errormessage="Required" forecolor="Red" validationgroup="addproperty" display="Dynamic">Required</asp:requiredfieldvalidator>
                                                    <asp:comparevalidator id="Comparevalidator1" runat="server" controltovalidate="roomprice1" display="Dynamic" errormessage="Invalid" forecolor="Red" operator="DataTypeCheck" text="Invalid" type="Integer"></asp:comparevalidator>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-group">
                                                <asp:label runat="server" text="Separate Bathroom" class="form-label"></asp:label>
                                                <asp:dropdownlist id="roombath1" runat="server" class="form-control">
                                                    <asp:ListItem Value=""></asp:ListItem>
                                                    <asp:ListItem Value="Y">Yes</asp:ListItem>
                                                    <asp:ListItem Value="N">No</asp:ListItem>
                                                </asp:dropdownlist>
                                                <asp:requiredfieldvalidator id="Requiredroombath1" runat="server" controltovalidate="roombath1" errormessage="Required" forecolor="Red" validationgroup="addproperty" display="Dynamic">Required</asp:requiredfieldvalidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="form-group">
                                                    <asp:label runat="server" text="Available Date" class="form-label"></asp:label>
                                                    <asp:textbox id="addstartdate1" runat="server" textmode="Date" class="form-control"></asp:textbox>
                                                    <asp:requiredfieldvalidator id="requirestart1" runat="server" controltovalidate="addstartdate1" errormessage="Required" forecolor="Red" validationgroup="addproperty" display="Dynamic">Required</asp:requiredfieldvalidator>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-group">
                                                    <asp:label runat="server" text="End Date" class="form-label"></asp:label>
                                                    <asp:textbox id="addenddate1" runat="server" textmode="Date" class="form-control"></asp:textbox>
                                                    <asp:requiredfieldvalidator id="requireend1" runat="server" controltovalidate="addenddate1" errormessage="Required" forecolor="Red" validationgroup="addproperty" display="Dynamic">Required</asp:requiredfieldvalidator>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:panel>
                                <asp:panel runat="server" id="room2" Visible="False">
                                    <br />
                                    <asp:Label runat="server" Text="Room 2 information" class="form-label"></asp:Label>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:label runat="server" text="Rent Price/Month" class="form-label"></asp:label>
                                                <div class="pricing-option-inputs">
                                                    <asp:textbox id="roomprice2" runat="server" class="form-control" placeholder="Rent Price/Month"></asp:textbox>
                                                    <asp:requiredfieldvalidator id="Requiredroomprice2" runat="server" controltovalidate="roomprice2" errormessage="Required" forecolor="Red" validationgroup="addproperty" display="Dynamic">Required</asp:requiredfieldvalidator>
                                                    <asp:comparevalidator id="Comparevalidator2" runat="server" controltovalidate="roomprice2" display="Dynamic" errormessage="Invalid" forecolor="Red" operator="DataTypeCheck" text="Invalid" type="Integer"></asp:comparevalidator>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-group">
                                                <asp:label runat="server" text="Separate Bathroom" class="form-label"></asp:label>
                                                <asp:dropdownlist id="roombath2" runat="server" class="form-control">
                                                    <asp:ListItem Value=""></asp:ListItem>
                                                    <asp:ListItem Value="Y">Yes</asp:ListItem>
                                                    <asp:ListItem Value="N">No</asp:ListItem>
                                                </asp:dropdownlist>
                                                <asp:requiredfieldvalidator id="Requiredroombath2" runat="server" controltovalidate="roombath2" errormessage="Required" forecolor="Red" validationgroup="addproperty" display="Dynamic">Required</asp:requiredfieldvalidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="form-group">
                                                    <asp:label runat="server" text="Available Date" class="form-label"></asp:label>
                                                    <asp:textbox id="addstartdate2" runat="server" textmode="Date" class="form-control"></asp:textbox>
                                                    <asp:requiredfieldvalidator id="requirestart2" runat="server" controltovalidate="addstartdate2" errormessage="Required" forecolor="Red" validationgroup="addproperty" display="Dynamic">Required</asp:requiredfieldvalidator>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-group">
                                                    <asp:label runat="server" text="End Date" class="form-label"></asp:label>
                                                    <asp:textbox id="addenddate2" runat="server" textmode="Date" class="form-control"></asp:textbox>
                                                    <asp:requiredfieldvalidator id="requireend2" runat="server" controltovalidate="addenddate2" errormessage="Required" forecolor="Red" validationgroup="addproperty" display="Dynamic">Required</asp:requiredfieldvalidator>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:panel>
                                <asp:panel runat="server" id="room3" Visible="False">
                                    <br />
                                    <asp:Label runat="server" Text="Room 3 information" class="form-label"></asp:Label>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:label runat="server" text="Rent Price/Month" class="form-label"></asp:label>
                                                <div class="pricing-option-inputs">
                                                    <asp:textbox id="roomprice3" runat="server" class="form-control" placeholder="Rent Price/Month"></asp:textbox>
                                                    <asp:requiredfieldvalidator id="Requiredfieldvalidator1" runat="server" controltovalidate="roomprice3" errormessage="Required" forecolor="Red" validationgroup="addproperty" display="Dynamic">Required</asp:requiredfieldvalidator>
                                                    <asp:comparevalidator id="Comparevalidator3" runat="server" controltovalidate="roomprice3" display="Dynamic" errormessage="Invalid" forecolor="Red" operator="DataTypeCheck" text="Invalid" type="Integer"></asp:comparevalidator>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-group">
                                                <asp:label runat="server" text="Separate Bathroom" class="form-label"></asp:label>
                                                <asp:dropdownlist id="roombath3" runat="server" class="form-control">
                                                    <asp:ListItem Value=""></asp:ListItem>
                                                    <asp:ListItem Value="Y">Yes</asp:ListItem>
                                                    <asp:ListItem Value="N">No</asp:ListItem>
                                                </asp:dropdownlist>
                                                <asp:requiredfieldvalidator id="Requiredfieldvalidator2" runat="server" controltovalidate="roombath3" errormessage="Required" forecolor="Red" validationgroup="addproperty" display="Dynamic">Required</asp:requiredfieldvalidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="form-group">
                                                    <asp:label runat="server" text="Available Date" class="form-label"></asp:label>
                                                    <asp:textbox id="addstartdate3" runat="server" textmode="Date" class="form-control"></asp:textbox>
                                                    <asp:requiredfieldvalidator id="Requiredfieldvalidator3" runat="server" controltovalidate="addstartdate3" errormessage="Required" forecolor="Red" validationgroup="addproperty" display="Dynamic">Required</asp:requiredfieldvalidator>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-group">
                                                    <asp:label runat="server" text="End Date" class="form-label"></asp:label>
                                                    <asp:textbox id="addenddate3" runat="server" textmode="Date" class="form-control"></asp:textbox>
                                                    <asp:requiredfieldvalidator id="Requiredfieldvalidator4" runat="server" controltovalidate="addenddate3" errormessage="Required" forecolor="Red" validationgroup="addproperty" display="Dynamic">Required</asp:requiredfieldvalidator>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:panel>
                                <asp:panel runat="server" id="room4" Visible="False">
                                    <br />
                                    <asp:Label runat="server" Text="Room 4 information" class="form-label"></asp:Label>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:label runat="server" text="Rent Price/Month" class="form-label"></asp:label>
                                                <div class="pricing-option-inputs">
                                                    <asp:textbox id="roomprice4" runat="server" class="form-control" placeholder="Rent Price/Month"></asp:textbox>
                                                    <asp:requiredfieldvalidator id="Requiredfieldvalidator5" runat="server" controltovalidate="roomprice4" errormessage="Required" forecolor="Red" validationgroup="addproperty" display="Dynamic">Required</asp:requiredfieldvalidator>
                                                    <asp:comparevalidator id="Comparevalidator4" runat="server" controltovalidate="roomprice4" display="Dynamic" errormessage="Invalid" forecolor="Red" operator="DataTypeCheck" text="Invalid" type="Integer"></asp:comparevalidator>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-group">
                                                <asp:label runat="server" text="Separate Bathroom" class="form-label"></asp:label>
                                                <asp:dropdownlist id="roombath4" runat="server" class="form-control">
                                                    <asp:ListItem Value=""></asp:ListItem>
                                                    <asp:ListItem Value="Y">Yes</asp:ListItem>
                                                    <asp:ListItem Value="N">No</asp:ListItem>
                                                </asp:dropdownlist>
                                                <asp:requiredfieldvalidator id="Requiredfieldvalidator6" runat="server" controltovalidate="roombath4" errormessage="Required" forecolor="Red" validationgroup="addproperty" display="Dynamic">Required</asp:requiredfieldvalidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="form-group">
                                                    <asp:label runat="server" text="Available Date" class="form-label"></asp:label>
                                                    <asp:textbox id="addstartdate4" runat="server" textmode="Date" class="form-control"></asp:textbox>
                                                    <asp:requiredfieldvalidator id="Requiredfieldvalidator7" runat="server" controltovalidate="addstartdate4" errormessage="Required" forecolor="Red" validationgroup="addproperty" display="Dynamic">Required</asp:requiredfieldvalidator>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-group">
                                                    <asp:label runat="server" text="End Date" class="form-label"></asp:label>
                                                    <asp:textbox id="addenddate4" runat="server" textmode="Date" class="form-control"></asp:textbox>
                                                    <asp:requiredfieldvalidator id="Requiredfieldvalidator8" runat="server" controltovalidate="addenddate4" errormessage="Required" forecolor="Red" validationgroup="addproperty" display="Dynamic">Required</asp:requiredfieldvalidator>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:panel>
                        </div>
                        <!-- ends: .form-group -->
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-10 offset-lg-1" style="left: 0px; top: 0px">
                                    <div class="atbd_content_module">
                                        <div class="atbd_content_module__tittle_area">
                                            <div class="atbd_area_title">
                                                <h4><span class="la la-thumbs-up"></span>Amenities (Check all that apply)</h4>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-lg-10 amenities-checks">
                                                <div class="form-check">
                                                    <asp:checkbox id="checkcondition" runat="server" class="form-check-input" text="  Air Conditioning" />
                                                    <br />
                                                </div>
                                                <div class="form-check">
                                                    <asp:checkbox id="checkheating" runat="server" class="form-check-input" text="  Heating" />
                                                    <br />
                                                </div>
                                                <div class="form-check">
                                                    <asp:checkbox id="checkLaundry" runat="server" class="form-check-input" text="  On-Site Laundry" />
                                                    <br />
                                                </div>
                                                <div class="form-check">
                                                    <asp:checkbox id="checkParking" runat="server" class="form-check-input" text=" Parking" />
                                                    <br />
                                                </div>
                                                <div class="form-check">
                                                    <asp:checkbox id="checkFurnished" runat="server" class="form-check-input" text=" Furnished" />
                                                    <br />
                                                </div>
                                                <div class="form-check">
                                                    <asp:checkbox id="checkpet" runat="server" class="form-check-input" text=" Pet-Friendly" />
                                                    <br />
                                                </div>
                                                <div class="form-check">
                                                    <asp:checkbox id="checkcarbondetector" runat="server" class="form-check-input" text=" Carbon Monoxide Detector" />
                                                    <br />
                                                </div>
                                                <div class="form-check">
                                                    <asp:checkbox id="checksomkedetector" runat="server" class="form-check-input" text=" Smoke Detector" />
                                                    <br />
                                                </div>
                                                <div class="form-check">
                                                    <asp:checkbox id="checkspeentrance" runat="server" class="form-check-input" text=" Separate Entrance" />
                                                    <br />
                                                </div>
                                                <div class="form-check">
                                                    <asp:checkbox id="checkWifi" runat="server" class="form-check-input" text=" Wi-Fi" />
                                                    <br />
                                                </div>
                                                <div class="form-check">
                                                    <asp:checkbox id="checkTV" runat="server" class="form-check-input" text=" TV" />
                                                    <br />
                                                </div>
                                                <div class="form-check">
                                                    <asp:checkbox id="checkspebath" runat="server" class="form-check-input" text="Separate Bathroom" />
                                                    <br />
                                                </div>
                                                <div class="form-check">
                                                    <asp:checkbox id="checkOther" class="form-check-input" runat="server" text="Other(s)" autopostback="True" />
                                                    <br />
                                                    <asp:textbox runat="server" class="form-control" enabled="False" id="othertextbox"></asp:textbox>
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
                                <br />
                                <br />
                                <div id="showimage">
                                    <asp:image id="imgpreview" runat="server" height="150" width="150" imageurl="http://cliquecities.com/assets/no-image-e3699ae23f866f6cbdf8ba2443ee5c4e.jpg" style="border-width: 0px;" />
                                </div>
                                <asp:fileupload id="FileUpload1" multiple="multiple" runat="server" allowmultiple="true" />
                                <%-- <asp:Button ID="Upload" runat="server" Text="Upload New Image" class="btn btn-sm btn-secondary form-control-file" OnClick="Upload_Click" />--%>
                                <br />
                                <br />
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
                        <asp:button runat="server" class="btn btn-xs btn-gradient btn-gradient-two access-link m-right-10" text="Post" validationgroup="addproperty" id="post" onclick="post_Click"></asp:button>
                        <asp:button runat="server" text="Cancel" class="btn btn-xs btn-gradient btn-gradient-two access-link m-right-10" id="cancel" onclick="cancel_Click"></asp:button>
                    </div>
                </div>
            </div>

            <br />
    </section>
</asp:Content>