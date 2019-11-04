﻿<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="Setting.aspx.cs" Inherits="WebPages_Setting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">

    <%--user image--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

    <style>
        #settingpage {
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
            width: 101px;
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="Server">
    <div id="settingpage">
        <asp:Label ID="setting" runat="server" Text="Settings" ForeColor="#CC3300" Font-Size="3em" Font-Bold="True" Width="80%" Style="align-content: center"></asp:Label>
        <br />
        <br />
        <div class="container">
            <div class="row">
                <div class="col-sm-2 imgUp">
                    <div class="imagePreview"></div>
                    <label class="btn btn-primary">
                        Upload<input type="file" class="uploadFile img" value="Upload Photo" style="width: 0px; height: 0px; overflow: hidden;">
                    </label>
                </div>
                <!-- col-2 -->
                <i class="fa fa-plus imgAdd"></i>
            </div>
            <!-- row -->
        </div>
        <!-- container -->

        <br />

        <table>
            <tr>
                <td></td>
                <td class="auto-style3">
                    <asp:Label runat="server" Text="First Name"></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="setfirstname" runat="server" MaxLength="25" CssClass="form-control" Width="147px"></asp:TextBox>
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
                <td>
                </td>
                <td class="auto-style3">

                    &nbsp;</td>
            </tr>
        </table>
        <br />
        &nbsp;&nbsp;&nbsp;
        <asp:Label runat="server" Text="Add Description: "></asp:Label><br />
        &nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="setdescription" runat="server" Height="146px" Width="434px" MaxLength="150"></asp:TextBox>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;
        <asp:Button ID="updateusersetting" runat="server" class="btn btn-danger" Text="Update" OnClick="updateusersetting_Click" ValidationGroup="settings" />
        &nbsp;
    </div>

</asp:Content>

