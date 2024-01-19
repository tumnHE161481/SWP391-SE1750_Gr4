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
        <title>Manage Renter</title>
        <link
            rel="stylesheet"
            type="text/css"
            href="./bootstrap-5.0.2-dist/css/bootstrap.min.css"
            />
        <link rel="stylesheet" type="text/css" href="./CSS/Admin/Admin.css" />
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
                    <a href="">
                        <i class="fa-regular fa-address-book"></i>
                        <span class="links_name">Renter</span>
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
                    <div class="header--title">
                        <div>
                            <span>Admin Home</span>
                            <h2>Welcome !</h2>
                        </div>
                        <img src="###" alt="" />
                    </div>
                </div>
                <!--Table Content-->
                <div class="tabular--wrapper">
                    <h3 class="main--title">Renter List</h3>
                    <div class="search--box">
                        <input type="text" placeholder="Search" />
                        <button><i class="fa-solid fa-magnifying-glass"></i></button>
                    </div>
                    <div class="table-container">
                        <table>
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Image</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Have Room</th>
                                    <th>Account status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="renter" items="${manageRenter}" varStatus="loop" >
                                    <tr>
                                        <td>${loop.index + 1}</td>
                                        <td><img style="height: 100px; width: 100%;" src=${renter.userAvatar}></td>
                                        <td>${renter.userName}</td>
                                        <td>${renter.userMail}</td>
                                        <td><c:choose>
                                                <c:when test="${renter.renterHaveRoom}">
                                                    <span style="color: green;">Yes</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span style="color: red;">No</span>
                                                </c:otherwise>
                                            </c:choose></td>
                                        <td><c:choose>
                                                <c:when test="${renter.renterStatus}">
                                                    <span style="color: green;">Active</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span style="color: red;">Inactive</span>
                                                </c:otherwise>
                                            </c:choose></td>
                                        <td>
                                            <div class="d-flex justify-content-center gap-1">
                                                <button>Ban</button>
                                                <button>Edit</button>
                                            </div>
                                        </td>
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
