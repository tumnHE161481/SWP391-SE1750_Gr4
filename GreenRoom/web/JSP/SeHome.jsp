<%-- 
    Document   : SeHome
    Created on : Jan 15, 2024, 2:57:49 PM
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

        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/tiny-slider.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/aos.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">

        <title>Security Home</title>
        <style>
            /*table*/
            .tabular--wrapper{
                background: #fff;
                margin-top: 1rem;
                border-radius: 10px;
                padding: 2rem;
            }

            .table-container{
                width: 100%;
            }

            table{
                width: 100%;
                border-collapse: collapse;
            }

            /*Chinh mau chu o hang dau*/
            thead{
                background: rgb(138, 110, 60, 000);
                color: black;
            }

            th{
                padding: 15px;
                text-align: left;
            }

            tbody{
                background: #f2f2f2;
            }

            td{
                padding: 15px;
                font-size: 14px;
                color: #333;
            }

            tr:nth-child(even){
                background: white;
            }


            tfoot{
                background: rgba(113, 99, 186, 255);
                font-weight: bold;
                color: rgb(255, 255, 255);
            }

            tfoot td{
                padding: 15px;
            }

            .table-container button{
                color: green;
                background: none;
                cursor: pointer;

            }

            th{
                padding: 15px;
                background: none;
                cursor: pointer;
            }

            .table-container table {
                table-layout: fixed;
            }

            .table-container td {
                word-wrap: break-word;
                max-width: 200px; /* Adjust the max-width value as needed */
            }

            .table-container th:nth-child(1),
            .table-container td:nth-child(1) {
                width: 60%; /* Adjust the width value as needed */
            }

            .table-container th:nth-child(2),
            .table-container td:nth-child(2),
            .table-container th:nth-child(3),
            .table-container td:nth-child(3) {
                width: 10%; /* Adjust the width value as needed */
            }
            .table-container .box-feature {
                height: 100%; /* Đảm bảo chiều cao của các box-feature bằng nhau */
                display: flex; /* Sử dụng flexbox */
                flex-direction: column; /* Xếp các phần tử theo chiều dọc */
            }

            .table-container .box-feature .content {
                flex-grow: 1; /* Kích thước phần nội dung mở rộng để lấp đầy không gian còn lại */
            }

            .table-container .box-feature .buttons {
                margin-top: auto; /* Đẩy nút xuống dưới cùng */
            }
            .large-icon {
                font-size: 75px; /* Đặt kích thước biểu tượng tại đây */
            }
        </style>
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
                        <a href="sehome" class="logo m-0 float-start">Green Room</a>

                        <ul class="js-clone-nav d-none d-lg-inline-block text-start site-menu float-end">
                            <li class="active"><a href="sehome">Home</a></li>
                            <li class="active"><a href="listroom">Room</a></li>
                            <li><a href="seprofile">Profile</a></li>
                            <li><a href="selistcustomer">Renter</a></li>
                            <li><a href="Guide.html">Guide</a></li>
                            <li><a href="selogout">Log Out</a></li>
                        </ul>

                        <a href="#" class="burger light me-auto float-end mt-1 site-menu-toggle js-menu-toggle d-inline-block d-lg-none" data-toggle="collapse" data-target="#main-navbar">
                            <span></span>
                        </a>

                    </div>
                </div>
            </div>
        </nav>

        <div class="hero">


            <div class="hero-slide">
                <div class="img overlay" style="background-image: url('<%=request.getContextPath()%>/images/hero_bg_3.jpg')"></div>
                <div class="img overlay" style="background-image: url('<%=request.getContextPath()%>/images/hero_bg_2.jpg')"></div>
                <div class="img overlay" style="background-image: url('<%=request.getContextPath()%>/images/hero_bg_1.jpg')"></div>
            </div>

            <div class="container">
                <div class="row justify-content-center align-items-center">
                    <div class="col-lg-9 text-center">
                        <h1 class="heading" data-aos="fade-up">Welcome GreenRoom</h1>

                    </div>
                </div>
            </div>
        </div>
        <div class="section sec-testimonials">
            <div class="container">
                <div class="row mb-5 align-items-center">
                    <div class="col-md-6">
                        <h2 class="font-weight-bold heading text-primary mb-4 mb-md-0">News</h2>
                    </div>
                    <div class="col-md-6 text-md-end">
                        <div id="testimonial-nav">
                            <span class="prev" data-controls="prev">Prev</span>

                            <span class="next" data-controls="next">Next</span>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-4">

                    </div>
                </div>
                <div class="testimonial-slider-wrap">
                    <div class="testimonial-slider">
                        <c:forEach items="${ListN}" var="n">
                            <div class="item">
                                <div class="testimonial">
                                    <span class="flaticon-house large-icon"></span>

                                    <h3 class="h5 text-primary mb-4">${n.creatAt}</h3>
                                    <blockquote>
                                        <p>${n.newTitle}</p>
                                    </blockquote>
                                    <p class="text-black-50">
                                        <a href="newsdetail?nid=${n.newID}" class="learn-more">Read more</a>
                    
                                    </p>
                                </div>
                            </div>
                        </c:forEach>


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

                <div class="row mt-5">
                    <div class="col-12 text-center">

                    </div>
                </div>
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
