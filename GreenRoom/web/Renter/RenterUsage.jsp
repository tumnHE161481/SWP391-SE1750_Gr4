<%-- 
    Document   : SeRoomList
    Created on : Jan 16, 2024, 1:11:52 AM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="author" content="Untree.co">
        <link rel="shortcut icon" href="favicon.png">

        <meta name="description" content="" />
        <meta name="keywords" content="bootstrap, bootstrap5" />

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">


        <link rel="stylesheet" href="<%=request.getContextPath()%>/fonts/icomoon/style.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/fonts/flaticon/font/flaticon.css">

        <link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/tiny-slider.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/aos.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/style.css">
        <link rel="stylesheet" href="./CSS/Usage.css"/>

        <title> Electric usage </title>
    </head>

    <body>

        <div class="site-mobile-menu site-navbar-target">
            <div class="site-mobile-menu-header">
                <div class="site-mobile-menu-close">
                    <span class="icofont-close js-menu-toggle"></span>
                </div>
            </div>
            <div class="site-mobile-menu-body"></div>
        </div>

        <nav class="site-nav">
            <div class="container">
                <div class="menu-bg-wrap">
                    <div class="site-navigation">
                        <a href="/Owner/OwRoomDetail.jsp" class="logo m-0 float-start">Green Room</a>

                        <ul class="js-clone-nav d-none d-lg-inline-block text-start site-menu float-end">
                            <li class="active"><a href="/Owner/OwRoomDetail.jsp">Home</a></li>
                            <li class="active"><a href="currentroom">Room</a></li>
                            <li><a href="selistcustomer">Renter</a></li>
                            <li><a href="Guide.html">Guide</a></li>
                            <li><a href="News.html">News</a></li>
                            <li><a href="News.html">Usage fee</a></li>
                            <li><a href="News.html">Log Out</a></li>
                        </ul>

                        <a href="#"
                           class="burger light me-auto float-end mt-1 site-menu-toggle js-menu-toggle d-inline-block d-lg-none"
                           data-toggle="collapse" data-target="#main-navbar">
                            <span></span>
                        </a>

                    </div>
                </div>
            </div>
        </nav>
        <div class="section">
            <div class="container">
                <div class="row mb-5 align-items-center pt-5">
                    <div class="col-lg-6">
                        <h2 class="font-weight-bold text-primary heading">Electric and water usage</h2>
                    </div>
                </div>

                <div class="row">

                    <div class="col-12">


                        <div class="property-slider-wrap">



                            <style>
                                /* Inline CSS */
                                .product-card {
                                    height: 100%;
                                    width: 100%;

                                }

                                .product-card img {
                                    max-height: fit-content;
                                    object-fit: cover;
                                }

                                .product-card .card-body {
                                    text-align: center;
                                }
                                .circular-image {
                                    width: 100px;
                                    height: 100px;
                                    border-radius: 50%;
                                    object-fit: cover;
                                }

                                .text-below {
                                    text-align: center;
                                    margin-top: 10px;
                                }
                            </style>

                            <div class="table-wrapper p-5 my-5">
                                <h1>  Current Usage Price </h1>
                                <table class="fl-table">

                                    <thead>
                                        <tr>

                                            <th>Electric Number Price (VND/kWh)</th>
                                            <th>Water Block Price (VND/m^3)</th>

                                        </tr>
                                    </thead>
                                    <tbody>

                                        <tr>
                                            <td>${eprice}(VND)</td>
                                            <td>${wprice}(VND)</td>

                                        </tr>
                                    <tbody>
                                </table>
                                <h1>  History Use </h1>

                                <table class="fl-table p-5 my-5">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Electric Number</th>
                                            <th>Total Electric price</th>
                                            <th>Water Block</th>
                                            <th>Total Water price</th>
                                            <th>Total </th>
                                            <th>Create At</th>
                                            <th>Pay At</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${usage}" var="us" varStatus="loop">
                                            <tr>
                                                <td>${loop.index + 1}</td>
                                                <td>${us.electricNum}</td>
                                                <td>${totale} (VND)</td>
                                                <td>${us.waterBlock}</td>
                                                <td>${totalw} (VND)</td>
                                                <td>${total} (VND)</td>
                                                <td>${us.createAt}</td>
                                                <td>${us.payAt}</td>
                                            </tr>
                                        </c:forEach> 
                                    <tbody>
                                </table>
                            </div>

                            <style>

                                body {
                                }

                                .form-control:focus {
                                    box-shadow: none;
                                }

                                .profile-button {
                                    box-shadow: none;
                                    border: none
                                }

                                .profile-button:hover {
                                }

                                .profile-button:focus {
                                    box-shadow: none
                                }

                                .profile-button:active {
                                    box-shadow: none
                                }

                                .back:hover {
                                    cursor: pointer
                                }

                                .labels {
                                    font-size: 11px
                                }

                                .add-experience:hover {
                                    background: #BA68C8;
                                    color: #fff;
                                    cursor: pointer;
                                    border: solid 1px #BA68C8
                                }
                            </style>



                        </div>
                    </div>

                </div>
            </div>
        </div>


        <div class="site-footer">
            <div class="container">

                <div class="row">
                    <div class="col-lg-4">
                        <div class="widget">
                            <h3>Contact</h3>
                            <address>43 Raymouth Rd. Baltemoer, London 3910</address>
                            <ul class="list-unstyled links">
                                <li><a href="tel://11234567890">+1(123)-456-7890</a></li>
                                <li><a href="tel://11234567890">+1(123)-456-7890</a></li>
                                <li><a href="mailto:info@mydomain.com">info@mydomain.com</a></li>
                            </ul>
                        </div>
                        <!-- /.widget -->
                    </div>
                    <!-- /.col-lg-4 -->
                    <div class="col-lg-4">
                        <div class="widget">
                            <h3>Sources</h3>
                            <ul class="list-unstyled float-start links">
                                <li><a href="#">About us</a></li>
                                <li><a href="#">Services</a></li>
                                <li><a href="#">Vision</a></li>
                                <li><a href="#">Mission</a></li>
                                <li><a href="#">Terms</a></li>
                                <li><a href="#">Privacy</a></li>
                            </ul>
                            <ul class="list-unstyled float-start links">
                                <li><a href="#">Partners</a></li>
                                <li><a href="#">Business</a></li>
                                <li><a href="#">Careers</a></li>
                                <li><a href="#">Blog</a></li>
                                <li><a href="#">FAQ</a></li>
                                <li><a href="#">Creative</a></li>
                            </ul>
                        </div>
                        <!-- /.widget -->
                    </div>
                    <!-- /.col-lg-4 -->
                    <div class="col-lg-4">
                        <div class="widget">
                            <h3>Links</h3>
                            <ul class="list-unstyled links">
                                <li><a href="#">Our Vision</a></li>
                                <li><a href="#">About us</a></li>
                                <li><a href="#">Contact us</a></li>
                            </ul>

                            <ul class="list-unstyled social">
                                <li><a href="#"><span class="icon-instagram"></span></a></li>
                                <li><a href="#"><span class="icon-twitter"></span></a></li>
                                <li><a href="#"><span class="icon-facebook"></span></a></li>
                                <li><a href="#"><span class="icon-linkedin"></span></a></li>
                                <li><a href="#"><span class="icon-pinterest"></span></a></li>
                                <li><a href="#"><span class="icon-dribbble"></span></a></li>
                            </ul>
                        </div>
                        <!-- /.widget -->
                    </div>
                    <!-- /.col-lg-4 -->
                </div>
                <!-- /.row -->


            </div>
            <!-- /.container -->
        </div>
        <!-- /.site-footer -->


        <!-- Preloader -->
        <div id="overlayer"></div>
        <div class="loader">
            <div class="spinner-border" role="status">
                <span class="visually-hidden">Loading...</span>
            </div>
        </div>


        <script src="<%=request.getContextPath()%>/js/bootstrap.bundle.min.js"></script>
        <script src="<%=request.getContextPath()%>/js/tiny-slider.js"></script>
        <script src="<%=request.getContextPath()%>/js/aos.js"></script>
        <script src="<%=request.getContextPath()%>/js/navbar.js"></script>
        <script src="<%=request.getContextPath()%>/js/counter.js"></script>
        <script src="<%=request.getContextPath()%>/js/custom.js"></script>
    </body>

</html>