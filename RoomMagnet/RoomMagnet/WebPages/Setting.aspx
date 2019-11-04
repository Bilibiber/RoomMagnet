<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="Setting.aspx.cs" Inherits="WebPages_Setting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
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
    </style>

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
        <asp:Label ID="setting" runat="server" Text="Setting" ForeColor="#CC3300" Font-Size="3em" Font-Bold="True" Width="80%" Style="align-content: center"></asp:Label>
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
                <td>
                    <asp:Label runat="server" Text="FirstName"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="setfirstname" runat="server"></asp:TextBox>
                </td>
                <td></td>
                <td>
                    <asp:Label runat="server" Text="MiddleName"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="setmiddlename" runat="server"></asp:TextBox>
                </td>
                <td></td>
                <td>
                    <asp:Label runat="server" Text="Lastname"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="setlastname" runat="server"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td></td>
                <td>
                    <asp:Label runat="server" Text="Gender"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="setgender" runat="server">
                        <asp:ListItem Value=""></asp:ListItem>
                        <asp:ListItem Value="male">Male</asp:ListItem>
                        <asp:ListItem Value="Female">FeMale</asp:ListItem>
                    </asp:DropDownList>

                </td>
                <td></td>
                <td>
                    <asp:Label runat="server" Text="Occupation"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="setOccupation" runat="server"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td></td>
                <td>
                    <asp:Label runat="server" Text="Password"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="setpassword" runat="server"></asp:TextBox>
                </td>
                <td></td>
                <td>
                    <asp:Label runat="server" Text="Confirm Password"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="setconfirmpass" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>
        <asp:Label runat="server" Text="Add Description: "></asp:Label><br />
        <asp:TextBox ID="TextBox1" runat="server" Height="146px" Width="434px"></asp:TextBox>
    </div>

</asp:Content>

