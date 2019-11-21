<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="SearchResult.aspx.cs" Inherits="WebPages_SearchResult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Search Result
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="Server">
    <asp:ScriptManager ID="ScriptManager1"
        EnablePageMethods="true"
        EnablePartialRendering="true" runat="server" />
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
                                <asp:TextBox ID="address" runat="server" CssClass="form-control search_fields Searchtxt-width inputgroup-height" type="textbox" ClientIDMode="Static" placeholder="Enter a city or zip code"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorHomePageSearchText" runat="server" ErrorMessage="Special characters are not allowed. For example:% & ; = $" ValidationExpression="[^%&;>=$]+" ControlToValidate="address" Display="Dynamic" ValidationGroup="ResultPageSearch"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required" ValidationGroup="ResultPageSearch" ControlToValidate="address" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="City and State should separate by a comma. For example Harrisonburg,VA" ValidationGroup="ResultPageSearch" ControlToValidate="address" Display="Dynamic" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
                            </div>

                            <div class="atbd_submit_btn input-group-append searchtxt-padding">
                                <asp:Button ID="search" runat="server" Text="Search" ClientIDMode="Static" CssClass="btn btn-primary inputgroup-height textcenter" OnClick="SearchResultButton_Click" ValidationGroup="ResultPageSearch" />
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
                        <h4>Search Results</h4>
                    </div>
                    <div class="row searchtxt-padding">
                        <p>
                            <asp:Label ID="SearchResultCount" runat="server" Text=""></asp:Label>
                        </p>
                    </div>
                    <div class="row">
                        <div id="Property1Space" runat="server" class="col-lg-12">
                            <div class="atbd_single_listing atbd_listing_list">
                                <article class="atbd_single_listing_wrapper">
                                    <figure class="atbd_listing_thumbnail_area">
                                        <div class="atbd_listing_image fill">
                                            <asp:ImageButton ID="Property1Image" OnClick="Property1Image_Click" runat="server" CssClass="imgfill" alt="Click to see more details" />
                                        </div>
                                        <!-- ends: .atbd_listing_image -->
                                    </figure>
                                    <!-- ends: .atbd_listing_thumbnail_area -->
                                    <div class="atbd_listing_info">
                                        <div class="atbd_content_upper">
                                            <h4 class="atbd_listing_title">
                                                <asp:Label ID="Property1Title" Visible="false" runat="server" Text="Label"></asp:Label>
                                            </h4>
                                            <div class="mt-0 form-label">
                                                <asp:Label ID="Property1CityState" runat="server" Text="Label"></asp:Label>
                                            </div>
                                            <div class="atbd_listing_meta" runat="server" visible="false" id="rating1">
                                                <span class="atbd_meta atbd_listing_rating" >
                                                    <asp:Label ID="Property1Rating" runat="server" Text="4.5"></asp:Label>
                                                    <i class="la la-star"></i></span>
                                            </div>
                                            <!-- End atbd listing meta -->
                                            <div class="atbd_listing_data_list">
                                                <div class="mt-0 form-label">
                                                    <asp:Label ID="Property1RentPrice" runat="server" Text="Label"></asp:Label>
                                                </div>
                                                <div class="row mt-0 form-label daterange">
                                                    <asp:Label ID="Property1StartDate" runat="server" Text="Label"></asp:Label>
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
                                                        <asp:Label runat="server" ID="Property1Bed" Text="1 Bed" CssClass="icon-padding"></asp:Label>
                                                    </div>
                                                    <span class="fas fa-bath icon-padding"></span>
                                                    <div class="numberCircle">
                                                        <asp:Label runat="server" ID="Property1Bath" Text="1 Bathroom" CssClass="icon-padding"></asp:Label>
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
                                            <asp:ImageButton ID="Property2Image" OnClick="Property2Image_Click" runat="server" CssClass="imgfill" />
                                        </div>
                                        <!-- ends: .atbd_listing_image -->
                                    </figure>
                                    <!-- ends: .atbd_listing_thumbnail_area -->
                                    <div class="atbd_listing_info">
                                        <div class="atbd_content_upper">
                                            <h4 class="atbd_listing_title">
                                                <asp:Label ID="Property2Title" Visible="false" runat="server" Text="Label"></asp:Label>
                                            </h4>
                                            <div class="mt-0 form-label">
                                                <asp:Label ID="Property2CityState" runat="server" Text="Label"></asp:Label>
                                            </div>
                                            <div class="atbd_listing_meta" runat="server" visible="false" id="rating2">
                                                <span class="atbd_meta atbd_listing_rating">
                                                    <asp:Label ID="Property2Rating" runat="server" Text="4.5"></asp:Label>
                                                    <i class="la la-star"></i></span>
                                            </div>
                                            <!-- End atbd listing meta -->
                                            <div class="atbd_listing_data_list">
                                                <div class="mt-0 form-label">
                                                    <asp:Label ID="Property2RentPrice" runat="server" Text="Label"></asp:Label>
                                                </div>
                                                <div class="row mt-0 form-label daterange">
                                                    <asp:Label ID="Property2StartDate" runat="server" Text="Label"></asp:Label>
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
                                                        <asp:Label runat="server" ID="Property2Bed" Text="1 Bed" CssClass="icon-padding"></asp:Label>
                                                    </div>
                                                    <span class="fas fa-bath icon-padding"></span>
                                                    <div class="numberCircle">
                                                        <asp:Label runat="server" ID="Property2Bath" Text="1 Bathroom" CssClass="icon-padding"></asp:Label>
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
                                            <asp:ImageButton ID="Property3Image" OnClick="Property3Image_Click" runat="server" CssClass="imgfill" />
                                        </div>
                                        <!-- ends: .atbd_listing_image -->
                                    </figure>
                                    <!-- ends: .atbd_listing_thumbnail_area -->
                                    <div class="atbd_listing_info">
                                        <div class="atbd_content_upper">
                                            <h4 class="atbd_listing_title">
                                                <asp:Label ID="Property3Title" Visible="false" runat="server" Text="Label"></asp:Label>
                                            </h4>
                                            <div class="mt-0 form-label">
                                                <asp:Label ID="Property3CityState" runat="server" Text="Label"></asp:Label>
                                            </div>
                                            <div class="atbd_listing_meta" runat="server" visible="false" id="rating3">
                                                <span class="atbd_meta atbd_listing_rating">
                                                    <asp:Label ID="Property3Rating" runat="server" Text="4.5"></asp:Label>
                                                    <i class="la la-star"></i></span>
                                            </div>
                                            <!-- End atbd listing meta -->
                                            <div class="atbd_listing_data_list">

                                                <div class="mt-0 form-label">
                                                    <asp:Label ID="Property3RentPrice" runat="server" Text="Label"></asp:Label>
                                                </div>
                                                <div class="row mt-0 form-label daterange">
                                                    <asp:Label ID="Property3StartDate" runat="server" Text="Label"></asp:Label>
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
                                                        <asp:Label runat="server" ID="Property3Bed" Text="1 Bed" CssClass="icon-padding"></asp:Label>
                                                    </div>
                                                    <span class="fas fa-bath icon-padding"></span>
                                                    <div class="numberCircle">
                                                        <asp:Label runat="server" ID="Property3Bath" Text="1 Bathroom" CssClass="icon-padding"></asp:Label>
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
                                        <asp:ImageButton ID="Property4Image" OnClick="Property4Image_Click" runat="server" CssClass="imgfill" />
                                    </div>
                                    <!-- ends: .atbd_listing_image -->
                                </figure>
                                <!-- ends: .atbd_listing_thumbnail_area -->
                                <div class="atbd_listing_info">
                                    <div class="atbd_content_upper">
                                        <h4 class="atbd_listing_title">
                                            <asp:Label ID="Property4Title" Visible="false" runat="server" Text="Label"></asp:Label>
                                        </h4>
                                        <div class="mt-0 form-label">
                                            <asp:Label ID="Property4CityState" runat="server" Text="Label"></asp:Label>
                                        </div>
                                        <div class="atbd_listing_meta" runat="server" visible="false" id="rating4">
                                            <span class="atbd_meta atbd_listing_rating">
                                                <asp:Label ID="Property4Rating" runat="server" Text="4.5"></asp:Label>
                                                <i class="la la-star"></i></span>
                                        </div>
                                        <!-- End atbd listing meta -->
                                        <div class="atbd_listing_data_list">
                                            <div class="mt-0 form-label">
                                                <asp:Label ID="Property4RentPrice" runat="server" Text="Label"></asp:Label>
                                            </div>
                                            <div class="row mt-0 form-label daterange">
                                                <asp:Label ID="Property4StartDate" runat="server" Text="Label"></asp:Label>
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
                                                    <asp:Label runat="server" ID="Property4Bed" Text="1 Bed" CssClass="icon-padding"></asp:Label>
                                                </div>
                                                <span class="fas fa-bath icon-padding"></span>
                                                <div class="numberCircle">
                                                    <asp:Label runat="server" ID="Property4Bath" Text="1 Bathroom" CssClass="icon-padding"></asp:Label>
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

                                        <asp:ImageButton ID="Property5Image" OnClick="Property5Image_Click" runat="server" CssClass="imgfill" />
                                    </div>
                                    <!-- ends: .atbd_listing_image -->
                                </figure>
                                <!-- ends: .atbd_listing_thumbnail_area -->

                                <div class="atbd_listing_info">
                                    <div class="atbd_content_upper">
                                        <h4 class="atbd_listing_title">
                                            <asp:Label ID="Property5Title" Visible="false" runat="server" Text="Label"></asp:Label>
                                        </h4>
                                        <div class="mt-0 form-label">
                                            <asp:Label ID="Property5CityState" runat="server" Text="Label"></asp:Label>
                                        </div>
                                        <div class="atbd_listing_meta" runat="server" visible="false" id="rating5">
                                            <span class="atbd_meta atbd_listing_rating">
                                                <asp:Label ID="Property5Rating" runat="server" Text="4.5"></asp:Label>
                                                <i class="la la-star"></i></span>
                                        </div>
                                        <!-- End atbd listing meta -->
                                        <div class="atbd_listing_data_list">

                                            <div class="mt-0 form-label">
                                                <asp:Label ID="Property5RentPrice" runat="server" Text="Label"></asp:Label>
                                            </div>
                                            <div class="row mt-0 form-label daterange">
                                                <asp:Label ID="Property5StartDate" runat="server" Text="Label"></asp:Label>
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
                                                    <asp:Label runat="server" ID="Property5Bed" Text="1 Bed" CssClass="icon-padding"></asp:Label>
                                                </div>
                                                <span class="fas fa-bath icon-padding"></span>
                                                <div class="numberCircle">
                                                    <asp:Label runat="server" ID="Property5Bath" Text="1 Bathroom" CssClass="icon-padding"></asp:Label>
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
                                    <asp:LinkButton ID="ResultPg1" runat="server" Text="1" OnClick="ResultPg1_Click" CssClass="page-numbers"> </asp:LinkButton>
                                    <asp:LinkButton ID="ResultPg2" runat="server" Text="2" OnClick="ResultPg2_Click" CssClass="page-numbers"> </asp:LinkButton>
                                    <asp:LinkButton ID="ResultPg3" runat="server" Text="3" OnClick="ResultPg3_Click" CssClass="page-numbers"> </asp:LinkButton>
                                    <asp:LinkButton ID="ResultPg4" runat="server" Text="4" OnClick="ResultPg4_Click" CssClass="page-numbers"> </asp:LinkButton>
                                    <asp:LinkButton ID="ResultPg5" runat="server" Text="5" OnClick="ResultPg5_Click" CssClass="page-numbers"> </asp:LinkButton>
                                    <asp:LinkButton ID="ResultPg6" runat="server" Text="6" OnClick="ResultPg6_Click" CssClass="page-numbers"> </asp:LinkButton>
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
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/img/roommagnet-text.png" CssClass="mx-auto image-padding" />
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <asp:TextBox ID="SearchResultMinPrice" runat="server" CssClass="form-control" placeholder="Min Price"></asp:TextBox>
                        <asp:CompareValidator ID="SearchResultsMinPriceValidator" ControlToValidate="SearchResultMinPrice" Operator="DataTypeCheck" Type="Currency" runat="server" Text="Invalid Price" Display="Dynamic"></asp:CompareValidator>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="SearchResultMaxPrice" runat="server" CssClass="form-control" placeholder="Max Price"></asp:TextBox>
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
                            <asp:ListItem Value="">Beds Available</asp:ListItem>
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
                    <small>*Please enter a location before you apply filters</small>
                </div>
                <div class="modal-footer mx-auto">
                    <div class="form-excerpts">
                        <ul class="list-unstyled">
                            <li>
                                <asp:Button ID="FiltersButton" runat="server" Text="Apply" CssClass="btn btn-xs btn-gradient btn-gradient-two access-link" OnClick="ApplyButton_Click" />
                                <div class="row text-center">
                                    <asp:Label ID="FilterLbl" runat="server" Text="Label" Visible="false" ForeColor="Red"></asp:Label>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>