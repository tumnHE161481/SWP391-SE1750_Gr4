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
            href="<%=request.getContextPath()%>/bootstrap-5.0.2-dist/css/bootstrap.min.css"
            />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/CSSTU/Admin.css" />
        <script
            type="text/javascript"
            src="<%=request.getContextPath()%>/bootstrap-5.0.2-dist/js/bootstrap.min.js"
        ></script>
        <link
            href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css"
            rel="stylesheet"
            />
        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/3.1.0/css/font-awesome.min.css" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/fontawesome-free-6.5.1-web/css/all.css">
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
                    <a href="logout">
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
                <!-- tabs -->
                <div class="pcss3t pcss3t-effect-scale pcss3t-theme-1 w-100" style="width: 75%">
                    <input type="radio" name="pcss3t" checked  id="tab1"class="tab-content-first">
                    <label for="tab1"><i class="fa-regular fa-user" style="color: #74C0FC;"></i>Current</label>

                    <input type="radio" name="pcss3t" id="tab2" class="tab-content-2">
                    <label for="tab2"><i class="fa-solid fa-clock" style="color: #74C0FC;"></i>New</label>
                    <!--
                                    <input type="radio" name="pcss3t" id="tab3" class="tab-content-3">
                                    <label for="tab3"><i class="icon-cogs"></i>Einstein</label>
                     
                                    <input type="radio" name="pcss3t" id="tab5" class="tab-content-last">
                                    <label for="tab5"><i class="icon-globe"></i>Newton</label>-->

                    <ul style="height: 1000px">
                        <li class="tab-content tab-content-first typography" style="height: 1000px">
                            <div class="tabular--wrapper">
                                <h2 class="main--title" style="padding-bottom: 0px; margin-bottom: 30px">Current Account List</h2>
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
                                                                <a style="text-decoration: none" href="newaccdetail?id=${id}"><i class="fa-solid fa-circle-info"></i>&nbsp;Detail</a>
                                                            </c:otherwise>
                                                        </c:choose></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="pagination-container">
                                    <ul class="pagination">
                                        <li class="icon">
                                            <a href="#"><span class="fas fa-angle-left"></span>Previous</a>
                                        </li>
                                        <li><a href="#">1</a></li>
                                        <li><a href="#">2</a></li>
                                        <li><a href="#">3</a></li>
                                        <li><a href="#">4</a></li>
                                        <li><a href="#">5</a></li>
                                        <li><a href="#">6</a></li>
                                        <li><a href="#">7</a></li>
                                        <li><a href="#">8</a></li>
                                        <li><a href="#">9</a></li>
                                        <li><a href="#">10</a></li>
                                        <li class="icon">
                                            <a href="#">Next<span class="fas fa-angle-right"></span></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </li>

                        <li class="tab-content tab-content-2 typography" style="height: 1000px">
                            <div class="tabular--wrapper">
                                <h2       class="main--title" style="padding-bottom: 0px; margin-bottom: 30px">New Account List</h2>
                                <!--                                <form method="post" action="manageaccount" class="w-100">
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
                                                                </form>-->
                                <div class="table-container">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th>Id</th>
                                                <th>Image</th>
                                                <th>Name</th>
                                                <th>Email</th>
                                                <th class="d-none">Role</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="user" items="${manageNewAccount}" varStatus="loop" >
                                                <c:set var="id" value="${user.userID}"/>
                                                <tr>
                                                    <td style="text-align: center">${loop.index + 1}</td>
                                                    <td style="padding: 20px 0px "><img style="height: 100px; width: 100px; border-radius: 50%; object-fit: cover" src=${user.userAvatar}></td>
                                                    <td style="font-weight: bold">${user.userName}</td>
                                                    <td>${user.account.userMail}</td>
                                                    <td class="d-none">
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
                                                                <a style="text-decoration: none" href="newaccdetail?id=${id}"><i class="fa-solid fa-circle-info"></i>&nbsp;Detail</a>
                                                            </c:otherwise>
                                                        </c:choose></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </li>

                        <!--                    <li class="tab-content tab-content-3 typography">
                                                <h1>Albert Einstein</h1>
                                                <p>German-born theoretical physicist who developed the general theory of relativity, one of the two pillars of modern physics (alongside quantum mechanics). While best known for his mass–energy equivalence formula E = mc2 (which has been dubbed "the world's most famous equation"), he received the 1921 Nobel Prize in Physics "for his services to theoretical physics, and especially for his discovery of the law of the photoelectric effect". The latter was pivotal in establishing quantum theory.</p>
                                                <p>Near the beginning of his career, Einstein thought that Newtonian mechanics was no longer enough to reconcile the laws of classical mechanics with the laws of the electromagnetic field. This led to the development of his special theory of relativity. He realized, however, that the principle of relativity could also be extended to gravitational fields, and with his subsequent theory of gravitation in 1916, he published a paper on the general theory of relativity.</p>
                                                <p class="text-right"><em>Find out more about Albert Einstein from <a href="http://en.wikipedia.org/wiki/Albert_Einstein" target="_blank">Wikipedia</a>.</em></p>				
                                            </li>
                        
                                            <li class="tab-content tab-content-last typography">
                                                <div class="typography">
                                                    <h1>Isaac Newton</h1>
                                                    <p>English physicist and mathematician who is widely regarded as one of the most influential scientists of all time and as a key figure in the scientific revolution. His book Philosophiæ Naturalis Principia Mathematica ("Mathematical Principles of Natural Philosophy"), first published in 1687, laid the foundations for most of classical mechanics. Newton also made seminal contributions to optics and shares credit with Gottfried Leibniz for the invention of the infinitesimal calculus.</p>
                                                    <p>Newton's Principia formulated the laws of motion and universal gravitation that dominated scientists' view of the physical universe for the next three centuries. It also demonstrated that the motion of objects on the Earth and that of celestial bodies could be described by the same principles. By deriving Kepler's laws of planetary motion from his mathematical description of gravity, Newton removed the last doubts about the validity of the heliocentric model of the cosmos.</p>
                                                    <p class="text-right"><em>Find out more about Isaac Newton from <a href="http://en.wikipedia.org/wiki/Isaac_Newton" target="_blank">Wikipedia</a>.</em></p>		
                                                </div>
                                            </li>-->
                    </ul>
                </div>
                <!--/ tabs -->
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
