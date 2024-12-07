<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
    <style>
        :root {
            --primary-color: #6a11cb;
            --secondary-color: #2575fc;
            --background-color: #f4f4f9;
            --text-color: #333;
            --white: #ffffff;
            --gray: #ccc;
            --shadow-color: rgba(0, 0, 0, 0.1);
        }

        body {
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
            background-color: var(--background-color);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background: var(--white);
            padding: 2rem;
            border-radius: 12px;
            box-shadow: 0 8px 20px var(--shadow-color);
            width: 100%;
            max-width: 400px;
            animation: fadeIn 0.5s ease-in-out;
        }

        h1 {
            text-align: center;
            color: var(--primary-color);
            font-size: 1.8rem;
            margin-bottom: 1rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        label {
            display: block;
            margin-bottom: 0.5rem;
            color: var(--text-color);
            font-size: 1rem;
        }

        input {
            width: 100%;
            padding: 0.8rem;
            border: 1px solid var(--gray);
            border-radius: 8px;
            font-size: 1rem;
            color: var(--text-color);
            background-color: var(--white);
            transition: all 0.3s ease;
        }

        input:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 8px rgba(106, 17, 203, 0.2);
            outline: none;
        }

        input::placeholder {
            color: #999;
        }

        button {
            width: 100%;
            padding: 0.8rem;
            font-size: 1rem;
            font-weight: bold;
            color: var(--white);
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease, transform 0.2s ease;
        }

        button:hover {
            background: linear-gradient(135deg, var(--secondary-color), var(--primary-color));
            transform: translateY(-3px);
        }

        button:active {
            transform: translateY(1px);
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
<head>
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin="" />
    <link
        rel="stylesheet"
        as="style"
        onload="this.rel='stylesheet'"
        href="https://fonts.googleapis.com/css2?display=swap&amp;family=Inter%3Awght%40400%3B500%3B700%3B900&amp;family=Noto+Sans%3Awght%40400%3B500%3B700%3B900"
    />
    <title>Online Certification Management</title>
    <link rel="icon" type="image/x-icon" href="data:image/x-icon;base64," />
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
</head>

<body>
    <div class="relative flex size-full min-h-screen flex-col group/design-root overflow-x-hidden" style='font-family: Inter, "Noto Sans", sans-serif;'>
        <div class="layout-container flex h-full grow flex-col">
            <header class="flex items-center justify-between whitespace-nowrap border-b border-solid border-b-[#e8eef3] px-10 py-3">
                <div class="flex items-center gap-4 text-[#0e151b]">
                    <div class="size-4">
                        <svg viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path
                                d="M42.4379 44C42.4379 44 36.0744 33.9038 41.1692 24C46.8624 12.9336 42.2078 4 42.2078 4L7.01134 4C7.01134 4 11.6577 12.932 5.96912 23.9969C0.876273 33.9029 7.27094 44 7.27094 44L42.4379 44Z"
                                fill="currentColor"
                            ></path>
                        </svg>
                    </div>
                    <h2 class="text-[#0e151b] text-lg font-bold leading-tight tracking-[-0.015em]">SkillCertify</h2>
                </div>
                <div class="flex flex-1 justify-end gap-8">
                    <div class="flex items-center gap-9">
                        <a class="text-[#0e151b] text-sm font-medium leading-normal" href="/">Home</a>
                        <a class="text-[#0e151b] text-sm font-medium leading-normal" href="userlogin">User</a>
                        <a class="text-[#0e151b] text-sm font-medium leading-normal" href="adminlogin">Admin</a>
                        <a class="text-[#0e151b] text-sm font-medium leading-normal" href="curatorlogin">Curator</a>
                         <a class="text-[#0e151b] text-sm font-medium leading-normal" href="login">Login</a>
                        <a class="text-[#0e151b] text-sm font-medium leading-normal" href="contactus">Contact Us</a>
                    </div>
                </div>
                <div
                    class="bg-center bg-no-repeat aspect-square bg-cover rounded-full size-10"
                    style='background-image: url("https://cdn.usegalileo.ai/sdxl10/a4934d7a-7a0b-414b-948f-16ebd4f70f29.png");'
                ></div>
            </header>
    <div class="container">
        <h1>Reset Password</h1>
        <form:form method="post" action="resetpassword" modelAttribute="reset">
            <input type="hidden" name="token" value="${token}" />
            <div class="form-group">
                <label for="newPassword">New Password:</label>
                <form:password path="newPassword" id="newPassword" class="form-control" placeholder="Enter new password" required="true"/>
            </div>
            <button type="submit" class="btn btn-primary">Reset Password</button>
        </form:form>
    </div>
</body>
</html>