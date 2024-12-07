<%@page import="com.klef.jfsd.springboot.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%
User user = (User) session.getAttribute("user");
if(user == null) {
    response.sendRedirect("usersessionexpiry");
    return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Profile</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Roboto', sans-serif;
        }

        body {
            background: linear-gradient(135deg, #f4f7fc 0%, #e8ecf1 100%);
            min-height: 100vh;
        }

        .content-container {
            padding: 2rem;
            display: flex;
            flex-direction: column;
            align-items: center;
            animation: fadeIn 0.8s ease-out;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        h3 {
            font-size: 2rem;
            font-weight: 700;
            color: #2c3e50;
            margin-bottom: 2rem;
            position: relative;
            text-align: center;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        h3 i {
            font-size: 1.8rem;
            color: #1a5f7a;
            animation: bounce 2s infinite;
        }

        @keyframes bounce {
            0%, 20%, 50%, 80%, 100% {
                transform: translateY(0);
            }
            40% {
                transform: translateY(-5px);
            }
            60% {
                transform: translateY(-3px);
            }
        }

        h3::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 120px;
            height: 4px;
            background: linear-gradient(90deg, #1a5f7a, #086288);
            border-radius: 4px;
        }

        .card {
            position: relative;
            width: 450px;
            background-color: #ffffff;
            display: flex;
            flex-direction: column;
            padding: 35px;
            gap: 15px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(44, 62, 80, 0.1);
            overflow: hidden;
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            margin-top: 20px;
        }

        .card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 5px;
            background: linear-gradient(90deg, #1a5f7a, #086288);
        }

        .card:hover {
            transform: translateY(-8px) scale(1.01);
            box-shadow: 0 15px 40px rgba(26, 95, 122, 0.2);
        }

        .profile-field {
            display: flex;
            align-items: center;
            padding: 12px 0;
            border-bottom: 1px solid #ecf0f1;
            transition: all 0.3s ease;
        }

        .profile-field:hover {
            background-color: #f4f7fc;
            padding-left: 10px;
            border-radius: 8px;
        }

        .profile-field i {
            width: 30px;
            color: #1a5f7a;
            font-size: 1.1rem;
            margin-right: 15px;
        }

        .profile-field b {
            color: #2c3e50;
            width: 100px;
            font-weight: 500;
        }

        .profile-field span {
            color: #2c3e50;
            flex: 1;
        }

        .status-active {
            color: #27ae60 !important;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .status-active i {
            font-size: 0.8rem;
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0% {
                transform: scale(1);
            }
            50% {
                transform: scale(1.2);
            }
            100% {
                transform: scale(1);
            }
        }

        .status-inactive {
            color: #e74c3c !important;
            font-weight: 600;
        }

        .action-btn {
            padding: 14px 25px;
            background: linear-gradient(135deg, #1a5f7a 0%, #086288 100%);
            color: white;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            text-decoration: none;
            font-size: 1em;
            text-align: center;
            transition: all 0.3s ease;
            margin-top: 25px;
            display: inline-flex;
            align-items: center;
            gap: 10px;
            font-weight: 500;
            letter-spacing: 0.5px;
        }

        .action-btn:hover {
            background: linear-gradient(135deg, #086288 0%, #1a5f7a 100%);
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(26, 95, 122, 0.3);
        }

        @media (max-width: 768px) {
            .card {
                width: 95%;
                padding: 25px;
            }

            .content-container {
                padding: 1rem;
            }

            h3 {
                font-size: 1.6rem;
            }

            .profile-field {
                font-size: 0.9rem;
            }

            .profile-field b {
                width: 80px;
            }
        }
    </style>
</head>
<body>
    <%@include file="usernavbar.jsp"%>
    
    <div class="content-container">
        <h3><i class="fas fa-user-circle"></i> My Profile</h3>
        
        <div class="card">
            <div class="profile-field">
                <i class="fas fa-id-badge"></i>
                <b>ID:</b>
                <span><%= user.getId() %></span>
            </div>
            
            <div class="profile-field">
                <i class="fas fa-user"></i>
                <b>Name:</b>
                <span><%= user.getName() %></span>
            </div>
            
            <div class="profile-field">
                <i class="fas fa-venus-mars"></i>
                <b>Gender:</b>
                <span><%= user.getGender() %></span>
            </div>
            
            <div class="profile-field">
                <i class="fas fa-map-marker-alt"></i>
                <b>Location:</b>
                <span><%= user.getLocation() %></span>
            </div>
            
            <div class="profile-field">
                <i class="fas fa-envelope"></i>
                <b>Email:</b>
                <span><%= user.getEmail() %></span>
            </div>
            
            <div class="profile-field">
                <i class="fas fa-phone"></i>
                <b>Contact:</b>
                <span><%= user.getContact() %></span>
            </div>
            
            <div class="profile-field">
                <i class="fas fa-signal"></i>
                <b>Status:</b>
                <span class="<%= user.getAccountstatus().equals("Active") ? "status-active" : "status-inactive" %>">
                    <% if(user.getAccountstatus().equals("Active")) { %>
                        <i class="fas fa-circle"></i>
                    <% } %>
                    <%= user.getAccountstatus() %>
                </span>
            </div>
        </div>
    </div>
</body>
</html>