<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Curator</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/style.css' />">
    <!-- Link to Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        /* General Reset */
        body, h1, p, input, button, a {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 60px auto;
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #444;
            margin-bottom: 25px;
            font-size: 28px;
            font-weight: bold;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        label {
            font-size: 16px;
            font-weight: 600;
            color: #555;
        }

        .input-group {
            display: flex;
            align-items: center;
            border: 1px solid #ddd;
            border-radius: 8px;
            overflow: hidden;
            background: #f8f9fa;
            transition: 0.3s ease;
        }

        .input-group:hover {
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
        }

        .input-group input {
            flex: 1;
            padding: 12px 15px;
            border: none;
            outline: none;
            background: transparent;
            font-size: 15px;
            color: #333;
        }

        .input-group i {
            padding: 12px;
            background: #e9ecef;
            color: #666;
            font-size: 18px;
            min-width: 40px;
            text-align: center;
        }

        .btn-group {
            display: flex;
            gap: 15px;
        }

        button, .btn-cancel {
            flex: 1;
            padding: 14px;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s ease;
            text-align: center;
            border: none;
        }

        button {
            background-color: #28a745;
            color: white;
        }

        button:hover {
            background-color: #218838;
        }

        .btn-cancel {
            background-color: #dc3545;
            color: white;
            text-decoration: none;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .btn-cancel:hover {
            background-color: #c82333;
        }

        @media (max-width: 480px) {
            .container {
                margin: 20px;
                padding: 20px;
            }

            h1 {
                font-size: 22px;
            }

            .btn-group {
                flex-direction: column;
            }

            button, .btn-cancel {
                width: 100%;
                margin-top: 10px;
            }
        }
    </style>
</head>
<body>
<%@include file="adminnavbar.jsp" %>
    <div class="container">
        <h1><i class="fas fa-user-edit"></i> Edit Curator</h1>
        <form method="post" action="<c:url value='/updatecurator' />">
            <!-- Hidden field to hold the ID -->
            <input type="hidden" name="id" value="${curator.id}" />

            <!-- Name -->
            <label for="name">Name:</label>
            <div class="input-group">
                <i class="fas fa-user"></i>
                <input type="text" id="name" name="name" value="${curator.name}" placeholder="Enter name" required />
            </div>

            <!-- Email -->
            <label for="email">Email:</label>
            <div class="input-group">
                <i class="fas fa-envelope"></i>
                <input type="email" id="email" name="email" value="${curator.email}" placeholder="Enter email" required />
            </div>

            <div class="btn-group">
                <button type="submit"><i class="fas fa-save"></i> Update</button>
                <a href="<c:url value='/viewallcurators' />" class="btn-cancel"><i class="fas fa-times"></i> Cancel</a>
            </div>
        </form>
    </div>
</body>
</html>
