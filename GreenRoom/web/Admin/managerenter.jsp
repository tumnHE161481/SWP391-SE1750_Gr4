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
        <div class="container">
            <div class="row">
                <div class="col-2">
                    <div class="sidebar">
                        <div class="logo-details">
                            <i class="bx bxl-c-plus-plus icon"></i>
                            <div class="logo_name">GreenHouse</div>
                            <i class="bx bx-menu" id="btn"></i>
                        </div>
                        <ul class="nav-list">
                            <li>
                                <a href="#" style="background-color: #fff;">
                                    <i class="fa-regular fa-user" style="color: #11101d"></i>
                                    <span class="links_name" style="color: #11101d">Manage Renter</span>
                                </a>
                                <span class="tooltip">Manage Renter</span>
                            </li>
                            <li>
                                <a href="./manageroom.html">
                                    <i class="fa-solid fa-person-shelter"></i>
                                    <span class="links_name">Manage Room</span>
                                </a>
                                <span class="tooltip">Manage Room</span>
                            </li>
                            <li>
                                <a href="./managesecurity.html">
                                    <i class="fa-solid fa-person-rifle"></i>
                                    <span class="links_name">Manage Security</span>
                                </a>
                                <span class="tooltip">Manage Security</span>
                            </li>
                            <li class="profile">
                                <div class="profile-details">
                                    <img src="profile.jpg" alt="profileImg" />
                                    <div class="name_job">
                                        <div class="name">Log Out</div>
                                    </div>
                                </div>
                                <i class="bx bx-log-out" id="log_out"></i>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-10 feature-screen">
                    <section class="home-section">
                        <div class="row">
                            <div class="col-12">
                                <h1>Manage Renter</h1>
                            </div>
                            <div class="row">
                                <div class="col-12 d-flex align-items-end">
                                    <button>Search</button>
                                    <input type="text" placeholder="Search by name" />
                                </div>
                            </div>
                        </div>
                        <div class="room-list">
                            <table class="table-bordered">
                                <thead>
                                    <tr>
                                        <th>Id</th>
                                        <th>Image</th>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>Room available</th>
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
                                                        <span style="color: green;">Active</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span style="color: red;">Inactive</span>
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
                                                    <button>Ban thi</button>
                                                    <button>Edit</button>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </section>
                </div>
            </div>
        </div>
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
                    closeBtn.classList.replace("fa-solid fa-bars", "fa-arrow-up-wide-short"); //replacing the iocns class
                } else {
                    closeBtn.classList.replace("fa-arrow-up-wide-short", "fa-solid fa-bars"); //replacing the iocns class
                }
            }
        </script>
    </body>
</html>
