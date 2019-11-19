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
                            <asp:Label ID="titleLbl" runat="server" Text="PropertyTitle"></asp:Label>
                        </h1>
                        <%-- <a class="action-space" data-toggle="modal" data-target="#atbdp-report-abuse-modal"><span class="la la-flag-o"></span>Report</a>--%>
                        <p class="subtitle">
                            <asp:Label ID="cityLbl" runat="server" Text="PropertyCity"></asp:Label>
                            <asp:Label ID="homeStateLbl" runat="server" Text="PropertyState"></asp:Label>
                            <asp:Label ID="zipCodeLbl" runat="server" Text="ZipCode" />
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%-- <div class="modal fade" id="atbdp-report-abuse-modal" tabindex="-1" role="dialog" aria-hidden="true" aria-labelledby="atbdp-report-abuse-modal-label">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
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
            </div>
        </div>
    </div>--%>

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
                            <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                                <div class="carousel-inner">
                                    <div class="carousel-item active no-overlay">
                                        <asp:Image ID="propertyImage1" runat="server" CssClass="d-block w-100 no-overlay" />
                                    </div>
                                    <div class="carousel-item no-overlay">
                                        <asp:Image ID="propertyImage2" runat="server" CssClass="d-block w-100 no-overlay" />
                                    </div>
                                    <div class="carousel-item no-overlay">
                                        <asp:Image ID="propertyImage3" runat="server" CssClass="d-block w-100 no-overlay" />
                                    </div>
                                    <div class="carousel-item no-overlay">
                                        <asp:Image ID="propertyImage4" runat="server" CssClass="d-block w-100 no-overlay" />
                                    </div>
                                    <div class="carousel-item no-overlay">
                                        <asp:Image ID="propertyImage5" runat="server" CssClass="d-block w-100 no-overlay" />
                                    </div>
                                </div>
                                <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </div>
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
                            <p>
                                <asp:Label ID="PropertyDescription" runat="server" Text="PropertyDescription"></asp:Label>
                            </p>
                        </div>
                    </div>
                    <!-- ends: .atbd_content_module -->

                    <div class="atbd_content_module atbd_review_module">
                        <div class="atbd_content_module__tittle_area">
                            <div class="atbd_area_title">
                                <h4><span class="la la-star-o"></span>
                                    <asp:Label ID="PropertyReviewCount" runat="server" Text="PropertyReviewCount"></asp:Label>
                                </h4>
                            </div>
                        </div>
                        <div class="atbdb_content_module_contents">
                            <div id="client_review_list">
                                <div class="atbd_single_review atbdp_static">
                                    <div class="atbd_review_top">
                                        <div class="atbd_avatar_wrapper">

                                            <div class="atbd_name_time">
                                                <p>
                                                    <asp:Label ID="PropertyReviewPoster" runat="server" Text="PropertyReviewPoster"></asp:Label>
                                                </p>
                                                <span class="review_time">
                                                    <asp:Label ID="PropertyReviewPostTime" runat="server" Text="PropertyReviewPostTime"></asp:Label>
                                                </span>
                                            </div>
                                        </div>

                                        <div class="atbd_rated_stars">
                                            <div class="atbd_listing_meta" style="float: right;">
                                                <span class="atbd_meta atbd_listing_rating">
                                                    <asp:Label ID="PropertyReviewPosterStar" runat="server" Text="4.5"></asp:Label><i class="la la-star"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="review_content">
                                        <p>
                                            <asp:Label ID="PropertyReviewContent" runat="server" Text="PropertyReviewContent"></asp:Label>
                                        </p>
                                    </div>
                                </div>
                                <div class="atbd_single_review atbdp_static" id="Review2" runat="server" visible="false">
                                    <div class="atbd_review_top">
                                        <div class="atbd_avatar_wrapper">

                                            <div class="atbd_name_time">
                                                <p>
                                                    <asp:Label ID="PropertyReviewPoster2" runat="server" Text="PropertyReviewPoster"></asp:Label>
                                                </p>
                                                <span class="review_time">
                                                    <asp:Label ID="PropertyReviewPostTime2" runat="server" Text="PropertyReviewPostTime"></asp:Label>
                                                </span>
                                            </div>
                                        </div>

                                        <div class="atbd_rated_stars">
                                            <div class="atbd_listing_meta" style="float: right;">
                                                <span class="atbd_meta atbd_listing_rating">
                                                    <asp:Label ID="PropertyReviewPosterStar2" runat="server" Text="4.5"></asp:Label><i class="la la-star"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="review_content">
                                        <p>
                                            <asp:Label ID="PropertyReviewContent2" runat="server" Text="PropertyReviewContent"></asp:Label>
                                        </p>
                                    </div>
                                </div>
                                <div class="atbd_single_review atbdp_static" id="Review3" runat="server" visible="false">
                                    <div class="atbd_review_top">
                                        <div class="atbd_avatar_wrapper">

                                            <div class="atbd_name_time">
                                                <p>
                                                    <asp:Label ID="PropertyReviewPoster3" runat="server" Text="PropertyReviewPoster"></asp:Label>
                                                </p>
                                                <span class="review_time">
                                                    <asp:Label ID="PropertyReviewPostTime3" runat="server" Text="PropertyReviewPostTime"></asp:Label>
                                                </span>
                                            </div>
                                        </div>

                                        <div class="atbd_rated_stars">
                                            <div class="atbd_listing_meta" style="float: right;">
                                                <span class="atbd_meta atbd_listing_rating">
                                                    <asp:Label ID="PropertyReviewPosterStar3" runat="server" Text="4.5"></asp:Label><i class="la la-star"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="review_content">
                                        <p>
                                            <asp:Label ID="PropertyReviewContent3" runat="server" Text="PropertyReviewContent"></asp:Label>
                                        </p>
                                    </div>
                                </div>
                                <div class="atbd_single_review atbdp_static" id="Review4" runat="server" visible="false">
                                    <div class="atbd_review_top">
                                        <div class="atbd_avatar_wrapper">

                                            <div class="atbd_name_time">
                                                <p>
                                                    <asp:Label ID="PropertyReviewPoster4" runat="server" Text="PropertyReviewPoster"></asp:Label>
                                                </p>
                                                <span class="review_time">
                                                    <asp:Label ID="PropertyReviewPostTime4" runat="server" Text="PropertyReviewPostTime"></asp:Label>
                                                </span>
                                            </div>
                                        </div>

                                        <div class="atbd_rated_stars">
                                            <div class="atbd_listing_meta" style="float: right;">
                                                <span class="atbd_meta atbd_listing_rating">
                                                    <asp:Label ID="PropertyReviewPosterStar4" runat="server" Text="4.5"></asp:Label><i class="la la-star"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="review_content">
                                        <p>
                                            <asp:Label ID="PropertyReviewContent4" runat="server" Text="PropertyReviewContent"></asp:Label>
                                        </p>
                                    </div>
                                </div>
                                <div class="atbd_single_review atbdp_static" id="Review5" runat="server" visible="false">
                                    <div class="atbd_review_top">
                                        <div class="atbd_avatar_wrapper">

                                            <div class="atbd_name_time">
                                                <p>
                                                    <asp:Label ID="PropertyReviewPoster5" runat="server" Text="PropertyReviewPoster"></asp:Label>
                                                </p>
                                                <span class="review_time">
                                                    <asp:Label ID="PropertyReviewPostTime5" runat="server" Text="PropertyReviewPostTime"></asp:Label>
                                                </span>
                                            </div>
                                        </div>

                                        <div class="atbd_rated_stars">
                                            <div class="atbd_listing_meta" style="float: right;">
                                                <span class="atbd_meta atbd_listing_rating">
                                                    <asp:Label ID="PropertyReviewPosterStar5" runat="server" Text="4.5"></asp:Label><i class="la la-star"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="review_content">
                                        <p>
                                            <asp:Label ID="PropertyReviewContent5" runat="server" Text="PropertyReviewContent"></asp:Label>
                                        </p>
                                    </div>
                                </div>
                                <!-- ends: .atbd_single_review -->
                            </div>
                            <!-- ends: .client_review_list -->
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 mt-5 mt-lg-0">
                    <div class="widget atbd_widget widget-card">
                        <div class="atbd_widget_title">
                            <h4><span class="la la-bookmark"></span>Property Details: </h4>
                            <div class="atbd_listing_meta" style="float: right;">
                                <span class="atbd_meta atbd_listing_rating">
                                    <asp:Label ID="numStarsLbl" runat="server" Text="4.5"></asp:Label><i class="la la-star"></i></span>
                            </div>
                        </div>
                        <!-- ends: /.atbd_widget_title -->
                        <div class="widget-body atbdp-widget-categories">
                            <ul class="atbdp_parent_category">
                                <li>
                                    <div class="item-section">
                                        <asp:Label runat="server" Text="Rent Price: "></asp:Label>
                                        <asp:Label ID="rentPriceLbl" runat="server"></asp:Label>
                                    </div>
                                </li>
                                <li>
                                    <div class="item-section">
                                        <asp:Label runat="server" Text=" "></asp:Label>
                                        <asp:Label ID="startDateLbl" runat="server"></asp:Label>
                                    </div>
                                </li>
                                <li>
                                    <div class="item-section">
                                        <asp:Label runat="server" Text="Available Bathrooms: "></asp:Label>
                                        <asp:Label ID="availableBathroomsLbl" runat="server"></asp:Label>
                                    </div>
                                </li>
                                <li>
                                    <div class="item-section">
                                        <asp:Label runat="server" Text="Last Updated: "></asp:Label>
                                        <asp:Label ID="lastUpdatedLbl" runat="server"></asp:Label>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <!-- ends: .atbdb_content_module_contents -->
                    </div>
                    <div class="widget atbd_widget widget-card">
                        <div class="atbd_widget_title">
                            <h4><span class="la la-user"></span>Host Info</h4>
                        </div>
                        <!-- ends: .atbd_widget_title -->
                        <div class="widget-body atbd_author_info_widget">
                            <div class="atbd_avatar_wrapper">
                                <div class="atbd_review_avatar fill">
                                    <asp:Image ID="PropertyOwnerImage" runat="server" ImageUrl="~/img/40x40.png" CssClass="imgfill" Height="40" Width="40" />
                                </div>
                                <div class="atbd_name_time">
                                    <h4>
                                        <asp:Label ID="PropertyOwnerName" runat="server" Text="Label"></asp:Label><span class="verified" data-toggle="tooltip" data-placement="top" title="Verified"></span>
                                    </h4>
                                </div>
                            </div>
                            <!-- ends: .atbd_avatar_wrapper -->
                            <asp:Button CssClass="btn btn-primary btn-block" runat="server" Text="Message" OnClick="Unnamed_Click" />
                            <asp:Button CssClass="btn btn-primary btn-block" runat="server" Text="Save to Favorites" OnClick="SavetoFav_OnClick" />
                        </div>
                        <!-- ends: .widget-body -->
                    </div>
                    <!-- ends: .widget -->
                    <div class="widget atbd_widget widget-card">
                        <div class="atbd_widget_title">
                            <h4><span class="la la-bookmark"></span>Amenities</h4>
                        </div>
                        <!-- ends: /.atbd_widget_title -->
                        <div class="widget-body atbdp-widget-categories">
                            <ul class="atbdp_parent_category">
                                <li runat="server" id="AirConditioningIcon" visible="false">
                                    <span class="la la-wifi icon-space"></span>
                                    <asp:Label ID="airConditioningLbl" runat="server" Text="Air Conditioning"></asp:Label>
                                </li>
                                <li runat="server" id="HeatingIcon" visible="false">
                                    <span class="la la-wifi icon-space"></span>
                                    <asp:Label ID="heatingLbl" runat="server" Text="Heating"></asp:Label>
                                </li>

                                <li runat="server" id="onSiteLaundryIcon" visible="false">
                                    <span class="la la-wifi icon-space"></span>
                                    <asp:Label ID="onSiteLaundryLbl" runat="server" Text="On Site Laundry"></asp:Label>
                                </li>
                                <li runat="server" id="parkingIcon" visible="false">
                                    <span class="la la-wifi icon-space"></span>
                                    <asp:Label ID="parkingLbl" runat="server" Text="Parking "></asp:Label>
                                </li>
                                <li runat="server" id="furnishedIcon" visible="false">
                                    <span class="la la-wifi icon-space"></span>
                                    <asp:Label ID="furnishedLbl" runat="server" Text="Furnished "></asp:Label>
                                </li>

                                <li runat="server" id="petFriendlyIcon" visible="false">
                                    <span class="la la-wifi icon-space"></span>
                                    <asp:Label ID="petFriendlyLbl" runat="server" Text="Pet Friendly "></asp:Label>
                                </li>
                                <li runat="server" id="carbonMonoxideDetectorIcon" visible="false">
                                    <span class="la la-wifi icon-space"></span>
                                    <asp:Label ID="carbonMonoxideDetectorLbl" runat="server" Text="Carbon Monoxide Detector"></asp:Label>
                                </li>
                                <li runat="server" id="smokeDetectorIcon" visible="false">
                                    <span class="la la-wifi icon-space"></span>
                                    <asp:Label ID="smokeDetectorLbl" runat="server" Text="Smoke Detector "></asp:Label>
                                </li>

                                <li runat="server" id="seperateEntranceIcon" visible="false">
                                    <span class="la la-wifi icon-space"></span>
                                    <asp:Label ID="seperateEntranceLbl" runat="server" Text="Seperate Entrance "></asp:Label>
                                </li>
                                <li runat="server" id="wifiIcon" visible="false">
                                    <span class="la la-wifi icon-space"></span>
                                    <asp:Label ID="wifiLbl" runat="server" Text="WiFi "></asp:Label>
                                </li>
                                <li runat="server" id="tvIcon" visible="false">
                                    <span class="la la-wifi icon-space"></span>
                                    <asp:Label ID="tvLbl" runat="server" Text="TV "></asp:Label>
                                </li>

                                <li runat="server" id="seperateBathroomIcon" visible="false">
                                    <span class="la la-wifi icon-space"></span>
                                    <asp:Label ID="seperateBathroomLbl" runat="server" Text="Seperate Bathroom "></asp:Label>
                                </li>
                            </ul>
                        </div>
                        <!-- ends: .atbdp -->
                    </div>
                    <!-- ends: .widget -->
                    <div class="widget atbd_widget widget-card">
                        <div class="atbd_widget_title">
                            <h4><span class="la la-map-marker"></span>Location</h4>
                        </div>
                        <!-- ends: .atbd_widget_title -->
                        <div class="widget-body atbdb_content_module_contents">
                            <div class="map" id="map-two"></div>
                        </div>
                    </div>

                    <!-- ends: widget -->
                </div>
            </div>
        </div>
    </section>
</asp:Content>