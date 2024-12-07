<%@page import="com.klef.jfsd.springboot.model.Certification"%>
<%@page import="java.util.List"%>
<%@page import="com.klef.jfsd.springboot.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%
User user = (User) session.getAttribute("user");
List<Certification> certifications = (List<Certification>) request.getAttribute("certifications");
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
    <title>Dashboard - Certification Management</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        /* Base Styles */
        :root {
            --primary-color: #2c3e50;
            --secondary-color: #1a2634;
            --accent-color: #3498db;
            --success-color: #2ecc71;
            --warning-color: #f1c40f;
            --danger-color: #e74c3c;
            --text-dark: #2c3e50;
            --text-light: #95a5a6;
            --background-light: #f8fafc;
            --card-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            --transition: all 0.3s ease;
            --font-primary: 'Inter', system-ui, -apple-system, sans-serif;
    		--font-secondary: 'Poppins', sans-serif;
    		--font-alternative: 'Roboto', sans-serif;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
           font-family: var(--font-primary); /* Default to Inter */
        }

        body {
            background-color: var(--background-light);
            color: var(--text-dark);
            line-height: 1.6;
            font-family: var(--font-primary);
        }

        /* Content Layout */
        .content {
            margin-left: 100px;
            padding: 2rem;
            transition: var(--transition);
        }

        /* Welcome Section */
        .welcome-section {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            padding: 2rem;
            border-radius: 1rem;
            margin-bottom: 2rem;
            box-shadow: var(--card-shadow);
        }

        .welcome-section h1 {
            font-size: 1.8rem;
            margin-bottom: 0.5rem;
            font-family: var(--font-secondary);
        }

        .welcome-section p {
            opacity: 0.9;
        }

        /* Stats Grid */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        .stat-card {
            background: white;
            padding: 1.5rem;
            border-radius: 1rem;
            box-shadow: var(--card-shadow);
            transition: var(--transition);
            position: relative;
            overflow: hidden;
        }

        .stat-card:hover {
            transform: translateY(-5px);
        }

        .stat-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 4px;
            background: linear-gradient(180deg, #2c3e50 0%, #1a2634 100%);
        }

        .stat-card i {
            font-size: 2rem;
            color: #2C3E50;
            margin-bottom: 1rem;
        }

        .stat-card h3 {
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
             font-family: var(--font-alternative);
        }

        .stat-card p {
            color: var(--text-light);
            font-size: 0.9rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        /* Certifications Section */
        .certifications-section {
            background: white;
            padding: 2rem;
            border-radius: 1rem;
            box-shadow: var(--card-shadow);
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
        }

        .section-header h2 {
            font-size: 1.5rem;
            color: var(--text-dark);
            font-family: var(--font-secondary);
        }

        .cert-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 1.5rem;
        }

        .cert-card {
            background: white;
            border: 1px solid rgba(0,0,0,0.1);
            border-radius: 0.75rem;
            padding: 1.5rem;
            transition: var(--transition);
        }

        .cert-card:hover {
            transform: translateY(-3px);
            box-shadow: var(--card-shadow);
        }

        .cert-header {
            display: flex;
            align-items: center;
            margin-bottom: 1rem;
        }

        .cert-icon {
            width: 40px;
            height: 40px;
             background: linear-gradient(180deg, #2c3e50 0%, #1a2634 100%);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 1rem;
        }

        .cert-icon i {
            color: white;
            font-size: 1.2rem;
        }

        .cert-title {
            flex: 1;
        }

        .cert-title h3 {
            font-size: 1.1rem;
            margin-bottom: 0.25rem;
            font-family: var(--font-alternative);
        }

        .cert-title p {
            font-size: 0.9rem;
            color: var(--text-light);
        }

        .cert-details {
            margin: 1rem 0;
        }

        .cert-detail {
            display: flex;
            align-items: center;
            margin-bottom: 0.5rem;
            font-size: 0.9rem;
        }

        .cert-detail i {
            width: 20px;
            margin-right: 0.5rem;
            color: var(--text-light);
        }

        .status-badge {
            display: inline-block;
            padding: 0.25rem 0.75rem;
            border-radius: 1rem;
            font-size: 0.8rem;
            font-weight: 500;
        }

        .status-active {
            background-color: rgba(46, 204, 113, 0.1);
            color: var(--success-color);
        }

        .status-expiring {
            background-color: rgba(241, 196, 15, 0.1);
            color: var(--warning-color);
        }

        .status-expired {
            background-color: rgba(231, 76, 60, 0.1);
            color: var(--danger-color);
        }

        .cert-actions {
            margin-top: 1.5rem;
            display: flex;
            gap: 1rem;
        }

        .btn {
            padding: 0.5rem 1rem;
            border-radius: 0.5rem;
            font-size: 0.9rem;
            font-weight: 500;
            text-decoration: none;
            transition: var(--transition);
            text-align: center;
        }

        .btn-primary {
             background: linear-gradient(180deg, #2c3e50 0%, #1a2634 100%);
            color: white;
        }

        .btn-primary:hover {
             background: linear-gradient(180deg, #2c3e50 0%, #1a2634 100%);
        }

        .btn-secondary {
            background: #ecf0f1;
            color: var(--text-dark);
        }

        .btn-secondary:hover {
            background: #bdc3c7;
        }

        /* Responsive Design */
        @media (max-width: 1024px) {
            .content {
                margin-left: 70px;
            }
        }

        @media (max-width: 768px) {
            .content {
                padding: 1rem;
            }
            
            .stats-grid {
                grid-template-columns: repeat(2, 1fr);
            }
            
            .cert-grid {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 480px) {
            .stats-grid {
                grid-template-columns: 1fr;
            }
            
            .welcome-section {
                padding: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <%@include file="usernavbar.jsp"%>

    <div class="content">
        <div class="welcome-section">
            <h1>Welcome back, <%= user.getName() %></h1>
            <p>Track and manage your certification journey</p>
        </div>

        <%
            int activeCount = 0, expiringCount = 0, completedCount = 0, pendingCount = 0;
            if (certifications != null) {
                for (Certification cert : certifications) {
                    String status = cert.getStatus();
                    if ("Active".equals(status)) activeCount++;
                    else if ("Expiring Soon".equals(status)) expiringCount++;
                    else if ("Completed".equals(status)) completedCount++;
                    else if ("Pending".equals(status)) pendingCount++;
                }
            }
        %>

        <div class="stats-grid">
            <div class="stat-card">
                <i class="fas fa-certificate"></i>
                <h3><%= activeCount %></h3>
                <p>Active Certifications</p>
            </div>
            <div class="stat-card">
                <i class="fas fa-clock"></i>
                <h3><%= expiringCount %></h3>
                <p>Expiring Soon</p>
            </div>
            <div class="stat-card">
                <i class="fas fa-award"></i>
                <h3><%= completedCount %></h3>
                <p>Completed</p>
            </div>
            <div class="stat-card">
                <i class="fas fa-hourglass-half"></i>
                <h3><%= pendingCount %></h3>
                <p>Pending</p>
            </div>
        </div>

        <div class="certifications-section">
            <div class="section-header">
                <h2>My Certifications</h2>
            </div>
            
            <div class="cert-grid">
                <c:forEach var="cert" items="${certifications}">
                    <div class="cert-card">
                        <div class="cert-header">
                            <div class="cert-icon">
                                <i class="fas fa-certificate"></i>
                            </div>
                            <div class="cert-title">
                                <h3>${cert.certificationname}</h3>
                                <p>#${cert.certificationId}</p>
                            </div>
                        </div>
                        
                        <div class="cert-details">
                            <div class="cert-detail">
                                <i class="fas fa-calendar"></i>
                                Expires: ${cert.expirydate}
                            </div>
                            <div class="cert-detail">
                                <i class="fas fa-info-circle"></i>
                                <span class="status-badge 
                                    <c:choose>
                                        <c:when test="${cert.status == 'Active'}">status-active</c:when>
                                        <c:when test="${cert.status == 'Expiring Soon'}">status-expiring</c:when>
                                        <c:when test="${cert.status == 'Expired'}">status-expired</c:when>
                                    </c:choose>">
                                    ${cert.status}
                                </span>
                            </div>
                        </div>
                        
                        <div class="cert-actions">
                            <a href="viewcertfile?id=${cert.certificationId}" target="_blank" class="btn btn-primary">View</a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</body>
</html>