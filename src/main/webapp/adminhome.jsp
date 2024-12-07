<%@page import="com.klef.jfsd.springboot.model.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
Admin admin = (Admin) session.getAttribute("admin");
if (admin == null) {
    response.sendRedirect("adminsessionexpiry");
    return;
}
%>
<%@include file="adminnavbar.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Certification Management System</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #1a237e;
            --secondary-color: #303f9f;
            --accent-color: #3949ab;
            --light-accent: #7986cb;
            --text-light: #ffffff;
            --text-dark: #141b4d;
            --background-light: #f5f6fa;
            --card-shadow: 0 4px 6px rgba(26, 35, 126, 0.1);
        }

        body {
            background-color: var(--background-light);
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            /* Remove flex properties from body */
            min-height: 100vh;
        }

        /* Add main content wrapper */
        .main-content {
            padding-top: 80px; /* Adjust based on your navbar height */
            min-height: calc(100vh - 80px); /* Subtract navbar height */
            width: 100%;
            box-sizing: border-box;
        }

        .dashboard-container {
            padding: 2rem;
            max-width: 1200px;
            width: 100%;
            margin: 0 auto; /* Center the container */
            box-sizing: border-box;
        }

        .dashboard-header {
            background: var(--primary-color);
            color: var(--text-light);
            padding: 2rem;
            border-radius: 15px;
            margin-bottom: 2rem;
            text-align: center;
            box-shadow: var(--card-shadow);
        }

        .dashboard-header h1 {
            margin: 0;
            font-size: 2.5rem;
            font-weight: 600;
        }

        .dashboard-header p {
            margin-top: 1rem;
            font-size: 1.1rem;
            opacity: 0.9;
        }

        .stats-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        .stat-card {
            background: var(--text-light);
            border-radius: 15px;
            padding: 1.5rem;
            text-align: center;
            transition: transform 0.3s ease;
            box-shadow: var(--card-shadow);
            border-top: 4px solid var(--primary-color);
        }

        .stat-card:hover {
            transform: translateY(-5px);
        }

        .stat-icon {
            background: var(--primary-color);
            color: var(--text-light);
            width: 60px;
            height: 60px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1rem;
        }

        .stat-icon i {
            font-size: 1.5rem;
        }

        .stat-number {
            font-size: 2.5rem;
            font-weight: bold;
            color: var(--primary-color);
            margin: 0.5rem 0;
        }

        .stat-label {
            color: var(--text-dark);
            font-size: 1.1rem;
            font-weight: 500;
        }

        .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 1.5rem;
        }

        .feature-card {
            background: var(--text-light);
            border-radius: 15px;
            padding: 1.5rem;
            box-shadow: var(--card-shadow);
            border-left: 4px solid var(--primary-color);
        }

        .feature-card h3 {
            color: var(--primary-color);
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            font-size: 1.3rem;
        }

        .feature-card h3 i {
            margin-right: 0.5rem;
            color: var(--primary-color);
        }

        .feature-card ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .feature-card ul li {
            padding: 0.5rem 0;
            color: var(--text-dark);
            display: flex;
            align-items: center;
        }

        .feature-card ul li:before {
            content: "•";
            color: var(--primary-color);
            font-weight: bold;
            margin-right: 0.5rem;
        }
    </style>
</head>
<body>
    <div class="main-content">
        <div class="dashboard-container">
            <div class="dashboard-header">
                <h1>Certification Management System</h1>
                <p>Streamline your certification processes with our comprehensive management tools</p>
            </div>

            <div class="stats-container">
                <div class="stat-card">
                    <div class="stat-icon">
                        <i class="fas fa-users"></i>
                    </div>
                    <div class="stat-number"><%= request.getAttribute("count") %></div>
                    <div class="stat-label">Total Users</div>
                </div>
                
            </div>

            <div class="features-grid">
                <div class="feature-card">
                    <h3><i class="fas fa-tasks"></i>Certification Overview</h3>
                    <ul>
                        <li>Track certification progress</li>
                        <li>Monitor completion rates</li>
                        <li>Review pending applications</li>
                        <li>Access detailed analytics</li>
                    </ul>
                </div>
                <div class="feature-card">
                    <h3><i class="fas fa-user-graduate"></i>User Management</h3>
                    <ul>
                        <li>Manage user profiles</li>
                        <li>Track individual progress</li>
                        <li>Handle user queries</li>
                        <li>Generate user reports</li>
                    </ul>
                </div>
                <div class="feature-card">
                    <h3><i class="fas fa-file-alt"></i>Document Center</h3>
                    <ul>
                        <li>Access certification templates</li>
                        <li>Manage documentation</li>
                        <li>Generate certificates</li>
                        <li>Archive completed certifications</li>
                    </ul>
                </div>
                <div class="feature-card">
                    <h3><i class="fas fa-chart-line"></i>Analytics & Reports</h3>
                    <ul>
                        <li>View completion statistics</li>
                        <li>Generate custom reports</li>
                        <li>Track performance metrics</li>
                        <li>Export data for analysis</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</body>
</html>