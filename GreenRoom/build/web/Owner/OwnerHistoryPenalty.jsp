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

        <title>Renter List</title>
        <style>
            tbody tr:nth-child(odd) {
                background-color: #f9f9f9;
                /* Set background color for odd rows */
            }
            /* Style for user details container */
            .user-details {
                margin-bottom: 20px;
            }

            /* Style for input boxes */
            .penalty_input {
                margin-bottom: 15px;
            }

            .penalty_input .details {
                display: inline-block;
                width: 150px; /* Adjust width as needed */
            }

            .penalty_input input[type="text"],
            .penalty_input textarea,
            .penalty_input select {
                width: calc(100% - 150px); /* Adjust width as needed */
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
                margin-left: 10px; /* Adjust margin as needed */
                font-size: 16px;
            }

            /* Style for the submit button */
            .profile-button {
                background-color: #007bff;
                color: #fff;
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
            }

            .profile-button:hover {
                background-color: #0056b3;
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
                        <a href="/Owner/OwHome.jsp" class="logo m-0 float-start">Green Room</a>

                        <ul class="js-clone-nav d-none d-lg-inline-block text-start site-menu float-end">
                            <li class="active"><a href="/Owner/OwHome.jsp">Home</a></li>
                            <li class="active"><a href="listroom">Room</a></li>
                            <li class="active"><a href="OwnerRenterList">Renter</a></li>
                            <li><a href="Guide.html">Guide</a></li>
                            <li><a href="News.html">News</a></li>
                            <li><a href="News.html">Log Out</a></li>
                        </ul>

                        <a href="#" class="burger light me-auto float-end mt-1 site-menu-toggle js-menu-toggle d-inline-block d-lg-none" data-toggle="collapse" data-target="#main-navbar">
                            <span></span>
                        </a>

                    </div>
                </div>
            </div>
        </nav>
        <div class="section">
            <div class="container">
                <div class="row  align-items-center pt-5">
                    <div class="col-lg-6">
                        <h2 class="font-weight-bold text-primary heading">History penalty</h2>
                    </div>
                </div>
                <c:set var="r" value="${requestScope.detail}"></c:set>
                <c:set var="rp" value="${requestScope.reportName}"></c:set>
                <c:set var="id" value="${r.userID}"></c:set>

                    <div class="content">

                        <form action="OwnerHistoryPenalty" method="post">
                            <div class="user-details">
                                <div class="penalty_input">
                                    <span class="details">Report </span>
                                    <input type="text" placeholder="" value="${rp.userName}" name="reportID"  readonly>
                            </div>
                            <div class="penalty_input">
                                <span class="details">Accuse </span>
                                <input type="text" placeholder="" name="accuseID" required>
                            </div>

                            <div class="penalty_input d-none" >
                                <span class="details">Room ID</span>
                                <input type="text" placeholder="Enter name rooom" name="roomID" value="${r.roomID}" required>
                            </div>

                            <div class="penalty_input">
                                <span class="details">Violation of Rule</span>
                                <select name="ruleID" class="details" 
                                        required>
                                    <c:forEach var="rn" items="${ruleName}" >
                                        <option value="${rn.ruleID}">${rn.ruleName}</option>

                                    </c:forEach>

                                </select>
                                <!--                                 <input type="text" placeholder="" name="ruleID" required>-->
                            </div>
                            <div class="penalty_input">
                                <span class="details"> Status</span>

                                <select  name="penStatus" class="details"
                                         required>
                                    <option value="false" selected="selected">Unprocessed</option>
                                    <option value="true">Processed</option>
                                </select>
                            </div>
                            <div class="penalty_input">
                                <span class="details">Description</span>

                                <textarea type="text" placeholder="" name="description" required></textarea>
                            </div>
                        </div>

                        <h3  style="color: #FF0E0E; margin-bottom: 20px;">${message}</h3>
                        <input type="submit" value="Add" class="btn btn-success"/>
                                                <a href="OwnerRenterDetail?id=${rp.userID}">Back</a>
                    </form>
                </div>
                <div class="header--title d-flex align-items-center">
                    <c:forEach var="owner" items="${OwnerImage}">
                        <img src="${owner.userAvatar}" alt="owner" style="height: 65px !important; width: 65px !important; margin-right: 20px" />
                        <div>
                            <span>Owner: ${owner.userName}</span>
                        </div>
                    </c:forEach>
                </div>

                <div class="row">

                    <div class="col-12">


                        <div class="property-slider-wrap">




                            <table style="width: 100%; border-collapse: collapse; margin-top: 20px;">
                                <thead>
                                    <tr>
                                        <th style="padding: 12px; text-align: left; background-color: #f2f2f2;">ID</th>
                                        <th style="padding: 12px; text-align: left; background-color: #f2f2f2;">Accuse </th>                                        
                                        <th style="padding: 12px; text-align: left; background-color: #f2f2f2;">Description</th>                                        
                                        <th style="padding: 12px; text-align: left; background-color: #f2f2f2;">Score Change</th>                                               
                                        <th style="padding: 12px; text-align: left; background-color: #f2f2f2;">Rule Name</th>
                                        <th style="padding: 12px; text-align: left; background-color: #f2f2f2;">Status</th> 
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="ac" items="${OwnerHistoryPenalty}" varStatus="loop">
                                        <c:set var="sid" value="${ac.user.userID}"></c:set>
                                            <tr style="border-bottom: 1px solid #ddd; background-color: #f9f9f9;">
                                                <td style="padding: 12px; text-align: left;">${loop.index + 1}</td>
                                            <td style="padding: 12px; text-align: left;">${ac.user.userName}</td>
                                            <td style="padding: 12px; text-align: left;">${ac.description}</td>
                                            <td style="padding: 12px; text-align: left;">${ac.rule.scoreChange}</td>
                                            <td style="padding: 12px; text-align: left; ">${ac.rule.ruleName}</td>
                                            <td style="padding: 12px; text-align: left;">
                                                <c:choose>
                                                    <c:when test="${ac.penStatus}">
                                                        <div value="true">Processed</div>
                                                    </c:when>
                                                    <c:otherwise> 
                                                        <div value="false" selected="selected">Unprocessed</div>
                                                    </c:otherwise>
                                                </c:choose></td>
                                        </tr>
                                        <!-- Additional rows can follow the same pattern -->
                                    </c:forEach>
                                </tbody>
                            </table>


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