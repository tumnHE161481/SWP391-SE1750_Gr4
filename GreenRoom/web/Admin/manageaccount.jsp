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
                                    
                                    <div class="page">
			<h1>Pure CSS Tabs</h1>			
	
			
			<!-- tabs -->
			<div class="pcss3t pcss3t-effect-scale pcss3t-theme-1">
				<input type="radio" name="pcss3t" checked  id="tab1"class="tab-content-first">
				<label for="tab1"><i class="icon-bolt"></i>Tesla</label>
				
				<input type="radio" name="pcss3t" id="tab2" class="tab-content-2">
				<label for="tab2"><i class="icon-picture"></i>da Vinci</label>
				
				<input type="radio" name="pcss3t" id="tab3" class="tab-content-3">
				<label for="tab3"><i class="icon-cogs"></i>Einstein</label>
				
				<input type="radio" name="pcss3t" id="tab5" class="tab-content-last">
				<label for="tab5"><i class="icon-globe"></i>Newton</label>
				
				<ul>
					<li class="tab-content tab-content-first typography">
						<h1>Nikola Tesla</h1>
						<p>Serbian-American inventor, electrical engineer, mechanical engineer, physicist, and futurist best known for his contributions to the design of the modern alternating current (AC) electrical supply system.</p>
						<p>Tesla started working in the telephony and electrical fields before emigrating to the United States in 1884 to work for Thomas Edison. He soon struck out on his own with financial backers, setting up laboratories/companies to develop a range of electrical devices. His patented AC induction motor and transformer were licensed by George Westinghouse, who also hired Tesla as a consultant to help develop an alternating current system. Tesla is also known for his high-voltage, high-frequency power experiments in New York and Colorado Springs which included patented devices and theoretical work used in the invention of radio communication, for his X-ray experiments, and for his ill-fated attempt at intercontinental wireless transmission in his unfinished Wardenclyffe Tower project.</p>
						<p class="text-right"><em>Find out more about Nikola Tesla from <a href="http://en.wikipedia.org/wiki/Nikola_Tesla" target="_blank">Wikipedia</a>.</em></p>
					</li>
					
					<li class="tab-content tab-content-2 typography">
						<h1>Leonardo da Vinci</h1>
						<p>Italian Renaissance polymath: painter, sculptor, architect, musician, mathematician, engineer, inventor, anatomist, geologist, cartographer, botanist, and writer. His genius, perhaps more than that of any other figure, epitomized the Renaissance humanist ideal. Leonardo has often been described as the archetype of the Renaissance Man, a man of "unquenchable curiosity" and "feverishly inventive imagination". He is widely considered to be one of the greatest painters of all time and perhaps the most diversely talented person ever to have lived. According to art historian Helen Gardner, the scope and depth of his interests were without precedent and "his mind and personality seem to us superhuman, the man himself mysterious and remote". Marco Rosci states that while there is much speculation about Leonardo, his vision of the world is essentially logical rather than mysterious, and that the empirical methods he employed were unusual for his time.</p>
						<p class="text-right"><em>Find out more about Leonardo da Vinci from <a href="http://en.wikipedia.org/wiki/Leonardo_da_Vinci" target="_blank">Wikipedia</a>.</em></p>
					</li>
					
					<li class="tab-content tab-content-3 typography">
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
					</li>
				</ul>
			</div>
			<!--/ tabs -->
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
