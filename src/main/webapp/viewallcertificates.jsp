<%@page import="com.klef.jfsd.springboot.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
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
    <title>Certification List</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
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

        .search-container {
            width: 90%;
            max-width: 600px;
            margin: 0 auto 2rem;
            position: relative;
        }

        #myInput {
            width: 100%;
            padding: 12px 20px 12px 45px;
            font-size: 16px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            transition: all 0.3s ease;
            background-color: white;
        }

        .search-icon {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #1a5f7a;
        }

        #myInput:focus {
            outline: none;
            border-color: #1a5f7a;
            box-shadow: 0 2px 8px rgba(26, 95, 122, 0.2);
        }

        #myTableContainer {
            width: 95%;
            margin: auto;
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        #myTable {
            width: 100%;
            border-collapse: collapse;
            font-size: 15px;
        }

        #myTable th {
            background: linear-gradient(180deg, #2c3e50 0%, #1a2634 100%);
            color: white;
            padding: 15px;
            font-weight: 600;
            text-align: left;
            text-transform: uppercase;
            font-size: 14px;
            letter-spacing: 0.5px;
        }

        #myTable td {
            padding: 12px 15px;
            border-bottom: 1px solid #eef0f5;
            color: #2c3e50;
        }

        #myTable tr:nth-child(even) {
            background-color: #f8f9fc;
        }

        #myTable tr:hover {
            background-color: #f0f4ff;
            transition: background-color 0.3s ease;
        }

        .action-buttons a {
            text-decoration: none;
            padding: 6px 12px;
            border-radius: 6px;
            font-size: 14px;
            font-weight: 500;
            transition: all 0.3s ease;
            display: inline-block;
            margin: 0 4px;
        }

       .view-btn {
    color: white;
    background: linear-gradient(180deg, #2c3e50 0%, #1a2634 100%);
}

.download-btn {
    color: white;
    background: linear-gradient(180deg, #2c3e50 0%, #1a2634 100%);
}


        .action-buttons a:hover {
            transform: translateY(-1px);
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            background-color: rgba(26, 95, 122, 0.2);
        }

        .status-badge {
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 13px;
            font-weight: 500;
        }
.status-active {
            background-color: #e1f7e1;
            color: #2e7d32;
        }

        .status-expired {
            background-color: #fde8e8;
            color: #c62828;
        }

        @media screen and (max-width: 768px) {
            body {
                padding: 10px;
                padding-left: 110px;
            }

            #myTableContainer {
                width: 100%;
                overflow-x: auto;
            }

            .search-container {
                width: 100%;
            }

            #myTable {
                font-size: 14px;
            }

            #myTable th, 
            #myTable td {
                padding: 10px;
            }

            .action-buttons a {
                padding: 4px 8px;
                font-size: 13px;
            }
        }
    </style>
     <script>
        function myFunction() {
            var input, filter, table, tr, td, i, txtValue;
            input = document.getElementById("myInput");
            filter = input.value.toUpperCase();
            table = document.getElementById("myTable");
            tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[1]; // filter by certification name
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
</head>

<body>
    <%@ include file="usernavbar.jsp" %>
    <br><br><br>
    <h1 class="page-header">View Your Certificates</h1>
    
    <div class="search-container">
        <i class="fas fa-search search-icon"></i>
        <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Enter Certification Name">
    </div>

    <div id="myTableContainer">
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
                            <span class="status-badge ${certification.status == 'Active' ? 'status-active' : 'status-expired'}">
                                <c:out value="${certification.status}" />
                            </span>
                        </td>
                        <td class="action-buttons">
                            <a href='viewcertfile?id=${certification.certificationId}' class="view-btn" target="_blank">
                                <i class="fas fa-eye"></i> View
                            </a>
                            <a href='downloadcertfile?id=${certification.certificationId}' class="download-btn">
                                <i class="fas fa-download"></i> Download
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>   
</body>
</html>