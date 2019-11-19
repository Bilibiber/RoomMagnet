<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="SearchResult.aspx.cs" Inherits="WebPages_SearchResult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="Server">
    <asp:scriptmanager id="ScriptManager1"
        enablepagemethods="true"
        enablepartialrendering="true" runat="server" />   
    <script
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDu9-V7rNAJ0LWxj2senGo9wVHwgLXQr-0&language=en">
    </script>
    <script type="text/javascript" src="https://www.google.com/jsapi?autoload={'modules':[{'name':'visualization','version':'1.1','packages':['corechart']}]}"></script>

    <script src="GoogleMap.js"></script>
    <section class="all-listing-wrapper section-bg results-pad" id="hideall" runat="server" visible="true">
        <div class="row">
            <div class="col-lg-12">
                <div class="atbd_generic_header">
                    <div class="atbd_generic_header_title">
                        <div class="atbd_seach_fields_wrapper input-group">
                            <div class="single_search_field search_query">
                                <asp:textbox id="address" runat="server" cssclass="form-control search_fields Searchtxt-width inputgroup-height" type="textbox" clientidmode="Static" placeholder="Enter a city or zip code"></asp:textbox>
                                <asp:regularexpressionvalidator id="RegularExpressionValidatorHomePageSearchText" runat="server" errormessage="Special characters are not allowed. For example:% & ; = $" validationexpression="[^%&;>=$]+" controltovalidate="address" display="Dynamic" validationgroup="ResultPageSearch"></asp:regularexpressionvalidator>
                                <asp:requiredfieldvalidator id="RequiredFieldValidator1" runat="server" errormessage="Required" validationgroup="ResultPageSearch" controltovalidate="address" display="Dynamic"></asp:requiredfieldvalidator>
                                <asp:customvalidator id="CustomValidator1" runat="server" errormessage="City and State should separate by a comma. For example Harrisonburg,VA" validationgroup="ResultPageSearch" controltovalidate="address" display="Dynamic" onservervalidate="CustomValidator1_ServerValidate"></asp:customvalidator>
                            </div>

                            <div class="atbd_submit_btn input-group-append searchtxt-padding">
                                <asp:button id="search" runat="server" text="Search" clientidmode="Static" cssclass="btn btn-primary inputgroup-height textcenter" onclick="SearchResultButton_Click" validationgroup="ResultPageSearch"/>
                            </div>
                        </div>
                    </div>
                    <!-- ends: .atbd_generic_header_title -->
                    <div class="atbd_listing_action_btn btn-toolbar" role="toolbar">
                        <!-- Views dropdown -->
                        <div class="dropdown">
                            <a class="action-btn dropdown-toggle" role="button" id="FilterdropdownMenuLink2" data-toggle="modal" data-target="#Filters" aria-haspopup="true" aria-expanded="false">Filters <span class="caret"></span></a>
                            &nbsp;&nbsp;&nbsp;
                                <a class="action-btn dropdown-toggle" role="button" id="dropdownMenuLink2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Sort by <span class="caret"></span></a>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink2">
                                <%-- Change to link button --%>
                                <asp:linkbutton id="LowToHigh" onclick="LowToHigh_Click" runat="server" cssclass="dropdown-item">Price ( low to high )</asp:linkbutton>
                                <asp:linkbutton id="HighToLow" onclick="HighToLow_Click" runat="server" cssclass="dropdown-item">Price ( high to low )</asp:linkbutton>
                            </div>
                        </div>
                    </div>
                    <!-- ends: .atbd_listing_action_btn -->
                </div>
                <!-- ends: .atbd_generic_header -->
            </div>
        </div>
        <!-- ends: .col-lg-12 -->
        <div class="col-lg-12 listing-items">
            <div class="row">
                <div class="col-lg-6 order-lg-0 order-1 mt-5 mt-lg-0">
                    <div class="listings-sidebar">
                        <div class="atbdb_content_module_contents">

                            <div id="map" style="width: 100%; height: 800px; border: 5px #5E5454;" class="map">
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
                            <asp:label id="SearchResultCount" runat="server" text=""></asp:label>
                        </p>
                    </div>
                    <div class="row">
                        <div id="Property1Space" runat="server" class="col-lg-12">
                            <div class="atbd_single_listing atbd_listing_list">
                                <article class="atbd_single_listing_wrapper">
                                    <figure class="atbd_listing_thumbnail_area">
                                        <div class="atbd_listing_image fill">
                                            <asp:imagebutton id="Property1Image" onclick="Property1Image_Click" runat="server" cssclass="imgfill" alt="Click to see more details" />
                                        </div>
                                        <!-- ends: .atbd_listing_image -->
                                    </figure>
                                    <!-- ends: .atbd_listing_thumbnail_area -->
                                    <div class="atbd_listing_info">
                                        <div class="atbd_content_upper">
                                            <h4 class="atbd_listing_title">
                                                <asp:label id="Property1Title" visible="false" runat="server" text="Label"></asp:label>
                                            </h4>
                                            <div class="mt-0 form-label">
                                                <asp:label id="Property1CityState" runat="server" text="Label"></asp:label>
                                            </div>
                                            <div class="atbd_listing_meta">
                                                <span class="atbd_meta atbd_listing_rating">
                                                    <asp:label id="Property1Rating" runat="server" text="4.5"></asp:label>
                                                    <i class="la la-star"></i></span>
                                            </div>
                                            <!-- End atbd listing meta -->
                                            <div class="atbd_listing_data_list">
                                                <div class="mt-0 form-label">
                                                    <asp:label id="Property1RentPrice" runat="server" text="Label"></asp:label>
                                                </div>
                                                <div class="row mt-0 form-label daterange">
                                                    <asp:label id="Property1StartDate" runat="server" text="Label"></asp:label>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End atbd listing meta -->

                                        <!-- end .atbd_content_upper -->
                                        <div class="atbd_listing_bottom_content">
                                            <div class="atbd_content_left">
                                                <div class="atbd_listing_category">
                                                    <span class="fas fa-bed icon-padding"></span>
                                                    <div class="numberCircle">
                                                        <asp:label runat="server" id="Property1Bed" text="1 Bed" cssclass="icon-padding"></asp:label>
                                                    </div>
                                                    <span class="fas fa-bath icon-padding"></span>
                                                    <div class="numberCircle">
                                                        <asp:label runat="server" id="Property1Bath" text="1 Bathroom" cssclass="icon-padding"></asp:label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </article>
                            </div>
                        </div>
                        <div id="Property2Space" runat="server" class="col-lg-12">
                            <div class="atbd_single_listing atbd_listing_list">
                                <article class="atbd_single_listing_wrapper">
                                    <figure class="atbd_listing_thumbnail_area">
                                        <div class="atbd_listing_image fill">
                                            <asp:imagebutton id="Property2Image" onclick="Property2Image_Click" runat="server" cssclass="imgfill" />
                                        </div>
                                        <!-- ends: .atbd_listing_image -->
                                    </figure>
                                    <!-- ends: .atbd_listing_thumbnail_area -->
                                    <div class="atbd_listing_info">
                                        <div class="atbd_content_upper">
                                            <h4 class="atbd_listing_title">
                                                <asp:label id="Property2Title" visible="false" runat="server" text="Label"></asp:label>
                                            </h4>
                                            <div class="mt-0 form-label">
                                                <asp:label id="Property2CityState" runat="server" text="Label"></asp:label>
                                            </div>
                                            <div class="atbd_listing_meta">
                                                <span class="atbd_meta atbd_listing_rating">
                                                    <asp:label id="Property2Rating" runat="server" text="4.5"></asp:label>
                                                    <i class="la la-star"></i></span>
                                            </div>
                                            <!-- End atbd listing meta -->
                                            <div class="atbd_listing_data_list">
                                                <div class="mt-0 form-label">
                                                    <asp:label id="Property2RentPrice" runat="server" text="Label"></asp:label>
                                                </div>
                                                <div class="row mt-0 form-label daterange">
                                                    <asp:label id="Property2StartDate" runat="server" text="Label"></asp:label>
                                                </div>
                                            </div>
                                            <!-- End atbd listing meta -->
                                        </div>
                                        <!-- end .atbd_content_upper -->
                                        <div class="atbd_listing_bottom_content">
                                            <div class="atbd_content_left">
                                                <div class="atbd_listing_category">
                                                    <span class="fas fa-bed icon-padding"></span>
                                                    <div class="numberCircle">
                                                        <asp:label runat="server" id="Property2Bed" text="1 Bed" cssclass="icon-padding"></asp:label>
                                                    </div>
                                                    <span class="fas fa-bath icon-padding"></span>
                                                    <div class="numberCircle">
                                                        <asp:label runat="server" id="Property2Bath" text="1 Bathroom" cssclass="icon-padding"></asp:label>
                                                    </div>
                                                </div>
                                            </div>
                                            <ul class="atbd_content_right">
                                                <li></li>
                                            </ul>
                                        </div>
                                        <!-- end .atbd_listing_bottom_content -->
                                    </div>
                                    <!-- ends: .atbd_listing_info -->
                                </article>
                                <!-- atbd_single_listing_wrapper -->
                            </div>
                        </div>
                        <div id="Property3Space" runat="server" class="col-lg-12">
                            <div class="atbd_single_listing atbd_listing_list">
                                <article class="atbd_single_listing_wrapper">
                                    <figure class="atbd_listing_thumbnail_area">
                                        <div class="atbd_listing_image fill">
                                            <asp:imagebutton id="Property3Image" onclick="Property3Image_Click" runat="server" cssclass="imgfill" />
                                        </div>
                                        <!-- ends: .atbd_listing_image -->
                                    </figure>
                                    <!-- ends: .atbd_listing_thumbnail_area -->
                                    <div class="atbd_listing_info">
                                        <div class="atbd_content_upper">
                                            <h4 class="atbd_listing_title">
                                                <asp:label id="Property3Title" visible="false" runat="server" text="Label"></asp:label>
                                            </h4>
                                            <div class="mt-0 form-label">
                                                <asp:label id="Property3CityState" runat="server" text="Label"></asp:label>
                                            </div>
                                            <div class="atbd_listing_meta">
                                                <span class="atbd_meta atbd_listing_rating">
                                                    <asp:label id="Property3Rating" runat="server" text="4.5"></asp:label>
                                                    <i class="la la-star"></i></span>
                                            </div>
                                            <!-- End atbd listing meta -->
                                            <div class="atbd_listing_data_list">

                                                <div class="mt-0 form-label">
                                                    <asp:label id="Property3RentPrice" runat="server" text="Label"></asp:label>
                                                </div>
                                                <div class="row mt-0 form-label daterange">
                                                    <asp:label id="Property3StartDate" runat="server" text="Label"></asp:label>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End atbd listing meta -->
                                        <!-- end .atbd_content_upper -->
                                        <div class="atbd_listing_bottom_content">
                                            <div class="atbd_content_left">
                                                <div class="atbd_listing_category">
                                                    <span class="fas fa-bed icon-padding"></span>
                                                    <div class="numberCircle">
                                                        <asp:label runat="server" id="Property3Bed" text="1 Bed" cssclass="icon-padding"></asp:label>
                                                    </div>
                                                    <span class="fas fa-bath icon-padding"></span>
                                                    <div class="numberCircle">
                                                        <asp:label runat="server" id="Property3Bath" text="1 Bathroom" cssclass="icon-padding"></asp:label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </article>
                                <!-- end .atbd_listing_bottom_content -->
                            </div>
                        </div>
                    </div>
                    <div id="Property4Space" runat="server" class="col-lg-12">
                        <div class="atbd_single_listing atbd_listing_list">
                            <article class="atbd_single_listing_wrapper">
                                <figure class="atbd_listing_thumbnail_area">
                                    <div class="atbd_listing_image fill">
                                        <asp:imagebutton id="Property4Image" onclick="Property4Image_Click" runat="server" cssclass="imgfill" />
                                    </div>
                                    <!-- ends: .atbd_listing_image -->
                                </figure>
                                <!-- ends: .atbd_listing_thumbnail_area -->
                                <div class="atbd_listing_info">
                                    <div class="atbd_content_upper">
                                        <h4 class="atbd_listing_title">
                                            <asp:label id="Property4Title" visible="false" runat="server" text="Label"></asp:label>
                                        </h4>
                                        <div class="mt-0 form-label">
                                            <asp:label id="Property4CityState" runat="server" text="Label"></asp:label>
                                        </div>
                                        <div class="atbd_listing_meta">
                                            <span class="atbd_meta atbd_listing_rating">
                                                <asp:label id="Property4Rating" runat="server" text="4.5"></asp:label>
                                                <i class="la la-star"></i></span>
                                        </div>
                                        <!-- End atbd listing meta -->
                                        <div class="atbd_listing_data_list">
                                            <div class="mt-0 form-label">
                                                <asp:label id="Property4RentPrice" runat="server" text="Label"></asp:label>
                                            </div>
                                            <div class="row mt-0 form-label daterange">
                                                <asp:label id="Property4StartDate" runat="server" text="Label"></asp:label>
                                            </div>
                                        </div>
                                        <!-- End atbd listing meta -->
                                    </div>
                                    <!-- end .atbd_content_upper -->
                                    <div class="atbd_listing_bottom_content">
                                        <div class="atbd_content_left">
                                            <div class="atbd_listing_category">
                                                <span class="fas fa-bed icon-padding"></span>
                                                <div class="numberCircle">
                                                    <asp:label runat="server" id="Property4Bed" text="1 Bed" cssclass="icon-padding"></asp:label>
                                                </div>
                                                <span class="fas fa-bath icon-padding"></span>
                                                <div class="numberCircle">
                                                    <asp:label runat="server" id="Property4Bath" text="1 Bathroom" cssclass="icon-padding"></asp:label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- end .atbd_listing_bottom_content -->
                                </div>
                                <!-- ends: .atbd_listing_info -->
                            </article>
                            <!-- atbd_single_listing_wrapper -->
                        </div>
                    </div>
                    <div id="Property5Space" runat="server" class="col-lg-12">
                        <div class="atbd_single_listing atbd_listing_list">
                            <article class="atbd_single_listing_wrapper">
                                <figure class="atbd_listing_thumbnail_area">
                                    <div class="atbd_listing_image fill">

                                        <asp:imagebutton id="Property5Image" onclick="Property5Image_Click" runat="server" cssclass="imgfill" />
                                    </div>
                                    <!-- ends: .atbd_listing_image -->
                                </figure>
                                <!-- ends: .atbd_listing_thumbnail_area -->

                                <div class="atbd_listing_info">
                                    <div class="atbd_content_upper">
                                        <h4 class="atbd_listing_title">
                                            <asp:label id="Property5Title" visible="false" runat="server" text="Label"></asp:label>
                                        </h4>
                                        <div class="mt-0 form-label">
                                            <asp:label id="Property5CityState" runat="server" text="Label"></asp:label>
                                        </div>
                                        <div class="atbd_listing_meta">
                                            <span class="atbd_meta atbd_listing_rating">
                                                <asp:label id="Property5Rating" runat="server" text="4.5"></asp:label>
                                                <i class="la la-star"></i></span>
                                        </div>
                                        <!-- End atbd listing meta -->
                                        <div class="atbd_listing_data_list">

                                            <div class="mt-0 form-label">
                                                <asp:label id="Property5RentPrice" runat="server" text="Label"></asp:label>
                                            </div>
                                            <div class="row mt-0 form-label daterange">
                                                <asp:label id="Property5StartDate" runat="server" text="Label"></asp:label>
                                            </div>
                                        </div>
                                        <!-- End atbd listing meta -->
                                    </div>
                                    <!-- end .atbd_content_upper -->
                                    <div class="atbd_listing_bottom_content">
                                        <div class="atbd_content_left">
                                            <div class="atbd_listing_category">
                                                <span class="fas fa-bed icon-padding"></span>
                                                <div class="numberCircle">
                                                    <asp:label runat="server" id="Property5Bed" text="1 Bed" cssclass="icon-padding"></asp:label>
                                                </div>
                                                <span class="fas fa-bath icon-padding"></span>
                                                <div class="numberCircle">
                                                    <asp:label runat="server" id="Property5Bath" text="1 Bathroom" cssclass="icon-padding"></asp:label>
                                                </div>
                                            </div>
                                        </div>
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
                                    <asp:linkbutton id="ResultPg1" runat="server" text="1" onclick="ResultPg1_Click" cssclass="page-numbers"> </asp:linkbutton>
                                    <asp:linkbutton id="ResultPg2" runat="server" text="2" onclick="ResultPg2_Click" cssclass="page-numbers"> </asp:linkbutton>
                                    <asp:linkbutton id="ResultPg3" runat="server" text="3" onclick="ResultPg3_Click" cssclass="page-numbers"> </asp:linkbutton>
                                    <asp:linkbutton id="ResultPg4" runat="server" text="4" onclick="ResultPg4_Click" cssclass="page-numbers"> </asp:linkbutton>
                                    <asp:linkbutton id="ResultPg5" runat="server" text="5" onclick="ResultPg5_Click" cssclass="page-numbers"> </asp:linkbutton>
                                    <asp:linkbutton id="ResultPg6" runat="server" text="6" onclick="ResultPg6_Click" cssclass="page-numbers"> </asp:linkbutton>
                                </div>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div class="modal fade" id="Filters" tabindex="-1" role="dialog" aria-labelledby="login_modal_label" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <asp:image id="Image1" runat="server" imageurl="~/img/roommagnet-text.png" cssclass="mx-auto image-padding" />
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <asp:textbox id="SearchResultMinPrice" runat="server" cssclass="form-control" placeholder="Min Price"></asp:textbox>
                        <asp:comparevalidator id="SearchResultsMinPriceValidator" controltovalidate="SearchResultMinPrice" operator="DataTypeCheck" type="Currency" runat="server" text="Invalid Price" display="Dynamic"></asp:comparevalidator>
                    </div>
                    <div class="form-group">
                        <asp:textbox id="SearchResultMaxPrice" runat="server" cssclass="form-control" placeholder="Max Price"></asp:textbox>
                        <asp:comparevalidator id="SearchResultsMaxPriceValidator" controltovalidate="SearchResultMaxPrice" runat="server" operator="DataTypeCheck" type="Currency" text="Invalid Price" display="Dynamic"></asp:comparevalidator>
                    </div>
                    <div class="form-group">
                        <asp:textbox id="SearchResultStartDate" runat="server" cssclass="form-control" placeholder="Start Date" onfocus="(this.type='date')"></asp:textbox>
                    </div>
                    <div class="form-group">
                        <asp:textbox id="SearchResultEndDate" runat="server" cssclass="form-control" placeholder="End Date" onfocus="(this.type='date')"></asp:textbox>
                    </div>

                    <div class="form-group">
                        <asp:dropdownlist id="SearchResultBedsAvailable" runat="server" cssclass="form-control">
                            <asp:ListItem Value="">Beds Available</asp:ListItem>
                            <asp:ListItem Value="1">1</asp:ListItem>
                            <asp:ListItem Value="2">2</asp:ListItem>
                            <asp:ListItem Value="3">3</asp:ListItem>
                            <asp:ListItem Value="4">4+</asp:ListItem>
                        </asp:dropdownlist>
                    </div>
                    <div class="form-group">
                        <asp:dropdownlist id="SearchResultHomeType" runat="server" cssclass="form-control">
                            <asp:ListItem>Home Type</asp:ListItem>
                            <asp:ListItem>Apartment</asp:ListItem>
                            <asp:ListItem>Townhome</asp:ListItem>
                            <asp:ListItem>House</asp:ListItem>
                        </asp:dropdownlist>
                    </div>
                </div>
                <div class="modal-footer mx-auto">
                    <div class="form-excerpts">
                        <ul class="list-unstyled">
                            <li>
                                <asp:button id="FiltersButton" runat="server" text="Apply" cssclass="btn btn-xs btn-gradient btn-gradient-two access-link" onclick="ApplyButton_Click" />
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>