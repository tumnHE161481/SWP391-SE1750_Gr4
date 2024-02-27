<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" href="home-guest/favicon.png">
        <title>Enter OTP Register</title>
        <style>
            body {
                background: linear-gradient(135deg, #30BD36, #5A84E6);
                font-family: sans-serif;
                margin: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            .enter-otp {
                
                background-color: white;
                width: fit-content;
                text-align: center;
                padding: 20px;
                box-shadow: 0 0 10px rgba(255, 255, 255, 0.2);
            }

            .enter-otp img {
                width: 150px;
                margin-top: 20px;
            }

            .otp-text {
                color: red;
                font-size: 15px;
                margin-top: 10px;
            }

            .text-notice {
                color: #343a40;
                font-size: 20px;
                margin-top: 10px;
            }

            .otp-value input {
                width: 200px;
                padding: 8px;
                margin-top: 20px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
                font-size: 16px;
            }

            .reset-password input {
                background-color: #30BD36;
                color: white;
                border: none;
                border-radius: 6px;
                padding: 10px 20px;
                cursor: pointer;
                font-size: 16px;
                margin-top: 20px;
            }
        </style>
    </head>
    <body>
        <div class="enter-otp">
            <div class="text-notice">Enter OTP Register</div>
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWxaKG6HL-_z88M5D0-zeXZjQHqN33XNtYmA&usqp=CAU" alt="Response Image">
            <div class="text-notice">Check your email for the OTP</div>
            <div class="otp-text">
                <% if(request.getAttribute("message")!=null) { 
                out.print(request.getAttribute("message")+"</p>"); 
                } %>
            </div>
            <form id="register-form" action="ValidateOtpregister" class="form" method="post">
                <div class="otp-value">
                    <input id="opt" name="otp" placeholder="Enter OTP" type="text" required>
                </div>
                <div class="reset-password">
                    <input name="recover-submit" value="Register" type="submit">
                </div>
            </form>
        </div>
    </body>
</html>
