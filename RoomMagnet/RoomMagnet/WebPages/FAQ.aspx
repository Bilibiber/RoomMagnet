<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="FAQ.aspx.cs" Inherits="WebPages_FAQ" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
</asp:Content>
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
                        <h1 class="page-title">FAQs</h1>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
                                <li class="breadcrumb-item active">FAQ</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ends: .breadcrumb-wrapper -->
    <section class="faq-wrapper section-padding border-bottom">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>What can we help you with?</h2>
                    </div>
                </div>
                <!-- ends: .col-lg-12 -->
                <div class="col-lg-12">
                    <div class="faq-contents">
                        <div class="atbd_content_module atbd_faqs_module">
                            <div class="atbd_content_module__tittle_area">
                                <div class="atbd_area_title">
                                    <h4><span class="la la-question-circle"></span>FAQs</h4>
                                </div>
                            </div>
                            <div class="atbdb_content_module_contents">
                                <div class="atbdp-accordion">
                                    <div class="accordion md-accordion" id="accordionEx" role="tablist" aria-multiselectable="true">
                                            <!-- Card header -->
                                            <div class="card-header" role="tab" id="headingOne1">
                                                <a data-toggle="collapse" data-parent="#accordionEx" href="#collapseOne1" aria-expanded="true"
                                                    aria-controls="collapseOne1">
                                                    <h5 class="mb-0">What makes RoomMagnet different?<i class="fas fa-angle-down rotate-icon" style="float: right;"></i>
                                                    </h5>
                                                </a>
                                            </div>
                                            <!-- Card body -->
                                            <div id="collapseOne1" class="collapse show" role="tabpanel" aria-labelledby="headingOne1"
                                                data-parent="#accordionEx">
                                                <div class="card-body">
                                                    RoomMagnet provides an easy to use platform where pre-screened Tenants and Hosts come together, and in exchange for a
                                                modest cost and/or in exchange for light domestic duties, enjoy reduced rent. It’s a win-win! Hosts monetize their extra living space and if they wish get a
                                                little help around the house. Tenants enjoy affordable housing.
                                                </div>
                                            </div>
  
                                        <!-- Card header -->
                                            <div class="card-header" role="tab" id="headingOne2">
                                                <a data-toggle="collapse" data-parent="#accordionEx" href="#collapseOne2" aria-expanded="true"
                                                    aria-controls="collapseOne2">
                                                    <h5 class="mb-0">Who can use RoomMagnet?<i class="fas fa-angle-down rotate-icon" style="float: right;"></i>
                                                    </h5>
                                                </a>
                                            </div>
                                            <!-- Card body -->
                                            <div id="collapseOne2" class="collapse show" role="tabpanel" aria-labelledby="headingOne2"
                                                data-parent="#accordionEx">
                                                <div class="card-body">
                                                    Roommagnet users must be at least 18 years of age and are seeking a minimum of 30 days stay in Host lodging.
                                            While Roommagnet is open to all who meet their minimum requirements we specialize in connecting Hosts with professional and semi-professionals such as,
                                            graduate students, international students, doctoral and nursing interns as well as college students seeking affordable off campus housing.
                                                </div>
                                            </div>

                                            <!-- Card header -->
                                            <div class="card-header" role="tab" id="headingOne3">
                                                <a data-toggle="collapse" data-parent="#accordionEx" href="#collapseOne3" aria-expanded="true"
                                                    aria-controls="collapseOne3">
                                                    <h5 class="mb-0">Who Are Host Families?<i class="fas fa-angle-down rotate-icon" style="float: right;"></i>
                                                    </h5>
                                                </a>
                                            </div>
                                            <!-- Card body -->
                                            <div id="collapseOne3" class="collapse show" role="tabpanel" aria-labelledby="headingOne1"
                                                data-parent="#accordionEx">
                                                <div class="card-body">
                                                    Host families are those who have room in their home, empty-nesters and people of advanced age who wish to age in place,
                                            and wish to monetize their empty space. In cases where hosts are interested in getting a little help around the house and tenants are willing  provide assistance
                                            with things such as light domestic or outdoor work, running errands, as well as companionship a further rent discount will be offered by the host and negotiated between host and tenant.
                                                </div>
                                            </div>

                                        <div class="card-header" role="tab" id="headingOne4">
                                            <a data-toggle="collapse" data-parent="#accordionEx" href="#collapseOne4" aria-expanded="true"
                                                aria-controls="collapseOne1">
                                                <h5 class="mb-0">What is the advantage of a host family?<i class="fas fa-angle-down rotate-icon" style="float: right;"></i>
                                                </h5>
                                            </a>
                                        </div>
                                        <!-- Card body -->
                                        <div id="collapseOne4" class="collapse show" role="tabpanel" aria-labelledby="headingOne1"
                                            data-parent="#accordionEx">
                                            <div class="card-body">
                                                Roommagnet connects host families who wish to share empty space in their home with responsible inter-generational adults who seek
                                            affordable housing in order to continue their careers. These may be advanced college students, doctoral and nursing interns, international students or professionals. Host
                                            families have the assurance that Tenants are carefully screened.  Hosts who need assistance with light domestic duties (i.e. shopping, household odd jobs, daily maintenance
                                            or just companionship) will offer further discount for assistance.
                                            </div>
                                        </div>

                                        <!-- Card header -->
                                        <div class="card-header" role="tab" id="headingOne5">
                                            <a data-toggle="collapse" data-parent="#accordionEx" href="#collapseOne5" aria-expanded="true"
                                                aria-controls="collapseOne1">
                                                <h5 class="mb-0">Why is there a need for RoomMagnet?<i class="fas fa-angle-down rotate-icon" style="float: right;"></i>
                                                </h5>
                                            </a>
                                        </div>
                                        <!-- Card body -->
                                        <div id="collapseOne5" class="collapse show" role="tabpanel" aria-labelledby="headingOne1"
                                            data-parent="#accordionEx">
                                            <div class="card-body">
                                                As the cost of housing increases and become more scare in highly populated areas, it becomes harder for responsible students, as well as
                                            professional and semi-professionals (ie: doctoral interns, and interning nurses) to find suitable and affordable housing. Likewise, International students not only have the added
                                            expense of international living, but also must adjust to the cultural landscape of the U.S., which living with a host family can greatly reduce.
                                            </div>
                                        </div>

                                        <!-- Card header -->
                                        <div class="card-header" role="tab" id="headingOne6">
                                            <a data-toggle="collapse" data-parent="#accordionEx" href="#collapseOne6" aria-expanded="true"
                                                aria-controls="collapseOne1">
                                                <h5 class="mb-0">What is RoomMagnet’s HomeshareSmarter® Living option?<i class="fas fa-angle-down rotate-icon" style="float: right;"></i>
                                                </h5>
                                            </a>
                                        </div>
                                        <!-- Card body -->
                                        <div id="collapseOne6" class="collapse show" role="tabpanel" aria-labelledby="headingOne1"
                                            data-parent="#accordionEx">
                                            <div class="card-body">
                                                Tenants who are open to assisting host families with some basic chores like running errands, doing yard work or just providing companionship or
                                            personal assistance will receive a discount on their housing. We call this HomeShareSmarter® Living.
                                            </div>
                                        </div>

                                        <!-- Card header -->
                                        <div class="card-header" role="tab" id="headingOne7">
                                            <a data-toggle="collapse" data-parent="#accordionEx" href="#collapseOne7" aria-expanded="true"
                                                aria-controls="collapseOne1">
                                                <h5 class="mb-0">Who are RoomMagnet's advisors?<i class="fas fa-angle-down rotate-icon" style="float: right;"></i>
                                                </h5>
                                            </a>
                                        </div>
                                        <!-- Card body -->
                                        <div id="collapseOne7" class="collapse show" role="tabpanel" aria-labelledby="headingOne1"
                                            data-parent="#accordionEx">
                                            <div class="card-body">
                                                Our advisors are available to assist hosts who would rather sit back and experience the benefits of the RoomMagnet program but not the hassle of
                                            getting set up. E-mail us today and let us set up a personal meeting with one of our advisors to walk you through the process. It’s that easy!
                                            </div>
                                        </div>
                                        <div class="card-header" role="tab" id="headingOne8">
                                            <a data-toggle="collapse" data-parent="#accordionEx" href="#collapseOne8" aria-expanded="true"
                                                aria-controls="collapseOne1">
                                                <h5 class="mb-0">What is RoomMagnet's background screening process?<i class="fas fa-angle-down rotate-icon" style="float: right;"></i>
                                                </h5>
                                            </a>
                                        </div>
                                        <!-- Card body -->
                                        <div id="collapseOne8" class="collapse show" role="tabpanel" aria-labelledby="headingOne1"
                                            data-parent="#accordionEx">
                                            <div class="card-body">
                                                We require all RoomMagnet users ( Tenants and Hosts) who wish to connect on our platform  to initiate a background check.
                                            We ask this so that our users feel secure in taking advantage of the benefits of RoomMagnet. Hosts or Tenants may request, and rely upon one or more consumer reports
                                            or investigative consumer reports to determine a compatible living arrangement. Should either Host or Tenants not choose to initiate a background screen,
                                            either party may continue to search the site to find a compatible match, however before a match is consummated a background screen must be initiated.
                                            </div>
                                        </div>
                                        <div class="card-header" role="tab" id="headingOne9">
                                            <a data-toggle="collapse" data-parent="#accordionEx" href="#collapseOne9" aria-expanded="true"
                                                aria-controls="collapseOne1">
                                                <h5 class="mb-0">What is the cost of my criminal background check?<i class="fas fa-angle-down rotate-icon" style="float: right;"></i>
                                                </h5>
                                            </a>
                                        </div>
                                        <!-- Card body -->
                                        <div id="collapseOne9" class="collapse show" role="tabpanel" aria-labelledby="headingOne1"
                                            data-parent="#accordionEx">
                                            <div class="card-body">
                                                RoomMagnet has selected a criminal background company that follows the Federal Credit Reporting Act (FCRA) regulations.
                                            The background information is obtained from the consumer reporting agency, IntelliCorp Records, Inc. which can be contacted by mail at 3000 Auburn Dr, Suite 410;Beachwood, OH 44122;
                                            or phone: 1-888-946-8355; or website: www.intellicorp.net. The cost of securing your criminal background check with Intellicorp is $24.95. (Use this link to
                                            begin your criminal background check. Be sure to enter the password located below link:
                                            Intellicorp Records will provide a link to request copy of your background report once it is completed .
                                            </div>
                                        </div>
                                        <div class="card-header" role="tab" id="headingOne10">
                                            <a data-toggle="collapse" data-parent="#accordionEx" href="#collapseOne10" aria-expanded="true"
                                                aria-controls="collapseOne1">
                                                <h5 class="mb-0">What is the cost of my criminal background check?<i class="fas fa-angle-down rotate-icon" style="float: right;"></i>
                                                </h5>
                                            </a>
                                        </div>
                                        <!-- Card body -->
                                        <div id="collapseOne10" class="collapse show" role="tabpanel" aria-labelledby="headingOne1"
                                            data-parent="#accordionEx">
                                            <div class="card-body">
                                                RoomMagnet has selected a criminal background company that follows the Federal Credit Reporting Act (FCRA) regulations.
                                            The background information is obtained from the consumer reporting agency, IntelliCorp Records, Inc. which can be contacted by mail at 3000 Auburn Dr, Suite 410;Beachwood, OH 44122;
                                            or phone: 1-888-946-8355; or website: www.intellicorp.net. The cost of securing your criminal background check with Intellicorp is $24.95. (Use this link to
                                            begin your criminal background check. Be sure to enter the password located below link:
                                            Intellicorp Records will provide a link to request copy of your background report once it is completed .
                                            </div>
                                        </div>
                                        <div class="card-header" role="tab" id="headingOne11">
                                            <a data-toggle="collapse" data-parent="#accordionEx" href="#collapseOne11" aria-expanded="true"
                                                aria-controls="collapseOne1">
                                                <h5 class="mb-0">What is the cost of becoming part of the RoomMagnet community?<i class="fas fa-angle-down rotate-icon" style="float: right;"></i>
                                                </h5>
                                            </a>
                                        </div>
                                        <!-- Card body -->
                                        <div id="collapseOne11" class="collapse show" role="tabpanel" aria-labelledby="headingOne1"
                                            data-parent="#accordionEx">
                                            <div class="card-body">
                                                RoomMagnet does not charge either Tenants or Hosts a fee to register, develop a profile, list a property or search.
                                            Upon a confirmed letter of intent, tenants will be required to pay the first and last month’s rent. RoomMagnet earns a match fee of one month’s rent once Host
                                            and Tenants connect and initiate the company’s letter of intent indicating a desirable match and a start date for occupancy. Such commission will be deducted
                                            from the first month’s base rental rate with the balance then forwarded to the host. On Lease agreements that are sixty (60) days or less Roommagnet will only require
                                            a 30% commission of the total lease term rental.
                                            </div>
                                        </div>
                                        <div class="card-header" role="tab" id="headingOne12">
                                            <a data-toggle="collapse" data-parent="#accordionEx" href="#collapseOne12" aria-expanded="true"
                                                aria-controls="collapseOne1">
                                                <h5 class="mb-0">Why do we use stripe to disperse our payments?<i class="fas fa-angle-down rotate-icon" style="float: right;"></i>
                                                </h5>
                                            </a>
                                        </div>
                                        <!-- Card body -->
                                        <div id="collapseOne12" class="collapse show" role="tabpanel" aria-labelledby="headingOne1"
                                            data-parent="#accordionEx">
                                            <div class="card-body">
                                                Stripe is a recognized secure payment platform that works similar to Paypal in that it collects payments from RoomMagnet Renters
                                            (Tenants) and automatically disperses funds to Landlords (Hosts). In order for RoomMagnet to disperse funds, landlords (hosts) will need to set up a simple stripe account.
                                            This will enable RoomMagnet to distribute funds directly and quickly to the account provided.
                                            Stripe is a network with redundant security encryption, and all information is kept strictly confidential. For more information on stripe visit www.stripe.com.
                                            </div>
                                        </div>
                                        <div class="card-header" role="tab" id="headingOne13">
                                            <a data-toggle="collapse" data-parent="#accordionEx" href="#collapseOne13" aria-expanded="true"
                                                aria-controls="collapseOne1">
                                                <h5 class="mb-0">How can I get involved with RoomMagnet?<i class="fas fa-angle-down rotate-icon" style="float: right;"></i>
                                                </h5>
                                            </a>
                                        </div>
                                        <!-- Card body -->
                                        <div id="collapseOne13" class="collapse show" role="tabpanel" aria-labelledby="headingOne1"
                                            data-parent="#accordionEx">
                                            <div class="card-body">
                                                We are currently looking for people with strong writing skills to use their talents to write articles to be featured on
                                            www.RoomMagnet.com. Put your journalistic talents to the test by writing about topics that would appeal to our community. If you have a burning desire to vent on
                                            social news, sports, college life, then let’s talk. Send us an e mail, tell us a little about yourself ,send us an example of your writing and we’ll get back to you.
                                            And if you’re unsure about your writing, we have great people here at RoomMagnet that will help turn your pieces into first rate work. Come on! We’re waiting for you.
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ends: .atbd_content_module -->
                    </div>
                    <!-- ends: .faq-contents -->
                </div>
                <!-- ends: .col-lg-12 -->
            </div>
        </div>
    </section>
    <!-- ends: .faq-wrapper -->
</asp:Content>