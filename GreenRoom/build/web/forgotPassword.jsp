<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="home-guest/favicon.png">
    <title>Forgot Password</title>
    <link href="forgotpassword/rspassword.css" rel="stylesheet" type="text/css">
    <style>
        
    </style>
</head>
<body>
    <div class="container">
        <form action="forgotPassword" method="post">
            <div class="title-text">Forgot your password?</div>
            <p>Change your password in three easy steps. This will help you to secure your password!</p>

            <ol class="step-reset">
                <li> Enter your email address below.</li>
                <li> Our system will send you an OTP to your email.</li>
                <li> Enter the OTP on the next page.</li>
            </ol>
        </form>

        <form action="forgotPassword" method="POST" style="margin-bottom: 100px;">
            <label for="email">Enter your email address</label>
            <br>
            <br>
            <input class="enter-email" type="email" placeholder="Email" name="email" id="email" required>
            <br>
            <br>
            <small class="form-text">( Enter the email address you used during the registration. Then we'll email an OTP to this address. )</small>
            <br>
            <br>
            <hr>
            <div class="submit-password">
                <button class="get-password" type="submit">
                    Get New Password
                </button>
                
                <h2 class="notice-message">${message}</h2>
            </div>
        </form>
            <a class="back-login" href="login.jsp" >
                    Back to Login
            </a>
    </div>
</body>
</html>
