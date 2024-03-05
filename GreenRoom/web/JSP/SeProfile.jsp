<%-- 
    Document   : SeProfile
    Created on : Jan 18, 2024, 2:16:15 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- /*
* Template Name: Property
* Template Author: Untree.co
* Template URI: https://untree.co/
* License: https://creativecommons.org/licenses/by/3.0/
*/ -->
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

    <title>Property &mdash; Free Bootstrap 5 Website Template by Untree.co</title>
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
                    <a href="Homepage.html" class="logo m-0 float-start">Green Room</a>

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

    <div class="hero page-inner overlay" style="background-image: url('<%=request.getContextPath()%>/images/hero_bg_1.jpg');">

        <div class="container">
            <div class="row justify-content-center align-items-center">
                <div class="col-lg-9 text-center mt-5">
                    <h1 class="heading" data-aos="fade-up">Profile</h1>

                    <nav aria-label="breadcrumb" data-aos="fade-up" data-aos-delay="200">
                        <ol class="breadcrumb text-center justify-content-center">
                            <li class="breadcrumb-item "><a href="index.html">Home</a></li>
                            <li class="breadcrumb-item active text-white-50" aria-current="page">Payment</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>


    <div class="section">
        <div class="container">
            <div class="row">

                <div class="col-lg-8" data-aos="fade-up" data-aos-delay="200">
                    <form action="#">
                        <div class="row">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-4">
                                        <!-- Avatar -->
                                        <img src="${account.user.userAvatar}" name="avatar" alt="Avatar" class="profile-avatar img-fluid">
                                    </div>
                                    <div class="col-md-8">
                                        <!-- Thông tin cá nhân -->
                                        <h2>User Profile</h2>
                                        <table class="table">
                                            <tbody>
                                                <tr>
                                                    <th scope="row">Tên:</th>
                                                    <td>${account.user.userName}</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Email:</th>
                                                    <td>${account.userMail}</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Gender:</th>
                                                    <td>${account.user.userGender}</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Birth:</th>
                                                    <td>${account.user.userBirth}</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Address:</th>
                                                    <td>${account.user.userAddress}</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Phone:</th>
                                                    <td>${account.user.userPhone}</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            

                            <div class="col-12">
                                <a href="seeditprofile"  value="Edit Profile" class="btn btn-primary">Edit Profile</a>
                       
                            </div>
                           
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- /.untree_co-section -->

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
                    <!-- 
              **==========
              NOTE: 
              Please don't remove this copyright link unless you buy the license here https://untree.co/license/  
              **==========
            -->

                    <p>Copyright &copy;
                        <script>
                            document.write(new Date().getFullYear());
                        </script>. All Rights Reserved. &mdash; Designed with love by <a href="https://untree.co">Untree.co</a>
                        <!-- License information: https://untree.co/license/ -->
                    </p>

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
