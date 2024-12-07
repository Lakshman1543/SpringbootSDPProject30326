<%@page import="com.klef.jfsd.springboot.model.Curator"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%
Curator curator = (Curator) session.getAttribute("curator");
if (curator == null) {
 
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Training Course</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        :root {
            --primary-color: #3b82f6;
            --secondary-color: #10b981;
            --background-color: #f4f7f6;
            --text-color: #2c3e50;
            --border-color: #e2e8f0;
            --error-color: #e74c3c;
        }

        body {
            background-color: var(--background-color);
            font-family: 'Inter', 'Arial', sans-serif;
            color: var(--text-color);
        }

        .gradient-sidebar {
            width: 250px;
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }

        .form-container {
            background-color: white;
            border-radius: 16px;
            padding: 40px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            max-width: 700px;
            margin: 50px auto;
            transition: all 0.4s ease;
        }

        .form-container:hover {
            box-shadow: 0 15px 30px rgba(0,0,0,0.15);
            transform: translateY(-5px);
        }

        .form-input {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid var(--border-color);
            border-radius: 10px;
            transition: all 0.3s ease;
            background-color: #f9fafb;
            font-size: 1rem;
        }

        .form-input:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(59,130,246,0.2);
        }

        .form-input:invalid {
    border-color: var(--primary-color); /* Change to blue */
    box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.2); /* Blue shadow */
}


        .form-label {
            display: block;
            margin-bottom: 8px;
            color: var(--primary-color);
            font-weight: 600;
            font-size: 0.95rem;
        }

        .submit-btn {
            background-color: var(--primary-color);
            color: white;
            border: none;
            padding: 14px;
            border-radius: 10px;
            font-weight: bold;
            transition: all 0.4s ease;
            box-shadow: 0 4px 6px rgba(59,130,246,0.3);
        }

        .submit-btn:hover {
            background-color: var(--secondary-color);
            transform: translateY(-3px);
            box-shadow: 0 6px 10px rgba(16,185,129,0.4);
        }

        .submit-btn:active {
            transform: translateY(1px);
            box-shadow: none;
        }

        @media (max-width: 768px) {
            .gradient-sidebar {
                width: 200px;
            }

            .form-container {
                width: 95%;
                padding: 25px;
                margin: 30px auto;
            }
        }
    </style>
</head>
<body class="antialiased">
    <div class="flex">
        <!-- Sidebar -->
        <div class="gradient-sidebar">
            <div class="sidebar">
                <%@ include file="curatornavbar.jsp" %>
            </div>
        </div>

        <!-- Main Content Area -->
        <div class="flex-1 ml-64 p-8 overflow-y-auto">
            <h2 class="text-2xl font-semibold mb-6 text-gray-800">
                <i class="fas fa-graduation-cap mr-2"></i>Add Training Course
            </h2>
            
            <form:form cssClass="form-container" action="inserttrainingcourse" method="post" modelAttribute="trainingCourse">
                <div class="mb-4">
                    <label class="form-label" for="id">Course ID</label>
                    <form:input 
                        cssClass="form-input" 
                        path="courseId" 
                        id="id" 
                        placeholder="Enter unique course identifier" 
                        required="true" 
                        pattern="[A-Za-z0-9-]+"
                        title="Course ID must contain only letters, numbers, and hyphens"
                    />
                </div>

                <div class="mb-4">
                    <label class="form-label" for="title">Course Title</label>
                    <form:input 
                        cssClass="form-input" 
                        path="title" 
                        id="title" 
                        placeholder="Enter comprehensive course title" 
                        required="true" 
                        minlength="5"
                        maxlength="100"
                    />
                </div>

                <div class="mb-4">
                    <label class="form-label" for="description">Course Description</label>
                    <form:textarea 
                        cssClass="form-input" 
                        path="description" 
                        id="description" 
                        placeholder="Provide a detailed course overview" 
                        rows="5" 
                        required="true" 
                        minlength="20"
                        maxlength="500"
                    />
                </div>

                <div class="mb-4">
                    <label class="form-label" for="filePath">Course Material URL</label>
                    <form:input 
                        cssClass="form-input" 
                        path="filePath" 
                        id="filePath" 
                        type="url" 
                        placeholder="https://example.com/course-materials" 
                        required="true"
                    />
                </div>

                <div class="mb-4">
                    <label class="form-label" for="days">Course Duration</label>
                    <form:input 
                        cssClass="form-input" 
                        path="days" 
                        id="days" 
                        type="number" 
                        min="1" 
                        max="90" 
                        placeholder="Number of training days" 
                        required="true"
                    />
                </div>

                <button type="submit" class="submit-btn w-full mt-4">
                    <i class="fas fa-plus-circle mr-2"></i>Add Training Course
                </button>
            </form:form>
        </div>
    </div>

    <script>
        // Client-side validation
        document.querySelector('form').addEventListener('submit', function(e) {
            const inputs = this.querySelectorAll('input, textarea');
            inputs.forEach(input => {
                if (!input.checkValidity()) {
                    input.classList.add('border-red-500');
                    e.preventDefault();
                } else {
                    input.classList.remove('border-red-500');
                }
            });
        });
    </script>
</body>
</html>