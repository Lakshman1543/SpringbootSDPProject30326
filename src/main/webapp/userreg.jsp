<%@page import="com.klef.jfsd.springboot.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%
User user = (User) session.getAttribute("user");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Quicksand', sans-serif;
        }

        body {
            min-height: 100vh;
            background: #0f0c29;
            color: #fff;
            position: relative;
            display: flex;
            justify-content: center;
            align-items: flex-start;  /* Changed from center to flex-start */
            padding: 20px;
            padding-top: 120px;  /* Added padding to move form down */
        }

        .waves {
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(45deg, #24243e, #302b63, #0f0c29);
            clip-path: polygon(0 70%, 100% 50%, 100% 100%, 0% 100%);
            animation: waveMove 10s ease-in-out infinite alternate;
            z-index: 0;
        }

        .form-container {
            position: relative;
            z-index: 7;
            width: 100%;
            max-width: 500px;
            margin: 20px auto;
            padding: 40px;
            background: rgba(255, 255, 255, 0.07);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 24px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
            animation: cardFloat 3s ease-in-out infinite;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 24px;
        }

        .input-group {
            position: relative;
        }

        label {
            display: block;
            font-size: 0.95rem;
            color: rgba(255, 255, 255, 0.9);
            font-weight: 500;
            margin-bottom: 8px;
        }

        .input-with-icon {
            position: relative;
            display: flex;
            align-items: center;
        }

        .input-with-icon i {
            position: absolute;
            left: 16px;
            color: rgba(255, 255, 255, 0.6);
            font-size: 1rem;
            transition: all 0.3s ease;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"],
        input[type="number"] {
            width: 100%;
            padding: 14px 20px 14px 48px;
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 14px;
            color: #fff;
            font-size: 1rem;
            transition: all 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="email"]:focus,
        input[type="password"]:focus,
        input[type="number"]:focus {
            border-color: #4ecdc4;
            outline: none;
            background: rgba(255, 255, 255, 0.08);
            box-shadow: 0 0 20px rgba(78, 205, 196, 0.2);
        }

        input:focus + i {
            color: #4ecdc4;
        }

        .radio-group {
    display: flex;
    gap: 16px;
    padding: 8px 0;
}

.radio-label {
    position: relative;
    display: flex;
    align-items: center;
    gap: 8px;
    font-size: 1rem;
    
    cursor: pointer;
    transition: all 0.3s ease;
}

.radio-label:hover {
    color: #4ecdc4;
}

input[type="radio"] {
    appearance: none;
    width: 18px;
    height: 18px;
    border: 2px solid rgba(255, 255, 255, 0.6);
    border-radius: 50%;
    outline: none;
    background: transparent;
    cursor: pointer;
    transition: all 0.3s ease;
    display: inline-block;
    margin: 0;
    position: relative;
}

input[type="radio"]:checked {
     background: linear-gradient(90deg, #4ecdc4, transparent);
     background: linear-gradient(90deg, #4ecdc4, transparent);
}

input[type="radio"]::before {
    content: "";
    position: absolute;
    width: 10px;
    height: 10px;
    background: #fff;
    border-radius: 50%;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%) scale(0);
    transition: transform 0.3s ease;
}

input[type="radio"]:checked::before {
    transform: translate(-50%, -50%) scale(1);
}


        h3 {
            color: #fff;
            font-size: 2.2em;
            font-weight: 700;
            letter-spacing: 1px;
            text-align: center;
            margin-bottom: 32px;
            position: relative;
        }

        h3::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 60px;
            height: 3px;
            background: linear-gradient(90deg, #4ecdc4, transparent);
            border-radius: 2px;
        }

        .button-container {
            display: flex;
            gap: 16px;
            margin-top: 16px;
        }

        input[type="submit"],
        input[type="reset"] {
            flex: 1;
            padding: 14px 30px;
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 14px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            background: rgba(255, 255, 255, 0.05);
            color: #fff;
        }

        input[type="submit"] {
            background: linear-gradient(135deg, rgba(78, 205, 196, 0.2), rgba(78, 205, 196, 0.1));
            border-color: rgba(78, 205, 196, 0.3);
        }

        input[type="submit"]:hover,
        input[type="reset"]:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
            background: rgba(78, 205, 196, 0.15);
        }

        @keyframes waveMove {
            0% { clip-path: polygon(0 70%, 100% 50%, 100% 100%, 0% 100%); }
            50% { clip-path: polygon(0 60%, 100% 80%, 100% 100%, 0% 100%); }
            100% { clip-path: polygon(0 80%, 100% 60%, 100% 100%, 0% 100%); }
        }

        @keyframes cardFloat {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }

        @media (max-width: 640px) {
            body {
                padding-top: 80px;  /* Adjusted for mobile */
            }

            .form-container {
                padding: 30px 20px;
                margin: 10px;
            }

            h3 {
                font-size: 1.8em;
            }

            .button-container {
                flex-direction: column;
            }

            .radio-group {
                flex-direction: column;
                gap: 12px;
            }
        }

        ::-webkit-scrollbar {
            width: 8px;
        }

        ::-webkit-scrollbar-track {
            background: rgba(255, 255, 255, 0.1);
        }

        ::-webkit-scrollbar-thumb {
            background: rgba(78, 205, 196, 0.5);
            border-radius: 4px;
        }

        input[type="number"]::-webkit-inner-spin-button,
        input[type="number"]::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
    </style>
</head>
<body>
    
     <div style="display: none;">
        <c:out value="${message}" />
    </div>
    <div class="waves"></div>
    <%@include file="mainnavbar.jsp"%>
    <div class="form-container">
        <form method="post" action="insertuser">
            <h3>User Registration</h3>
            
            <div class="input-group">
                <label for="uname">Name</label>
                <div class="input-with-icon">
                    <input type="text" id="uname" name="name" required placeholder="Enter your name" />
                    <i class="fas fa-user"></i>
                </div>
            </div>

            <div class="input-group">
                <label>Gender</label>
                <div class="radio-group">
                    <label class="radio-label">
                        <input type="radio" id="male" name="gender" value="MALE" required />
                        Male
                    </label>
                    <label class="radio-label">
                        <input type="radio" id="female" name="gender" value="FEMALE" required />
                        Female
                    </label>
                    <label class="radio-label">
                        <input type="radio" id="others" name="gender" value="OTHERS" required />
                        Others
                    </label>
                </div>
            </div>

            <div class="input-group">
                <label for="uemail">Email ID</label>
                <div class="input-with-icon">
                    <input type="email" id="uemail" name="email" required placeholder="Enter your email" />
                    <i class="fas fa-envelope"></i>
                </div>
            </div>

            <div class="input-group">
                <label for="upassword">Password</label>
                <div class="input-with-icon">
                    <input type="password" id="upassword" name="pwd" required placeholder="Enter your password" />
                    <i class="fas fa-lock"></i>
                </div>
            </div>

            <div class="input-group">
                <label for="uphonenumber">Contact</label>
                <div class="input-with-icon">
                    <input type="number" id="uphonenumber" name="phoneNumber" required placeholder="Enter your contact number" />
                    <i class="fas fa-phone"></i>
                </div>
            </div>

            <div class="input-group">
                <label for="ulocation">Location</label>
                <div class="input-with-icon">
                    <input type="text" id="ulocation" name="location" required placeholder="Enter your location" />
                    <i class="fas fa-map-marker-alt"></i>
                </div>
            </div>

            <div class="button-container">
                <input type="submit" value="Register" />
                <input type="reset" value="Clear" />
            </div>
        </form>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastify-js/1.12.0/toastify.js"></script>
    <script>
        const message = `<c:out value="${message}"/>`;
        if (message && message.trim() !== '') {
        	Toastify({
                text: "Regestration Successful",
                duration: 3000,
                close: true,
                gravity: "top", // `top` or `bottom`
                position: "right", // `left`, `center` or `right`
                backgroundColor: "linear-gradient(to right, #4CAF50, #8BC34A)",
                stopOnFocus: true, // Prevents dismissing of toast on hover
            }).showToast();
        }
    </script>
</body>
</html>