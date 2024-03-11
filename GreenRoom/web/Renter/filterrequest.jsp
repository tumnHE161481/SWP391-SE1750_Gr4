<%-- 
    Document   : SeNews
    Created on : Jan 18, 2024, 2:59:38 PM
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
        <script
            type="text/javascript"
            src="./bootstrap-5.0.2-dist/js/bootstrap.min.js"
        ></script>
        <link
            href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css"
            rel="stylesheet"
            />
        <link rel="stylesheet" href="./fontawesome-free-6.5.1-web/css/all.css">


        <title>GreenRoom</title>
        <link rel="icon" href="home-guest/favicon.png">
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
            .pagination{
                display: inline-block;
            }
            .pagination a{
                color: #007bff;
                font-size: 22px;
                float: left;
                padding: 8px 16px;
                text-decoration: none;
                border: 1px solid #003333;
            }
            .pagination a.active{
                background-color: #4CAF50;
            }
            .pagination a:hover:not(.active){
                background-color: #019f6c;
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
                        <a href="Homepage.html" class="logo m-0 float-start">GreenRoom</a>

                        <ul class="js-clone-nav d-none d-lg-inline-block text-start site-menu float-end">
                            <li><a href="Homepage.html">Home</a></li>
                            <li><a href="RoomList.html">Room</a></li>
                            <li><a href="Payment.html">Payment</a></li>
                            <li class="active"><a href="request">Send Request</a></li>
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


        <!--        <div class="hero page-inner overlay" style="background-image: url('images/hero_bg_3.jpg');">
        
                    <div class="container">
                        <div class="row justify-content-center align-items-center">
                            <div class="col-lg-9 text-center mt-5">
                                <h1 class="heading" data-aos="fade-up">Request</h1>
        
                                <nav aria-label="breadcrumb" data-aos="fade-up" data-aos-delay="200">
                                    <ol class="breadcrumb text-center justify-content-center">
        
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>-->


       	<section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6 text-center mb-5">
                        <h2 class="heading-section">Your Request(s)</h2>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-12">
                        <div class="wrapper">
                            <div class="row no-gutters">
                                <div class="col-lg-8 col-md-7 order-md-last d-flex align-items-stretch">
                                    <div class="contact-wrap w-100" style="padding: 0px 48px">
                                        <div class="container d-flex justify-content-center">
                                            <div class="row">
                                                <div class="col-md-12" style="width: 100%">

                                                    <div class="card2">
                                                        <div class="card-body2">
                                                            <h4 class="card-title2">Recent Requests</h4>
                                                            <h6 class="card-subtitle2">Latest Request that created by user</h6>
                                                            <div class="row">
                                                                <div class="col-lg-6 col-md-12">
                                                                    <form method="post" action="searchrequest" class="w-100">
                                                                        <div class="row h-100" style="margin-bottom: 30px">
                                                                            <div class="col-12"> 
                                                                                <h6 class="main--title" style="padding-bottom: 0px; margin-bottom: 0px">&nbsp;Search:</h6>

                                                                                <div class="d-flex" >
                                                                                    <button class="btn-search"><i class="fa-solid fa-magnifying-glass"></i></button>
                                                                                    <input type="text" class="form-control w-75" name="txtSearch" placeholder="Enter name or mail" value="${param.txtSearch}">
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-12">
                                                                                <div class="row">
                                                                                    <div class="col-12 d-flex gap-3">
                                                                                        Result Found: ${searchCount}
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                                <div class="col-lg-6 col-md-12">
                                                                    <form method="get" action="filterrequest" class="w-100">
                                                                        <div class="row h-100" style="margin-bottom: 30px">
                                                                            <div class="col-12"> 
                                                                                <h6 class="main--title" style="padding-bottom: 0px; margin-bottom: 0px">&nbsp;Filter by status:</h6>
                                                                                <div class="d-flex">
                                                                                    <button type="submit" class="btn btn-info" style="background: #666; color: #FFF" type="submit">Filter</button>
                                                                                    <select name="status" class="form-control w-75">
                                                                                        <option value="">All</option>
                                                                                        <c:forEach items="${allStatus}" var="st">
                                                                                            <option value="${st.resStatus}">${st.resStatus}</option>
                                                                                        </c:forEach>
                                                                                    </select>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                            <small style="font-style: italic; color: #EF3159">(*) you can edit or unsend request(s) only when request status is still pending</small>
                                                        </div>
                                                        <c:set var="page" value="${requestScope.page}"></c:set>
                                                            <div class="comment-widgets m-b-20">
                                                            <c:forEach var="req" items="${requestScope.requestList}">
                                                                <div class="d-flex flex-row comment-row" style="margin-top: 20px">
                                                                    <div class="p-2"><span class="round2"><img src="${sessionScope.avatar}" alt="user" height="50" width="50" style="object-fit: cover"></span></div>
                                                                    <div class="comment-text w-100">
                                                                        <div class="d-flex justify-content-between">
                                                                            <div>
                                                                                <h5>${req.title}</h5>     
                                                                                <c:choose>
                                                                                    <c:when test="${req.requestType == 1}">
                                                                                        <span class="label2" style="background-color: #666">Need to Repair</span>
                                                                                    </c:when>
                                                                                    <c:when test="${req.requestType == 2}">
                                                                                        <span class="label2" style="background-color: #666">Report someone</span>
                                                                                    </c:when>
                                                                                    <c:when test="${req.requestType == 3}">
                                                                                        <span class="label2" style="background-color: #666">Rental housing support</span>
                                                                                    </c:when>
                                                                                    <c:when test="${req.requestType == 4}">
                                                                                        <span class="label2" style="background-color: #666">Checkout or Change Room</span>
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        <span class="label2" style="background-color: #666">Other</span>
                                                                                    </c:otherwise>
                                                                                </c:choose>                                                               
                                                                                <c:choose>
                                                                                    <c:when test="${req.resStatus eq 'Pending'}">
                                                                                        <span class="label2 label-info">Pending</span>
                                                                                    </c:when>
                                                                                    <c:when test="${req.resStatus eq 'Approved'}">
                                                                                        <span class="label2 label-success">Approved</span>
                                                                                    </c:when>
                                                                                    <c:when test="${req.resStatus eq 'Rejected'}">
                                                                                        <span class="label2 label-danger">Rejected</span>
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        <span class="label2 label-info" style="background-color: #666">Other</span>
                                                                                    </c:otherwise>
                                                                                </c:choose>
                                                                                <br/>
                                                                                <small style="font-style: italic" class="date">${req.createAt}</small>
                                                                            </div>
                                                                            <div>
                                                                                <c:choose>
                                                                                    <c:when test="${req.resStatus eq 'Pending'}">
                                                                                        <a class="btn btn-primary" style="color: #FFF;height: auto" href="editrequest?id=${req.requestID}"><i class="fa fa-pencil"></i>&nbsp;Edit</a>
                                                                                        <a class="btn btn-danger" style="color: #FFF;height: auto" href="deleterequest?id=${req.requestID}" ><i class="fa fa-trash"></i>&nbsp;Remove</a>
                                                                                    </c:when>
                                                                                    <c:otherwise>

                                                                                    </c:otherwise>
                                                                                </c:choose>
                                                                            </div>
                                                                        </div>

                                                                        <p class="m-b-5 m-t-10">${req.description}</p>
                                                                    </div>
                                                                </div>
                                                            </c:forEach>
                                                        </div>
                                                        <c:set var="status" value="${requestScope.status}"></c:set>
                                                            <div class="pagination">
                                                            <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                                                                <a class="${i==page?"active":""}" href="filterrequest?page=${i}&status=${status}">${i}</a>
                                                            </c:forEach>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>


                                        <div class="row" style="margin-top:50px ">
                                            <div class="col-md-12">
                                                <div class="form-group d-flex justify-content-center">
                                                    <a style="padding: 10px 20px; font-size: 18px" href="request" class="btn btn-danger"><i class="fa-solid fa-chevron-left"></i>&nbsp;Back To Form</a>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-5 d-flex align-items-stretch">
                                    <div class="info-wrap w-100 p-md-5 p-4" style="background-color :#005555; color: #FFF" >
                                        <h3 style="color: #FFF">Contact GreenRoom Owner</h3>
                                        <p class="mb-4">If it is an emergency, please contact the information below!</p>
                                        <div class="dbox w-100 d-flex align-items-start">
                                            <div class="icon d-flex align-items-center justify-content-center">
                                                <span class="fa fa-map-marker"></span>
                                            </div>
                                            <div class="text pl-3">
                                                <p><span>Address:</span> 198 Pho Vong, Thanh Xuan, Ha Noi</p>
                                            </div>
                                        </div>
                                        <div class="dbox w-100 d-flex align-items-center">
                                            <div class="icon d-flex align-items-center justify-content-center">
                                                <span class="fa fa-phone"></span>
                                            </div>
                                            <div class="text pl-3">
                                                <p><span>Phone:</span> <a href="tel://1234567920">+ 1235 2355 98</a></p>
                                            </div>
                                        </div>
                                        <div class="dbox w-100 d-flex align-items-center">
                                            <div class="icon d-flex align-items-center justify-content-center">
                                                <span class="fa fa-paper-plane"></span>
                                            </div>
                                            <div class="text pl-3">
                                                <p><span>Email:</span> <a href="mailto:info@yoursite.com">maituboss@gmail.com</a></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
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

</html>