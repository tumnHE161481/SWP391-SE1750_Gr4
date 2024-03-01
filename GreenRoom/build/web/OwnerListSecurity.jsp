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
        <title>Owner - List of Security</title>
        <script type="text/javascript">
            function DoDelete(id) {
                if (confirm("Are you sure you want to delete category id = " + id)) {
                    window.location = "olsdelete?id=" + id;
                }
            }
        </script>
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
            <div class="navbar-item">List of Security</div>
        </div>   

    <center>

        <table border="1px solid" width="80%" style="background-color: white ; border-radius: 4px">
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Gender</th>
                <th>Dob</th>
                <th>Address</th>
                <th>Phone</th>
                <th>Avatar</th>
                <th>Action</th>
            </tr>

            <c:forEach items="${requestScope.data}" var="c">
                <c:set var="id" value="${c.userId}"/>

                <tr>
                    <td  style="text-align: center;">${id}</td>
                    <td>${c.userName}</td>
                    <td  style="text-align: center;">${c.userGender}</td>
                    <td  style="text-align: center;">${c.userBirth}</td>
                    <td  style="padding-left: 20px">${c.userAddress}</td>
                    <td  style="text-align: center;">${c.userPhone}</td>
                    <td  style="text-align: center;"> <img src="${c.userAvatar}" style="height: 130px; width: 140px;"> </td>


                    <td  style="text-align: center;">
                        <a href="#" onclick="DoDelete('${id}')">Delete</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="olsdetail?id=${id}">Detail</a>
                    </td>
                </tr>

            </c:forEach>

        </table>
    </center>
</body>
</html>
