<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Training Course</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }
        .container {
            width: 50%;
            margin: 50px auto;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }
        input, textarea, select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Update Training Course</h2>
        <form action="updatetrainingcourse" method="post" modelAttribute="trainingCourse">
            <input type="hidden" name="courseId" value="${trainingCourse.courseId}" />
            
            <label for="title">Title</label>
            <input type="text" id="title" name="title" value="${trainingCourse.title}" required />

            <label for="description">Description</label>
            <textarea id="description" name="description" rows="4" required>${trainingCourse.description}</textarea>

            <label for="filePath">File URL</label>
            <input type="url" id="filePath" name="filePath" value="${trainingCourse.filePath}" required />

            <label for="days">Duration (Days)</label>
            <input type="number" id="days" name="days" value="${trainingCourse.days}" min="1" required />

            <button type="submit">Update Course</button>
        </form>
    </div>
</body>
</html>
