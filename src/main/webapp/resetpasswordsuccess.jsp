<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Success</title>
    <style>
        :root {
            --primary-color: #6a11cb;
            --secondary-color: #2575fc;
            --background-color: #f4f4f4;
            --text-color: #333;
            --white: #ffffff;
            --shadow-color: rgba(0, 0, 0, 0.1);
            --border-radius: 12px;
            --btn-padding: 12px 20px;
        }

        body {
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
            background-color: var(--background-color);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            color: var(--text-color);
        }

        .container {
            background-color: var(--white);
            border-radius: var(--border-radius);
            box-shadow: 0 10px 30px var(--shadow-color);
            padding: 40px 30px;
            text-align: center;
            width: 350px;
        }

        .message {
            font-size: 1.2rem;
            margin-bottom: 30px;
            color: #28a745;
        }

        .btn {
            padding: var(--btn-padding);
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            border: none;
            border-radius: var(--border-radius);
            font-size: 16px;
            cursor: pointer;
            transition: all 0.3s ease, transform 0.2s ease;
            text-decoration: none;
        }

        .btn:hover {
            opacity: 0.9;
            transform: translateY(-3px);
        }

        .btn:active {
            transform: translateY(1px);
        }

        .back-link {
            display: block;
            margin-top: 20px;
            color: var(--primary-color);
            text-decoration: none;
            font-size: 1rem;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="message">
            <c:out value="${message}"></c:out>
        </div>
        <a href="login" class="btn">Go Back</a>
    </div>

</body>
</html>
