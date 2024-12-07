<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View All Curators</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/style.css' />">
    <style>
        :root {
            --primary: #6200ea;
            --primary-hover: #3700b3;
            --background: #f9f9f9;
            --text-dark: #212121;
            --text-muted: #757575;
            --button-radius: 4px;
            --card-shadow: rgba(0, 0, 0, 0.1);
        }

        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background-color: var(--background);
            color: var(--text-dark);
        }

        .container {
            max-width: 1200px;
            margin: 50px auto;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 4px 8px var(--card-shadow);
            border-radius: 8px;
        }

        h1 {
            font-size: 2rem;
            text-align: center;
            margin-bottom: 20px;
            color: var(--text-dark);
        }

        .table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 16px;
            text-align: left;
            border: 1px solid #ddd;
            font-size: 1rem;
        }

        th {
            background-color: var(--primary);
            color: white;
            font-weight: 600;
        }

        tr:nth-child(even) {
            background-color: #f4f4f4;
        }

        tr:hover {
            background-color: #e1e1e1;
        }

        td:last-child {
            font-weight: 500;
        }

        .btn {
            display: inline-block;
            padding: 8px 16px;
            text-align: center;
            border-radius: var(--button-radius);
            text-decoration: none;
            transition: background-color 0.3s, transform 0.2s;
        }

        .btn-primary {
            background-color: var(--primary);
            color: white;
            border: none;
        }

        .btn-primary:hover {
            background-color: var(--primary-hover);
            transform: scale(1.05);
        }

        .btn-danger {
            background-color: #dc3545;
            color: white;
            border: none;
        }

        .btn-danger:hover {
            background-color: #c82333;
            transform: scale(1.05);
        }

        .btn-success {
            background-color: #28a745;
            color: white;
            border: none;
        }

        .btn-success:hover {
            background-color: #218838;
            transform: scale(1.05);
        }

        .empty-message {
            text-align: center;
            font-size: 1.2rem;
            color: var(--text-muted);
        }

        .actions {
            display: flex;
            gap: 10px;
        }

        .actions a, .actions button {
            flex: 1;
            text-align: center;
        }

        .add-curator-btn {
            text-align: center;
            margin-top: 20px;
        }

        @media (max-width: 768px) {
            .container {
                padding: 15px;
            }

            th, td {
                font-size: 0.9rem;
            }

            .actions {
                flex-direction: column;
            }
        }
    </style>
</head>

<body>

<%@ include file="adminnavbar.jsp" %>

    <div class="container">
        <h1>All Curators</h1>

        <!-- Display a message if the list is empty -->
        <c:if test="${empty curators}">
            <p class="empty-message">No curators found.</p>
        </c:if>

        <!-- Table for listing curators -->
        <c:if test="${not empty curators}">
            <table class="table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${curators}" var="curator">
                        <tr>
                            <td>${curator.id}</td>
                            <td>${curator.name}</td>
                            <td>${curator.email}</td>
                            <td class="actions">
                                <a href="<c:url value='editcurator/${curator.id}' />" class="btn btn-primary">Edit</a>
                                <form action="<c:url value='/deletecurator/${curator.id}' />" method="post" style="display:inline;">
                                    <button type="submit" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this curator?');">Delete</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>

        <!-- Link to add a new curator -->
        <div class="add-curator-btn">
            <a href="<c:url value='addcurator' />" class="btn btn-success">Add New Curator</a>
        </div>
    </div>

</body>

</html>
