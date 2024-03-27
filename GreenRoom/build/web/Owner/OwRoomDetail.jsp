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

        <link rel="stylesheet" href="<%=request.getContextPath()%>/vcss/tiny-slider.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/vcss/aos.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/vcss/style.css">

        <title>Room List</title>
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
                        <a href="./Owner/OwHome.jsp" class="logo m-0 float-start">Green Room</a>

                        <ul class="js-clone-nav d-none d-lg-inline-block text-start site-menu float-end">
                            <li><a href="ownerhome">Home</a></li>
                            <li><a href="listroom">Room</a></li>
                            <li><a href="">Renter</a></li> 
                            <li><a href="">Request</a></li> 
                            <li><a href="ownerhome">News</a></li>
                            <li><a href="roomfee">Fee</a></li>
                            <li><a href="logout">Log out</a></li>
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
                        <h2 class="font-weight-bold text-primary heading">View List Room</h2>
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
                                    margin: 20px;
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
                            <c:set var="owroomdetail" value="${requestScope.detail}"></c:set>
                            <c:forEach var="rod" items="${owroomdetail}">
                                <div class="container">
                                    <div class="card product-card">
                                        <img src="${rod.roomImg}" class="card-img-top" alt="Room Image">
                                        <div class="card-body">
                                            <h5 class="card-title">Room ${rod.roomNumber} - ${rod.roomSize}</h5>
                                            <p class="card-text"> At Floor: ${rod.roomFloor}</p>
                                            <p class="card-text"></p>
                                            <a href="#" class="btn btn-primary">View Room Bill History</a>
                                            <a href="#" class="btn btn-info">See Room Fees</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="container mt-4">
                                    <div class="d-flex justify-content-center">
                                        <h3>Number items in that room</h3>
                                    </div>
                                    <div class="d-flex justify-content-center" style="margin-bottom: 40px"><small style="font-style: italic">(Yes - mean only 1)</small></div>
                                    <div class="d-flex justify-content-around">
                                        <div class="text-center">
                                            <img src="./Image/airconditional.png" alt="Image 1" class="circular-image">
                                            <div class="text-below">Have: 
                                                <c:choose>
                                                    <c:when test="${rod.item.airConditional}">
                                                        <span style="color: green"> Yes &nbsp;</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span style="color: red"> No &nbsp;</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                        <div class="text-center">
                                            <img src="./Image/bunk.jpg" alt="Image 2" class="circular-image">
                                            <div class="text-below">Have: ${rod.item.bunk} item(s)</div>
                                        </div>
                                        <div class="text-center">
                                            <img src="./Image/CeillingFan.jpg" alt="Image 3" class="circular-image">
                                            <div class="text-below">
                                                Have: 
                                                <c:choose>
                                                    <c:when test="${rod.item.ceilingFans}">
                                                        <span style="color: green"> Yes &nbsp;</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span style="color: red"> No &nbsp;</span>
                                                    </c:otherwise>
                                                </c:choose></div>
                                        </div>
                                        <div class="text-center">
                                            <img src="./Image/singlebed.jpg" alt="Image 4" class="circular-image">
                                            <div class="text-below">Have: ${rod.item.singleBed} item(s)</div>
                                        </div>
                                        <div class="text-center">
                                            <img src="./Image/chair.jpg" alt="Image 5" class="circular-image">
                                            <div class="text-below">Have: ${rod.item.chair} item(s)</div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                            <style>
                                tbody tr:nth-child(odd) {
                                    background-color: #f9f9f9; /* Set background color for odd rows */
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