<%@page import="com.klef.jfsd.springboot.model.Curator"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%
Curator curator = (Curator) session.getAttribute("curator");
if (curator == null) {
    response.sendRedirect("login.jsp"); // Redirect to login if not authenticated
    return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Training Course</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            display: flex;
            height: 100vh;
            background-color: #f4f6f9;
        }
        .navbar {
            width: 250px;
            background-color: #2d3748; /* Dark gray */
            color: white;
            padding: 20px;
            display: flex;
            flex-direction: column;
            gap: 15px;
            box-shadow: 2px 0 10px rgba(0, 0, 0, 0.1);
        }
        .navbar a {
            color: #cbd5e0;
            text-decoration: none;
            font-weight: 500;
            padding: 10px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        .navbar a:hover {
            background-color: #4a5568; /* Darker gray */
        }
        .content {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        .form-container {
            width: 100%;
            max-width: 600px;
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            padding: 30px;
            animation: fadeIn 0.5s ease-in-out;
        }
        .form-container h2 {
            font-size: 1.8rem;
            font-weight: 600;
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }
        .form-container label {
            font-size: 1rem;
            font-weight: 500;
            color: #555;
            margin-bottom: 5px;
            display: block;
        }
        .form-container input,
        .form-container textarea {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 1rem;
            margin-bottom: 15px;
            background: #f9f9f9;
        }
        .form-container input:focus,
        .form-container textarea:focus {
            border-color: #3b82f6;
            outline: none;
            box-shadow: 0 0 5px rgba(59, 130, 246, 0.5);
        }
        .form-container button {
            width: 100%;
            padding: 12px;
            font-size: 1rem;
            font-weight: 600;
            color: #fff;
            background-color: #3b82f6;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .form-container button:hover {
            background-color: #2563eb;
        }
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>
   <%@ include file="curatornavbar.jsp" %>

    <!-- Content Section -->
    <div class="content">
        <div class="form-container">
            <form action="updatetrainingcourse" method="post">
                <h2>Update Training Course</h2>
                <input type="hidden" name="courseId" value="${trainingCourse.courseId}" />

                <label for="title">Title</label>
                <input type="text" id="title" name="title" value="${trainingCourse.title}" required />

                <label for="description">Description</label>
                <textarea id="description" name="description" rows="5" required>${trainingCourse.description}</textarea>

                <label for="filePath">File/URL</label>
                <input type="url" id="filePath" name="filePath" value="${trainingCourse.filePath}" required />

                <label for="days">Duration (Days)</label>
                <input type="number" id="days" name="days" value="${trainingCourse.days}" required />

                <button type="submit">Update Course</button>
            </form>
        </div>
    </div>
</body>
</html>
