<%@ page import="com.klef.jfsd.springboot.model.User"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
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
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Add Certification</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastify-js/1.12.0/toastify.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }

        body {
            background-color: #f4f7fc;
            padding: 20px;
            padding-left: 120px;
            min-height: 100vh;
        }

        .page-header {
            text-align: center;
            margin-bottom: 2rem;
            color: #2c3e50;
            position: relative;
            padding-bottom: 10px;
        }

        .page-header::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 3px;
            background: linear-gradient(180deg, #2c3e50 0%, #1a2634 100%);
        }

        .form-container {
            width: 90%;
            max-width: 600px;
            margin: 0 auto;
            background: white;
            padding: 2rem;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .form-row {
            margin-bottom: 1.5rem;
        }

        .form-row label {
            display: block;
            margin-bottom: 0.5rem;
            color: #2c3e50;
            font-weight: 500;
        }

        .form-row input[type="text"],
        .form-row input[type="date"],
        .form-row input[type="file"],
        .form-row select {
            width: 100%;
            padding: 10px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            font-size: 16px;
            transition: all 0.3s ease;
        }

        .form-row input[type="text"]:focus,
        .form-row input[type="date"]:focus,
        .form-row select:focus {
            outline: none;
            border-color: #1a5f7a;
            box-shadow: 0 2px 8px rgba(26, 95, 122, 0.2);
        }

        .submit-btn {
            background: linear-gradient(180deg, #2c3e50 0%, #1a2634 100%);
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            width: 100%;
            margin-top: 1rem;
        }

        .submit-btn:hover {
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(26, 95, 122, 0.3);
        }

        .error-message {
            color: #c62828;
            text-align: center;
            margin-bottom: 1rem;
            padding: 8px;
            background-color: #fde8e8;
            border-radius: 6px;
            font-size: 14px;
        }

        @media screen and (max-width: 768px) {
            body {
                padding: 10px;
                padding-left: 110px;
            }

            .form-container {
                width: 100%;
                padding: 1.5rem;
            }
        }
    </style>
</head>

<body>
    <%@ include file="usernavbar.jsp"%>
    <br><br><br>
    

    <h1 class="page-header">Add Certification</h1>
    
    <c:if test="${not empty message}">
        <div class="error-message">
            <c:out value="${message}"></c:out>
        </div>
    </c:if>

    <form action="insertcertification" method="post" enctype="multipart/form-data" class="form-container">
        <div class="form-row">
            <label>Certification Name</label>
            <input type="text" name="certificationname" required="required" />
        </div>

        <div class="form-row">
            <label>Issued By</label>
            <input type="text" name="issuedBy" required="required" />
        </div>

        <div class="form-row">
            <label>Issue Date</label>
            <input type="date" name="issuedate" required="required" />
        </div>

        <div class="form-row">
            <label>Expiry Date</label>
            <input type="date" name="expirydate" />
        </div>

        <div class="form-row">
            <label>Status</label>
            <select name="status" required="required">
                <option value="">---Select---</option>
                <option value="Active">Active</option>
                <option value="Expired">Expired</option>
            </select>
        </div>

        <div class="form-row">
            <label>Certificate File (PDF)</label>
            <input type="file" name="certificatefile" required="required" accept="application/pdf" />
        </div>
        
        <div class="form-row">
        <label for="isGlobal">Is Global?</label>
        <input type="checkbox" id="isGlobal" name="isGlobal" value="true">
    </div>

        <button type="submit" class="submit-btn">
            <i class="fas fa-plus-circle"></i> Add Certification
        </button>
    </form>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/toastify-js/1.12.0/toastify.js"></script>
    <!-- <script>
        // Fetch the message from the JSP page
        const message = `<c:out value="${message}" />`.trim();

        // Display toast if the message is not empty
        if (message) {
            Toastify({
                text: message,
                duration: 3000,
                close: true,
                gravity: "top", // `top` or `bottom`
                position: "right", // `left`, `center`, or `right`
                backgroundColor: "linear-gradient(to right, #4CAF50, #8BC34A)",
                stopOnFocus: true // Prevent dismiss on hover
            }).showToast();
        }
    </script> -->
</body>
</html>