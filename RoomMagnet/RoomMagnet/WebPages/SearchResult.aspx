<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="SearchResult.aspx.cs" Inherits="WebPages_SearchResult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <style>
        body {
            width:85%;
            margin:auto;
        }
    </style>
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" Runat="Server">
    <h1>Search Result<asp:Label ID="SearchResultCount" runat="server" Text=""></asp:Label> 
    </h1>
    <asp:TextBox ID="SearchResultText" runat="server" PlaceHolder="Enter a City or Zipcode"></asp:TextBox>
    <asp:Button ID="SearchResultButton" runat="server" Text="Search" OnClick="SearchResultButton_Click"/>
    
    <div>
         <u>Filters</u>
      </div>
        <div >
            Price
        </div>
        
       
            Min. Price
            <asp:TextBox ID="SearchResultMinPrice" runat="server"></asp:TextBox>
            <asp:CompareValidator ID="SearchResultsMinPriceValidator" ControlToValidate="SearchResultMinPrice" Operator="DataTypeCheck" Type="Currency" runat="server" Text="(Invalid Price)" Display="Dynamic"></asp:CompareValidator>
            Max Price
            <asp:TextBox ID="SearchResultMaxPrice" runat="server"></asp:TextBox>
            <asp:CompareValidator ID="SearchResultsMaxPriceValidator" ControlToValidate="SearchResultMaxPrice" runat="server" Operator="DataTypeCheck" Type="Currency" Text="(Invalid Price)"></asp:CompareValidator>
            <asp:Label ID="SearchLabel" runat="server" Text=""></asp:Label>
            <div>
                Start Date
            <asp:TextBox ID="SearchResultStartDate" runat="server"></asp:TextBox>
            End Date
            <asp:TextBox ID="SearchResultEndDate" runat="server" ></asp:TextBox>
            <br />
            Beds Available

            <asp:DropDownList ID="SearchResultBedsAvailable" runat="server">

                <asp:ListItem Value="1">1</asp:ListItem>
                <asp:ListItem Value="2">2</asp:ListItem>
                <asp:ListItem Value="3">3</asp:ListItem>
                <asp:ListItem Value="4">4+</asp:ListItem>
            </asp:DropDownList>
     
        
            
        <asp:DropDownList ID="SearchResultHomeType" Visible="false" runat="server">
                <asp:ListItem>Apartment</asp:ListItem>
                <asp:ListItem>Townhome</asp:ListItem>
                <asp:ListItem>House</asp:ListItem>
            </asp:DropDownList>





           
                <div class="container">
                   <br />
                    <asp:Image ID="Image2" Visible="false" runat="server"  style="width:200px;" />
                <div class="media-body">
                    <h3 class="mt-0"> <asp:Label ID="Label1" Visible="false" runat="server" Text="Label"></asp:Label> </h3>
                    <asp:Label ID="Label2" runat="server" Visible="false" CssClass="small" Text="Label"></asp:Label>
                    <hr />
                     <h5 class="mt-0"> <asp:Label ID="Label3" Visible="false" CssClass="la-font" runat="server" Text="Amenities"></asp:Label> </h5>
                       <asp:Label ID="Label4" runat="server" Visible="false" CssClass="small" Text="Label"></asp:Label>
                    
                </div>
                    <asp:Image ID="Image3" runat="server" Visible="false"  style="width:200px;" />
                <div class="media-body">
                    <h3 class="mt-0"> <asp:Label ID="Label5" Visible="false" runat="server" Text="Label"></asp:Label> </h3>
                    <asp:Label ID="Label6" runat="server" Visible="false" CssClass="small" Text="Label"></asp:Label>
                    <hr />
                     <h5 class="mt-0"> <asp:Label ID="Label7" Visible="false" CssClass="la-font" runat="server" Text="Amenities"></asp:Label> </h5>
                       <asp:Label ID="Label8" runat="server" Visible="false" CssClass="small" Text="Label"></asp:Label>
                    
                </div>
                    <asp:Image ID="Image4" runat="server" Visible="false"  style="width:200px;" />
                <div class="media-body">
                    <h3 class="mt-0"> <asp:Label ID="Label9" Visible="false" runat="server" Text="Label"></asp:Label> </h3>
                    <asp:Label ID="Label10" runat="server" Visible="false" CssClass="small" Text="Label"></asp:Label>
                    <hr />
                     <h5 class="mt-0"> <asp:Label ID="Label11" Visible="false" CssClass="la-font" runat="server" Text="Amenities"></asp:Label> </h5>
                       <asp:Label ID="Label12" runat="server" Visible="false" CssClass="small" Text="Label"></asp:Label>
                    
                </div>
                    <asp:Image ID="Image5" runat="server" Visible="false"  style="width:200px;" />
                <div class="media-body">
                    <h3 class="mt-0"> <asp:Label ID="Label13" Visible="false" runat="server" Text="Label"></asp:Label> </h3>
                    <asp:Label ID="Label14" runat="server" Visible="false" CssClass="small" Text="Label"></asp:Label>
                    <hr />
                     <h5 class="mt-0"> <asp:Label ID="Label15" Visible="false" CssClass="la-font" runat="server" Text="Amenities"></asp:Label> </h5>
                       <asp:Label ID="Label16" runat="server" Visible="false" CssClass="small" Text="Label"></asp:Label>
                </div>
                
            
                </div>

        
            
       </div>
              <div class="col-lg-12 listing-items">
                    <div class="row">
                        <div class="col-lg-6 order-lg-0 order-1 mt-5 mt-lg-0">
                            <div class="listings-sidebar">
                              <div class="atbdb_content_module_contents">
                          <div class="map" id="map-one"></div>

                          <div class="cor-form">
                              <div id="hide_if_no_manual_cor" class="clearfix row m-bottom-30">
                                  <div class="col-sm-6">
                                      <div class="form-group">
                                          <label for="manual_lat" class="not_empty"> Latitude </label>
                                          <input type="text" name="manual_lat" id="manual_lat" class="form-control directory_field" placeholder="Enter Latitude eg. 24.89904">
                                      </div>
                                  </div>
                                  <div class="col-sm-6 mt-3 mt-sm-0">
                                      <div class="form-group">
                                          <label for="manual_lng" class="not_empty"> Longitude </label>
                                          <input type="text" name="manual_lng" id="manual_lng" class="form-control directory_field" placeholder="Enter Longitude eg. 91.87198">
                                      </div>
                                  </div>
                                  <div class="col-md-12 col-sm-12">
                                      <div class="form-group lat_btn_wrap m-top-15">
                                          <button class="btn btn-primary" id="generate_admin_map">Generate on Map
                                          </button>
                                      </div>
                                  </div> <!-- ends #hide_if_no_manual_cor-->
                              </div>

                          </div>
                      </div>
                            </div>
                        </div><!-- ends: .col-lg-4 -->

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
                                                </div><!-- ends: .atbd_listing_image -->
                                            </figure><!-- ends: .atbd_listing_thumbnail_area -->

                                            <div class="atbd_listing_info">
                                                <div class="atbd_content_upper">
                                                    <h4 class="atbd_listing_title">
                                                        <a href="">Property 1</a>
                                                    </h4>
                                                    <div class="atbd_listing_meta">
                                                        <span class="atbd_meta atbd_listing_rating">4.5<i class="la la-star"></i></span>
                                                        <span class="atbd_meta atbd_listing_price">$1,100</span>
                                                    </div><!-- End atbd listing meta -->
                                                    <div class="atbd_listing_data_list">
                                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                                    </div><!-- End atbd listing meta -->
                                                </div><!-- end .atbd_content_upper -->
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
                                                </div><!-- end .atbd_listing_bottom_content -->
                                            </div><!-- ends: .atbd_listing_info -->
                                        </article><!-- atbd_single_listing_wrapper -->
                                    </div>
                                </div><!-- ends: .col-lg-12 -->

                                <div class="col-lg-12">
                                    <div class="atbd_single_listing atbd_listing_list">
                                        <article class="atbd_single_listing_wrapper">
                                            <figure class="atbd_listing_thumbnail_area">
                                                <div class="atbd_listing_image">
                                                    <a href="">
                                                        <img src="img/p1.jpg" alt="listing image">
                                                    </a>
                                                </div><!-- ends: .atbd_listing_image -->
                                            </figure><!-- ends: .atbd_listing_thumbnail_area -->

                                            <div class="atbd_listing_info">
                                                <div class="atbd_content_upper">
                                                    <h4 class="atbd_listing_title">
                                                        <a href="">Property 1</a>
                                                    </h4>
                                                    <div class="atbd_listing_meta">
                                                        <span class="atbd_meta atbd_listing_rating">4.5<i class="la la-star"></i></span>
                                                        <span class="atbd_meta atbd_listing_price">$1,100</span>
                                                    </div><!-- End atbd listing meta -->
                                                    <div class="atbd_listing_data_list">
                                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                                    </div><!-- End atbd listing meta -->
                                                </div><!-- end .atbd_content_upper -->
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
                                                </div><!-- end .atbd_listing_bottom_content -->
                                            </div><!-- ends: .atbd_listing_info -->
                                        </article><!-- atbd_single_listing_wrapper -->
                                    </div>
                                </div><!-- ends: .col-lg-12 -->

                                <div class="col-lg-12">
                                    <div class="atbd_single_listing atbd_listing_list">
                                        <article class="atbd_single_listing_wrapper">
                                            <figure class="atbd_listing_thumbnail_area">
                                                <div class="atbd_listing_image">
                                                    <a href="">
                                                        <img src="img/p1.jpg" alt="listing image">
                                                    </a>
                                                </div><!-- ends: .atbd_listing_image -->
                                            </figure><!-- ends: .atbd_listing_thumbnail_area -->

                                            <div class="atbd_listing_info">
                                                <div class="atbd_content_upper">
                                                    <h4 class="atbd_listing_title">
                                                        <a href="">Property 1</a>
                                                    </h4>
                                                    <div class="atbd_listing_meta">
                                                        <span class="atbd_meta atbd_listing_rating">4.5<i class="la la-star"></i></span>
                                                        <span class="atbd_meta atbd_listing_price">$1,100</span>
                                                    </div><!-- End atbd listing meta -->
                                                    <div class="atbd_listing_data_list">
                                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                                    </div><!-- End atbd listing meta -->
                                                </div><!-- end .atbd_content_upper -->
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
                                                </div><!-- end .atbd_listing_bottom_content -->
                                            </div><!-- ends: .atbd_listing_info -->
                                        </article><!-- atbd_single_listing_wrapper -->
                                    </div>
                                </div><!-- ends: .col-lg-12 -->

                                <div class="col-lg-12">
                                    <div class="atbd_single_listing atbd_listing_list">
                                        <article class="atbd_single_listing_wrapper">
                                            <figure class="atbd_listing_thumbnail_area">
                                                <div class="atbd_listing_image">
                                                    <a href="">
                                                        <img src="img/p1.jpg" alt="listing image">
                                                    </a>
                                                </div><!-- ends: .atbd_listing_image -->
                                            </figure><!-- ends: .atbd_listing_thumbnail_area -->

                                            <div class="atbd_listing_info">
                                                <div class="atbd_content_upper">
                                                    <h4 class="atbd_listing_title">
                                                        <a href="">Property 1</a>
                                                    </h4>
                                                    <div class="atbd_listing_meta">
                                                        <span class="atbd_meta atbd_listing_rating">4.5<i class="la la-star"></i></span>
                                                        <span class="atbd_meta atbd_listing_price">$1,100</span>
                                                    </div><!-- End atbd listing meta -->
                                                    <div class="atbd_listing_data_list">
                                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                                    </div><!-- End atbd listing meta -->
                                                </div><!-- end .atbd_content_upper -->
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
                                                </div><!-- end .atbd_listing_bottom_content -->
                                            </div><!-- ends: .atbd_listing_info -->
                                        </article><!-- atbd_single_listing_wrapper -->
                                    </div>
                                </div><!-- ends: .col-lg-12 -->

                              
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
                        </div><!-- ends: .col-lg-8 -->
                    </div>
                </div><!-- ends: .listing-items -->
            </div>
        </div>
    </section><!-- ends: .all-listing-wrapper -->
</asp:Content>

