<%-- 
    Document   : login
    Created on : Jan 9, 2024, 10:22:56 AM
    Author     : yetvv.piacom
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
  <meta charset="UTF-8">
  <title> Login </title>
  <link rel="icon" href="home-guest/favicon.png">
  <link rel="stylesheet" href="login-register/style.css">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
        .valid {
            color: green;
        }

        .invalid {
            color: red;
        }
        
  </style>
</head>

<body>
  <div class="container1">
    <div class="title">Login</div>
    <h3 id="password-validation" style="  margin-top: 20px;"></h3>
    <div class="content">
        <form action="login" method="post">
        <div class="user-details1">
          <div class="input-box">
            <span class="details">Email</span>
            <input type="email" name="email" placeholder="Enter your Email" required>
          </div>
          <div class="input-box">
            <span class="details">Password</span>
            <input type="password" name="password" id="password-input" oninput="validatePassword()" placeholder="Enter your Password" required>
          </div>


          <span class="details">
            Don't have account ?
            <a href="register" style="text-decoration: none; font-weight: 600;">Register now</a>
          </span>
        </div>
        <div class="button">
            <button type="submit">
                <input type="submit" value="Login" style="width: 400px; height: 45px">
            </button>
        </div>
      </form>
        





      <div class="form1">
        <div class="button">
            <a href="forgotPassword"><input type="submit" value="Forgot password"></a>
        </div>
      </div>
        <h3 style="color: red; margin-top: 15px">${message}</h3>
    </div>
  </div>
    
    
    
    <script>
        function validatePassword() {
            var passwordInput = document.getElementById('password-input');
            var passwordValidation = document.getElementById('password-validation');

            if (passwordInput.value.length >= 8) {
                passwordValidation.textContent = 'Valid password';
                passwordValidation.className = 'valid';
            } else {
                passwordValidation.textContent = 'Password must be at least 8 characters';
                passwordValidation.className = 'invalid';
            }
        }
    </script>

</body>

</html>