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
        <link href="https://cdn.jsdelivr.net/gh/eliyantosarage/font-awesome-pro@main/fontawesome-pro-6.5.1-web/css/all.min.css" rel="stylesheet">
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
                        <span class="links_name" style=" color: black">Renter</span>
                    </a>
                    <span class="tooltip">Renter</span>
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
                <c:set var="sd" value="${requestScope.detail}"></c:set>
                    <div class="container">
                        <div class="row flex-lg-nowrap">
                            <div class="col">
                                <form action="newaccdetail" method="post">
                                    <div class="row">
                                        <div class="col mb-3">
                                            <div class="card">
                                                <div class="card-body">
                                                    <div class="e-profile">
                                                        <div class="row">
                                                            <div class="col-12 col-sm-auto mb-3">
                                                                <div class="mx-auto" style="width: 140px;">
                                                                    <div class="d-flex justify-content-center align-items-center rounded" style="height: 140px; background-color: rgb(233, 236, 239);">
                                                                        <img class="w-100 h-100" src="${sd.userAvatar}"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col justify-content-between mb-3">
                                                            <div class="text-center text-sm-left mb-2 mb-sm-0">
                                                                <h4 class="pt-sm-2 pb-1 mb-0 text-nowrap">
                                                                    ${sd.userName}</h4>
                                                                <p class="mb-0">${sd.account.userMail}</p>
                                                                <div class="text-muted"><small>
                                                                        UnknownRoleID: ${sd.userID} &nbsp;
                                                                        <i class="fa-solid fa-user-plus" style="color: #74C0FC;"></i>
                                                                    </small></div>
                                                            </div>
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
                                                                                    <label>Date of birth:</label>
                                                                                    <input readonly class="form-control" type="date" name="name" value="${sd.userBirth}">
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-6">
                                                                                <div class="form-group">
                                                                                    <label>Gender:</label>
                                                                                    <input readonly class="form-control" type="text" name="name" value="${sd.userGender}">
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="row">           
                                                                            <div class="col-12">
                                                                                <div class="form-group">
                                                                                    <label>Address: </label>
                                                                                    <input readonly class="form-control" type="text" name="username"  value="${sd.userAddress}">
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="row" style="margin-bottom: 40px">           
                                                                            <div class="col-6">
                                                                                <div class="form-group">
                                                                                    <label>Contact: </label>
                                                                                    <input readonly class="form-control" type="text" value="${sd.userPhone}">
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-6">
                                                                                <div class="form-group">
                                                                                    <label style="color: red; font-style: italic">(*)Choose Role for this account: </label>
                                                                                    <select onchange="toggleRoomNum()" id="renterStatus" name="userRole" class="w-100" style="background-color: #e6e9e9; padding: 6px 12px; border-radius: 5px; border: 1px solid #ced4da;">
                                                                                        <option value="1" selected>Renter</option>
                                                                                        <option value="2">Security</option>
                                                                                    </select>
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

                                                <h6 class="card-title font-weight-bold">Support</h6>
                                                <p class="card-text">Add or Delete new account.</p>
                                                <div class="d-flex justify-content-center gap-4">
                                                    <a href="manageaccount" type="button" class="btn btn-primary">< Back</a>
                                                    <button type="submit" class="btn btn-success"><i class="fa-solid fa-plus" style="color: #ffffff;"></i>&nbsp;Add</button>
                                                    <a href="" class="btn btn-danger"><i class="fa-regular fa-trash-xmark" style="color: #ffffff;"></i>&nbsp;Delete</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </form> 
                                                                                
                        </div>
                    </div>
                </div>

        </section>
    </div>
                                                                                
</body>
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
    <c:set var="mess" value="${requestScope.updateMessage}"></c:set>
    function doUpdate() {
        if (confirm("Are you sure about this change?")) {
            alert("${mess}");
        }
    }
</script>
</html>
