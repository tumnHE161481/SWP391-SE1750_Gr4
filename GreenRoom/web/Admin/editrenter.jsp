<%-- 
    Document   : managerenter
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
        <title>Manage Renter</title>
        <link
            rel="stylesheet"
            type="text/css"
            href="./bootstrap-5.0.2-dist/css/bootstrap.min.css"
            />
        <link rel="stylesheet" href="./CSS/Admin.css"/>
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
                    <a href="managerenter" style="background-color: white">
                        <i class="fa-regular fa-address-book" style=" color: black"></i>
                        <span class="links_name" style=" color: black">Renter</span>
                    </a>
                    <span class="tooltip">Renter</span>
                </li>
                <li>
                    <a href="#">
                        <i class="fa-solid fa-house-user"></i>
                        <span class="links_name">Room</span>
                    </a>
                    <span class="tooltip">Room</span>
                </li>
                <li>
                    <a href="#">
                        <i class="fa-solid fa-shield-halved"></i>
                        <span class="links_name">Security</span>
                    </a>
                    <span class="tooltip">Security</span>
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
                        <img src="./Image/avatar8.jpg" alt="admin" style="height: 65px !important; width: 65px !important; margin-right: 20px"/>
                        <div>
                            <span>Admin Home</span>
                            <h2>Welcome !</h2>
                        </div>
                    </div>
                </div>
                <c:set var="renterList" value="${requestScope.detail}"></c:set>
                <c:forEach var="rdl" items="${renterList}">
                    <c:set var="id" value="${rdl.userID}"></c:set>
                        <div class="container">
                            <div class="row flex-lg-nowrap">
                                <div class="col">
                                    <div class="row">
                                        <div class="col mb-3">
                                            <div class="card">
                                                <div class="card-body">
                                                    <div class="e-profile">
                                                        <div class="row">
                                                            <div class="col-12 col-sm-auto mb-3">
                                                                <div class="mx-auto" style="width: 140px;">
                                                                    <div class="d-flex justify-content-center align-items-center rounded" style="height: 140px; background-color: rgb(233, 236, 239);">
                                                                        <img class="w-100 h-100" src="${rdl.userAvatar}"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col justify-content-between mb-3">
                                                            <div class="text-center text-sm-left mb-2 mb-sm-0">
                                                                <h4 class="pt-sm-2 pb-1 mb-0 text-nowrap">
                                                                    ${rdl.userName}</h4>
                                                                <p class="mb-0">${rdl.account.userMail}</p>
                                                                <div class="text-muted">
                                                                    <small>
                                                                        RenterID: ${rdl.renter.renterID} &nbsp;
                                                                        <c:choose>
                                                                            <c:when test="${rdl.renter.renterStatus}">
                                                                                <i style="color: rgb(44, 223, 44)" class="fa-solid fa-user-check"></i>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <i style="color: rgb(172, 14, 14)" class="fa-solid fa-user-slash"></i>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </small>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="tab-content pt-3">
                                                        <div class="tab-pane active">
                                                            <form class="form" novalidate="">
                                                                <div class="row">
                                                                    <div class="col">
                                                                        <div class="row" style="margin-bottom: 40px">  
                                                                            <div class="col-6">
                                                                                <div class="form-group">
                                                                                    <label>Account status: </label>
                                                                                    <select onchange="change" id="renterStatus" name="renterStatus" class="w-100" style="background-color: #e6e9e9; padding: 6px 12px; border-radius: 5px; border: 1px solid #ced4da;">
                                                                                        <option style="color: green" value="${rdl.renter.renterStatus}" ${rdl.renter.renterStatus ? 'selected' : ''}>Active&nbsp;&#10003;</option>
                                                                                        <option style="color: red" value="${!rdl.renter.renterStatus}" ${!rdl.renter.renterStatus ? 'selected' : ''}>Deactive&nbsp;&#10007;</option>
                                                                                    </select>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-6">
                                                                                <div class="form-group">
                                                                                    <label>Room Number: </label>
                                                                                    <c:choose>
                                                                                        <c:when test="${rdl.renter.renterStatus}">
                                                                                            <select id="roomNumberSection" class="w-100" style="background-color: #e6e9e9; padding: 6px 12px; border-radius: 5px; border: 1px solid #ced4da;">
                                                                                                <c:forEach var="room" items="${roomNumberList}">
                                                                                                    <option  value="${room.roomNumber}">${room.roomNumber}</option>
                                                                                                </c:forEach>
                                                                                            </select>

                                                                                        </c:when>
                                                                                        <c:otherwise>                      
                                                                                            <div class="w-100" style="background-color: #e6e9e9; padding: 6px 12px; border-radius: 5px; border: 1px solid #ced4da;"><i style="font-weight: bolder;" class="fa-solid fa-ban"></i></div>
                                                                                         <small style="color: graytext">Active account to edit room for renter</small>   
                                                                                        </c:otherwise>
                                                                                        </c:choose>
                                                                                </div>
                                                                            </div>
                                                                        </div> 
                                                                    </div>
                                                                </div>
                                                            </form>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-12 col-md-3 mb-3">
                                        <div class="card">
                                            <div class="card-body">
                                                <h6 class="card-title font-weight-bold">Choose</h6>
                                                <p class="card-text">Submit or Cancel edit renter account status and add room for them.</p>
                                                <div class="d-flex justify-content-between">
                                                    <a href="renterdetail?id=${id}" type="button" class="btn btn-danger">Cancel</a>
                                                    <a type="button" class="btn btn-success">Submit change</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </section>
        <script>
            let sidebar = document.querySelector(".sidebar");
            let closeBtn = document.querySelector("#btn");
            let searchBtn = document.querySelector(".bx-search");

            closeBtn.addEventListener("click", () => {
                sidebar.classList.toggle("open");
                menuBtnChange(); // calling the function (optional)
            });

            searchBtn.addEventListener("click", () => {
                // Sidebar open when you click on the search icon
                sidebar.classList.toggle("open");
                menuBtnChange(); // calling the function (optional)
            });

            // Function to change sidebar button (optional)
            function menuBtnChange() {
                if (sidebar.classList.contains("open")) {
                    closeBtn.classList.replace("fa-bars", "fa-times");
                } else {
                    closeBtn.classList.replace("fa-times", "fa-bars");
                }
            }

            function toggleRoomNumberVisibility() {
                var accountStatusSelect = document.getElementById("renterStatus");
                var roomNumberSection = document.getElementById("roomNumberSection");

                // Check if the selected value is "false" (i.e., Deactive)
                if (accountStatusSelect.value === "true") {
                    roomNumberSection.style.display = "block";
                } else {
                    roomNumberSection.style.display = "none";
                }
            }

            document.getElementById("renterStatus").addEventListener("change", toggleRoomNumberVisibility);
            toggleRoomNumberVisibility();
        </script>

    </body>
</html>
