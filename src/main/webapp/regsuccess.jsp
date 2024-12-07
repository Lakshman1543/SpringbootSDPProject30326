<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Success</title>
<style>
  body {
    font-family: Arial, sans-serif;
    display: flex;
    align-items: center;
    justify-content: center;
    height: 100vh;
    margin: 0;
    background-color: #f0f8ff;
  }
  .container {
    text-align: center;
    background: #fff;
    padding: 30px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
  }
  h1 {
    color: #28a745;
    font-size: 2rem;
  }
  p {
    margin: 20px 0;
    font-size: 1.1rem;
    color: #555;
  }
  .button {
    padding: 10px 20px;
    background-color: #007bff;
    color: white;
    text-decoration: none;
    border-radius: 4px;
    font-weight: bold;
  }
  .button:hover {
    background-color: #0056b3;
  }
</style>
</head>
<body>
  <div class="container">
    <h1>Registered Successfully!</h1>
    <p>Click the button below to login</p>
    <a href="userlogin" class="button">Login</a>
  </div>
</body>
</html>
