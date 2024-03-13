<%-- 
    Document   : SeAddNews
    Created on : Feb 27, 2024, 1:28:09 AM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <title>Add News</title>
        <style>
            .hi{
                margin-top: 20px; /* or any other value you prefer */
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

        <div class="hero page-inner overlay" style="background-image: url('<%=request.getContextPath()%>/images/hero_bg_1.jpg');">

            <div class="container">
                <div class="row justify-content-center align-items-center">
                    <div class="col-lg-9 text-center mt-5">
                        <h1 class="heading" data-aos="fade-up">Add News</h1>

                        <nav aria-label="breadcrumb" data-aos="fade-up" data-aos-delay="200">
                            <ol class="breadcrumb text-center justify-content-center">
                                <li class="breadcrumb-item "><a href="index.html">Home</a></li>
                                <li class="breadcrumb-item active text-white-50" aria-current="page">Add News</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>


        <div class="hi">
            <div class="row justify-content-center">
                <div class="col-lg-9">
                    <div class="card">
                        <div class="card-body">
                            <h1 class="card-title">Edit News</h1>
                            <form action="seupdatenews" method="post">

                                <div class="mb-3">
                                    <label for="title" class="form-label">Title:</label>
                                    <input type="text" class="form-control" id="title" name="title" value="${details.newTitle}" required>
                                </div>

                                <div class="form-group">
                                    <label>Photo</label> <br/>

                                    <input type="file" 
                                           class="form-control" name="img" value="${details.img}" placeholder="Enter photo">
                                </div>

                                <div class="mb-3">
                                    <label for="content" class="form-label">Description:</label>
                                    <textarea class="form-control" id="content" name="des" value="${details.description}" rows="4" required></textarea>
                                </div>
                                <div class="modal-footer">
                                    <input type ="hidden" name="nid" value="${param.nid}" ><!-- comment -->
                                    <input  type="submit" class="btn btn-success" value="Submit">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
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