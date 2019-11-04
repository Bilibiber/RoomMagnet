<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="Setting.aspx.cs" Inherits="WebPages_Setting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" Runat="Server">
    <asp:Label ID="setting" runat="server" Text="Setting" ForeColor="#CC3300" Font-Size="3em" Font-Bold="True" Width="80%" style="align-content:center"></asp:Label>
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

    
</asp:Content>

