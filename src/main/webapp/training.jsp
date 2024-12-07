<%@ page import="com.klef.jfsd.springboot.model.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
User user = (User) session.getAttribute("user");
if (user == null) {
    response.sendRedirect("usersessionexpiry");
    return;
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Training Courses - Certification Management System</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #3498db;
            --secondary-color: #2ecc71;
            --text-color: #2c3e50;
            --background-color: #f4f6f9;
            --card-bg: #ffffff;
            --card-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', 'Arial', sans-serif;
            background-color: var(--background-color);
            line-height: 1.6;
            color: var(--text-color);
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 2rem;
        }

        .page-header {
            text-align: center;
            margin-bottom: 2.5rem;
        }

        .page-header h1 {
            font-size: 2.5rem;
            color: var(--text-color);
            position: relative;
            display: inline-block;
        }

        .page-header h1::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 4px;
            background: var(--primary-color);
        }

        .course-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 1.5rem;
        }

        .course-card {
            background: var(--card-bg);
            border-radius: 12px;
            box-shadow: var(--card-shadow);
            padding: 1.5rem;
            transition: all 0.3s ease;
            display: flex;
            flex-direction: column;
            position: relative;
            overflow: hidden;
        }

        .course-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 6px;
            background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
        }

        .course-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.15);
        }

        .course-header {
            font-size: 1.4rem;
            font-weight: 700;
            color: var(--primary-color);
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
        }

        .course-header i {
            margin-right: 0.75rem;
            color: var(--secondary-color);
        }

        .course-description {
            flex-grow: 1;
            color: var(--text-color);
            opacity: 0.8;
            margin-bottom: 1.5rem;
            line-height: 1.6;
        }

        .course-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: auto;
        }

        .course-details {
            font-size: 0.9rem;
            color: var(--text-color);
            opacity: 0.7;
        }

        .course-link {
            background: var(--primary-color);
            color: white;
            padding: 0.5rem 1rem;
            border-radius: 6px;
            text-decoration: none;
            font-weight: 600;
            transition: background 0.3s ease;
        }

        .course-link:hover {
            background: var(--secondary-color);
        }
        
        @media (max-width: 768px) {
            .course-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <%@ include file="usernavbar.jsp" %>

    <div class="container">
        <div class="page-header">
            <h1>Available Training Courses</h1>
        </div>
        <div class="course-grid">
            <c:forEach var="course" items="${courses}">
                <div class="course-card">
                    <div class="course-header">
                        <i class="fas fa-graduation-cap"></i>
                        ${course.title}
                    </div>
                    <p class="course-description">${course.description}</p>
                    <div class="course-footer">
                        <div class="course-details">
                            <p><i class="fas fa-clock"></i> ${course.days} Days</p>
                            <p><i class="fas fa-user"></i> ${course.addedBy.name}</p>
                        </div>
                        <a href="${course.filePath}" target="_blank" class="course-link">
                            View Details <i class="fas fa-arrow-right"></i>
                        </a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>