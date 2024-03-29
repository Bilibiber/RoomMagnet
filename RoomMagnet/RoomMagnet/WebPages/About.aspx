﻿<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="WebPages_About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    About
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="Server">

    <section class="header-breadcrumb bgimage overlay overlay--dark fill">

        <div class="Faq-image imgfill">
            <asp:image id="Image1" runat="server" imageurl="~/img/home-1-small.png" />
        </div>
        <div class="breadcrumb-wrapper content_above">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <h1 class="page-title">About</h1>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
                                <li class="breadcrumb-item active">About</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <!-- ends: .breadcrumb-wrapper -->
    </section>
    <!-- ends: .intro-wrapper -->
    <section class="about-contents section-padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-14 contents-wrapper">
                    <div class="contents">
                        <div class="offset-lg-1 mt-5 mt-md-0">
                            <h1>Why did we create RoomMagnet?</h1>

                            <h4>RoomMagnet brings together a solution to two social problems that are of major concern to society and continue to escalate internationally.</h4>

                            <p>
                                The first is the cost of affordable housing. Costs for college students, interns and young professionals  continues to escalate at an alarming pace, making it more difficult to get a start on their careers.
                                   Secondly, older adults and empty-nesters, as they get older, wish to age in place, and often need additional income and at times assistance with light domestic duties such as shopping, household duties, daily maintenance or just companionship.
                                   Our goal is to bring professional and semi-professionals such as, graduate students, international students, doctoral and nursing interns as well as college students seeking affordable housing together with hosts who have extra room to share.
                                   Students can do light housekeeping and chores in exchange for reduced rent, while hosts enjoy having help available and earning income from their extra living space.
                            </p>

                            <h5>Common sense solution</h5>
                            <p>
                                RoomMagnet connects tenants that have limited financial capital with hosts who wish to monetize their extra living space by having someone live in and assist either financially or in exchange for some light domestic duties.
                                   How does RoomMagnet bring together two vastly different groups of people? We accomplish this by providing a beautifully designed, fully functional digital platform that matches tenants with hosts, enabling them to form a mutually beneficial relationship.
                            </p>
                            <h5>Tenants</h5>
                            <p>Everyone has a right to affordable living.</p>
                            <h5>Hosts</h5>
                            <p>
                                We share the world and we share our space.
                                   Hosts develop lasting friendships, helping each other through the sharing economy It's a win-win!
                            </p>
                        </div>
                    </div>
                    <!-- ends: .contents -->
                    <div class="contents">
                        <div class="row align-items-center">
                            <div class="col-lg-7 col-sm-6">
                                <h1>Why List on <span>RoomMagnet</span>?</h1>
                                <ul class="list-unstyled list-features p-top-15">
                                    <li>
                                        <div class="list-count"><span>1</span></div>
                                        <div class="list-content">
                                            <h4>Reason 1: </h4>
                                            <p>Renters - Help out around the house and get discounted rent!</p>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="list-count"><span>2</span></div>
                                        <div class="list-content">
                                            <h4>Reason 2: </h4>
                                            <p>Hosts - Enjoy some extra company while your kids are at college!</p>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="list-count"><span>3</span></div>
                                        <div class="list-content">
                                            <h4>Reason 3: </h4>
                                            <p>Retirees - Enjoy company from some young people to keep things exciting and get some help around the house!</p>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-lg-6 offset-lg-1 text-right col-sm-6 mt-5 mt-md-0">
                                <img src="img/about-img2.png" alt="">
                            </div>
                        </div>
                    </div>
                    <!-- ends: .contents -->
                </div>
                <!-- ends: .content-block -->
            </div>
        </div>
    </section>
</asp:Content>