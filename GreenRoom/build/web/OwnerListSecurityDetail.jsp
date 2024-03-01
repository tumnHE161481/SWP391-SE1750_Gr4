<%-- 
    Document   : list
    Created on : Feb 29, 2024, 11:44:42 PM
    Author     : yetvv.piacom
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Owner List Security Detail</title>
        
        <style>
            body {
                background: green;
            }
            .navbar {
                background-color: #333;
                overflow: hidden;
                margin-bottom: 60px;
            }

            .navbar-item {
                float: left;
                display: block;
                color: white;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
            }

            .navbar-item:hover {
                background-color: #ddd;
                color: black;
            }
        </style>
    </head>
    <body>

        <div class="navbar">
            <div class="navbar-item">Owner</div>
            <div class="navbar-item">Security detail</div>
        </div>   

    <center>
        <h3 style="color: red">${requestScope.error}</h3>

        <table border="1px solid" width="80%" style="background-color: white ; border-radius: 4px">
            <tr>
                <th>seID</th>
                <th>userID</th>
                <th>sShift</th>
                <th>seStatus</th>
                <th>Action</th>
            </tr>

                <c:set var="c" value="${requestScope.detail}"/>

                <tr>
                    <td  style="text-align: center;">${c.seID}</td>
                    <td  style="text-align: center;">${c.userID}</td>
                    <td  style="text-align: center;">${c.sShift}</td>
                    <td  style="text-align: center;">${c.seStatus}</td>
                    <td  style="text-align: center;">
                        <a href="editsshift?id=${c.seID}">Edit-shift</a>
                    </td>
                </tr>

        </table>
    </center>
</body>
</html>
