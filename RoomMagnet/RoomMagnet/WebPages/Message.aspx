<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="Message.aspx.cs" Inherits="WebPages_Message" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Message
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="Server">
    <section class="section-bg">
        <div class="container">
            <div class="col-md-12 mx-auto">
                <h1 class="update-title">Messages</h1>

                <div class="row">
                    <div class="col-md-12 no-padding">
                        <div class="form-group">
                            <asp:DropDownList ID="RenterNames" runat="server" AutoPostBack="true" OnTextChanged="RenterNames_TextChanged" Visible="false" CssClass="form-control">
                                <asp:ListItem Value="No One">Select Contacts</asp:ListItem>
                            </asp:DropDownList>
                            <asp:Label ID="ReceiverLbl" runat="server" Text="You are sending message to : UserName"></asp:Label>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="container p-bottom-30">
                        <div class="col-md-12">
                            <asp:TextBox ID="Messages" TextMode="MultiLine" runat="server" CssClass="form-control" ReadOnly="true" Width="1070px" Height="250px"></asp:TextBox>
                        </div>
                    </div>
                    <hr />
                    <div class="type_msg">
                        <div class="input_msg_write">
                            <div class="input-group">
                                <asp:TextBox ID="txtsend" runat="server" CssClass="form-control" placeholder="Type a message" Width="500px"></asp:TextBox>
                                <div class="atbd_submit_btn input-group-append searchtxt-padding">
                                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Send" Font-Bold="True" CssClass="btn btn-primary" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="p-bottom-30">
        </div>
    </section>
</asp:Content>