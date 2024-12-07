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
    <title>View All Training Courses</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
    :root {
        --primary-color: #3b82f6;
        --secondary-color: #10b981;
        --accent-color: #8b5cf6;
        --background-color: #f4f6f9;
        --card-gradient-start: #ffffff;
        --card-gradient-end: #f0f4f8;
        --text-primary: #1f2937;
        --text-secondary: #4b5563;
    }

    .container {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
        gap: 24px;
        padding: 30px;
        margin-left: 270px;
        perspective: 1000px;
    }

    .card {
        background: linear-gradient(145deg, var(--card-gradient-start), var(--card-gradient-end));
        border-radius: 16px;
        border: 1px solid rgba(229, 231, 235, 0.5);
        box-shadow: 
            0 25px 50px -12px rgba(0, 0, 0, 0.05),
            0 10px 15px -3px rgba(0, 0, 0, 0.1);
        padding: 24px;
        transition: 
            transform 0.4s cubic-bezier(0.34, 1.56, 0.64, 1),
            box-shadow 0.4s ease,
            background 0.4s ease;
        position: relative;
        overflow: hidden;
        display: flex;
        flex-direction: column;
        transform-style: preserve-3d;
        will-change: transform;
    }

    .card::before {
        content: '';
        position: absolute;
        top: -50%;
        left: -50%;
        width: 200%;
        height: 200%;
        background: radial-gradient(
            circle at center, 
            rgba(59, 130, 246, 0.1) 0%, 
            transparent 70%
        );
        transform: rotate(-45deg);
        opacity: 0;
        transition: opacity 0.4s ease;
        pointer-events: none;
        z-index: 1;
    }

    .card:hover::before {
        opacity: 1;
    }

    .card:hover {
        transform: 
            translateZ(20px) 
            rotateX(4deg) 
            rotateY(-4deg) 
            scale(1.02);
        box-shadow: 
            0 30px 60px -15px rgba(0, 0, 0, 0.1),
            0 15px 25px -10px rgba(0, 0, 0, 0.15);
    }

    .card h3 {
        font-size: 1.375rem;
        color: var(--primary-color);
        margin-bottom: 16px;
        display: flex;
        align-items: center;
        font-weight: 700;
        letter-spacing: -0.025em;
    }

    .card h3 i {
        margin-right: 12px;
        color: var(--accent-color);
        font-size: 1.5rem;
        opacity: 0.8;
    }

    .card p {
        font-size: 0.925rem;
        color: var(--text-secondary);
        margin-bottom: 12px;
        line-height: 1.6;
    }

    .card p span {
        font-weight: 600;
        color: var(--text-primary);
        display: block;
        margin-bottom: 4px;
        font-size: 0.875rem;
        opacity: 0.7;
    }

    .card a {
        display: inline-block;
        padding: 10px 20px;
        background: linear-gradient(
            135deg, 
            var(--primary-color) 0%, 
            var(--secondary-color) 100%
        );
        color: white;
        border-radius: 8px;
        text-decoration: none;
        font-size: 0.925rem;
        font-weight: 700;
        margin-top: auto;
        text-transform: uppercase;
        letter-spacing: 0.05em;
        transition: 
            transform 0.3s ease,
            box-shadow 0.3s ease;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .card a:hover {
        transform: translateY(-3px);
        box-shadow: 
            0 6px 12px rgba(0, 0, 0, 0.15),
            0 4px 8px rgba(0, 0, 0, 0.1);
        background: linear-gradient(
            135deg, 
            var(--secondary-color) 0%, 
            var(--accent-color) 100%
        );
    }

    @media (max-width: 768px) {
        .container {
            grid-template-columns: 1fr;
            margin-left: 0;
            padding: 15px;
        }

        .card {
            max-width: 100%;
        }
    }
</style>
</head>
<body class="antialiased">
    <div class="flex">
        <!-- Sidebar (Navbar) -->
        <div class="gradient-sidebar">
            <div class="sidebar">
                <!-- Include the sidebar/navbar content -->
                <%@ include file="curatornavbar.jsp" %>
            </div>
        </div>

        <!-- Main Content -->
        <div class="flex-1 p-8">
            <h2 class="text-2xl font-semibold text-center mb-6 text-gray-800">All Training Courses</h2>
            <div class="container">
                <c:forEach var="course" items="${courses}">
                    <div class="card hover-lift">
                        <!-- Card Header -->
                        <h3><i class="fas fa-book"></i> ${course.title}</h3>

                        <!-- Card Body -->
                        <p><span>Description:</span> ${course.description}</p>
                        <p><span>Duration:</span> ${course.days} Days</p>
                        <p><span>Added By:</span> ${course.addedBy.name}</p>
                        <p class="text-sm text-gray-500"><span>Added On:</span> ${course.createdAt}</p>

                        <!-- Card Footer with a link -->
                        <a href="${course.filePath}" target="_blank">View File/URL</a>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</body>
</html>
