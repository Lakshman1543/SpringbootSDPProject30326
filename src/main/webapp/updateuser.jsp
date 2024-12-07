<%@page import="com.klef.jfsd.springboot.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
User user = (User) session.getAttribute("user");
if(user==null) {
    response.sendRedirect("usersessionexpiry");
    return;
}
%>
<!DOCTYPE html>
<html>
<head>
    <title>Update User</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', sans-serif;
        }

        body {
            background: linear-gradient(135deg, #f4f7fc 0%, #e8ecf1 100%);
            min-height: 100vh;
        }

        h3 {
            color: #2c3e50;
            font-size: 2rem;
            text-align: center;
            margin-bottom: 2rem;
            position: relative;
        }

        h3::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 3px;
            background: linear-gradient(90deg, #1a5f7a, #086288);
            border-radius: 3px;
        }

        h4 {
            text-align: center;
            color: #e74c3c;
            margin-bottom: 1rem;
        }

        .form-container {
            max-width: 600px;
            margin: 0 auto;
            background: white;
            padding: 2rem;
            border-radius: 20px;
            box-shadow: 0 15px 30px rgba(44, 62, 80, 0.1);
        }

        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 1rem;
        }

        td {
            padding: 0.5rem;
            vertical-align: middle;
        }

        td:first-child {
            width: 35%;
        }

        label {
            color: #2c3e50;
            font-weight: 500;
            font-size: 0.95rem;
            display: block;
            margin-bottom: 0.5rem;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"],
        input[type="number"] {
            width: 100%;
            padding: 0.8rem 1rem;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            font-size: 1rem;
            transition: all 0.3s ease;
            background: #f8f9fa;
        }

        input[type="text"]:focus,
        input[type="email"]:focus,
        input[type="password"]:focus,
        input[type="number"]:focus {
            border-color: #1a5f7a;
            box-shadow: 0 0 0 3px rgba(26, 95, 122, 0.1);
            outline: none;
        }

        /* Radio buttons styling */
        .radio-group {
            display: flex;
            gap: 1.5rem;
            align-items: center;
        }

        input[type="radio"] {
            appearance: none;
            width: 20px;
            height: 20px;
            border: 2px solid #1a5f7a;
            border-radius: 50%;
            margin-right: 0.5rem;
            position: relative;
            cursor: pointer;
        }

        input[type="radio"]:checked {
            border-color: #1a5f7a;
            background: #1a5f7a;
        }

        input[type="radio"]:checked::after {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 8px;
            height: 8px;
            background: white;
            border-radius: 50%;
        }

        .button-container {
            text-align: center;
            padding-top: 1rem;
        }

        input[type="submit"],
        input[type="reset"] {
            padding: 0.8rem 2rem;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            margin: 0 0.5rem;
        }

        input[type="submit"] {
            background: linear-gradient(135deg, #1a5f7a 0%, #086288 100%);
            color: white;
        }

        input[type="reset"] {
            background: #e0e0e0;
            color: #2c3e50;
        }

        input[type="submit"]:hover {
            background: linear-gradient(135deg, #086288 0%, #1a5f7a 100%);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(26, 95, 122, 0.2);
        }

        input[type="reset"]:hover {
            background: #d0d0d0;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(44, 62, 80, 0.1);
        }

        /* Readonly inputs */
        input[readonly] {
            background-color: #f4f7fc;
            cursor: not-allowed;
            border-color: #e8ecf1;
        }

        /* Responsive design */
        @media (max-width: 768px) {
            .form-container {
                padding: 1.5rem;
                margin: 0 1rem;
            }

            table td {
                display: block;
                width: 100%;
            }

            td:first-child {
                padding-bottom: 0;
            }

            .radio-group {
                flex-wrap: wrap;
            }
        }
    </style>
</head>
<body>
    <%@include file="usernavbar.jsp" %>

    <h4><c:out value="${message}"></c:out></h4>
    <h3>Update User Profile</h3>

    <div class="form-container">
        <form method="post" action="updateuserprofile">
            <table>
                <tr>
                    <td><label for="id">User ID</label></td>
                    <td><input type="number" id="eid" name="id" readonly value="<%= user.getId() %>" required/></td>
                </tr>
                <tr>
                    <td><label for="name">Enter Name</label></td>
                    <td><input type="text" id="ename" name="name" value="<%= user.getName() %>" required/></td>
                </tr>
                <tr>
                    <td><label>Select Gender</label></td>
                    <td class="radio-group">
                        <div>
                            <input type="radio" id="male" name="gender" value="MALE" <%= user.getGender().equals("MALE") ? "checked" : "" %> required/>
                            <label for="male">Male</label>
                        </div>
                        <div>
                            <input type="radio" id="female" name="gender" value="FEMALE" <%= user.getGender().equals("FEMALE") ? "checked" : "" %> required/>
                            <label for="female">Female</label>
                        </div>
                        <div>
                            <input type="radio" id="others" name="gender" value="OTHERS" <%= user.getGender().equals("OTHERS") ? "checked" : "" %> required/>
                            <label for="others">Others</label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td><label for="location">Enter Location</label></td>
                    <td><input type="text" id="elocation" name="location" value="<%= user.getLocation() %>" required/></td>
                </tr>
                <tr>
                    <td><label for="email">Enter Email ID</label></td>
                    <td><input type="email" id="eemail" name="email" readonly value="<%= user.getEmail() %>" required/></td>
                </tr>
                <tr>
                    <td><label for="pwd">Enter Password</label></td>
                    <td><input type="password" id="epwd" name="pwd" value="<%= user.getPassword() %>" required/></td>
                </tr>
                <tr>
                    <td><label for="contact">Enter Contact</label></td>
                    <td><input type="number" id="econtact" name="contact" value="<%= user.getContact() %>" required/></td>
                </tr>
                <tr>
                    <td colspan="2" class="button-container">
                        <input type="submit" value="Update"/>
                        <input type="reset" value="Clear"/>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>