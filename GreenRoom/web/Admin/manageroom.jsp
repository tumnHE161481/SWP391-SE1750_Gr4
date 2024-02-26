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
        <link rel="icon" href="home-guest/favicon.png">
        <title>Green Room</title>
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
        <div class="sidebar">
            <div class="logo-details">
                <i class="fa-brands fa-gofore"></i>
                <div class="logo_name">GreenRoom</div>
                <i class="fa-solid fa-bars" id="btn"></i>
            </div>
            <ul class="nav-list">
                <li>
                    <a href="manageaccount">
                        <i class="fa-regular fa-address-book"></i>
                        <span class="links_name" style=" color: white">Account</span>
                    </a>
                    <span class="tooltip">Account</span>
                </li>
                <li>
                    <a href="manageroom" style="background-color: white">
                        <i class="fa-solid fa-house-user" style=" color: black"></i>
                        <span style=" color: black" class="links_name">Room</span>
                    </a>
                    <span class="tooltip">Room</span>
                </li>
                <li>
                    <a href="#">
                        <i class="fa-solid fa-right-from-bracket"></i>
                        <span class="links_name">Log out</span>
                    </a>
                    <span class="tooltip">Log out</span>
                </li>
            </ul>
        </div>
        <section class="home-section">
            <div class="main--content">
                <div class="header--wrapper">
                    <div class="header--title d-flex align-items-center">
                        <img src="./Image/user/avatar20.jpg" alt="admin" style="height: 65px !important; width: 65px !important; margin-right: 20px"/>
                        <div>
                            <span>Admin Home</span>
                            <h2>Welcome !</h2>
                        </div>
                    </div>
                </div>
                <!--Table Content-->
                <div class="tabular--wrapper">
                    <h3 style="margin-bottom: 40px">Room Management</h3>
                    <div class="col-lg-4">
                        <div class="row">
                            <div class="col-2">
                                <h3>Floor: </h3>
                            </div>
                            <div class="col-10">
                                <div class="d-flex gap-4">
                                    <button type="submit">All</button>
                                    <button type="submit">1,2,3,4</button>
                                </div>
                            </div>
                        </div>
                    </div>
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
        </section>
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
    </body>
</html>
