<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Curator</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            line-height: 1.6;
            background-color: #f0f4f8;
            color: #2c3e50;
        }

        .welcome {
            background: linear-gradient(135deg, #e0f7fa 0%, #b2ebf2 100%);
            padding: 40px 20px;
            text-align: center;
            color: #006064;
        }

        .welcome h1 {
            margin: 0;
            font-size: 2.5em;
        }

        h3 {
            text-align: center;
            padding: 20px 0;
            color: #006064;
            text-transform: uppercase;
            font-weight: bold;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            max-width: 1200px;
            margin: 20px auto;
            border-collapse: separate;
            border-spacing: 0;
            background-color: #ffffff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 15px;
            text-align: left;
            word-wrap: break-word;
        }

        th {
            background-color: #1E201E;
            color: #e0f7fa;
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        tr:nth-child(even) {
            background-color: #f8f9fa;
        }

        tr:nth-child(odd) {
            background-color: #ffffff;
        }

        tr:hover {
            background-color: #e0f7fa;
            transition: background-color 0.3s ease;
        }

        td a {
            display: inline-block;
            padding: 8px 16px;
            background-color: #e94560;
            color: #ffffff;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }

        td a:hover {
            background-color: #c81d4e;
        }

        @media screen and (max-width: 768px) {
            table {
                border: 0;
            }
            table thead {
                display: none;
            }
            table tr {
                margin-bottom: 10px;
                display: block;
                border-bottom: 2px solid #1E201E;
            }
            table td {
                display: block;
                text-align: right;
                padding-left: 50%;
                position: relative;
            }
            table td:before {
                content: attr(data-label);
                position: absolute;
                left: 6px;
                width: 45%;
                padding-right: 10px;
                white-space: nowrap;
                text-align: left;
                font-weight: bold;
                color: #006064;
            }
        }
    </style>
</head>
<body>
    <%@include file="adminnavbar.jsp"%>
    <h3>
        <u>Delete Curator</u>
    </h3>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>NAME</th>
                <th>EMAIL</th>
                <th>SPECIALIZATION</th>
                <th>ACTION</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${clist}" var="curator">
                <tr>
                    <td data-label="ID"><c:out value="${curator.id}" /></td>
                    <td data-label="NAME"><c:out value="${curator.name}" /></td>
                    <td data-label="EMAIL"><c:out value="${curator.email}" /></td>
                    <td data-label="SPECIALIZATION"><c:out value="${curator.specialization}" /></td>
                    <td data-label="ACTION">
                        <a href='<c:url value="deleteoperation?id=${curator.id}"></c:url>'>Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
