<%@page import="com.klef.jfsd.springboot.model.Admin"%>
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
    <title>View All Users</title>
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
            padding: 2rem;
            width: 95%;
            max-width: 1400px;
            margin: 0 auto;
            overflow: hidden;
        }

        .page-title {
            color: var(--text-dark);
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 1.5rem;
            padding-bottom: 0.75rem;
            border-bottom: 2px solid var(--primary);
            width: 100%;
            text-align: left;
        }

        .table-wrapper {
            overflow-x: auto;
            margin-right: -1px;
            padding-right: 1px;
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

        th:first-child {
            border-top-left-radius: 8px;
        }

        th:last-child {
            border-top-right-radius: 8px;
        }

        td {
            padding: 1rem;
            border-bottom: 1px solid #e5e7eb;
            color: var(--text-dark);
            font-size: 0.875rem;
        }

        tr:last-child td {
            border-bottom: none;
        }

        tr:hover td {
            background-color: #f8fafc;
        }

        /* Status cell styling */
        td:last-child {
            font-weight: 500;
        }

        .status-active {
            color: #059669;
        }

        .status-inactive {
            color: #dc2626;
        }


        /* Status styles */
        .status-cell {
            font-weight: 500;
        }

        .status-Accepted {
            color: #059669;
        }

        .status-Rejected {
            color: #dc2626;
        }

        .status-Pending {
            color: #d97706;
        }

        :root {
    --primary: #4f46e5;
    --primary-hover: #4338ca;
    --background: #f9fafb;
    --text-dark: #1f2937;
    --text-muted: #9ca3af;
}

/* Dropdown styles */
.dropdown {
    position: relative;
    display: inline-block;
}

.dropdown-toggle {
    padding: 0.5rem 1rem;
    background: var(--primary);
    color: white;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    font-size: 0.875rem;
    display: flex;
    align-items: center;
    gap: 0.5rem;
    transition: background-color 0.2s;
}

.dropdown-toggle:hover {
    background: var(--primary-hover);
}

.dropdown-content {
    visibility: hidden;
    opacity: 0;
    position: absolute;
    right: 0;
    min-width: 160px;
    background-color: white;
    border-radius: 8px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    z-index: 1000;
    margin-top: 0.5rem;
    overflow: hidden;
    transition: visibility 0s, opacity 0.2s ease;
}

/* Show dropdown when hovering over the dropdown container */
.dropdown:hover .dropdown-content,
.dropdown-content:hover {
    visibility: visible;
    opacity: 1;
}

.dropdown-content a {
    color: var(--text-dark);
    padding: 0.75rem 1rem;
    text-decoration: none;
    display: block;
    font-size: 0.875rem;
    transition: background-color 0.2s;
}

.dropdown-content a:hover {
    background-color: #f3f4f6;
    color: var(--primary);
}

/* Add a small invisible area to prevent dropdown from closing */
.dropdown::after {
    content: '';
    position: absolute;
    height: 20px;
    width: 100%;
    bottom: -20px;
    left: 0;
}

      
        /* Responsive design */
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
</head>
<body>
    <%@include file="adminnavbar.jsp" %>
    <div class="main-content">
        <div class="table-container">
            <h3 class="page-title">View All Users</h3>
            <div class="table-wrapper">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Gender</th>
                            <th>Location</th>
                            <th>Email</th>
                            <th>Contact</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${userlist}" var="user">
                            <tr>
                                <td><c:out value="${user.id}" /></td>
                                <td><c:out value="${user.name}" /></td>
                                <td><c:out value="${user.gender}" /></td>
                                <td><c:out value="${user.location}" /></td>
                                <td><c:out value="${user.email}" /></td>
                                <td><c:out value="${user.contact}" /></td>
                                <td><c:out value="${user.accountstatus}"/></td>
								<td>
			                    <a href='<c:url value="updatestatus?id=${user.id}&accountstatus=Accepted"></c:url>' style="color:green;">
			                        <i class="fas fa-check"></i>
			                    </a>
			                    <a href='<c:url value="updatestatus?id=${user.id}&accountstatus=Rejected"></c:url>' style="color:red; margin-left: 10px;">
			                        <i class="fas fa-times"></i>
			                    </a>
			                </td>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script>
        function updatestatus(id, accountstatus) {
            const url = `updatestatus?id=${id}&accountstatus=${accountstatus}`;
            window.location.href = url;
        }
    </script>
</body>
</html>