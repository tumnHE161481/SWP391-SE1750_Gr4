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
                        <h1 class="heading" data-aos="fade-up">Room Detail</h1>

                        <nav aria-label="breadcrumb" data-aos="fade-up" data-aos-delay="200">
                            <ol class="breadcrumb text-center justify-content-center">

                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>

        <c:set var="rd" value="${requestScope.detail}"></c:set>
        <c:set var="id" value="${rd.roomID}"></c:set>
            <div class="container">
                <div class="row flex-lg-nowrap">
                    <div class="col">
                        <div class="row">
                            <div class="col mb-3">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="e-profile">
                                            <div class="row">
                                                <div class="col-12" style=" height: 400px">
                                                    <img class="w-100 h-100" src="${rd.roomImg}"/>
                                            </div>
                                        </div>

                                        <div class="tab-content pt-3">
                                            <div class="tab-pane active">
                                                <form class="form" novalidate="">
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="row">
                                                                <div class="col-6">
                                                                    <div class="form-group">
                                                                        <label>Floor:</label>
                                                                        <input readonly class="form-control" type="text" name="name" value="${rd.roomFloor}">
                                                                    </div>
                                                                </div>
                                                                <div class="col-6">
                                                                    <div class="form-group">
                                                                        <label>Room Number:</label>
                                                                        <input readonly class="form-control" type="text" name="name" value="${rd.roomNumber}">
                                                                    </div>
                                                                </div>

                                                            </div>
                                                            <div class="row">           
                                                                <div class="col-6">
                                                                    <div class="form-group">
                                                                        <label>Room Size:</label>
                                                                        <c:choose>
                                                                            <c:when test="${rd.roomSize == 1}">
                                                                                <input readonly class="form-control" type="text" name="username"  value="Small">
                                                                            </c:when>
                                                                            <c:when test="${rd.roomSize == 2}">
                                                                                <input readonly class="form-control" type="text" name="username"  value="Medium">
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <input readonly class="form-control" type="text" name="username"  value="Big">
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </div>
                                                                </div>
                                                                <div class="col-6">
                                                                    <div class="form-group">
                                                                        <label>Total Room members:</label>
                                                                        <input readonly class="form-control" type="text" name="name" value="${rd.total}">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row" style="margin-top: 80px">
                                                        <c:choose>
                                                            <c:when test="${rd.total > 0}">
                                                                <h3>Here is room member(s):</h3>
                                                            </c:when>
                                                            <c:when test="${rd.roomSize == 0}">
                                                                <div></div>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <div></div>
                                                            </c:otherwise>
                                                        </c:choose>
                                                        <c:forEach var="user" items="${renterInThatRoom}">
                                                            <div class="col-3">
                                                                <div class="card h-100 w-100">
                                                                    <img src=${user.userAvatar} class="card-img-top" style= "height: 160px; width: 100%" alt="...">
                                                                    <div class="card-body">
                                                                        <p class="card-title">${user.userName}<p>
                                                                            <a href="adrenteredit?id=${user.userID}" class="btn btn-primary">Change room</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </c:forEach>

                                                    </div>
                                                    <div class="row" style="margin-top: 80px">
                                                        <h3>Item(s)in this room(s):</h3>                                                                           
                                                        <c:forEach var="it" items="${itemInThatRoom}">
                                                            <div class="col-2" style="margin-top: 10px ">
                                                                <div class="card h-100 w-100">
                                                                    <img src=${it.item.itemImg} class="card-img-top" style= "height: 160px; width: 100%" alt="...">
                                                                    <div class="card-body d-flex align-items-center justify-content-center" style="background-color: #20c997">
                                                                        <p class="card-title" style="color: white; font-size:16px">${it.item.itemName} x ${it.roomitem.quantity} </p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </c:forEach>

                                                    </div>
                                                </form>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row" style="margin-bottom: 100px">
                            <div class="col-6">
                                <div class="card">
                                    <div class="card-body">
                                        <h6 class="card-title font-weight-bold">Support</h6>
                                        <p class="card-text">Edit room information and item(s) in that room too.</p>
                                        <div class="d-flex justify-content-center gap-4">
                                            <a href="manageroom" type="button" class="btn btn-danger"><i class="fa-solid fa-chevron-left"></i>&nbsp;Back</a>
                                            <a href="editroom?id=${id}" type="button" class="btn btn-primary"><i class="fa-regular fa-pen-to-square"></i> &nbsp;Edit</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="card">
                                    <div class="card-body">
                                        <h6 class="card-title font-weight-bold">Go to see room fee history:</h6>
                                        <p class="card-text" style="font-style: italic">(*)Only have renter live in here can go to it</p>
                                        <c:choose>
                                            <c:when test="${rd.total > 0}">
                                                <div class="d-flex justify-content-center gap-4">
                                                    <a href="roomfee?id=${rd.roomID}" type="button" class="btn btn-success"><i class="fa-regular fa-eye"></i>&nbsp;Click to see</a>
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="d-flex justify-content-center gap-4">
                                                    <button class="btn btn-warning"><i class="fa-regular fa-eye"></i>&nbsp; Sorry no one live in here to do that action</button>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>

                                    </div>
                                </div>
                            </div>
                        </div>
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
