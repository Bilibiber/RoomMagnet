<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="SearchResult.aspx.cs" Inherits="WebPages_SearchResult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="Server">
         <script
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDu9-V7rNAJ0LWxj2senGo9wVHwgLXQr-0&language=en">
    </script>
      <script type="text/javascript">
          var geocoder = new google.maps.Geocoder();
          var map;
          var click = false;
          function initMap() {
              map = new google.maps.Map(document.getElementById('map'), {
                  zoom: 10,
                  center: { lat: 38.4495688, lng: -78.8689156 },
              });
              if (click === true) {
                  geocodeAddress()
              }

          }

          function geocodeAddress() {
              click = true;
              var address = document.getElementById('address').value;
              geocoder.geocode({ 'address': address }, function (results, status) {
                  if (status === 'OK') {
                      map = new google.maps.Map(document.getElementById('map'), {
                          zoom: 10,
                          center: results[0].geometry.location,
                      });
                      var marker = new google.maps.Marker({
                          map: map,
                          position: results[0].geometry.location
                      });
                  } else {
                      alert('Geocode was not successful for the following reason: ' + status);
                  }
              });
          }
          window.onload = initMap;
    </script>
    <section class="all-listing-wrapper section-bg results-pad">

        <div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="atbd_generic_header">
                        <div class="atbd_generic_header_title">
                               <div class="atbd_seach_fields_wrapper input-group">
                            <div class="single_search_field search_query">
                                <asp:TextBox ID="address" runat="server" CssClass="form-control search_fields Searchtxt-width inputgroup-height" type="textbox" ClientIDMode="Static" placeholder="Enter a city or zip code"></asp:TextBox>
                            </div>

                            <div class="atbd_submit_btn input-group-append searchtxt-padding">
                                <asp:Button ID="search" runat="server" Text="Search" ClientIDMode="Static" CssClass="btn btn-primary inputgroup-height textcenter" OnClick="SearchResultButton_Click" />
                            </div>
                        </div>
                        </div>
                        <!-- ends: .atbd_generic_header_title -->
                        <div class="atbd_listing_action_btn btn-toolbar" role="toolbar">
                            <!-- Views dropdown -->
                            <div class="dropdown">
                                <a class="action-btn dropdown-toggle" role="button" id="FilterdropdownMenuLink2" data-toggle="modal" data-target="#Filters" aria-haspopup="true" aria-expanded="false">Filters <span class="caret" ></span></a>
                                &nbsp;&nbsp;&nbsp;
                                <a class="action-btn dropdown-toggle" role="button" id="dropdownMenuLink2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Sort by <span class="caret"></span></a>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuLink2">
                                    <%-- Change to link button --%>
                                    <asp:LinkButton ID="LowToHigh" OnClick="LowToHigh_Click" runat="server" CssClass="dropdown-item">Price ( low to high )</asp:LinkButton>
                                        <asp:LinkButton ID="HighToLow" OnClick="HighToLow_Click" runat="server" CssClass="dropdown-item">Price ( high to low )</asp:LinkButton>
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

                            <div id="map" style="width: 100%; height: 800px; border: 5px #5E5454;">
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ends: .col-lg-4 -->

                <div class="col-lg-6 order-0 order-lg-1">
                    <div class="row searchtxt-padding">
                    <h4>Search Result</h4>
                        </div>
                    <div class="row searchtxt-padding">
                            <p>
                                <asp:Label ID="SearchResultCount" runat="server" Text=""></asp:Label>
                            </p>
                        </div>
                    <div class="row">
                        </div>
                        <div class="col-lg-12">
                            <div class="atbd_single_listing atbd_listing_list">
                                <article class="atbd_single_listing_wrapper">
                                    <figure class="atbd_listing_thumbnail_area">
                                        <div class="atbd_listing_image fill">
                                            
                                                <asp:ImageButton ID="Property1Image" OnClick="Property1Image_Click" runat="server" CssClass="imgfill" />
                                            
                                        </div>
                                        <!-- ends: .atbd_listing_image -->
                                    </figure>
                                    <!-- ends: .atbd_listing_thumbnail_area -->

                                    <div class="atbd_listing_info">
                                        <div class="atbd_content_upper">
                                            <h4 class="atbd_listing_title">
                                                <asp:Label ID="Property1Title" Visible="false" runat="server" Text="Label"></asp:Label>
                                            </h4>
                                            <div class="atbd_listing_meta">
                                                <span class="atbd_meta atbd_listing_rating">
                                                    <asp:Label ID="Label1" runat="server" Text="4.5"></asp:Label><i class="la la-star"></i></span>                                                    
                                                                            
                                            </div>
                                            <!-- End atbd listing meta -->
                                            <div class="atbd_listing_data_list">

                                                                <h5 class="mt-0">
                                                                    <asp:Label ID="Property1RentPrice" runat="server" Text="Label"></asp:Label>
                                                                    <asp:Label ID="Property1CityState" runat="server" Text="Label"></asp:Label>
                                                                </h5>
                                            </div>
                                            <!-- End atbd listing meta -->
                                        </div>
                                        <!-- end .atbd_content_upper -->
                                        <div class="atbd_listing_bottom_content">
                                            <div class="atbd_content_left">
                                                <div class="atbd_listing_category">
                                                     <a><span class="la la-bed"></span></a><div class="numberCircle"><asp:label runat="server" ID="Property1Bed" text="1 Bed"></asp:label> </div>
                                                     <a><span class="la la-bath"></span></a><div class="numberCircle"><asp:label runat="server" ID="Property1Bath" text="1 Bathroom"></asp:label> </div>
                                                </div>
                                            </div>
                                            <ul class="atbd_content_right">
                                                <li>
                                                    <div class="atbd_author atbd_author--thumb fill">
                                                        <asp:imagebutton runat="server" ID="Property1HostPic" alt="Author Image" CssClass="imgfill rounded-circle hostimage"></asp:imagebutton>
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
                                               <asp:ImageButton ID="Property2Image" OnClick="Property2Image_Click" runat="server" />
                                            </a>
                                        </div>
                                        <!-- ends: .atbd_listing_image -->
                                    </figure>
                                    <!-- ends: .atbd_listing_thumbnail_area -->

                                    <div class="atbd_listing_info">
                                        <div class="atbd_content_upper">
                                            <h4 class="atbd_listing_title">
                                                <a href=""><asp:Label ID="Property2Title"  runat="server" Text="Label"></asp:Label></a>
                                            </h4>
                                            <div class="atbd_listing_meta">
                                                <span class="atbd_meta atbd_listing_rating">4.5<i class="la la-star"></i></span>
                                            </div>
                                            <!-- End atbd listing meta -->
                                            <div class="atbd_listing_data_list">
                                                                <h5 class="mt-0">
                                                                    <asp:Label ID="Property2RentPrice" runat="server" Text="Label"></asp:Label>
                                                                    <asp:Label ID="Property2CityState" runat="server" Text="Label"></asp:Label>
                                                                    </h5>
                                            </div>
                                            <!-- End atbd listing meta -->
                                        </div>
                                        <!-- end .atbd_content_upper -->
                                        <div class="atbd_listing_bottom_content">
                                            <div class="atbd_content_left">
                                                <div class="atbd_listing_category">
                                                    <a><span class="la la-bed"></span></a> <div class="numberCircle"><asp:label runat="server" ID="Property2Bed" text="1 Bed"></asp:label> </div>
                                                    <a href=""><span class="la la-bath"></span></a><div class="numberCircle"><asp:label runat="server" ID="Property2Bath" text=" 1 Bathroom"></asp:label> </div>
                                                </div>
                                            </div>
                                            <ul class="atbd_content_right">
                                                <li>
                                                    <div class="atbd_author atbd_author--thumb">
                                                        <a href="">
                                                            <asp:imagebutton runat="server" ID="Property2HostPic" alt="Author Image"></asp:imagebutton>
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
                                              <asp:ImageButton ID="Property3Image" OnClick="Property3Image_Click" runat="server" />
                                            </a>
                                        </div>
                                        <!-- ends: .atbd_listing_image -->
                                    </figure>
                                    <!-- ends: .atbd_listing_thumbnail_area -->

                                    <div class="atbd_listing_info">
                                        <div class="atbd_content_upper">
                                            <h4 class="atbd_listing_title">
                                                <a href=""><asp:Label ID="Property3Title" Visible="false" runat="server" Text="Label"></asp:Label></a>
                                            </h4>
                                            <div class="atbd_listing_meta">
                                                <span class="atbd_meta atbd_listing_rating">4.5<i class="la la-star"></i></span>
                                            </div>
                                            <!-- End atbd listing meta -->
                                            <div class="atbd_listing_data_list">
                                                                <h5 class="mt-0">
                                                                    <asp:Label ID="Property3RentPrice" runat="server" Text="Label"></asp:Label>
                                                                    <asp:Label ID="Property3CityState" runat="server" Text="Label"></asp:Label>
                                                                    </h5>
                                            </div>
                                            <!-- End atbd listing meta -->
                                        </div>
                                        <!-- end .atbd_content_upper -->
                                        <div class="atbd_listing_bottom_content">
                                            <div class="atbd_content_left">
                                                <div class="atbd_listing_category">
                                                    <a><span class="la la-bed"></span></a> <div class="numberCircle"><asp:label runat="server" ID="Property3Bed" text="1 Bed"></asp:label> </div>
                                                    <a href=""><span class="la la-bath"></span></a><div class="numberCircle"><asp:label runat="server" ID="Property3Bath" text=" 1 Bathroom"></asp:label> </div>
                                                </div>
                                            </div>
                                            <ul class="atbd_content_right">
                                                <li>
                                                    <div class="atbd_author atbd_author--thumb">
                                                        <a href="">
                                                            <asp:imagebutton runat="server" alt="Author Image" ID="Property3HostPic"></asp:imagebutton>
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
                                               <asp:ImageButton ID="Property4Image" OnClick="Property4Image_Click" runat="server" />
                                            </a>
                                        </div>
                                        <!-- ends: .atbd_listing_image -->
                                    </figure>
                                    <!-- ends: .atbd_listing_thumbnail_area -->

                                    <div class="atbd_listing_info">
                                        <div class="atbd_content_upper">
                                            <h4 class="atbd_listing_title">
                                                <a href=""><asp:Label ID="Property4Title" Visible="false" runat="server" Text="Label"></asp:Label></a>
                                            </h4>
                                            <div class="atbd_listing_meta">
                                                <span class="atbd_meta atbd_listing_rating">4.5<i class="la la-star"></i></span>
                                            </div>
                                            <!-- End atbd listing meta -->
                                            <div class="atbd_listing_data_list">
                                                                <h5 class="mt-0">
                                                                    <asp:Label ID="Property4RentPrice" runat="server" Text="Label"></asp:Label>
                                                                    <asp:Label ID="Property4CityState" runat="server" Text="Label"></asp:Label>
                                                                    </h5>
                                            </div>
                                            <!-- End atbd listing meta -->
                                        </div>
                                        <!-- end .atbd_content_upper -->
                                        <div class="atbd_listing_bottom_content">
                                            <div class="atbd_content_left">
                                                <div class="atbd_listing_category">
                                                    <a><span class="la la-bed"></span></a> <div class="numberCircle"><asp:label runat="server" ID="Property4Bed" text="1 Bed"></asp:label> </div>
                                                    <a href=""><span class="la la-bath"></span></a><div class="numberCircle"><asp:label runat="server" ID="Property4Bath" text=" 1 Bathroom"></asp:label> </div>
                                                </div>
                                            </div>
                                            <ul class="atbd_content_right">
                                                <li>
                                                    <div class="atbd_author atbd_author--thumb">
                                                        <a href="">
                                                            <asp:imagebutton runat="server" alt="Author Image" ID="Property4HostPic"></asp:imagebutton>

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
                                              <asp:ImageButton ID="Property5Image" OnClick="Property5Image_Click" runat="server" />
                                            </a>
                                        </div>
                                        <!-- ends: .atbd_listing_image -->
                                    </figure>
                                    <!-- ends: .atbd_listing_thumbnail_area -->

                                    <div class="atbd_listing_info">
                                        <div class="atbd_content_upper">
                                            <h4 class="atbd_listing_title">
                                                <a href=""><asp:Label ID="Property5Title" Visible="false" runat="server" Text="Label"></asp:Label></a>
                                            </h4>
                                            <div class="atbd_listing_meta">
                                                <span class="atbd_meta atbd_listing_rating">4.5<i class="la la-star"></i></span>
                                            </div>
                                            <!-- End atbd listing meta -->
                                            <div class="atbd_listing_data_list">
                                                                <h5 class="mt-0">
                                                                    <asp:Label ID="Property5RentPrice" runat="server" Text="Label"></asp:Label>
                                                                    <asp:Label ID="Property5CityState" runat="server" Text="Label"></asp:Label>
                                                                </h5>
                                            </div>
                                            <!-- End atbd listing meta -->
                                        </div>
                                        <!-- end .atbd_content_upper -->
                                        <div class="atbd_listing_bottom_content">
                                            <div class="atbd_content_left">
                                                <div class="atbd_listing_category">
                                                    <a><span class="la la-bed"></span></a> <div class="numberCircle"><asp:label runat="server" ID="Property5Bed" text="1 Bed"></asp:label> </div>
                                                    <a href=""><span class="la la-bath"></span></a><div class="numberCircle"><asp:label runat="server" ID="Property5Bath" text=" 1 Bathroom"></asp:label> </div>
                                                </div>
                                            </div>
                                            <ul class="atbd_content_right">
                                                <li>
                                                    <div class="atbd_author atbd_author--thumb">
                                                        <a href="">
                                                            <asp:ImageButton ID="Property5HostPic" alt="Author Image" runat="server" />
                                                            <div class="media-body">

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

                        <div class="row">
                            <div class="col-lg-12">
                                <nav class="navigation pagination d-flex justify-content-end" role="navigation">
                                    <div class="nav-links">
                                        <a class="prev page-numbers" href=""><span class="la la-long-arrow-left"></span></a>
                                        <a><asp:LinkButton ID="LinkButton1" runat="server" Text="1"> </asp:LinkButton></a>
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
                                <asp:Button ID="FiltersButton" runat="server" Text="Apply" CssClass="btn btn-xs btn-gradient btn-gradient-two access-link" OnClick="ApplyButton_Click" />
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>