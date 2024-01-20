<%-- 
    Document   : home
    Created on : Jan 12, 2024, 8:23:33 AM
    Author     : yetvv.piacom
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<title>Register</title>
        <link rel="icon" href="home-guest/favicon.png">
	<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.2.0/css/all.css'>
	<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.2.0/css/fontawesome.css'>
        <link rel="stylesheet" href="register/register.css">

</head>

<body>
	<!-- partial:index.partial.html -->
	<div class="container">
		<div class="screen">
			<div class="screen__content">

                            <form class="login" method="post" action="register">

					<i class="login__icon fas fa-home fa-xl" style="font-size: xx-large; margin-top: 20px;"><span
							class="button__text">Register</span></i>

					<div class="login__field">
						<i class="login__icon fas fa-user"></i>
						<input type="text" class="login__input" placeholder="Name" name="name" required>
					</div>
					<div class="login__field">
						<i class="login__icon fas fa-user"></i>
						<input type="email" class="login__input" placeholder="Email" name="email" required>
					</div>
					<div class="login__field">
						<i class="login__icon fas fa-lock"></i>
						<input type="password" class="login__input" placeholder="Password" name="password" required>
					</div>
					<div class="login__field">
						<i class="login__icon fas fa-lock"></i>
						<input type="password" class="login__input" placeholder="Re-Password" name="repassword" required>
					</div>
                                    
                                    
                                        <button class="button login__submit" type="submit">
						<span class="button__text">Register</span>
						<i class="button__icon fas fa-chevron-right" style="color: white;"></i>
					</button>
                                    
                                    
                                        <a class="button login__submit" href="login.jsp" style="text-decoration: none;">
						<span class="button__text">Log-In</span>
						<i class="button__icon fas fa-chevron-right" style="color: white;"></i>
					</a>
				</form>
			</div>
			<div class="screen__background">
				<span class="screen__background__shape screen__background__shape4"></span>
				<span class="screen__background__shape screen__background__shape3"></span>
				<span class="screen__background__shape screen__background__shape2"></span>
				<span class="screen__background__shape screen__background__shape1"></span>
			</div>
		</div>
	</div>
	<!-- partial -->

</body>

</html>
