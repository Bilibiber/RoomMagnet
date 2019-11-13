<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="Rate Property.aspx.cs" Inherits="WebPages_Rate_Property" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" Runat="Server">
    <script runat="server">
    protected void Rating1_Changed(object sender, EventArgs e)
    {
        Label1.Text = "You Rated: " + Rating1.CurrentRating;
    }
</script>

    <style type="text/css">
        .StarCss { 
            background-image: url(/Image/star.png);
            height:24px;
            width:24px;
        }
        .FilledStarCss {
            background-image: url(/Image/filledstar.png);
            height:24px;
            width:24px;
        }
        .EmptyStarCss {
            background-image: url(/Image/star.png);
            height:24px;
            width:24px;
        }
        .WaitingStarCss {
            background-image: url(/Image/waitingstar.png);
            height:24px;
            width:24px;
        }
    </style>

    <div>
        <h2 style="color:DarkBlue; font-style:italic;">
            Property Rating: We want to know your experience!
        </h2>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>

                    <asp:Image 
                        ID="Image1"
                        runat="server"
                        ImageUrl="~/Image/tree.jpg"
                        Height="200"
                        />
                    <asp:Label 
                        ID="Label1"
                        runat="server"
                        ForeColor="Red"
                        Font-Size="X-Large"
                        Font-Italic="True"
                        >Property Name!</asp:Label>
                    <br /><br />

                    <asp:Label 
                        ID="Label2"
                        runat="server"
                        ForeColor="Red"
                        Font-Size="Large"
                        Text="Rate this property"
                        >
                    </asp:Label>
                    <br />
                    <ajaxToolkit:AlwaysVisibleControlExtender ID="AlwaysVisibleControlExtender1" runat="server" />
                    <ajaxToolkit:Rating 
                        ID="Rating1"
                        runat="server"
                        StarCssClass="StarCss"
                        FilledStarCssClass="FilledStarCss"
                        EmptyStarCssClass="EmptyStarCss"
                        WaitingStarCssClass="WaitingStarCss"
                        AutoPostBack="true"
                        OnChanged="Rating1_Changed"
                        >
                    </ajaxToolkit:Rating>
    </div>


    <p>
        Written Comments: (8000 character max)</p>
    <p>
        <asp:TextBox ID="TextBox1" runat="server" Height="90px" Width="358px"></asp:TextBox>
    </p>
</asp:Content>

