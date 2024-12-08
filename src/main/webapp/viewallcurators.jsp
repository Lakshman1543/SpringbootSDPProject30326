<%@page import="com.klef.jfsd.springboot.model.Admin"%>
<%@page import="com.klef.jfsd.springboot.model.Curator"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%
Admin admin = (Admin) session.getAttribute("admin");
if (admin == null) {
	response.sendRedirect("adminsessionexpiry");
	return;
}
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>View All Curators</title>
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

        td:last-child {
            font-weight: 500;
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

<%@ include file="adminnavbar.jsp" %>

<div class="main-content">
    <div class="table-container">
        <h3 class="page-title">View All Curators</h3>
        <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search by Curator Name">

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Gender</th>
                    <th>Email</th>
                    <th>Username</th>
                    <th>Contact</th>
                    <th>Image</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${clist}" var="curator">
                    <tr>
                        <td><c:out value="${curator.id}"></c:out></td>
                        <td><c:out value="${curator.name}"></c:out></td>
                        <td><c:out value="${curator.gender}"></c:out></td>
                        <td><c:out value="${curator.email}"></c:out></td>
                        <td><c:out value="${curator.username}"></c:out></td>
                        <td><c:out value="${curator.contact}"></c:out></td>
                        <td>
                            <img src="displaycuratorimage?id=${curator.id}" width="50" height="50" alt="Curator Image">
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<script>
    function myFunction() {
        var input, filter, table, tr, td, i, txtValue;
        input = document.getElementById("myInput");
        filter = input.value.toUpperCase();
        table = document.getElementById("myTable");
        tr = table.getElementsByTagName("tr");
        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[1]; // Search by the Name column
            if (td) {
                txtValue = td.textContent || td.innerText;
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    }
</script>

</body>
</html>
