<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="UpdateProperty.aspx.cs" Inherits="WebPages_UpdateProperty" %>

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
        .auto-style1 {
            left: 0px;
            top: 1px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="Server">
    <%-- <asp:Button ID="MasterPageLogIn" runat="server" Text="Sign In" CssClass="btn btn-xs btn-gradient btn-gradient-two access-link" data-toggle="modal" data-target="#Updatenotification" data-dismiss="modal" OnClientClick="return false" />--%>
    <section class="add-listing-wrapper border-bottom section-bg ">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center settings-title">
                    <h1>Update Property</h1>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-lg-10 offset-lg-1">
                    <div class="atbd_content_module">
                        <div class="atbd_content_module__tittle_area">
                            <div class="atbd_area_title">
                                <h4><span class="la la-home"></span>Property Information
                                </h4>
                            </div>
                        </div>
                        <div class="atbdb_content_module_contents">
                            <form action="/">
                                <div class="form-group">
                                    <asp:Label runat="server" for="title" class="form-label">Title*</asp:Label>
                                    <asp:TextBox runat="server" ID="addtitle" class="form-control" placeholder="Enter Title" MaxLength="50"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="requireTitle" runat="server" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addproperty" ControlToValidate="addtitle" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group ">
                                    <asp:Label runat="server" Text="Street Address*" class="form-label"></asp:Label>
                                    <asp:TextBox runat="server" ID="addStreet" placeholder="Street Address" class="form-control" MaxLength="50"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="requireStreet" runat="server" ControlToValidate="addStreet" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addproperty" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group ">
                                    <asp:Label runat="server" Text="City*" class="form-label"></asp:Label>
                                    <asp:TextBox runat="server" ID="addCity" placeholder="City" class="form-control" MaxLength="30"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="requireCity" runat="server" ControlToValidate="addCity" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addproperty" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">

                                    <asp:Label runat="server" Text="Country*" class="form-label"></asp:Label>
                                    <div class="input-group">

                                        <asp:DropDownList ID="addCountry" runat="server" AppendDataBoundItems="True" AutoPostBack="True" class="form-control">
                                            <asp:ListItem Value=""></asp:ListItem>
                                        </asp:DropDownList>
                                        <br />
                                        <asp:RequiredFieldValidator ID="requireCountry" runat="server" ControlToValidate="addCountry" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addproperty" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:Label runat="server" Text="State*" class="form-label"></asp:Label>
                                    <asp:DropDownList runat="server" ID="replacestate" class="form-control" enable="false"></asp:DropDownList>
                                    <asp:DropDownList runat="server" ID="addState" class="form-control" Visible="False">
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
                                    <asp:Label runat="server" class="form-label " Text="Zip*"></asp:Label>
                                    <asp:TextBox ID="addZip" runat="server" placeholder="Zip Code" class="form-control" MaxLength="10"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="requireZip" runat="server" ControlToValidate="addZip" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addproperty" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CompareZip" runat="server" ErrorMessage="Invalid" Text="Invalid" ControlToValidate="addZip" Display="Dynamic" ForeColor="Red" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                </div>

                                <div class="form-group ">
                                    <asp:Label runat="server" class="form-label " Text="Home Type*"></asp:Label>
                                    <asp:DropDownList runat="server" ID="addType" class="form-control">
                                        <asp:ListItem Value=""></asp:ListItem>
                                        <asp:ListItem Value="Appartment">Appartment</asp:ListItem>
                                        <asp:ListItem Value="TownHouse">Town house</asp:ListItem>
                                        <asp:ListItem Value="Home">Home</asp:ListItem>
                                        </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="addType" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addproperty" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                </div>

                                <div class="form-group">
                                    <asp:Label runat="server" Text="Square Footage of House*" class="form-label"></asp:Label>

                                    <asp:TextBox ID="addSquare" runat="server" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="requireSquare" runat="server" ControlToValidate="addSquare" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addproperty" Display="Dynamic">Required</asp:RequiredFieldValidator>

                                    <asp:CompareValidator ID="Comparesquare" runat="server" ControlToValidate="addSquare" Display="Dynamic" ErrorMessage="Invalid" ForeColor="Red" Operator="DataTypeCheck" Text="Invalid" Type="Integer"></asp:CompareValidator>
                                </div>

                                <div class="form-group">
                                    <asp:Label runat="server" Text="Rent Price/Month*" class="form-label"></asp:Label>
                                    <div class="pricing-option-inputs">

                                        <asp:TextBox ID="addPrice" runat="server" class="form-control" placeholder="Rent Price/Month"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="requirePrice" runat="server" ControlToValidate="addPrice" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addproperty" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                        <asp:CompareValidator ID="Compareprice" runat="server" ControlToValidate="addPrice" Display="Dynamic" ErrorMessage="Invalid" ForeColor="Red" Operator="DataTypeCheck" Text="Invalid" Type="Double"></asp:CompareValidator>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <asp:Label runat="server" Text="Total Bathroom*" class="form-label"></asp:Label>
                                    <asp:DropDownList ID="addbath" runat="server" class="form-control">
                                        <asp:ListItem Value=""></asp:ListItem>
                                        <asp:ListItem Value="1">1</asp:ListItem>
                                        <asp:ListItem Value="2">2</asp:ListItem>
                                        <asp:ListItem Value="3">3</asp:ListItem>
                                        <asp:ListItem Value="4">4</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="requireBath" runat="server" ControlToValidate="addbath" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addproperty" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <asp:Label runat="server" Text="Avaliable Bedrooms*" class="form-label"></asp:Label>
                                    <asp:DropDownList ID="addBedrooms" runat="server" class="form-control" AutoPostBack="True" OnSelectedIndexChanged="addBedrooms_SelectedIndexChanged">
                                        <asp:ListItem Value=""></asp:ListItem>
                                        <asp:ListItem Value="1">1</asp:ListItem>
                                        <asp:ListItem Value="2">2</asp:ListItem>
                                        <asp:ListItem Value="3">3</asp:ListItem>
                                        <asp:ListItem Value="4">4</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="requireBedroom" runat="server" ControlToValidate="addBedrooms" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addproperty" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                </div>
                                <hr />
                                <asp:Panel runat="server" ID="room1">
                                    <asp:Label runat="server" Text="Please enter room information" class="form-label"></asp:Label><br />
                                    <asp:Label runat="server" Text="Room 1 information" class="form-label"></asp:Label>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:Label runat="server" Text="Room Name*" class="form-label"></asp:Label>
                                                <asp:TextBox ID="Room1Name" runat="server" class="form-control" placeholder="Enter Room Name"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="Room1Requiredfieldvalidator" runat="server" ControlToValidate="Room1Name" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addproperty" Display="Dynamic">Required</asp:RequiredFieldValidator><br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label runat="server" Text="Rent Price/Month*" class="form-label"></asp:Label>
                                                <div class="pricing-option-inputs">
                                                    <asp:TextBox ID="roomprice1" runat="server" class="form-control" placeholder="Rent Price/Month"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="Requiredroomprice1" runat="server" ControlToValidate="roomprice1" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addproperty" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                                    <asp:CompareValidator ID="Comparevalidator1" runat="server" ControlToValidate="roomprice1" Display="Dynamic" ErrorMessage="Invalid" ForeColor="Red" Operator="DataTypeCheck" Text="Invalid" Type="Double"></asp:CompareValidator>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-group">
                                                    <asp:Label runat="server" Text="Separate Bathroom*" class="form-label"></asp:Label>
                                                    <asp:DropDownList ID="roombath1" runat="server" class="form-control">
                                                        <asp:ListItem Value=""></asp:ListItem>
                                                        <asp:ListItem Value="Y">Yes</asp:ListItem>
                                                        <asp:ListItem Value="N">No</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="Requiredroombath1" runat="server" ControlToValidate="roombath1" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addproperty" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="form-group">
                                                    <asp:Label runat="server" Text="Available Date*" class="form-label"></asp:Label>
                                                    <asp:TextBox ID="addstartdate1" runat="server" class="form-control" onfocus="(this.type='date')"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="requirestart1" runat="server" ControlToValidate="addstartdate1" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addproperty" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                                    <asp:CompareValidator ID="Comparestart1" runat="server" Operator="GreaterThan" Type="Date" ControlToValidate="addstartdate1" ValidateEmptyText="True" Text="Start date can't be less than today" ValidationGroup="addproperty" ForeColor="Red"></asp:CompareValidator>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-group">
                                                    <asp:Label runat="server" Text="End Date*" class="form-label"></asp:Label>
                                                    <asp:TextBox ID="addenddate1" runat="server" onfocus="(this.type='date')" class="form-control"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="requireend1" runat="server" ControlToValidate="addenddate1" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addproperty" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                                    <asp:CompareValidator ID="Compareend1" runat="server" Operator="GreaterThan" Type="Date" ControlToValidate="addenddate1" ValidateEmptyText="True" ValidationGroup="addproperty" Text="End date should be greater than start day!" ForeColor="Red" ControlToCompare="addstartdate1"></asp:CompareValidator>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                                <asp:Panel runat="server" ID="room2" Visible="False">
                                    <br />
                                    <asp:Label runat="server" Text="Room 2 information" class="form-label"></asp:Label>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:Label runat="server" Text="Room Name*" class="form-label"></asp:Label>
                                                <asp:TextBox ID="Room2Name" runat="server" class="form-control" placeholder="Enter Room Name"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="Room2Name" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addproperty" Display="Dynamic">Required</asp:RequiredFieldValidator><br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label runat="server" Text="Rent Price/Month*" class="form-label"></asp:Label>
                                                <div class="pricing-option-inputs">
                                                    <asp:TextBox ID="roomprice2" runat="server" class="form-control" placeholder="Rent Price/Month"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="Requiredroomprice2" runat="server" ControlToValidate="roomprice2" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addproperty" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                                    <asp:CompareValidator ID="Comparevalidator2" runat="server" ControlToValidate="roomprice2" Display="Dynamic" ErrorMessage="Invalid" ForeColor="Red" Operator="DataTypeCheck" Text="Invalid" Type="Double"></asp:CompareValidator>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-group">
                                                    <asp:Label runat="server" Text="Separate Bathroom*" class="form-label"></asp:Label>
                                                    <asp:DropDownList ID="roombath2" runat="server" class="form-control">
                                                        <asp:ListItem Value=""></asp:ListItem>
                                                        <asp:ListItem Value="Y">Yes</asp:ListItem>
                                                        <asp:ListItem Value="N">No</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="Requiredroombath2" runat="server" ControlToValidate="roombath2" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addproperty" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="form-group">
                                                    <asp:Label runat="server" Text="Available Date*" class="form-label"></asp:Label>
                                                    <asp:TextBox ID="addstartdate2" runat="server" onfocus="(this.type='date')" class="form-control"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="requirestart2" runat="server" ControlToValidate="addstartdate2" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addproperty" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                                    <asp:CompareValidator ID="Comparestart2" runat="server" Operator="GreaterThan" Type="Date" ControlToValidate="addstartdate2" ValidateEmptyText="True" Text="Start date can't be less than today" ValidationGroup="addproperty" ForeColor="Red"></asp:CompareValidator>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-group">
                                                    <asp:Label runat="server" Text="End Date*" class="form-label"></asp:Label>
                                                    <asp:TextBox ID="addenddate2" runat="server" onfocus="(this.type='date')" class="form-control"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="requireend2" runat="server" ControlToValidate="addenddate2" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addproperty" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                                    <asp:CompareValidator ID="Compareend2" runat="server" Operator="GreaterThan" Type="Date" ControlToValidate="addenddate2" ValidateEmptyText="True" ValidationGroup="addproperty" Text="End date should be greater than start day!" ForeColor="Red" ControlToCompare="addstartdate2"></asp:CompareValidator>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                                <asp:Panel runat="server" ID="room3" Visible="False">
                                    <br />
                                    <asp:Label runat="server" Text="Room 3 information" class="form-label"></asp:Label>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:Label runat="server" Text="Room Name*" class="form-label"></asp:Label>
                                                <asp:TextBox ID="Room3Name" runat="server" class="form-control" placeholder="Enter Room Name"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="Room3Name" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addproperty" Display="Dynamic">Required</asp:RequiredFieldValidator><br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label runat="server" Text="Rent Price/Month*" class="form-label"></asp:Label>
                                                <div class="pricing-option-inputs">
                                                    <asp:TextBox ID="roomprice3" runat="server" class="form-control" placeholder="Rent Price/Month"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="Requiredfieldvalidator1" runat="server" ControlToValidate="roomprice3" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addproperty" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                                    <asp:CompareValidator ID="Comparevalidator3" runat="server" ControlToValidate="roomprice3" Display="Dynamic" ErrorMessage="Invalid" ForeColor="Red" Operator="DataTypeCheck" Text="Invalid" Type="Double"></asp:CompareValidator>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-group">
                                                    <asp:Label runat="server" Text="Separate Bathroom*" class="form-label"></asp:Label>
                                                    <asp:DropDownList ID="roombath3" runat="server" class="form-control">
                                                        <asp:ListItem Value=""></asp:ListItem>
                                                        <asp:ListItem Value="Y">Yes</asp:ListItem>
                                                        <asp:ListItem Value="N">No</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="Requiredfieldvalidator2" runat="server" ControlToValidate="roombath3" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addproperty" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="form-group">
                                                    <asp:Label runat="server" Text="Available Date*" class="form-label"></asp:Label>
                                                    <asp:TextBox ID="addstartdate3" runat="server" onfocus="(this.type='date')" class="form-control"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="Requiredfieldvalidator3" runat="server" ControlToValidate="addstartdate3" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addproperty" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                                    <asp:CompareValidator ID="Comparestart3" runat="server" Operator="GreaterThan" Type="Date" ControlToValidate="addstartdate3" ValidateEmptyText="True" Text="Start date can't be less than today" ValidationGroup="addproperty" ForeColor="Red"></asp:CompareValidator>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-group">
                                                    <asp:Label runat="server" Text="End Date*" class="form-label"></asp:Label>
                                                    <asp:TextBox ID="addenddate3" runat="server" onfocus="(this.type='date')" class="form-control"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="Requiredfieldvalidator4" runat="server" ControlToValidate="addenddate3" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addproperty" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                                    <asp:CompareValidator ID="Compareend3" runat="server" Operator="GreaterThan" Type="Date" ControlToValidate="addenddate3" ValidateEmptyText="True" ValidationGroup="addproperty" Text="End date should be greater than start day!" ForeColor="Red" ControlToCompare="addstartdate3"></asp:CompareValidator>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                                <asp:Panel runat="server" ID="room4" Visible="False">
                                    <br />
                                    <asp:Label runat="server" Text="Room 4 information" class="form-label"></asp:Label>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:Label runat="server" Text="Room Name*" class="form-label"></asp:Label>
                                                <asp:TextBox ID="Room4Name" runat="server" class="form-control" placeholder="Enter Room Name"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="Room4Name" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addproperty" Display="Dynamic">Required</asp:RequiredFieldValidator><br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label runat="server" Text="Rent Price/Month*" class="form-label"></asp:Label>
                                                <div class="pricing-option-inputs">
                                                    <asp:TextBox ID="roomprice4" runat="server" class="form-control" placeholder="Rent Price/Month"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="Requiredfieldvalidator5" runat="server" ControlToValidate="roomprice4" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addproperty" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                                    <asp:CompareValidator ID="Comparevalidator4" runat="server" ControlToValidate="roomprice4" Display="Dynamic" ErrorMessage="Invalid" ForeColor="Red" Operator="DataTypeCheck" Text="Invalid" Type="Double"></asp:CompareValidator>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-group">
                                                    <asp:Label runat="server" Text="Separate Bathroom*" class="form-label"></asp:Label>
                                                    <asp:DropDownList ID="roombath4" runat="server" class="form-control">
                                                        <asp:ListItem Value=""></asp:ListItem>
                                                        <asp:ListItem Value="Y">Yes</asp:ListItem>
                                                        <asp:ListItem Value="N">No</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="Requiredfieldvalidator6" runat="server" ControlToValidate="roombath4" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addproperty" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="form-group">
                                                    <asp:Label runat="server" Text="Available Date*" class="form-label"></asp:Label>
                                                    <asp:TextBox ID="addstartdate4" runat="server" onfocus="(this.type='date')" class="form-control" Width="284px"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="Requiredfieldvalidator7" runat="server" ControlToValidate="addstartdate4" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addproperty" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                                    <asp:CompareValidator ID="Comparestart4" runat="server" Operator="GreaterThan" Type="Date" ControlToValidate="addstartdate4" ValidateEmptyText="True" Text="Start date can't be less than today" ValidationGroup="addproperty" ForeColor="Red"></asp:CompareValidator>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-group">
                                                    <asp:Label runat="server" Text="End Date*" class="form-label"></asp:Label>
                                                    <asp:TextBox ID="addenddate4" runat="server" onfocus="(this.type='date')" class="form-control"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="Requiredfieldvalidator8" runat="server" ControlToValidate="addenddate4" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addproperty" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                                    <asp:CompareValidator ID="Compareend4" runat="server" Operator="GreaterThan" Type="Date" ControlToValidate="addenddate4" ValidateEmptyText="True" ValidationGroup="addproperty" Text="End date should be greater than start day!" ForeColor="Red" ControlToCompare="addstartdate4"></asp:CompareValidator>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                        </div>
                        <!-- ends: .form-group -->
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-10 offset-lg-1" style="left: 0px; top: 0px">
                                    <div class="atbd_content_module">
                                        <div class="atbd_content_module__tittle_area">
                                            <div class="atbd_area_title">
                                                <h4><span class="la la-thumbs-up"></span>Amenities (Check all that apply)*</h4>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <div class="col-lg-10 amenities-checks">
                                                <div class="form-check">
                                                    <asp:CheckBox ID="checkcondition" runat="server" class="form-check-input" Text="  Air Conditioning" style="padding-right:100px" />
                                                </div>
                                                <div class="form-check">
                                                    <asp:CheckBox ID="checkheating" runat="server" class="form-check-input" Text="  Heating" />
                                                    <br />
                                                </div>
                                                <div class="form-check">
                                                    <asp:CheckBox ID="checkLaundry" runat="server" class="form-check-input" Text="  On-Site Laundry" />
                                                    <br />
                                                </div>
                                                <div class="form-check">
                                                    <asp:CheckBox ID="checkParking" runat="server" class="form-check-input" Text=" Parking" />
                                                    <br />
                                                </div>
                                                <div class="form-check">
                                                    <asp:CheckBox ID="checkFurnished" runat="server" class="form-check-input" Text=" Furnished" />
                                                    <br />
                                                </div>
                                                <div class="form-check">
                                                    <asp:CheckBox ID="checkpet" runat="server" class="form-check-input" Text=" Pet-Friendly" />
                                                    <br />
                                                </div>
                                                <div class="form-check">
                                                    <asp:CheckBox ID="checkcarbondetector" runat="server" class="form-check-input" Text=" Carbon Monoxide Detector" />
                                                    <br />
                                                </div>
                                                <div class="form-check">
                                                    <asp:CheckBox ID="checksomkedetector" runat="server" class="form-check-input" Text=" Smoke Detector" />
                                                    <br />
                                                </div>
                                                <div class="form-check">
                                                    <asp:CheckBox ID="checkspeentrance" runat="server" class="form-check-input" Text=" Separate Entrance" />
                                                    <br />
                                                </div>
                                                <div class="form-check">
                                                    <asp:CheckBox ID="checkWifi" runat="server" class="form-check-input" Text=" Wi-Fi" />
                                                    <br />
                                                </div>
                                                <div class="form-check">
                                                    <asp:CheckBox ID="checkTV" runat="server" class="form-check-input" Text=" TV" />
                                                    <br />
                                                </div>
                                                <div class="form-check">
                                                    <asp:CheckBox ID="checkspebath" runat="server" class="form-check-input" Text="Separate Bathroom" />
                                                    <br />
                                                </div>
                                                <div class="form-check">
                                                    <asp:CheckBox ID="checkOther" class="form-check-input" runat="server" Text="Other(s)" AutoPostBack="True" />
                                                    <br />
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
                                <div class="col-lg-10 offset-lg-1" style="left: 0px; top: 0px">
                                    <div class="atbd_content_module">
                                        <div class="atbd_content_module__tittle_area">
                                            <div class="atbd_area_title">
                                                <h4>Property Descriptions*</h4>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox runat="server" ID="propertydes" placeholder="Description" class="form-control" TextMode="MultiLine" Height="200px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="requireddes" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ControlToValidate="propertydes" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

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
                                <%--<div id="showimage">
                                    <asp:Image ID="imgpreview" runat="server" Height="150" Width="150" ImageUrl="http://cliquecities.com/assets/no-image-e3699ae23f866f6cbdf8ba2443ee5c4e.jpg" Style="border-width: 0px;" />
                                </div>--%>
                                <asp:FileUpload ID="FileUpload1" multiple="multiple" runat="server" AllowMultiple="true" />
                                <asp:RequiredFieldValidator ID="requireimg" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ValidationGroup="img" ControlToValidate="FileUpload1" ForeColor="Red"></asp:RequiredFieldValidator>
                                <%-- <asp:Button ID="Upload" runat="server" Text="Upload New Image" class="btn btn-sm btn-secondary form-control-file" OnClick="Upload_Click" />--%>
                                <br />
                                <br />
                                <asp:Button ID="updateimg" class="btn btn-primary" runat="server" Text="Insert more images" ValidationGroup="img" OnClick="updateimg_Click"/>
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
                        <asp:Button runat="server" class="btn btn-xs btn-gradient btn-gradient-two access-link m-right-10" Text="Post" ValidationGroup="addproperty" ID="post" OnClick="post_Click"></asp:Button>
                        <asp:Button runat="server" Text="Cancel" class="btn btn-xs btn-gradient btn-gradient-two access-link m-right-10" ID="cancel" OnClick="cancel_Click" CausesValidation="False"></asp:Button>
                    </div>
                </div>
            </div>

            <br />
    </section>
</asp:Content>