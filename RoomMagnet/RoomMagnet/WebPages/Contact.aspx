<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="WebPages_Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">Contact Us </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="Server">
    <section class="header-breadcrumb bgimage overlay overlay--dark fill">

        <div class="Faq-image imgfill">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/img/home-1-small.png" />
        </div>

        <div class="breadcrumb-wrapper content_above">

            <div class="container">

                <div class="row">

                    <div class="col-lg-12 text-center">

                        <h1 class="page-title">Contact Us</h1>

                        <nav aria-label="breadcrumb">

                            <ol class="breadcrumb">

                                <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>

                                <li class="breadcrumb-item active">Contact</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <!-- ends: .breadcrumb-wrapper -->
    </section>

    <section class="contact-area section-bg p-top-100 p-bottom-70">

        <div class="container">

            <div class="row">
                <%--                <iframe
                    width="450"
                    height="250"
                    frameborder="0" style="border: 0"
                    src="https://www.google.com/maps/embed/v1/search?key=AIzaSyADjKK8z95sGvpp0LSMuI8nAUNbK5FCJYo&q=Richmond"></iframe>--%>

                <div class="col-lg-8">

                    <div class="widget atbd_widget widget-card contact-block">

                        <div class="atbd_widget_title">

                            <h4><span class="la la-envelope"></span>Contact Form</h4>
                        </div>
                        <!-- ends: .atbd_widget_title -->

                        <div class="atbdp-widget-listing-contact contact-form">

                            <div class="form-group">

                                <asp:TextBox CssClass="form-control" runat="server" ID="Name" placeholder="Name" />
                            </div>

                            <div class="form-group">

                                <asp:TextBox CssClass="form-control" runat="server" ID="Email" placeholder="Email" />
                            </div>

                            <div class="form-group">

                                <asp:TextBox CssClass="form-control" runat="server" ID="Message" Rows="6" placeholder="Message" />
                            </div>

                            <asp:Button Text="Send Message" CssClass="btn btn-gradient btn-gradient-one btn-block" ID="SendMessage" OnClick="SendEmail_OnClick" runat="server" />

                            <asp:Label runat="server" ID="ThanksLbl" Text="Thank you for contacting us!" Visible="false" />
                        </div>
                        <!-- ends: .atbdp-widget-listing-contact -->
                    </div>
                    <!-- ends: .widget -->
                </div>
                <!-- ends: .col-lg-8 -->

                <div class="col-lg-4">

                    <div class="widget atbd_widget widget-card">

                        <div class="atbd_widget_title">

                            <h4><span class="la la-phone"></span>Contact Info</h4>
                        </div>
                        <!-- ends: .atbd_widget_title -->

                        <div class="widget-body atbd_author_info_widget">

                            <div class="atbd_widget_contact_info">

                                <p>Got a question? We'd love to hear from you. Send us a message and we'll respond as soon as possible.</p>

                                <ul>

                                    <li>

                                        <span class="la la-envelope"></span>

                                        <span class="atbd_info">support@roommagnet.com</span>
                                    </li>
                                </ul>
                            </div>
                            <!-- ends: .atbd_widget_contact_info -->
                        </div>

                        <!-- ends: .widget-body -->
                    </div>
                    <div class="widget atbd_widget widget-card">
                        <div class="atbd_widget_title">
                            <h4><span class="la la-map-marker"></span>Location</h4>
                        </div>
                        <!-- ends: .atbd_widget_title -->
                        <div class="widget-body atbdb_content_module_contents">
                           <div id="map" style="width: 300px; height: 300px; border: 5px #5E5454;"></div>
                            
                        </div>
                    </div>
                    <!-- ends: .widget -->
                </div>
                <!-- ends: .col-lg-4 -->
            </div>
        </div>
         
    </section>
    <!-- ends: .contact-area -->

     <script
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDu9-V7rNAJ0LWxj2senGo9wVHwgLXQr-0&language=en&callback=initMap">
    </script>
    <script type="text/javascript">
        function initMap() {
            map = new google.maps.Map(document.getElementById('map'), {
                zoom: 11,
                center: { lat: 38.4495688, lng: -78.8689156 },
                disableDefaultUI: true
            });
        }
    </script>
    <!-- inject:js-->
</asp:Content>