<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Training Courses</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }
        .container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            padding: 20px;
        }
        .card {
            background-color: white;
            width: 300px;
            margin: 15px;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
        }
        .card:hover {
            transform: translateY(-5px);
        }
        .card h3 {
            font-size: 18px;
            color: #333;
        }
        .card p {
            font-size: 14px;
            color: #555;
            line-height: 1.6;
        }
        .card span {
            font-weight: bold;
        }
        .card .buttons {
            margin-top: 10px;
            display: flex;
            justify-content: space-between;
        }
        .card a, .card button {
            display: inline-block;
            margin-top: 10px;
            padding: 8px 15px;
            text-align: center;
            font-size: 14px;
            border-radius: 5px;
            text-decoration: none;
            color: white;
            border: none;
            cursor: pointer;
        }
        .card a {
            background-color: #007bff;
        }
        .card a:hover {
            background-color: #0056b3;
        }
        .card .edit {
            background-color: #28a745;
        }
        .card .edit:hover {
            background-color: #218838;
        }
        .card .delete {
            background-color: #dc3545;
        }
        .card .delete:hover {
            background-color: #c82333;
        }
        .card .footer {
            margin-top: 15px;
            font-size: 12px;
            color: #777;
        }
    </style>
</head>
<body>
    <h2 style="text-align: center; padding: 20px;">Manage Training Courses</h2>
    <div class="container">
        <c:forEach var="course" items="${courses}">
            <div class="card">
                <h3>${course.title}</h3>
                <p><span>Description:</span> ${course.description}</p>
                <p><span>Duration:</span> ${course.days} Days</p>
                <p><span>Added By:</span> ${course.addedBy.name}</p>
                <p class="footer"><span>Added On:</span> ${course.createdAt}</p>
                <div class="buttons">
                    <a href="updateTrainingcourse.jsp?courseId=${course.courseId}" class="edit">Edit</a>
                    <form action="deleteCourse" method="post" style="display: inline;">
                        <input type="hidden" name="courseId" value="${course.courseId}" />
                        <button type="submit" class="delete">Delete</button>
                    </form>
                </div>
            </div>
        </c:forEach>
    </div>
</body>
</html>
