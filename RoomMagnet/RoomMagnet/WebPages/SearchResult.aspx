<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="SearchResult.aspx.cs" Inherits="WebPages_SearchResult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <script>
        function initMap() {
            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 8,
                center: { lat: -34.397, lng: 150.644 }
            });
            var geocoder = new google.maps.Geocoder();

            document.getElementById('search').addEventListener('click', function () {
                geocodeAddress(geocoder, map);
            });
        }

        function geocodeAddress(geocoder, resultsMap) {
            var address = document.getElementById('address').value;
            geocoder.geocode({ 'address': address }, function (results, status) {
                if (status === 'OK') {
                    resultsMap.setCenter(results[0].geometry.location);
                    var marker = new google.maps.Marker({
                        map: resultsMap,
                        position: results[0].geometry.location
                    });
                } else {
                    alert('Geocode was not successful for the following reason: ' + status);
                }
            });
        }
        google.maps.event.addListener(window, 'load', initMap);
    </script>
    <script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDu9-V7rNAJ0LWxj2senGo9wVHwgLXQr-0&callback=initMap&language=en">
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="Server">
    <section class="all-listing-wrapper section-bg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <asp:TextBox ID="address" runat="server" CssClass="form-control" type="textbox" ClientIDMode="Static" placeholder="Enter a zipCode or city with state"></asp:TextBox>
                    <asp:Button ID="search" runat="server" Text="Search" ClientIDMode="Static" UseSubmitBehavior="false" OnClientClick="return true" CssClass="btn btn-xs btn-gradient btn-gradient-two access-link" />
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="atbd_generic_header">
                        <div class="atbd_generic_header_title">
                            <h4>Search Result</h4>
                            <p>
                                <asp:Label ID="SearchResultCount" runat="server" Text=""></asp:Label>
                            </p>
                        </div>
                        <!-- ends: .atbd_generic_header_title -->
                        <div class="atbd_listing_action_btn btn-toolbar" role="toolbar">
                            <!-- Views dropdown -->

                            <div class="dropdown">
                                <a class="action-btn dropdown-toggle" role="button" id="FilterdropdownMenuLink2" data-toggle="modal" data-target="#Filters" aria-haspopup="true" aria-expanded="false">Filters <span class="caret"></span></a>
                                <a class="action-btn dropdown-toggle" role="button" id="dropdownMenuLink2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Sort by <span class="caret"></span></a>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuLink2">
                                    <%-- Change to link button --%>
                                    <a class="dropdown-item" href="">Price ( low to high )</a>
                                    <a class="dropdown-item" href="">Price ( high to low )</a>
                                </div>
                            </div>
                        </div>
                        <!-- ends: .atbd_listing_action_btn -->
                    </div>
                    <!-- ends: .atbd_generic_header -->
                </div>
            </div>
        </div>
        <!-- ends: .col-lg-12 -->

        <div class="col-lg-12 listing-items">
            <div class="row">
                <div class="col-lg-6 order-lg-0 order-1 mt-5 mt-lg-0">
                    <div class="listings-sidebar">
                        <div class="atbdb_content_module_contents">

                            <div id="map" style="width: 500px; height: 500px; border: 5px #5E5454;" class="fa-map">
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ends: .col-lg-4 -->

                <div class="col-lg-6 order-0 order-lg-1">
                    <div class="row">

                        <div class="col-lg-12">
                            <div class="atbd_single_listing atbd_listing_list">
                                <article class="atbd_single_listing_wrapper">
                                    <figure class="atbd_listing_thumbnail_area">
                                        <div class="atbd_listing_image">
                                            <a href="">
                                                <img src="img/p1.jpg" alt="listing image">
                                            </a>
                                        </div>
                                        <!-- ends: .atbd_listing_image -->
                                    </figure>
                                    <!-- ends: .atbd_listing_thumbnail_area -->

                                    <div class="atbd_listing_info">
                                        <div class="atbd_content_upper">
                                            <h4 class="atbd_listing_title">
                                                <a href="">Property 1</a>
                                            </h4>
                                            <div class="atbd_listing_meta">
                                                <span class="atbd_meta atbd_listing_rating">4.5<i class="la la-star"></i></span>
                                                <span class="atbd_meta atbd_listing_price">$1,100</span>
                                            </div>
                                            <!-- End atbd listing meta -->
                                            <div class="atbd_listing_data_list">
                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                            </div>
                                            <!-- End atbd listing meta -->
                                        </div>
                                        <!-- end .atbd_content_upper -->
                                        <div class="atbd_listing_bottom_content">
                                            <div class="atbd_content_left">
                                                <div class="atbd_listing_category">
                                                    <a href=""><span class="la la-bed"></span>1 Bed</a>
                                                    <a href=""><span class="la la-bath"></span>1 Bathroom</a>
                                                </div>
                                            </div>
                                            <ul class="atbd_content_right">
                                                <li>
                                                    <div class="atbd_author atbd_author--thumb">
                                                        <a href="">
                                                            <img src="img/author-thumb2.jpg" alt="Author Image">
                                                            <span class="custom-tooltip">Name, Owner</span>
                                                        </a>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                        <!-- end .atbd_listing_bottom_content -->
                                    </div>
                                    <!-- ends: .atbd_listing_info -->
                                </article>
                                <!-- atbd_single_listing_wrapper -->
                            </div>
                        </div>
                        <!-- ends: .col-lg-12 -->

                        <div class="col-lg-12">
                            <div class="atbd_single_listing atbd_listing_list">
                                <article class="atbd_single_listing_wrapper">
                                    <figure class="atbd_listing_thumbnail_area">
                                        <div class="atbd_listing_image">
                                            <a href="">
                                                <img src="img/p1.jpg" alt="listing image">
                                            </a>
                                        </div>
                                        <!-- ends: .atbd_listing_image -->
                                    </figure>
                                    <!-- ends: .atbd_listing_thumbnail_area -->

                                    <div class="atbd_listing_info">
                                        <div class="atbd_content_upper">
                                            <h4 class="atbd_listing_title">
                                                <a href="">Property 1</a>
                                            </h4>
                                            <div class="atbd_listing_meta">
                                                <span class="atbd_meta atbd_listing_rating">4.5<i class="la la-star"></i></span>
                                                <span class="atbd_meta atbd_listing_price">$1,100</span>
                                            </div>
                                            <!-- End atbd listing meta -->
                                            <div class="atbd_listing_data_list">
                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                            </div>
                                            <!-- End atbd listing meta -->
                                        </div>
                                        <!-- end .atbd_content_upper -->
                                        <div class="atbd_listing_bottom_content">
                                            <div class="atbd_content_left">
                                                <div class="atbd_listing_category">
                                                    <a href=""><span class="la la-bed"></span>1 Bed</a>
                                                    <a href=""><span class="la la-bath"></span>1 Bathroom</a>
                                                </div>
                                            </div>
                                            <ul class="atbd_content_right">
                                                <li>
                                                    <div class="atbd_author atbd_author--thumb">
                                                        <a href="">
                                                            <img src="img/author-thumb2.jpg" alt="Author Image">
                                                            <span class="custom-tooltip">Name, Owner</span>
                                                        </a>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                        <!-- end .atbd_listing_bottom_content -->
                                    </div>
                                    <!-- ends: .atbd_listing_info -->
                                </article>
                                <!-- atbd_single_listing_wrapper -->
                            </div>
                        </div>
                        <!-- ends: .col-lg-12 -->

                        <div class="col-lg-12">
                            <div class="atbd_single_listing atbd_listing_list">
                                <article class="atbd_single_listing_wrapper">
                                    <figure class="atbd_listing_thumbnail_area">
                                        <div class="atbd_listing_image">
                                            <a href="">
                                                <img src="img/p1.jpg" alt="listing image">
                                            </a>
                                        </div>
                                        <!-- ends: .atbd_listing_image -->
                                    </figure>
                                    <!-- ends: .atbd_listing_thumbnail_area -->

                                    <div class="atbd_listing_info">
                                        <div class="atbd_content_upper">
                                            <h4 class="atbd_listing_title">
                                                <a href="">Property 1</a>
                                            </h4>
                                            <div class="atbd_listing_meta">
                                                <span class="atbd_meta atbd_listing_rating">4.5<i class="la la-star"></i></span>
                                                <span class="atbd_meta atbd_listing_price">$1,100</span>
                                            </div>
                                            <!-- End atbd listing meta -->
                                            <div class="atbd_listing_data_list">
                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                            </div>
                                            <!-- End atbd listing meta -->
                                        </div>
                                        <!-- end .atbd_content_upper -->
                                        <div class="atbd_listing_bottom_content">
                                            <div class="atbd_content_left">
                                                <div class="atbd_listing_category">
                                                    <a href=""><span class="la la-bed"></span>1 Bed</a>
                                                    <a href=""><span class="la la-bath"></span>1 Bathroom</a>
                                                </div>
                                            </div>
                                            <ul class="atbd_content_right">
                                                <li>
                                                    <div class="atbd_author atbd_author--thumb">
                                                        <a href="">
                                                            <img src="img/author-thumb2.jpg" alt="Author Image">
                                                            <span class="custom-tooltip">Name, Owner</span>
                                                        </a>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                        <!-- end .atbd_listing_bottom_content -->
                                    </div>
                                    <!-- ends: .atbd_listing_info -->
                                </article>
                                <!-- atbd_single_listing_wrapper -->
                            </div>
                        </div>
                        <!-- ends: .col-lg-12 -->

                        <div class="col-lg-12">
                            <div class="atbd_single_listing atbd_listing_list">
                                <article class="atbd_single_listing_wrapper">
                                    <figure class="atbd_listing_thumbnail_area">
                                        <div class="atbd_listing_image">
                                            <a href="">
                                                <img src="img/p1.jpg" alt="listing image">
                                            </a>
                                        </div>
                                        <!-- ends: .atbd_listing_image -->
                                    </figure>
                                    <!-- ends: .atbd_listing_thumbnail_area -->

                                    <div class="atbd_listing_info">
                                        <div class="atbd_content_upper">
                                            <h4 class="atbd_listing_title">
                                                <a href="">Property 1</a>
                                            </h4>
                                            <div class="atbd_listing_meta">
                                                <span class="atbd_meta atbd_listing_rating">4.5<i class="la la-star"></i></span>
                                                <span class="atbd_meta atbd_listing_price">$1,100</span>
                                            </div>
                                            <!-- End atbd listing meta -->
                                            <div class="atbd_listing_data_list">
                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                            </div>
                                            <!-- End atbd listing meta -->
                                        </div>
                                        <!-- end .atbd_content_upper -->
                                        <div class="atbd_listing_bottom_content">
                                            <div class="atbd_content_left">
                                                <div class="atbd_listing_category">
                                                    <a href=""><span class="la la-bed"></span>1 Bed</a>
                                                    <a href=""><span class="la la-bath"></span>1 Bathroom</a>
                                                </div>
                                            </div>
                                            <ul class="atbd_content_right">
                                                <li>
                                                    <div class="atbd_author atbd_author--thumb">
                                                        <a href="">
                                                            <img src="img/author-thumb2.jpg" alt="Author Image">
                                                            <span class="custom-tooltip">Name, Owner</span>
                                                        </a>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                        <!-- end .atbd_listing_bottom_content -->
                                    </div>
                                    <!-- ends: .atbd_listing_info -->
                                </article>
                                <!-- atbd_single_listing_wrapper -->
                            </div>
                        </div>
                        <!-- ends: .col-lg-12 -->

                        <div class="row">
                            <div class="col-lg-12">
                                <nav class="navigation pagination d-flex justify-content-end" role="navigation">
                                    <div class="nav-links">
                                        <a class="prev page-numbers" href=""><span class="la la-long-arrow-left"></span></a>
                                        <a class="page-numbers" href="">1</a>
                                        <span aria-current="page" class="page-numbers current">2</span>
                                        <a class="page-numbers" href="">3</a>
                                        <a class="next page-numbers" href=""><span class="la la-long-arrow-right"></span></a>
                                    </div>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <!-- ends: .col-lg-8 -->
                </div>
            </div>
            <!-- ends: .listing-items -->
        </div>
    </section>

    <div class="modal fade" id="Filters" tabindex="-1" role="dialog" aria-labelledby="login_modal_label" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/img/roommagnet-text.png" CssClass="mx-auto image-padding" />
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <asp:TextBox ID="SearchResultMinPrice" runat="server" CssClass="form-control" placeHolder="Min Price"></asp:TextBox>
                        <asp:CompareValidator ID="SearchResultsMinPriceValidator" ControlToValidate="SearchResultMinPrice" Operator="DataTypeCheck" Type="Currency" runat="server" Text="Invalid Price" Display="Dynamic"></asp:CompareValidator>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="SearchResultMaxPrice" runat="server" CssClass="form-control" placeHolder="Max Price"></asp:TextBox>
                        <asp:CompareValidator ID="SearchResultsMaxPriceValidator" ControlToValidate="SearchResultMaxPrice" runat="server" Operator="DataTypeCheck" Type="Currency" Text="Invalid Price" Display="Dynamic"></asp:CompareValidator>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="SearchResultStartDate" runat="server" CssClass="form-control" placeholder="Start Date" onfocus="(this.type='date')"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="SearchResultEndDate" runat="server" CssClass="form-control" placeholder="End Date" onfocus="(this.type='date')"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <asp:DropDownList ID="SearchResultBedsAvailable" runat="server" CssClass="form-control">
                            <asp:ListItem Value="" default="" Selected="">Beds Available</asp:ListItem>
                            <asp:ListItem Value="1">1</asp:ListItem>
                            <asp:ListItem Value="2">2</asp:ListItem>
                            <asp:ListItem Value="3">3</asp:ListItem>
                            <asp:ListItem Value="4">4+</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <asp:DropDownList ID="SearchResultHomeType" runat="server" CssClass="form-control">
                            <asp:ListItem>Home Type</asp:ListItem>
                            <asp:ListItem>Apartment</asp:ListItem>
                            <asp:ListItem>Townhome</asp:ListItem>
                            <asp:ListItem>House</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="modal-footer mx-auto">
                    <div class="form-excerpts">
                        <ul class="list-unstyled">
                            <li>
                                <asp:Button ID="FiltersButton" runat="server" Text="Apply" CssClass="btn btn-xs btn-gradient btn-gradient-two access-link" />
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <br />
        <asp:Image ID="Image2" Visible="false" runat="server" Style="width: 200px;" />
        <div class="media-body">
            <h3 class="mt-0">
                <asp:Label ID="Label1" Visible="false" runat="server" Text="Label"></asp:Label>
            </h3>
            <asp:Label ID="Label2" runat="server" Visible="false" CssClass="small" Text="Label"></asp:Label>
            <hr />
            <h5 class="mt-0">
                <asp:Label ID="Label3" Visible="false" CssClass="la-font" runat="server" Text="Amenities"></asp:Label>
            </h5>
            <asp:Label ID="Label4" runat="server" Visible="false" CssClass="small" Text="Label"></asp:Label>
        </div>
        <asp:Image ID="Image3" runat="server" Visible="false" Style="width: 200px;" />
        <div class="media-body">
            <h3 class="mt-0">
                <asp:Label ID="Label5" Visible="false" runat="server" Text="Label"></asp:Label>
            </h3>
            <asp:Label ID="Label6" runat="server" Visible="false" CssClass="small" Text="Label"></asp:Label>
            <hr />
            <h5 class="mt-0">
                <asp:Label ID="Label7" Visible="false" CssClass="la-font" runat="server" Text="Amenities"></asp:Label>
            </h5>
            <asp:Label ID="Label8" runat="server" Visible="false" CssClass="small" Text="Label"></asp:Label>
        </div>
        <asp:Image ID="Image4" runat="server" Visible="false" Style="width: 200px;" />
        <div class="media-body">
            <h3 class="mt-0">
                <asp:Label ID="Label9" Visible="false" runat="server" Text="Label"></asp:Label>
            </h3>
            <asp:Label ID="Label10" runat="server" Visible="false" CssClass="small" Text="Label"></asp:Label>
            <hr />
            <h5 class="mt-0">
                <asp:Label ID="Label11" Visible="false" CssClass="la-font" runat="server" Text="Amenities"></asp:Label>
            </h5>
            <asp:Label ID="Label12" runat="server" Visible="false" CssClass="small" Text="Label"></asp:Label>
        </div>
        <asp:Image ID="Image5" runat="server" Visible="false" Style="width: 200px;" />
        <div class="media-body">
            <h3 class="mt-0">
                <asp:Label ID="Label13" Visible="false" runat="server" Text="Label"></asp:Label>
            </h3>
            <asp:Label ID="Label14" runat="server" Visible="false" CssClass="small" Text="Label"></asp:Label>
            <hr />
            <h5 class="mt-0">
                <asp:Label ID="Label15" Visible="false" CssClass="la-font" runat="server" Text="Amenities"></asp:Label>
            </h5>
            <asp:Label ID="Label16" runat="server" Visible="false" CssClass="small" Text="Label"></asp:Label>
        </div>
    </div>
    </div>
</asp:Content>