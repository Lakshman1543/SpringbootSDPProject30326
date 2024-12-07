<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Messages</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .table-container {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container table-container">
        <h2>Contact Messages</h2>
        <table class="table table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th>#</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Contact</th>
                    <th>Message</th>
                    <th>Suggestions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="contact" items="${qlist}">
                    <tr>
                        <td>${contact.id}</td>
                        <td>${contact.name}</td>
                        <td>${contact.email}</td>
                        <td>${contact.contact}</td>
                        <td>${contact.message}</td>
                        <td>${contact.suggestions != null ? contact.suggestions : 'N/A'}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Optional: Bootstrap JS for modal or interactivity -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.1/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
