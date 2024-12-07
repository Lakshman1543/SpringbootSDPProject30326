<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Session Expired</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #1a237e;
            --secondary-color: #303f9f;
            --background-light: #f5f6fa;
            --text-dark: #141b4d;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--background-light);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--text-dark);
        }

        .session-expired-container {
            background: white;
            padding: 3rem;
            border-radius: 15px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 400px;
            width: 90%;
        }

        .icon-container {
            margin-bottom: 1.5rem;
        }

        .icon-container i {
            font-size: 4rem;
            color: var(--primary-color);
            animation: pulse 2s infinite;
        }

        h1 {
            font-size: 1.8rem;
            margin-bottom: 1rem;
            color: var(--primary-color);
        }

        p {
            color: #666;
            margin-bottom: 2rem;
            line-height: 1.6;
        }

        .login-button {
            display: inline-block;
            padding: 0.8rem 2rem;
            background-color: var(--primary-color);
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .login-button:hover {
            background-color: var(--secondary-color);
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        @keyframes pulse {
            0% {
                transform: scale(1);
            }
            50% {
                transform: scale(1.1);
            }
            100% {
                transform: scale(1);
            }
        }

        @media (max-width: 480px) {
            .session-expired-container {
                padding: 2rem;
            }

            h1 {
                font-size: 1.5rem;
            }

            .icon-container i {
                font-size: 3rem;
            }
        }
    </style>
</head>
<body>
    <div class="session-expired-container">
        <div class="icon-container">
            <i class="fas fa-clock"></i>
        </div>
        <h1>Session Expired!</h1>
        <p>Your session has expired due to inactivity. Please log in again to continue.</p>
        <a href="login	" class="login-button">
            <i class="fas fa-sign-in-alt"></i> Back to Login
        </a>
    </div>
</body>
</html>