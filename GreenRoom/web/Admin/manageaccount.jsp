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
                    <a href="manageaccount" style="background-color: white">
                        <i class="fa-regular fa-address-book" style=" color: black"></i>
                        <span class="links_name" style=" color: black">Account</span>
                    </a>
                    <span class="tooltip">Account</span>
                </li>
                <li>
                    <a href="manageroom">
                        <i class="fa-solid fa-house-user"></i>
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
                <!--Table Content-->
                <div class="tabular--wrapper">
                    <h2 class="main--title" style="padding-bottom: 0px; margin-bottom: 30px">Account List</h2>
                    <form method="post" action="manageaccount" class="w-100">
                        <div class="row h-100" style="margin-bottom: 30px">
                            <div class="col-12"> 
                                <h4 class="main--title" style="padding-bottom: 0px; margin-bottom: 0px">&nbsp;Search:</h4>
                                
                                <div class="search-box">
                                    <button class="btn-search"><i class="fa-solid fa-magnifying-glass"></i></button>
                                    <input type="text" class="input-search" name="txtSearch" placeholder="Enter name or mail" value="${param.txtSearch}">
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
                    <div class="table-container">
                        <table>
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Image</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Role</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="user" items="${manageAccount}" varStatus="loop" >
                                    <c:set var="id" value="${user.userID}"/>
                                    <tr>
                                        <td style="text-align: center">${loop.index + 1}</td>
                                        <td style="padding: 20px 0px "><img style="height: 100px; width: 100px; border-radius: 50%; object-fit: cover" src=${user.userAvatar}></td>
                                        <td style="font-weight: bold">${user.userName}</td>
                                        <td>${user.account.userMail}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${user.account.userRole == 1}">
                                                    <div>Renter</div>
                                                </c:when>
                                                <c:when test="${user.account.userRole == 2}">
                                                    <div>Security</div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div>Unknown</div>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td><c:choose>
                                                <c:when test="${user.account.userRole == 1}">
                                                    <a style="text-decoration: none" href="renterdetail?id=${id}"><i class="fa-solid fa-circle-info"></i>&nbsp;Detail</a>
                                                </c:when>
                                                <c:when test="${user.account.userRole == 2}">
                                                    <a style="text-decoration: none" href="adsedetail?id=${id}"><i class="fa-solid fa-circle-info"></i>&nbsp;Detail</a>
                                                </c:when>
                                                <c:otherwise>
                                                    <div>Unknown</div>
                                                </c:otherwise>
                                            </c:choose></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
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
