<%-- 
    Document   : accessDenied
    Created on : Mar 7, 2024, 8:51:26 AM
    Author     : ASUS
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <title>Access Denied</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <meta charset="UTF-8">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700&display=swap" rel="stylesheet">
        <link href="CSS/accessDenied.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    </head>
    <body>
        <div class="container" style="color: #5c636a">
            <div class="photo">
                <img src="./Image/error/error2.png" alt="quiz-logo">
            </div>
            <div class="message">
                <h1>Opp!!! 403 - No Permission</h1>
                <p>You are not allowed to access this page</p>
                <br/>The error may be caused by you not running correctly with this role. Click here to visit our homepage</p>
            </div>
            <div class="btt">
                <c:choose>
                    <c:when test="${sessionScope.userRole == '1'}">
                        <a class="button" href="sehome">Go back Home</a>
                    </c:when>
                    <c:when test="${sessionScope.userRole == '2'}">
                        <a class="button" href="sehome">Go back Home</a>
                    </c:when> 
                    <c:when test="${sessionScope.userRole == '3'}">
                        <a class="button" href="sehome">Go back Home</a>
                    </c:when>
                    <c:when test="${sessionScope.userRole == '4'}">
                        <a class="button" href="manageaccount">Go back Home</a>
                    </c:when>
                    <c:otherwise>
                        <a class="button" href="">Go back Home</a>
                    </c:otherwise>
                </c:choose>     
            </div>
        </div>
    </body>
</html>
