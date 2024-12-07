<%@page import="com.klef.jfsd.springboot.model.Curator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
Curator curator = (Curator) session.getAttribute("curator");
if (curator == null) {
    response.sendRedirect("curatorsessionexpiry");
    return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Curator Dashboard</title>
    <!-- TailwindCSS -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <!-- FontAwesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        :root {
            --primary-color: #3b82f6;
            --secondary-color: #10b981;
            --background-color: #f4f6f9;
        }
        body {
            background-color: var(--background-color);
            margin: 0;
            font-family: 'Inter', sans-serif;
        }

        /* Sidebar Styling */
        .sidebar {
            position: fixed;
            top: 0;
            left: 0;
            width: 250px;
            height: 100vh;
            
            box-shadow: 4px 0 10px rgba(0, 0, 0, 0.1);
            z-index: 100;
        }

        /* Content Area */
        .content {
            margin-left: 250px; /* Sidebar width */
            padding: 2rem;
            overflow-y: auto;
            height: 100vh;
        }

        .gradient-sidebar {
            background: linear-gradient(180deg, #2563eb 0%, #1d4ed8 100%);
        }

        .card-gradient {
            background: linear-gradient(135deg, rgba(59,130,246,0.1) 0%, rgba(16,185,129,0.1) 100%);
        }

        .hover-lift {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .hover-lift:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 25px -5px rgba(0,0,0,0.1), 0 10px 10px -5px rgba(0,0,0,0.04);
        }

        /* Add responsive behavior */
        @media (max-width: 768px) {
            .sidebar {
                width: 200px;
            }
            .content {
                margin-left: 200px;
            }
        }
    </style>
</head>

<body class="antialiased">
    <div class="flex">
        <!-- Fixed Sidebar (Navbar) -->
        <div class="sidebar">
            <%@ include file="curatornavbar.jsp" %>
        </div>

        <!-- Main Content Area -->
        <div class="content">
            <!-- Welcome Message -->
            <h2 class="text-2xl font-semibold mb-4">Welcome, <c:out value="${curator.username}" />!</h2>

            <!-- Top Navigation -->
            <header class="flex justify-end items-center mb-10">
                <!-- Add New Button on the Right -->
                <a href="addtrainingcourse">
                    <button class="bg-blue-500 text-white px-4 py-2 rounded-full hover:bg-blue-600 transition">
                        <i class="fas fa-plus mr-2"></i>Add New
                    </button>
                </a>
            </header>

            <!-- Stats Grid -->
            <div class="grid grid-cols-4 gap-6 mb-10">
                <div class="card-gradient p-6 rounded-xl hover-lift shadow-md">
                    <div class="flex justify-between items-center">
                        <div>
                            <h3 class="text-gray-600 mb-2">Total Courses</h3>
                            <p class="text-2xl font-bold text-blue-600"><%= request.getAttribute("count") %></p>
                        </div>
                        <i class="fas fa-graduation-cap text-blue-400 text-3xl"></i>
                    </div>
                </div>
                <!-- Add more statistic cards if needed -->
            </div>
        </div>
    </div>
</body>
</html>
