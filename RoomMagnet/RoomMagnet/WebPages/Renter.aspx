<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="Renter.aspx.cs" Inherits="WebPages_Renter" %>

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
            width: 117px;
        }

        .auto-style2 {
            width: 898px;
        }

        .auto-style3 {
            width: 758px;
        }

        .auto-style4 {
            width: 200px;
        }

        .auto-style6 {
            width: 40px;
        }

        .auto-style7 {
            width: 20px;
        }

        .auto-style8 {
            width: 25px;
            height: 74px;
        }

        .auto-style9 {
            width: 200px;
            height: 74px;
        }

        .auto-style10 {
            height: 74px;
        }

        .auto-style11 {
            width: 120px;
        }

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

        .auto-style13 {
            width: 20px;
            height: 33px;
        }

        .auto-style14 {
            width: 200px;
            height: 33px;
        }

        .auto-style15 {
            height: 33px;
        }

        .auto-style16 {
            width: 120px;
            height: 33px;
        }

        /*upload images*/
        .preview-images-zone {
            width: 100%;
            border: 1px solid #ddd;
            min-height: 180px;
            /* display: flex; */
            padding: 5px 5px 0px 5px;
            position: relative;
            overflow:auto;
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
    </style>

    <script>
        $(document).ready(function() {
            document.getElementById('pro-image').addEventListener('change', readImage, false);
    
            $( ".preview-images-zone" ).sortable();
    
            $(document).on('click', '.image-cancel', function() {
                let no = $(this).data('no');
                $(".preview-image.preview-show-"+no).remove();
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
                        var html =  '<div class="preview-image preview-show-' + num + '">' +
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


            <img src="https://timedotcom.files.wordpress.com/2018/09/bill-gates-africa.jpg" class="rounded mx-auto d-block" alt="userimage" style="width: 300px;" />
            <br />
            <br />
            <asp:TextBox ID="unverified" runat="server" BackColor="#CC3300" BorderStyle="None" Font-Size="XX-Large" ForeColor="White" Style="text-align: center; width: 200px;">UNVERIFIED</asp:TextBox>
            <asp:TextBox ID="pending" runat="server" BackColor="#CC3300" BorderStyle="None" Font-Size="XX-Large" ForeColor="White" Style="text-align: center; width: 200px;" Enabled="False" Visible="False">PENDING</asp:TextBox>
            <asp:TextBox ID="verified" runat="server" BackColor="#CC3300" BorderStyle="None" Font-Size="XX-Large" ForeColor="White" Style="text-align: center; width: 200px;" Enabled="False" Visible="False">VERIFIED</asp:TextBox>

            <br />
            <br />
            <asp:Button ID="renterSavedSearch" runat="server" Text="Saved Searches" Font-Size="XX-Large" ForeColor="Red" BackColor="Gray" BorderStyle="None" OnClick="renterSavedSearch_Click"></asp:Button>
            <br />
            <asp:Button ID="renterMessage" runat="server" Text="My Message" Font-Size="XX-Large" ForeColor="White" BackColor="Gray" BorderStyle="None" OnClick="renterMessage_Click"></asp:Button>
            <br />
            <asp:Button ID="renterConnections" runat="server" Text="Connections" Font-Size="XX-Large" ForeColor="White" BackColor="Gray" BorderStyle="None" OnClick="renterConnections_Click"></asp:Button>
            <br />
            <asp:Button ID="renterPreference" runat="server" Text="Preferences" Font-Size="XX-Large" ForeColor="White" BackColor="Gray" BorderStyle="None" OnClick="renterPreference_Click"></asp:Button>
            <br />
            <asp:Button ID="rentertohost" runat="server" Text="Become a Host" Font-Size="XX-Large" ForeColor="White" BackColor="Gray" BorderStyle="None" OnClick="rentertohost_Click"></asp:Button>
            <br />
            <asp:Button ID="renterSetting" runat="server" Text="Setting" Font-Size="XX-Large" ForeColor="White" BackColor="Gray" BorderStyle="None" OnClick="renterSetting_Click"></asp:Button>
            <br />
            <asp:Button ID="renterLogOut" runat="server" Text="Log Out" Font-Size="XX-Large" ForeColor="White" BackColor="Gray" BorderStyle="None"></asp:Button>
        </div>
        <div class="col-md-8">
            <!-- Your second column here -->
            <br />
            <hr />
            <asp:Panel runat="server" ID="renterinfor">
                <asp:Label ID="hellow" runat="server" Text="Hello, world" ForeColor="#CC3300" Font-Size="3em" Font-Bold="True"></asp:Label>
                <br />
                <asp:Button runat="server" Text="Edit my profile" ID="rentereditprofile" ForeColor="#666666" BackColor="White" BorderStyle="None"></asp:Button>
                <br />
                <br />
                <table>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="renterabout" runat="server" Text="About" Font-Bold="True"></asp:Label>
                        </td>
                        <td class="auto-style1"></td>
                        <td class="auto-style2">My husband and I are looking for someone to fill the extra room in our house and would love the extra company!
                        </td>
                        <td class="auto-style3"></td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="renterAge" runat="server" Text="Age" Font-Bold="True"></asp:Label>
                        </td>
                        <td class="auto-style1"></td>
                        <td class="auto-style2">
                            <p>
                                72
                            </p>
                        </td>
                        <td class="auto-style3"></td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="renterGender" runat="server" Text="Gender" Font-Bold="True"></asp:Label>
                        </td>
                        <td class="auto-style1"></td>
                        <td class="auto-style2">
                            <p>
                                Female
                            </p>
                        </td>
                        <td class="auto-style3"></td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="renterOccupation" runat="server" Text="Occupation" Font-Bold="True"></asp:Label>
                        </td>
                        <td class="auto-style1"></td>
                        <td class="auto-style2">
                            <p>
                                Married
                            </p>
                        </td>
                        <td class="auto-style3"></td>
                    </tr>

                </table>
            </asp:Panel>

            <%--become a host panel--%>
            <asp:Panel runat="server" ID="renterbecomehost" Visible="False">
                <div>
                    <asp:Label runat="server" Text="Add property" ForeColor="#CC3300" Font-Size="3em" Font-Bold="True"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button runat="server" Text="Cancel" class="btn btn-secondary btn-sm" ID="cancel" OnClick="cancel_Click"></asp:Button>
                    <br />
                    <table>
                        <tr>
                            <td class="auto-style8"></td>
                            <td class="auto-style9">
                                <asp:Label runat="server" Text="Title:" Font-Bold="True"></asp:Label>
                            </td>
                            <td class="auto-style10">
                                <asp:TextBox runat="server" ID="addtitle" MaxLength="75"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="requireTitle" runat="server" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addproperty" ControlToValidate="addtitle">Required</asp:RequiredFieldValidator>
                            </td>
                        </tr>

                        <tr>
                            <td class="auto-style13"></td>
                            <td class="auto-style14">
                                <asp:Label runat="server" Text="Street Address:" Font-Bold="True"></asp:Label>
                            </td>
                            <td class="auto-style15">
                                <asp:TextBox runat="server" ID="addStreet"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="requireStreet" runat="server" ControlToValidate="addStreet" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addproperty">Required</asp:RequiredFieldValidator>
                            </td>
                            <td class="auto-style13"></td>
                            <td class="auto-style16">
                                <asp:Label runat="server" Text="City:" Font-Bold="True"></asp:Label>
                            </td>
                            <td class="auto-style15">
                                <asp:TextBox runat="server" ID="addCity"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="requireCity" runat="server" ControlToValidate="addCity" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addproperty">Required</asp:RequiredFieldValidator>
                            </td>
                        </tr>

                        <tr>
                            <td class="auto-style7"></td>
                            <td class="auto-style4">
                                <asp:Label runat="server" Text="State:" Font-Bold="True"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList runat="server" Width="80px" ID="addState">
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
                                <asp:RequiredFieldValidator ID="requireState" runat="server" ControlToValidate="addState" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addproperty">Required</asp:RequiredFieldValidator>
                            </td>
                            <td class="auto-style7"></td>
                            <td class="auto-style11">
                                <asp:Label ID="Label3" runat="server" Text="Country" Font-Bold="True"></asp:Label></td>
                            <td>
                                <asp:DropDownList ID="addCountry" runat="server" Width="170px" AppendDataBoundItems="True">
                                    <asp:ListItem Value=""></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="requireCountry" runat="server" ControlToValidate="addCountry" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addproperty">Required</asp:RequiredFieldValidator>
                            </td>
                        </tr>

                        <tr>
                            <td class="auto-style7"></td>
                            <td class="auto-style4">
                                <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Zip:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="addZip" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="requireZip" runat="server" ControlToValidate="addZip" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addproperty" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareZip" runat="server" ErrorMessage="Invalid" Text="Invalid" ControlToValidate="addZip" Display="Dynamic" ForeColor="Red" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                            </td>
                            <td class="auto-style7"></td>
                            <td class="auto-style11">
                                <asp:Label runat="server" Text="Square Footage of House:" Font-Bold="True" ID="Label1"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="addSquare" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="requireSquare" runat="server" ControlToValidate="addSquare" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addproperty">Required</asp:RequiredFieldValidator>

                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style7"></td>
                            <td class="auto-style4">
                                <asp:Label runat="server" Text="Total Bedrooms:" Font-Bold="True"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList runat="server" Width="80px" ID="addBedrooms">
                                    <asp:ListItem Value=""></asp:ListItem>
                                    <asp:ListItem Value="1">1</asp:ListItem>
                                    <asp:ListItem Value="2">2</asp:ListItem>
                                    <asp:ListItem Value="3">3</asp:ListItem>
                                    <asp:ListItem Value="4">4</asp:ListItem>
                                    <asp:ListItem Value="5">5</asp:ListItem>
                                    <asp:ListItem Value="6">6</asp:ListItem>
                                    <asp:ListItem Value="7">7</asp:ListItem>
                                    <asp:ListItem Value="8">8</asp:ListItem>
                                    <asp:ListItem Value="9">9</asp:ListItem>
                                    <asp:ListItem Value="10">10</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="requireBedrooms" runat="server" ControlToValidate="addBedrooms" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addproperty">Required</asp:RequiredFieldValidator>
                            </td>
                            <td class="auto-style7"></td>
                            <td class="auto-style11">
                                <asp:Label runat="server" Text="Available Bedrooms:" Font-Bold="True"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="addAvailable" runat="server" Width="80px">
                                    <asp:ListItem Value=""></asp:ListItem>
                                    <asp:ListItem Value="1">1</asp:ListItem>
                                    <asp:ListItem Value="2">2</asp:ListItem>
                                    <asp:ListItem Value="3">3</asp:ListItem>
                                    <asp:ListItem Value="4">4</asp:ListItem>
                                    <asp:ListItem Value="5">5</asp:ListItem>
                                    <asp:ListItem Value="6">6</asp:ListItem>
                                    <asp:ListItem Value="7">7</asp:ListItem>
                                    <asp:ListItem Value="8">8</asp:ListItem>
                                    <asp:ListItem Value="9">9</asp:ListItem>
                                    <asp:ListItem Value="10">10</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="requireAvailable" runat="server" ControlToValidate="addAvailable" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addproperty">Required</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style7"></td>
                            <td class="auto-style4">
                                <asp:Label runat="server" Text="Total Bathrooms:" Font-Bold="True"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList runat="server" Width="80px" ID="addBathrooms">
                                    <asp:ListItem Value=""></asp:ListItem>
                                    <asp:ListItem Value="1">1</asp:ListItem>
                                    <asp:ListItem Value="2">2</asp:ListItem>
                                    <asp:ListItem Value="3">3</asp:ListItem>
                                    <asp:ListItem Value="4">4</asp:ListItem>
                                    <asp:ListItem Value="5">5</asp:ListItem>
                                    <asp:ListItem Value="6">6</asp:ListItem>
                                    <asp:ListItem Value="7">7</asp:ListItem>
                                    <asp:ListItem Value="8">8</asp:ListItem>
                                    <asp:ListItem Value="9">9</asp:ListItem>
                                    <asp:ListItem Value="10">10</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="requireBathrooms" runat="server" ControlToValidate="addBathrooms" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addproperty">Required</asp:RequiredFieldValidator>
                            </td>
                            <td class="auto-style7"></td>
                            <td class="auto-style11">
                                <asp:Label runat="server" Text="Permanent Residences:" Font-Bold="True"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="addResidences" runat="server" Width="80px">
                                    <asp:ListItem Value=""></asp:ListItem>
                                    <asp:ListItem Value="1">1</asp:ListItem>
                                    <asp:ListItem Value="2">2</asp:ListItem>
                                    <asp:ListItem Value="3">3</asp:ListItem>
                                    <asp:ListItem Value="4">4</asp:ListItem>
                                    <asp:ListItem Value="5">5</asp:ListItem>
                                    <asp:ListItem Value="6">6</asp:ListItem>
                                    <asp:ListItem Value="7">7</asp:ListItem>
                                    <asp:ListItem Value="8">8</asp:ListItem>
                                    <asp:ListItem Value="9">9</asp:ListItem>
                                    <asp:ListItem Value="10">10</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="addResidences" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addproperty">Required</asp:RequiredFieldValidator>
                            </td>

                        </tr>
                        <tr>
                            <td class="auto-style7"></td>
                            <td class="auto-style4">
                                <asp:Label runat="server" Text="Rent Price/Month:" Font-Bold="True"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="addPrice" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="requirePrice" runat="server" ControlToValidate="addPrice" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addproperty">Required</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style7"></td>
                            <td class="auto-style4">
                                <asp:Label runat="server" Text="Date Availability:" Font-Bold="True"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="addstartdate" runat="server" TextMode="Date"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="requirestart" runat="server" ControlToValidate="addstartdate" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addproperty">Required</asp:RequiredFieldValidator>
                            </td>
                            <td class="auto-style7"></td>
                            <td class="auto-style11">
                                <asp:Label runat="server" Text="to:" Font-Bold="True"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="addenddate" runat="server" TextMode="Date"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="requireend" runat="server" ControlToValidate="addenddate" ErrorMessage="Required" ForeColor="Red" ValidationGroup="addproperty">Required</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </table>
                    
                    <%--upload images--%>
                        <div class="container">
                            <fieldset class="form-group">
                                <a href="javascript:void(0)" onclick="$('#pro-image').click()">Add Property Images</a>
                                <input type="file" id="pro-image" name="pro-image" style="display: none;" class="form-control" multiple>
                            </fieldset>
                            <div class="preview-images-zone">

                            </div>
                        </div>
                        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
            </asp:Panel>

            <%--setting panel--%>
            <asp:Panel runat="server" ID="renterSettingpanel" Visible="False">
                <div>
                    <asp:Label runat="server" Text="Setting" ForeColor="#CC3300" Font-Size="3em" Font-Bold="True"></asp:Label>
                    <br />
                </div>
            </asp:Panel>

            <hr />

            <%-- saved id panel--%>
            <asp:Panel runat="server" ID="rentersearch">
                <div id="saveSearch">
                    <asp:Label ID="save" runat="server" Text="Saved Searches" ForeColor="#CC3300" Font-Size="3em" Font-Bold="True"></asp:Label>
                    <br />
                    <asp:Button ID="renterEditSearch" runat="server" BackColor="White" BorderStyle="None" ForeColor="#666666" Text="Edit" />
                </div>
            </asp:Panel>


            <%--message panel--%>
            <asp:Panel runat="server" ID="rentermymessage" Visible="False">
                <div id="message">
                    <asp:Label ID="mymessage" runat="server" Text="My Message" ForeColor="#CC3300" Font-Size="3em" Font-Bold="True"></asp:Label>
                </div>
            </asp:Panel>

            <%--connection panel--%>
            <asp:Panel runat="server" ID="renterconnection" Visible="False">
                <div>
                    <asp:Label runat="server" Text="Connection" ForeColor="#CC3300" Font-Size="3em" Font-Bold="True"></asp:Label>
                </div>
            </asp:Panel>

            <%--preference panel--%>
            <asp:Panel runat="server" ID="renterpreferences" Visible="False">
                <div>
                    <asp:Label runat="server" Text="Preference" ForeColor="#CC3300" Font-Size="3em" Font-Bold="True"></asp:Label>
                </div>
            </asp:Panel>

            <%--renter Amenities panel--%>
            <asp:Panel runat="server" ID="renteraddAmenities" Visible="False">
                <div>
                    <asp:Label runat="server" Text="Amenities" ForeColor="#CC3300" Font-Size="3em" Font-Bold="True"></asp:Label>
                    <br />
                </div>
                <table>
                    <tr>
                        <td class="auto-style6"></td>
                        <td>
                            <asp:CheckBox runat="server" Text=" Air Conditioning"></asp:CheckBox>
                        </td>
                        <td class="auto-style6"></td>
                        <td>
                            <asp:CheckBox runat="server" Text=" Carbon Monoxide Detector"></asp:CheckBox>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:CheckBox runat="server" Text=" Heating"></asp:CheckBox>
                        </td>
                        <td></td>
                        <td>
                            <asp:CheckBox runat="server" Text=" Smoke Detector"></asp:CheckBox>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:CheckBox runat="server" Text=" On-Site Laundry"></asp:CheckBox>
                        </td>
                        <td></td>
                        <td>
                            <asp:CheckBox runat="server" Text=" Separate Entrance"></asp:CheckBox>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:CheckBox runat="server" Text=" Parking"></asp:CheckBox>
                        </td>
                        <td></td>
                        <td>
                            <asp:CheckBox runat="server" Text=" Wi-Fi"></asp:CheckBox>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:CheckBox runat="server" Text=" Furnished"></asp:CheckBox>
                        </td>
                        <td></td>
                        <td>
                            <asp:CheckBox runat="server" Text=" TV"></asp:CheckBox>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:CheckBox runat="server" Text=" Pet-Friendly"></asp:CheckBox>
                        </td>
                        <td></td>
                        <td>
                            <asp:CheckBox runat="server" Text=" Separate Bathroom"></asp:CheckBox>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:CheckBox runat="server" Text=" Other(s)"></asp:CheckBox>
                        </td>
                        <td></td>
                        <td>
                            <asp:TextBox runat="server"></asp:TextBox>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:Button runat="server" class="btn btn-danger btn-lg" Text="Post" ValidationGroup="addproperty" ID="post" OnClick="post_Click"></asp:Button>
            </asp:Panel>

        </div>
    </div>
</asp:Content>

