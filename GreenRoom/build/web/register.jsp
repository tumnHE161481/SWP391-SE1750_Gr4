<%-- 
    Document   : home
    Created on : Jan 12, 2024, 8:23:33 AM
    Author     : yetvv.piacom
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

    <head>
        <meta charset="UTF-8">
        <title> Register </title>
        <link rel="icon" href="home-guest/favicon.png">
        <link rel="stylesheet" href="login-register/style.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
    </head>

    <body>
        <div class="container">
            <div class="title">Register</div>
            <h3 id="password-validation" style=" margin-top: 20px;"></h3>
            <h3 id="match" style=" margin-top: 20px;"></h3>
            <div class="content">
                <form action="register" method="post">
                    <div class="user-details">
                        <div class="input-box">
                            <span class="details">Username</span>
                            <input type="text" placeholder="Enter your username" name="username" required>
                        </div>
                        <div class="input-box">
                            <span class="details">Email</span>
                            <input type="mail" placeholder="Enter your email" name="usermail" required>
                        </div>
                        <div class="input-box">
                            <span class="details">Phone Number</span>
                            <input type="text" placeholder="Enter your number" name="userphone" required>
                        </div>
                        <div class="input-box">
                            <span class="details">Password</span>
                            <input type="password" placeholder="Enter your password" name="password" required id="password" oninput="validatePassword()">
                        </div>
                        <div class="input-box">
                            <span class="details">Address</span>
                            <input type="text" placeholder="Confirm your Address" name="address" required >
                        </div>
                        <div class="input-box">
                            <span class="details">Confirm Password</span>
                            <input type="password" placeholder="Confirm your password" name="repassword" required id="repassword" oninput="validatePasswordMatch()">
                        </div>
                        <div class="input-box">
                            <span class="details">Birth Day</span>
                            <input type="date" name="dob" required>
                        </div>

                        <div class="input-box">
                            <span class="details">Gender</span>
                            <select id="gender" name="gender"
                                    style="width: 300px;height: 40px;border-radius: 5px; padding-left: 15px;font-size: 16px;" required>
                                <option value="Male" selected="selected">Male</option>
                                <option value="Female">Female</option>
                                <option value="Other">Other</option>
                            </select>
                        </div>
                    </div>

                    <h3  style="color: #FF0E0E; margin-bottom: 20px;">${message}</h3>


                    <div class="button" ">
                        <input type="submit" value="Register" style="width: 650px;">
                    </div>

                </form>

                <div class="form1">
                    <div class="button">
                        <a href="login.jsp"><input type="submit" value="Back to Login" style="width: 650px;"></a>
                    </div>
                </div>


            </div>
        </div>

        <script>
            function validatePassword() {
                var passwordInput = document.getElementById('password');
                var passwordValidation = document.getElementById('password-validation');

                if (passwordInput.value.length >= 8) {
                    passwordValidation.textContent = 'Valid password';
                    passwordValidation.style.color = 'green';
                } else {
                    passwordValidation.textContent = 'Password must be at least 8 characters';
                    passwordValidation.style.color = 'red';
                }
            }
            function validatePasswordMatch() {
                
                var passwordInput = document.getElementById('password');
                var repasswordInput = document.getElementById('repassword');
                
                var passwordValidation = document.getElementById('match');

                if (passwordInput.value === repasswordInput.value) {
                    passwordValidation.textContent = 'Confirm Password match';
                    passwordValidation.style.color = 'green';
                } else {
                    passwordValidation.textContent = 'rePassword does not match';
                    passwordValidation.style.color = 'red';
                }
            }
        </script>


    </body>

</html>
