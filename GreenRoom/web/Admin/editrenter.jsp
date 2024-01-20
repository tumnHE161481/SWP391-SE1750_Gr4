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
                                                                <span style="color: rgb(166, 168, 170); font: bold 8pt Arial;">140x140</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col d-flex flex-column flex-sm-row justify-content-between mb-3">
                                                        <div class="text-center text-sm-left mb-2 mb-sm-0">
                                                            <h4 class="pt-sm-2 pb-1 mb-0 text-nowrap">John Smith</h4>
                                                            <p class="mb-0">@johnny.s</p>
                                                            <div class="text-muted"><small>Last seen 2 hours ago</small></div>
                                                            <div class="mt-2">
                                                                <button class="btn btn-primary" type="button">
                                                                    <i class="fa fa-fw fa-camera"></i>
                                                                    <span>Change Photo</span>
                                                                </button>
                                                            </div>
                                                        </div>
                                                        <div class="text-center text-sm-right">
                                                            <span class="badge badge-secondary">administrator</span>
                                                            <div class="text-muted"><small>Joined 09 Dec 2017</small></div>
                                                        </div>
                                                    </div>
                                                </div>
                                                
                                                <div class="tab-content pt-3">
                                                    <div class="tab-pane active">
                                                        <form class="form" novalidate="">
                                                            <div class="row">
                                                                <div class="col">
                                                                    <div class="row">
                                                                        <div class="col">
                                                                            <div class="form-group">
                                                                                <label>Full Name</label>
                                                                                <input class="form-control" type="text" name="name" placeholder="John Smith" value="John Smith">
                                                                            </div>
                                                                        </div>
                                                                        <div class="col">
                                                                            <div class="form-group">
                                                                                <label>Username</label>
                                                                                <input class="form-control" type="text" name="username" placeholder="johnny.s" value="johnny.s">
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col">
                                                                            <div class="form-group">
                                                                                <label>Email</label>
                                                                                <input class="form-control" type="text" placeholder="user@example.com">
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col mb-3">
                                                                            <div class="form-group">
                                                                                <label>About</label>
                                                                                <textarea class="form-control" rows="5" placeholder="My Bio"></textarea>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-12 col-sm-6 mb-3">
                                                                    <div class="mb-2"><b>Change Password</b></div>
                                                                    <div class="row">
                                                                        <div class="col">
                                                                            <div class="form-group">
                                                                                <label>Current Password</label>
                                                                                <input class="form-control" type="password" placeholder="••••••">
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col">
                                                                            <div class="form-group">
                                                                                <label>New Password</label>
                                                                                <input class="form-control" type="password" placeholder="••••••">
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col">
                                                                            <div class="form-group">
                                                                                <label>Confirm <span class="d-none d-xl-inline">Password</span></label>
                                                                                <input class="form-control" type="password" placeholder="••••••"></div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-12 col-sm-5 offset-sm-1 mb-3">
                                                                    <div class="mb-2"><b>Keeping in Touch</b></div>
                                                                    <div class="row">
                                                                        <div class="col">
                                                                            <label>Email Notifications</label>
                                                                            <div class="custom-controls-stacked px-2">
                                                                                <div class="custom-control custom-checkbox">
                                                                                    <input type="checkbox" class="custom-control-input" id="notifications-blog" checked="">
                                                                                    <label class="custom-control-label" for="notifications-blog">Blog posts</label>
                                                                                </div>
                                                                                <div class="custom-control custom-checkbox">
                                                                                    <input type="checkbox" class="custom-control-input" id="notifications-news" checked="">
                                                                                    <label class="custom-control-label" for="notifications-news">Newsletter</label>
                                                                                </div>
                                                                                <div class="custom-control custom-checkbox">
                                                                                    <input type="checkbox" class="custom-control-input" id="notifications-offers" checked="">
                                                                                    <label class="custom-control-label" for="notifications-offers">Personal Offers</label>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col d-flex justify-content-end">
                                                                    <button class="btn btn-primary" type="submit">Save Changes</button>
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
                                    <div class="card mb-3">
                                        <div class="card-body">
                                            <div class="px-xl-3">
                                                <button class="btn btn-block btn-secondary">
                                                    <i class="fa fa-sign-out"></i>
                                                    <span>Logout</span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-body">
                                            <h6 class="card-title font-weight-bold">Support</h6>
                                            <p class="card-text">Get fast, free help from our friendly assistants.</p>
                                            <button type="button" class="btn btn-primary">Contact Us</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <!--                <div>
                <c:set var="renterList" value="${requestScope.adminrenterdetail}"></c:set>
                <c:forEach var="rdl" items="${detail}">
                   <div>id: ${rdl.userID}</div>
                   <div>name: ${rdl.userName}</div>
                </c:forEach>
        </div>-->

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
                        closeBtn.classList.replace("fa-bars", "fa-times");
                    } else {
                        closeBtn.classList.replace("fa-times", "fa-bars");
                    }
                }
            </script>
    </body>
</html>
