<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Curator</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        /* Custom Styles */
        body {
            background-color: #f4f7f6;
            font-family: 'Arial', sans-serif;
        }
        .form-container {
            background-color: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            margin: 40px auto;
        }

        .form-container:hover {
            box-shadow: 0 15px 25px rgba(0, 0, 0, 0.15);
        }

        .form-title {
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 20px;
            color: #2c3e50;
        }

        .form-label {
            font-weight: 600;
            margin-bottom: 8px;
            color: #333;
        }

        .form-input {
            width: 100%;
            padding: 12px;
            border-radius: 8px;
            border: 2px solid #e2e8f0;
            background-color: #f9fafb;
            transition: all 0.3s ease;
            font-size: 1rem;
        }

        .form-input:focus {
            border-color: #3b82f6;
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.2);
        }

        .form-button {
            background-color: #3b82f6;
            color: white;
            padding: 12px;
            border-radius: 8px;
            font-weight: bold;
            width: 100%;
            transition: all 0.3s ease;
        }

        .form-button:hover {
            background-color: #2563eb;
        }

        .form-button:active {
            background-color: #1d4ed8;
        }
    </style>
</head>
<body class="antialiased">
    <%@ include file="adminnavbar.jsp" %>
    <div class="form-container">
        <h2 class="form-title">Add Curator</h2>
        <form action="insertcurator" method="POST" enctype="multipart/form-data">
            <div class="mb-4">
                <label for="name" class="form-label">Name:</label>
                <input type="text" id="name" name="name" class="form-input" required />
            </div>
            <div class="mb-4">
                <label for="gender" class="form-label">Gender:</label>
                <select id="gender" name="gender" class="form-input" required>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Other">Other</option>
                </select>
            </div>
            <div class="mb-4">
                <label for="username" class="form-label">Username:</label>
                <input type="text" id="username" name="username" class="form-input" required />
            </div>
            <div class="mb-4">
                <label for="email" class="form-label">Email:</label>
                <input type="email" id="email" name="email" class="form-input" required />
            </div>
            <div class="mb-4">
                <label for="contact" class="form-label">Contact Number:</label>
                <input type="text" id="contact" name="contact" class="form-input" required />
            </div>
            <div class="mb-4">
                <label for="curatorimage" class="form-label">Image:</label>
                <input type="file" id="curatorimage" name="curatorimage" class="form-input" required />
            </div>
            <button type="submit" class="form-button">Add Curator</button>
        </form>
    </div>
</body>
</html>
