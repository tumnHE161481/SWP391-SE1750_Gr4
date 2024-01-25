<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register success</title>
    <link rel="icon" href="home-guest/favicon.png">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #30BD36, #5A84E6);
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .success-container {
            text-align: center;
            background-color: #4CAF50;
            color: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .success-icon {
            font-size: 60px;
            margin-bottom: 20px;
        }

        .success-message {
            font-size: 24px;
            margin-bottom: 15px;
            padding-bottom: 10px;
        }

        .back-to-home {
            text-decoration: none;
            color: #ffffff;
            background-color: #333;
            padding: 12px 24px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .back-to-home:hover {
            background-color: #bd2a2a;
        }
    </style>
</head>

<body>
    <div class="success-container">
        <div class="success-icon">&#10004;</div>
        <div class="success-message">Register success!</div>
        <a href="login" class="back-to-home">Back to login</a>
    </div>
</body>

</html>