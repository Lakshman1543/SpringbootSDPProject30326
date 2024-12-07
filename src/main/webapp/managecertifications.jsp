<%@ page import="com.klef.jfsd.springboot.model.Admin"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%
Admin admin = (Admin) session.getAttribute("admin");
if (admin == null) {
    response.sendRedirect("adminsessionexpiry.jsp");
    return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Certificates</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary: #4f46e5;
            --primary-hover: #4338ca;
            --background: #f9fafb;
            --text-dark: #1f2937;
            --text-muted: #9ca3af;
        }

        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', sans-serif;
            background: var(--background);
        }

        .main-content {
            margin-left: 280px;
            padding: 2rem;
            transition: margin-left 0.3s ease;
        }

        .sidebar.collapsed + .main-content {
            margin-left: 80px;
        }

        .table-container {
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 6px rgba(79, 70, 229, 0.1);
            padding: 1.5rem;
            width: 100%;
            overflow: auto;
        }

        .page-title {
            color: var(--text-dark);
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 1.5rem;
            padding-bottom: 0.75rem;
            border-bottom: 2px solid var(--primary);
        }

        .search-container {
            position: relative;
            margin-bottom: 1.5rem;
        }

        #myInput {
            width: 100%;
            padding: 12px 20px;
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            font-size: 1rem;
            background-color: white;
        }

        #myInput:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 2px 8px rgba(79, 70, 229, 0.15);
        }

        .search-icon {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--text-muted);
        }

        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
        }

        th {
            background: var(--primary);
            color: white;
            font-weight: 500;
            padding: 1rem;
            text-align: left;
            font-size: 0.875rem;
            text-transform: uppercase;
            letter-spacing: 0.05em;
            position: sticky;
            top: 0;
            z-index: 10;
        }

        td {
            padding: 1rem;
            border-bottom: 1px solid #e5e7eb;
            color: var(--text-dark);
            font-size: 0.875rem;
        }

        tr:hover td {
            background-color: #f8fafc;
        }

        .action-buttons a {
            text-decoration: none;
            padding: 0.5rem 1rem;
            border-radius: 6px;
            font-size: 0.875rem;
            font-weight: 500;
            display: inline-block;
            margin-right: 0.5rem;
        }

        .view-btn {
            background-color: var(--primary);
            color: white;
        }

        .download-btn {
            background-color: var(--primary-hover);
            color: white;
        }

        .edit-btn {
            background-color: #f59e0b;
            color: white;
        }

        .delete-btn {
            background-color: #dc2626;
            color: white;
        }

        .action-buttons a:hover {
            opacity: 0.9;
        }

        .status-active {
            color: #059669;
        }

        .status-expired {
            color: #dc2626;
        }

        @media (max-width: 768px) {
            .main-content {
                margin-left: 0;
                padding: 1rem;
            }

            .table-container {
                border-radius: 8px;
                padding: 1rem;
            }

            table {
                min-width: 800px;
            }
        }
    </style>
    <script>
        function myFunction() {
            const input = document.getElementById("myInput");
            const filter = input.value.toUpperCase();
            const table = document.getElementById("myTable");
            const rows = table.getElementsByTagName("tr");

            for (let i = 1; i < rows.length; i++) {
                const td = rows[i].getElementsByTagName("td")[1]; // Certification name column
                rows[i].style.display = td && td.textContent.toUpperCase().includes(filter) ? "" : "none";
            }
        }
    </script>
</head>
<body>
<%@include file="adminnavbar.jsp" %>
<div class="main-content">
    <div class="table-container">
        <h3 class="page-title">View Certificates</h3>
        <div class="search-container">
            <i class="fas fa-search search-icon"></i>
            <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search Certificates">
        </div>
        <table id="myTable">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Certification Name</th>
                    <th>Issued By</th>
                    <th>Issue Date</th>
                    <th>Expiry Date</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${certlist}" var="certification">
                    <tr>
                        <td><c:out value="${certification.certificationId}" /></td>
                        <td><c:out value="${certification.certificationname}" /></td>
                        <td><c:out value="${certification.issuedBy}" /></td>
                        <td><c:out value="${certification.issuedate}" /></td>
                        <td><c:out value="${certification.expirydate}" /></td>
                        <td>
                            <span class="${certification.status == 'Active' ? 'status-active' : 'status-expired'}">
                                <c:out value="${certification.status}" />
                            </span>
                        </td>
                        <td class="action-buttons">
                            <a href="viewcertfile?id=${certification.certificationId}" class="view-btn">View</a>
                            <a href="downloadcertfile?id=${certification.certificationId}" class="download-btn">Download</a>
                            <!-- Edit Button -->
                            <a href="editcertification?id=${certification.certificationId}" class="edit-btn">
                                <i class="fas fa-edit"></i> Edit
                            </a>
                            <!-- Delete Button -->
                            <a href="deletecertification?id=${certification.certificationId}" class="delete-btn" onclick="return confirm('Are you sure you want to delete this certificate?');">
                                <i class="fas fa-trash-alt"></i> Delete
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
