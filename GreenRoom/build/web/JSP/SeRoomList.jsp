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

        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/tiny-slider.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/aos.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">

        <title>Room List</title>
        <style>
            .property-item img {
                width: 381px;
                height: 319px;
            }
            img-fluid {
                max-width: 100%;
                height: auto;
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
                            <li><a href="Payment.html">Profile</a></li>
                            <li><a href="selistcustomer">Renter</a></li>
                            <li><a href="Guide.html">Guide</a></li>

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
                        <h2 class="font-weight-bold text-primary heading">Green Room</h2>
                    </div>
                    <div class="col-lg-6 text-lg-end">
                        <p><a href="#" target="_blank" class="btn btn-primary text-white py-3 px-4">View List Room</a>
                        </p>
                    </div>
                </div>
                <div class="row">

                    <div class="col-12">


                        <div class="property-slider-wrap">



                            <div class="property-slider">
                                <c:forEach items="${ListR}" var="r">
                                    <div class="property-item">
                                        <img src="${r.roomImg}" alt="Image" class="img-fluid">
                                        <div class="property-content">
                                            <div class="price mb-2"><span>${r.roomNumber}</span></div>
                                            <div>
                                                <span class="d-block mb-2 text-black-50"></span>
                                                <span class="city d-block mb-3">Green Room</span>

                                                <div class="specs d-flex mb-4">

                                                </div>

                                                <a href="sedetailroom?pid=${r.getRoomID()}" class="btn btn-primary py-2 px-3">See details</a>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>


                            </div>


                            <div id="property-nav" class="controls" tabindex="0" aria-label="Carousel Navigation">
                                <span class="prev" data-controls="prev" aria-controls="property" tabindex="-1">Prev</span>
                                <span class="next" data-controls="next" aria-controls="property" tabindex="-1">Next</span>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>

        <section class="features-1">
            <div class="container">
                <div class="row">
                    <div class="col-6 col-lg-3" data-aos="fade-up" data-aos-delay="300">
                        <div class="box-feature">
                            <span class="flaticon-house"></span>
                            <h3 class="mb-3">Our Properties</h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptates, accusamus.</p>
                            <p><a href="#" class="learn-more">Learn More</a></p>
                        </div>
                    </div>
                    <div class="col-6 col-lg-3" data-aos="fade-up" data-aos-delay="500">
                        <div class="box-feature">
                            <span class="flaticon-building"></span>
                            <h3 class="mb-3">Property for Sale</h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptates, accusamus.</p>
                            <p><a href="#" class="learn-more">Learn More</a></p>
                        </div>
                    </div>
                    <div class="col-6 col-lg-3" data-aos="fade-up" data-aos-delay="400">
                        <div class="box-feature">
                            <span class="flaticon-house-3"></span>
                            <h3 class="mb-3">Real Estate Agent</h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptates, accusamus.</p>
                            <p><a href="#" class="learn-more">Learn More</a></p>
                        </div>
                    </div>
                    <div class="col-6 col-lg-3" data-aos="fade-up" data-aos-delay="600">
                        <div class="box-feature">
                            <span class="flaticon-house-1"></span>
                            <h3 class="mb-3">House for Sale</h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptates, accusamus.</p>
                            <p><a href="#" class="learn-more">Learn More</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </section>






        <div class="section section-4 bg-light">
            <div class="container">
                <div class="row justify-content-center  text-center mb-5">
                    <div class="col-lg-5">
                        <h2 class="font-weight-bold heading text-primary mb-4">Let's find home that's perfect for you</h2>
                        <p class="text-black-50">Lorem ipsum dolor sit amet consectetur adipisicing elit. Numquam enim
                            pariatur similique debitis vel nisi qui reprehenderit.</p>
                    </div>
                </div>
                <div class="row justify-content-between mb-5">
                    <div class="col-lg-7 mb-5 mb-lg-0 order-lg-2">
                        <div class="img-about dots">
                            <img src="<%=request.getContextPath()%>/images/hero_bg_3.jpg" alt="Image" class="img-fluid">
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="d-flex feature-h">
                            <span class="wrap-icon me-3">
                                <span class="icon-home2"></span>
                            </span>
                            <div class="feature-text">
                                <h3 class="heading">2M Properties</h3>
                                <p class="text-black-50">Lorem ipsum dolor sit amet consectetur adipisicing elit. Nostrum
                                    iste.</p>
                            </div>
                        </div>

                        <div class="d-flex feature-h">
                            <span class="wrap-icon me-3">
                                <span class="icon-person"></span>
                            </span>
                            <div class="feature-text">
                                <h3 class="heading">Top Rated Agents</h3>
                                <p class="text-black-50">Lorem ipsum dolor sit amet consectetur adipisicing elit. Nostrum
                                    iste.</p>
                            </div>
                        </div>

                        <div class="d-flex feature-h">
                            <span class="wrap-icon me-3">
                                <span class="icon-security"></span>
                            </span>
                            <div class="feature-text">
                                <h3 class="heading">Legit Properties</h3>
                                <p class="text-black-50">Lorem ipsum dolor sit amet consectetur adipisicing elit. Nostrum
                                    iste.</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row section-counter mt-5">
                    <div class="col-6 col-sm-6 col-md-6 col-lg-3" data-aos="fade-up" data-aos-delay="300">
                        <div class="counter-wrap mb-5 mb-lg-0">
                            <span class="number"><span class="countup text-primary">3298</span></span>
                            <span class="caption text-black-50"># of Buy Properties</span>
                        </div>
                    </div>
                    <div class="col-6 col-sm-6 col-md-6 col-lg-3" data-aos="fade-up" data-aos-delay="400">
                        <div class="counter-wrap mb-5 mb-lg-0">
                            <span class="number"><span class="countup text-primary">2181</span></span>
                            <span class="caption text-black-50"># of Sell Properties</span>
                        </div>
                    </div>
                    <div class="col-6 col-sm-6 col-md-6 col-lg-3" data-aos="fade-up" data-aos-delay="500">
                        <div class="counter-wrap mb-5 mb-lg-0">
                            <span class="number"><span class="countup text-primary">9316</span></span>
                            <span class="caption text-black-50"># of All Properties</span>
                        </div>
                    </div>
                    <div class="col-6 col-sm-6 col-md-6 col-lg-3" data-aos="fade-up" data-aos-delay="600">
                        <div class="counter-wrap mb-5 mb-lg-0">
                            <span class="number"><span class="countup text-primary">7191</span></span>
                            <span class="caption text-black-50"># of Agents</span>
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