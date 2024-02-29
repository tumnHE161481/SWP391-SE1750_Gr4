<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
    <h1>Change password form</h1>
    <h3 style = "color: red">${requestScope.ms}</h3> 
    <form action="change" method="post">
        <input type="hidden" name="user" value="${sessionScope.Account.userMail}">
        Old password: <input type="password" name="current_password"/><br/>
        New password: <input type="password" name="new_password"/><br/>
        Confirm password: <input type="password" name="confirm_password"/><br/>
        <input type="submit" value="CHANGE">
    </form>
</body>
</html>
