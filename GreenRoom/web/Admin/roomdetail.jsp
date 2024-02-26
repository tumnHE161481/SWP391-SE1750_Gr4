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
                        <span class="links_name" style=" color: black">Account</span>
                    </a>
                    <span class="tooltip">Account</span>
                </li>
                <li>
                    <a href="manageroom" style="background-color: white">
                        <i class="fa-solid fa-house-user" style=" color: black"></i>
                        <span class="links_name">Room</span>
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
                                                                    <div class="col-3" style="margin-top: 10px ">
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

                                <div class="col-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <h6 class="card-title font-weight-bold">Support</h6>
                                            <p class="card-text">Edit room information and item(s) in that room too.</p>
                                            <div class="d-flex justify-content-center gap-4">
                                                <a href="manageroom" type="button" class="btn btn-danger"><i class="fa-solid fa-chevron-left"></i>&nbsp;Back</a>
                                                <a href="adrooomedit?id=${id}" type="button" class="btn btn-primary"><i class="fa-regular fa-pen-to-square"></i> &nbsp;Edit</a>
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
