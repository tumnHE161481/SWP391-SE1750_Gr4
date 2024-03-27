<%-- 
    Document   : SeNews
    Created on : Jan 18, 2024, 2:59:38 PM
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

            .user-info {
                display: flex;
                flex-direction: column;
                align-items: center; /* Center items horizontally */
                text-align: center;  /* Center text within the container */
                background-color: #f9f9f9; /* Background color */
                border-radius: 10px; /* Optional: Add rounded corners */
                box-shadow: 0 0 12px rgba(0, 0, 0, 0.1); /* Optional: Add box shadow */
                padding: 20px; /* Optional: Add padding */
                max-width: 600px; /* Optional: Set max-width */
                margin: 20px auto; /* Center the container */
            }
            .user-info p {
                font-size: 20px;  /* Increase paragraph font size */
                color: green;     /* Change color to green */
                margin-bottom: 12px;
            }

            @media (max-width: 768px) {
                .renter-info {
                    max-width: 100%;
                }
            }
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
                        <a href="renterhome" class="logo m-0 float-start">GreenRoom</a>

                        <ul class="js-clone-nav d-none d-lg-inline-block text-start site-menu float-end">
                            <li><a href="renterhome">Home</a></li>
                            <li><a href="">Room</a></li>
                            <li><a href="bill-list">Payment</a></li>
                            <li><a href="request">Send Request</a></li>
                            <li><a href="">Guideline&Rule</a></li>
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


        <div class="PaddingMenu" style="background-image: url(''); height: 100px; padding: 40px;">
            <!-- Content of PaddingMenu -->
        </div>
        <!-- Content section -->
        <!--        <div class="personal-info">
        <%-- Iterate over the list of users --%>
        <c:forEach items="${listBill}" var="bill">
            <div class="info-container" >
            <%-- First div with general user information on the left --%>
            <div class="user-info">
                <h3>ID: ${bill.billID}</h3>
                <p>Total: ${bill.total}</p>
                <p>Deadline ${bill.deadline}</p>
                <p>Room: ${bill.roomID}</p>
            </div>
        </div>
        </c:forEach>
    </div>-->

        <!-- News section -->
        <div class="tabular--wrapper">
            <div class="table-container">
                <div class="section bg-light">
                    <div class="container">
                        <div class="row">
                            <c:forEach items="${listBill}" var="bill">
                                <c:if test="${bill.payAt eq null}">
                                    <div class="col-6 col-lg-3" data-aos="fade-up" data-aos-delay="300">
                                        <div class="box-feature mb-4">
                                            <span class="flaticon-house mb-4 d-block"></span>
                                            <h3 class="text-black mb-3 font-weight-bold">ID: ${bill.billID}</h3>
                                            <p class="text-black-50">Wat ${bill.total}</p>
                                            <p class="text-black-50">Total: ${bill.total}</p>
                                            <p class="text-black-50">Deadline ${bill.deadline}</p>
                                            <p class="text-black-50">Room: ${bill.roomID}</p>
                                            <p>
                                                <a href="payment?id=${bill.billID}" class="learn-more">Pay</a>
                                                <a href="#" data-bs-toggle="modal" data-bs-target="#billDetailModal${bill.billID}" class="learn-more">Details</a>
                                            </p>
                                        </div>
                                    </div>

                                    <!-- Modal for this bill -->
                                    <div class="modal fade" id="billDetailModal${bill.billID}" tabindex="-1" aria-labelledby="billDetailModalLabel${bill.billID}" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="billDetailModalLabel${bill.billID}">Bill Details</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <!-- Content for displaying bill details will go here -->
                                                    <div>
                                                        <p>ID: ${bill.billID}</p>
                                                        <p>Total: ${bill.total}</p>
                                                        <p>Deadline: ${bill.deadline}</p>
                                                        <p>Electric: ${bill.electric}</p>
                                                        <p>Water: ${bill.water}</p>
                                                        <p>RoomFee: ${bill.roomFee}</p>
                                                        <p>PenMoney: ${bill.penMoney}</p>
                                                        <p>Other: ${bill.other}</p>
                                                        <p>Room: ${bill.roomID}</p>
                                                        <!-- Add more details as needed -->
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </c:if>
                            </c:forEach>

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