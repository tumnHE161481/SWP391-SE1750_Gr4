<%-- 
    Document   : manageaccount
    Created on : Jan 13, 2024, 5:53:28 PM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="author" content="Untree.co">
        <link rel="shortcut icon" href="favicon.png">

        <meta name="description" content="" />
        <meta name="keywords" content="bootstrap, bootstrap5" />

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">


        <link rel="stylesheet" href="fonts/icomoon/style.css">
        <link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">
        <link rel="stylesheet" href="./vcss/tiny-slider.css">
        <link rel="stylesheet" href="./vcss/aos.css">
        <link rel="stylesheet" href="./vcss/style.css">
        <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">	
        <link rel="stylesheet" href="./CSS/Renter.css"/>
        <link
            rel="stylesheet"
            type="text/css"
            href="./bootstrap-5.0.2-dist/css/bootstrap.min.css"
            />
        <link rel="stylesheet" href="./CSS/Admin.css" />
        <link rel="stylesheet" href="./CSS/style_1.css" />
        <script
            type="text/javascript"
            src="./bootstrap-5.0.2-dist/js/bootstrap.min.js"
        ></script>
        <link
            href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css"
            rel="stylesheet"
            />
        <link rel="stylesheet" href="./fontawesome-free-6.5.1-web/css/all.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
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
                        <a href="Homepage.html" class="logo m-0 float-start">GreenRoom</a>

                        <ul class="js-clone-nav d-none d-lg-inline-block text-start site-menu float-end">
                            <li><a href="Homepage.html">Home</a></li>
                            <li class="active"><a href="manageroom">Room</a></li>
                            <li><a href="Payment.html">Payment</a></li>
                            <li><a href="request">Send Request</a></li>
                            <li><a href="Guide.html">Guide</a></li>
                            <li><a href="News.html">News</a></li>
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


        <div class="hero page-inner overlay" style="background-image: url('images/hero_bg_3.jpg');">

            <div class="container">
                <div class="row justify-content-center align-items-center">
                    <div class="col-lg-9 text-center mt-5">
                        <h1 class="heading" data-aos="fade-up">Edit Room</h1>

                        <nav aria-label="breadcrumb" data-aos="fade-up" data-aos-delay="200">
                            <ol class="breadcrumb text-center justify-content-center">

                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>

    <div class="tabular--wrapper row">
                    <div class="col-2">
                        <div class="wrap">
                            <ul class="nav">
                                <li class="nav__link">1</li>
                                <li class="nav__link">2</li>
                                <li class="nav__link">3</li>
                                <li class="nav__link">4</li>
                                <li class="nav__link">5</li>
                                <div class="nav__bar"></div>
                            </ul>
                        </div>

                    </div>
                    <div class="col-10">
                        <h3 style="margin-bottom: 40px">Room Management</h3>
                        <div class="col-lg-12">
                            <div class="row g-4 justify-content-center">
                                <c:forEach var="room" items="${manageRoom}" varStatus="loop" >
                                    <c:set var="id" value="${room.roomID}"/>
                                    <div class="col-md-6 col-lg-6 col-xl-3">
                                        <div class="rounded position-relative fruite-item">
                                            <div class="fruite-img">
                                                <img src=${room.roomImg} class="img-fluid w-100 rounded-top" alt="" style="object-fit: cover; height: 300px">
                                            </div>

                                            <c:choose>
                                                <c:when test="${room.roomSize == 1}">
                                                    <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Small Size</div>
                                                </c:when>
                                                <c:when test="${room.roomSize == 2}">
                                                    <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Medium Size</div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Big Size</div>
                                                </c:otherwise>
                                            </c:choose>
                                            <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                <h4>Room ${room.roomNumber}</h4>
                                                <small style="padding: 0px; font-style: italic">Floor ${room.roomFloor}</small>
                                                <div class="d-flex justify-content-between flex-lg-wrap align-items-center" style="text-align: center">
                                                    <c:choose>
                                                        <c:when test="${room.roomSize == 1}">
                                                            <p class="text-dark fw-bold mb-0" style="font-size: 16px">Renter ${room.total}/1&nbsp;<i class="fa-solid fa-people-group"></i> </p>
                                                        </c:when>
                                                        <c:when test="${room.roomSize == 2}">
                                                            <p class="text-dark fw-bold mb-0" style="font-size: 16px">Renter ${room.total}/2&nbsp;<i class="fa-solid fa-people-group"></i> </p>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <p class="text-dark fw-bold mb-0" style="font-size: 16px">Renter ${room.total}/4&nbsp;<i class="fa-solid fa-people-group"></i> </p>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <a href="adroomdetail?id=${id}" class="btn border border-secondary rounded-pill px-3 text-primary" style="font-size: 16px">
                                                        <i class="fa-solid fa-hand-point-right fa-sm" style="color: #1959c8;"></i> View detail
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>   
                    </div>
                </div>
       	
        <!--        <script>
        <c:set var="succ" value="${requestScope.success}"></c:set>
        <c:set var="err" value="${requestScope.error}"></c:set>
        var successMessage = "${succ}";
        var errorMessage = "${err}";
        if (successMessage !== "") {
            alert(successMessage);
        }
        if (errorMessage !== "") {
            alert(errorMessage);
        }
    </script>-->


        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/tiny-slider.js"></script>
        <script src="js/aos.js"></script>
        <script src="js/navbar.js"></script>
        <script src="js/counter.js"></script>
        <script src="js/custom.js"></script>
    </body>

    <script>
        let sidebar = document.querySelector(".sidebar");
        let closeBtn = document.querySelector("#btn");
        let searchBtn = document.querySelector(".bx-search");

        closeBtn.addEventListener("click", () => {
            sidebar.classList.toggle("open");
            menuBtnChange(); //calling the function(optional)
        });

        searchBtn.addEventListener("click", () => {
            // Sidebar open when you click on the search iocn
            sidebar.classList.toggle("open");
            menuBtnChange(); //calling the function(optional)
        });

        // following are the code to change sidebar button(optional)
        function menuBtnChange() {
            if (sidebar.classList.contains("open")) {
                closeBtn.classList.replace("fa-bars", "fa-times");
            } else {
                closeBtn.classList.replace("fa-times", "fa-bars");
            }
        }


    </script>
</html>
