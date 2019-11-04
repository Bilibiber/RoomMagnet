<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="WebPages_Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">
    Contact Us
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" Runat="Server">
  
   <section class="header-breadcrumb bgimage overlay overlay--dark">
        <div class="bg_image_holder"><img src="img/rm/home-4.jpg" alt=""></div>
        


        <div class="breadcrumb-wrapper content_above">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <h1 class="page-title">Contact Us</h1>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Contact</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div><!-- ends: .breadcrumb-wrapper -->
    </section>
    <section class="contact-area section-bg p-top-100 p-bottom-70">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="widget atbd_widget widget-card contact-block">
                        <div class="atbd_widget_title">
                            <h4><span class="la la-envelope"></span> Contact Form</h4>
                        </div><!-- ends: .atbd_widget_title -->
                        <div class="atbdp-widget-listing-contact contact-form">
                            <form id="atbdp-contact-form" class="form-vertical" role="form">
                                <div class="form-group">
                                    <input type="text" class="form-control" id="atbdp-contact-name" placeholder="Name" required="">
                                </div>
                                <div class="form-group">
                                    <input type="email" class="form-control" id="atbdp-contact-email" placeholder="Email" required="">
                                </div>
                                <div class="form-group">
                                    <textarea class="form-control" id="atbdp-contact-message" rows="6" placeholder="Message" required=""></textarea>
                                </div>
                                <button type="submit" class="btn btn-gradient btn-gradient-one btn-block">Send Message</button>
                            </form>
                        </div><!-- ends: .atbdp-widget-listing-contact -->
                    </div><!-- ends: .widget -->
                </div><!-- ends: .col-lg-8 -->
                <div class="col-lg-4">
                    <div class="widget atbd_widget widget-card">
                        <div class="atbd_widget_title">
                            <h4><span class="la la-phone"></span>Contact Info</h4>
                        </div><!-- ends: .atbd_widget_title -->
                        <div class="widget-body atbd_author_info_widget">
                            <div class="atbd_widget_contact_info">
                              <p>Got a question? We'd love to hear from you. Send us a message and we'll respond as soon as possible.</p>
                                <ul>
                                    <li>
                                        <span class="la la-envelope"></span>
                                        <span class="atbd_info">support@roommagnet.com</span>
                                    </li>

                                </ul>
                            </div><!-- ends: .atbd_widget_contact_info -->

                        </div><!-- ends: .widget-body -->
                    </div><!-- ends: .widget -->
                </div><!-- ends: .col-lg-4 -->
            </div>
        </div>
    </section><!-- ends: .contact-area -->


    

    
</asp:Content>

