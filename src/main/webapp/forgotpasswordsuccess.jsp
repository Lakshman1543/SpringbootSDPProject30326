<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mail Success</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            color: #333;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .container {
            text-align: center;
            padding: 20px 30px;
            background-color: #ffffff;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 90%;
        }

        .container p {
            font-size: 16px;
            margin-bottom: 20px;
        }

        .container a {
            display: inline-block;
            padding: 10px 20px;
            font-size: 14px;
            color: #ffffff;
            background-color: #007bff;
            text-decoration: none;
            border-radius: 3px;
            transition: background-color 0.3s;
        }

        .container a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <p><c:out value="${message}"></c:out></p>
        <a href="login">Back</a>
    </div>
</body>
</html>
