<%@ Page Title="Rate Property" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="RateProperty.aspx.cs" Inherits="WebPages_RateProperty" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <link href="../Css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Css/star-rating.css" rel="stylesheet" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script> 
    <script src="../vendor_assets/js/star-rating.js"></script>

https://github.com/dreyescat/bootstrap-rating
<script> 
        $(document).ready(function () {  
            $("#input-21b").on("rating.change", function (event, value, caption) {  
                var ratingvalue = $('hdfRatingValue').val();  
                ratingvalue = value;  
                alert(ratingvalue);  
            });  
        });  
    </script>
    <script>  
       $(document).ready(function () {  
           $("#input-21b").on("rating.change", function (event, value, caption) {  
               alert("You rated: " + value + " = " + $(caption).text());  
           });  
       });  
   </script> 
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Body" Runat="Server">
    <div>  
         
        <div class="row">
<div class="col-lg-12">  
     
<%--    <input id="input-21a" value="0" type="number" class="rating" data-symbol="*" min=0 max=5 step=0.5 data-size="xl" >  
    <hr>  
    <input id="input-21b" type="number" class="rating" min=0 max=5 step=0.5 data-glyphicon="false" data-star-captions="{}" data-default-caption="{rating} Stars" data-size="lg">  
    <hr>  
    <input id="input-21c" value="0" type="number" class="rating" min=0 max=8 step=0.5 data-size="xl" data-stars="8">  
    <hr>  
    <input id="input-21d" value="2" type="number" class="rating" min=0 max=5 step=0.5 data-size="sm">  
    <hr>  
    <input id="input-21e" value="0" type="number" class="rating" min=0 max=5 step=0.5 data-size="xs" >  --%>

    <label for="input-7-md" class="control-label">Rate this Property</label>
<input id="input-7-md" class="rating rating-loading" value="3" data-min="0" data-max="5" data-step="0.5" data-size="md"><hr/>

    <hr>  
    </div>  
        </div>  
      
    </div>  
            <asp:HiddenField ID="hdfRatingValue" runat="server" ClientIDMode="Static" />  
</asp:Content>
