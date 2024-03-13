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

        <title>Renter Detail</title>
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
                            <li class="active"><a href="listroom">Room</a></li>
                            <li><a href="selistcustomer">Renter</a></li>
                            <li><a href="Guide.html">Guide</a></li>
                            <li><a href="News.html">News</a></li>
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
                        <h2 class="font-weight-bold text-primary heading">Renter Detail</h2>
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

                            <div class="container rounded bg-white  mb-5">
                                <div class="row">
                                    <div class="col-md-4 border-right">
                                        <c:set var="r" value="${requestScope.detail}"></c:set>
                                        <c:set var="id" value="${r.userID}"></c:set>
                                            <div class="d-flex flex-column align-items-center text-center "><img class="rounded-circle mt-5" width="150px" src=${r.userAvatar}><span class="text-black-50">${r.account.userMail}</span><span> </span></div>
                                        </div>
                                        <div class="col-md-8 border-right">
                                            <div class="p-3 py-5">
                                                <div class="d-flex justify-content-between align-items-center mb-3">
                                                    <h4 class="text-right">Profile </h4>
                                                </div>
                                                <div class="row mt-2">
                                                    <div class="col-md-6"><label class="labels" >Name</label><input readonly type="text" class="form-control"  value="${r.userName}"></div>
                                                    <div class="col-md-6"><label class="labels">Phone</label><input readonly type="text" class="form-control" value=${r.userPhone} placeholder="surname"></div>
                                                </div>
                                                <div class="row mt-3">
                                                    <div class="col-md-12"><label class="labels">Address</label><input readonly type="text" class="form-control"  value="${r.userAddress}"></div>
                                                    <div class="col-md-12"><label class="labels">Room Number</label><input readonly type="text" class="form-control"  value=${r.room.roomNumber}></div>
                                                    <div class="col-md-12"><label class="labels">Room Floor</label><input readonly type="text" class="form-control"  value=${r.room.roomFloor}></div>
                                                    <div class="col-md-12"><label class="labels">CGRScore</label><input readonly type="text" class="form-control"  value=${r.renter.CGRScore}></div>
                                                </div>
                                              

                                            </div>
                                        </div>
                                        <div class="row">

                                            
                                            <div class="col-md-12 mt-5 text-center"><button style="border: 1px solid #000" class="btn btn-info profile-button" type="button"><a href="OwnerRenterList">Back</a></div>
                                            <div class="col-md-12 mt-5 text-center"><button class="btn btn-danger profile-button" type="button"><a href="OwnerHistoryPenalty?id=${id}">Penalty</a></div>

                                        </div>

                                    </div>
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