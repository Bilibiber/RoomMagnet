<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="PropertyInfo.aspx.cs" Inherits="WebPages_PropertyInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="Server">
    <div class="section-bg property-title">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 property-action">
                    <div class="atbd_content_module  title-padding action ">

                        <h1>
                            <asp:Label ID="PropertyTitle" runat="server" Text="PropertyTitle"></asp:Label>
                        </h1>

                        <a class="action-space" data-toggle="modal" data-target="#atbdp-report-abuse-modal"><span class="la la-flag-o"></span>Report</a>
                        <p class="subtitle">
                            <asp:Label ID="PropertyCity" runat="server" Text="PropertyCity"></asp:Label>
                            <asp:Label ID="PropertyState" runat="server" Text="PropertyState"></asp:Label>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="atbdp-report-abuse-modal" tabindex="-1" role="dialog" aria-hidden="true" aria-labelledby="atbdp-report-abuse-modal-label">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <form action="/" id="atbdp-report-abuse-form" class="form-vertical">
                    <div class="modal-header">
                        <h3 class="modal-title" id="atbdp-report-abuse-modal-label">Report Abuse</h3>
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span></button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="atbdp-report-abuse-message" class="not_empty">Your Complaint<span class="atbdp-star">*</span></label>
                            <textarea class="form-control" id="atbdp-report-abuse-message" rows="4" placeholder="Message..." required=""></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-secondary btn-sm">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <section class="directory_listiing_detail_area single_area section-bg property-padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">

                    <div class="atbd_content_module atbd_listing_gallery">
                        <div class="atbd_content_module__tittle_area">
                            <div class="atbd_area_title">
                                <h4><span class="la la-image"></span>Gallery</h4>
                            </div>
                        </div>
                        <div class="atbdb_content_module_contents">
                            <div class="gallery-wrapper">
                                <div class="gallery-images">
                                    <div class="single-image fill">
                                        <asp:Image ID="Image1" runat="server" ImageUrl="~/img/rm/apartment-carpet-comfort-2485222.jpg" CssClass="imgfill"/>
                                    </div>
                                    <div class="single-image fill">
                                        <asp:Image ID="Image2" runat="server" ImageUrl="~/img/rm/apartment-clean-condominium-279719.jpg" CssClass="imgfill" />
                                    </div>
                                    <div class="single-image">
                                        <asp:Image ID="Image3" runat="server" />
                                    </div>
                                    <div class="single-image">
                                        <asp:Image ID="Image4" runat="server" />
                                    </div>
                                    <div class="single-image">
                                        <asp:Image ID="Image5" runat="server" />
                                    </div>
                                    <div class="single-image">
                                        <asp:Image ID="Image6" runat="server" />
                                    </div>
                                </div>
                                <!-- ends: .gallery-images what is this? -->
                                <div class="gallery-thumbs">
                                    <div class="single-thumb  fill">
                                        <asp:Image ID="Image7" runat="server" ImageUrl="~/img/rm/apartment-carpet-comfort-2485222.jpg" CssClass="imgfill"/>
                                    </div>
                                    <div class="single-thumb">
                                        <img src="img/gt2.jpg" alt="">
                                    </div>
                                    <div class="single-thumb">
                                        <img src="img/gt3.jpg" alt="">
                                    </div>
                                    <div class="single-thumb">
                                        <img src="img/gt4.jpg" alt="">
                                    </div>
                                    <div class="single-thumb">
                                        <img src="img/gt5.jpg" alt="">
                                    </div>
                                    <div class="single-thumb">
                                        <img src="img/gt3.jpg" alt="">
                                    </div>
                                </div>
                                <!-- ends: .gallery-thumbs -->
                            </div>
                            <!-- ends: .gallery-wrapper -->
                        </div>
                    </div>
                    <!-- ends: .atbd_content_module -->

                    <div class="atbd_content_module atbd_listing_details">
                        <div class="atbd_content_module__tittle_area">
                            <div class="atbd_area_title">
                                <h4><span class="la la-file-text-o"></span>Property Description</h4>
                            </div>
                        </div>
                        <div class="atbdb_content_module_contents">
                            <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa kequi officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusan tium dolorem que laudantium, totam rem aperiam the eaque ipsa quae abillo was inventore veritatis keret quasi aperiam architecto beatae vitae dicta sunt explicabo. Nemo ucxqui officia voluptatem accu santium doloremque laudantium, totam rem ape dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas.</p>
                        </div>
                    </div>
                    <!-- ends: .atbd_content_module -->

                    <div class="atbd_content_module atbd_review_module">
                        <div class="atbd_content_module__tittle_area">
                            <div class="atbd_area_title">
                                <h4><span class="la la-star-o"></span>
                                    <asp:Label ID="PropertyReviewCount" runat="server" Text="PropertyReviewCount"></asp:Label></h4>
                                <label for="review_content" class="btn btn-secondary btn-icon-left btn-sm not_empty" data-toggle="modal" data-target="#review_modal"><span class="la la-star-o"></span>Add a review</label>
                            </div>
                        </div>
                        <div class="atbdb_content_module_contents">
                            <div id="client_review_list">
                                <div class="atbd_single_review atbdp_static">
                                    <div class="atbd_review_top">
                                        <div class="atbd_avatar_wrapper">
                                           <%-- <div class="atbd_review_avatar">
                                                <img alt="" src="img/review-author-thumb.jpg" class="avatar avatar-32 photo"></div>--%>
                                            <div class="atbd_name_time">
                                                <p>
                                                    <asp:Label ID="PropertyReviewPoster" runat="server" Text="PropertyReviewPoster"></asp:Label></p>
                                                <span class="review_time">
                                                    <asp:Label ID="PropertyReviewPostTime" runat="server" Text="PropertyReviewPostTime"></asp:Label></span>
                                            </div>
                                        </div>
                                      <%--  Don't know how to show those stars yet--%>
                                        <div class="atbd_rated_stars">
                                            <ul>
                                                <li><span class="rate_active"></span></li>
                                                <li><span class="rate_active"></span></li>
                                                <li><span class="rate_active"></span></li>
                                                <li><span class="rate_active"></span></li>
                                                <li><span class="rate_disable"></span></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="review_content">
                                        <p>
                                            <asp:Label ID="PropertyReviewContent" runat="server" Text="PropertyReviewContent"></asp:Label></p>
                                    </div>
                                </div>
                                <!-- ends:.atbd_single_review -->
                                <div class="atbd_single_review atbdp_static">
                                    <div class="atbd_review_top">
                                        <div class="atbd_avatar_wrapper">
                                            <div class="atbd_review_avatar">
                                                <img alt="" src="img/review-author-thumb3.jpg" class="avatar avatar-32 photo"></div>
                                            <div class="atbd_name_time">
                                                <p>Conrad Jane</p>
                                                <span class="review_time">6 hours ago</span>
                                            </div>
                                        </div>
                                        <div class="atbd_rated_stars">
                                            <ul>
                                                <li><span class="rate_active"></span></li>
                                                <li><span class="rate_active"></span></li>
                                                <li><span class="rate_active"></span></li>
                                                <li><span class="rate_active"></span></li>
                                                <li><span class="rate_active"></span></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="review_content">
                                        <p>Lacinia eget consectetur sed, convallis at tellus. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Curabitur non nulla sit amet nisl tempus</p>
                                    </div>
                                </div>
                                <!-- ends: .atbd_single_review -->
                            </div>
                            <!-- ends: .client_review_list -->
                        </div>
                    </div>
                    <!-- ends: .atbd_content_module -->
                </div>        

                <!-- begin: side information -->
                <div class="col-lg-4 mt-5 mt-lg-0">
                    <div class="widget atbd_widget widget-card">
                        <div class="atbd_widget_title">
                            <h4><span class="la la-user"></span>Host Info</h4>
                        </div>
                        <!-- ends: .atbd_widget_title -->
                        <div class="widget-body atbd_author_info_widget">
                            <div class="atbd_avatar_wrapper">
                                <div class="atbd_review_avatar">
                                    <img src="img/avatar-60x60.jpg" alt="Avatar Image">
                                </div>
                                <div class="atbd_name_time">
                                    <h4>Name<span class="verified" data-toggle="tooltip" data-placement="top" title="Verified"></span></h4>
                                    <span class="review_time">Posted 6 days ago</span>
                                </div>
                            </div>
                            <!-- ends: .atbd_avatar_wrapper -->
                            <a href="" class="btn btn-primary btn-block">Message</a>
                        </div>
                        <!-- ends: .widget-body -->
                    </div>
                    <!-- ends: .widget -->

                    <div class="widget atbd_widget widget-card">
                        <div class="atbd_widget_title">
                            <h4><span class="la la-bookmark"></span>Amenities</h4>
                            <a href="#" data-toggle="modal" data-target="#amenities_modal">View All</a>
                        </div>
                        <!-- ends: /.atbd_widget_title -->
                        <div class="widget-body atbdp-widget-categories">
                            <ul class="atbdp_parent_category">
                                <li>
                                    <span class="la la-wifi icon-space"></span>Wifi
                                </li>
                                <li>
                                    <span class="la la-car icon-space"></span>Parking
                                </li>

                                <li>
                                    <i class="la la-tv icon-space"></i>TV
                                </li>
                            </ul>
                        </div>
                        <!-- ends: .atbdp -->
                    </div>
                    <!-- ends: .widget -->

                    <div class="modal" id="amenities_modal" tabindex="-1" role="dialog" aria-labelledby="amenities_modal_label" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title" id="amenities_modal_h1">Amenities</h1>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <h4>Basic</h4>
                                    <ul class="list-unstyled amenities-list">
                                        <li>Wifi
                                        </li>
                                        <li>Washer
                                        </li>
                                        <li>Dryer
                                        </li>
                                        <li>TV
                                        </li>
                                        <li>Air Conditioning
                                        </li>
                                        <li>Heating
                                        </li>
                                    </ul>
                                    <h4>Bed and Bath</h4>
                                    <ul class="list-unstyled amenities-list">
                                        <li>Private Full Bath
                                        </li>
                                        <li>Bed
                                        </li>
                                        <li>Closet
                                        </li>
                                        <li>Dresser
                                        </li>
                                    </ul>
                                    <h4>Safety Measures</h4>
                                    <ul class="list-unstyled amenities-list">
                                        <li>Smoke Detector
                                        </li>
                                        <li>Carbon Monoxide Detector
                                        </li>
                                        <li>Fire Extinguisher
                                        </li>
                                        <li>First Aid Kit
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="widget atbd_widget widget-card">
                        <div class="atbd_widget_title">
                            <h4><span class="la la-map-marker"></span>Location</h4>
                        </div>
                        <!-- ends: .atbd_widget_title -->
                        <div class="widget-body atbdb_content_module_contents">
                            <div class="map" id="map-two"></div>
                        </div>
                        <!-- ends: .atbdb_content_module_contents -->
                    </div>
                    <!-- ends: widget -->
                </div>
            </div>
        </div>
    </section>
    <!-- ends: .directory_listiing_detail_area -->

    <!-- begin footer -->
</asp:Content>