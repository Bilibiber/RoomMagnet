<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="AddProperty.aspx.cs" Inherits="WebPages_AddProperty" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
        <%--renter update image--%>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <!------ Include the above in your HEAD tag ---------->

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

    <style>
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
<asp:Content ID="Content3" ContentPlaceHolderID="Body" Runat="Server">
     <%--become a host panel--%>
            <asp:Panel runat="server" ID="renterbecomehost" Visible="true" style="width:70%; margin:auto;">
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
                                <asp:DropDownList runat="server" Width="80px" ID="addState" Enabled="False">
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
                                <asp:DropDownList ID="addCountry" runat="server" Width="170px" AppendDataBoundItems="True" AutoPostBack="True">
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
                        <div class="container" style="float:left; display:inline-block">
                            <fieldset class="form-group">
                                <a href="javascript:void(0)" onclick="$('#pro-image').click()">Add Property Images</a>
                                <input type="file" id="pro-image" name="pro-image" style="display: none;" class="form-control" multiple>
                            </fieldset>
                            <div class="preview-images-zone">

                            </div>
                        </div>
                        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
            </asp:Panel>

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
                            <asp:CheckBox ID="checkOther" runat="server" Text="Other(s)" AutoPostBack="True" />
                        </td>
                        <td></td>
                        <td>
                            <asp:TextBox runat="server" Enabled="False" ID="othertextbox"></asp:TextBox>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:Button runat="server" class="btn btn-danger btn-lg" Text="Post" ValidationGroup="addproperty" ID="post" OnClick="post_Click"></asp:Button>
            </asp:Panel>
</asp:Content>

