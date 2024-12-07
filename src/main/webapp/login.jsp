<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
    :root {
    --primary-color: #6a11cb;
    --secondary-color: #2575fc;
    --background-color: #f4f4f4;
    --text-color: #333;
    --white: #ffffff;
    --gray: #e0e0e0;
}

body {
    margin: 0;
    padding: 0;
    font-family: 'Inter', 'Noto Sans', sans-serif;
    background-color: var(--background-color);
    background-image: url('https://images.unsplash.com/photo-1658235081483-8f06aa0882cf?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');
    background-size: cover;
    background-position: center;
    background-attachment: fixed;
    color: var(--text-color);
}

body::before {
    content: '';
    position: fixed;
    inset: 0;
    background: rgba(0, 0, 0, 0.5);
    z-index: 0;
}

.layout-container {
    z-index: 1;
    position: relative;
}

header {
    background: rgba(255, 255, 255, 0.9);
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    padding: 1rem 2rem;
}

header a {
    color: var(--text-color);
    font-size: 1rem;
    font-weight: 500;
    transition: color 0.3s;
}

header a:hover {
    color: var(--primary-color);
}

header h2 {
    font-size: 1.5rem;
    color: var(--text-color);
    font-weight: bold;
}

.form-center {
    display: flex;
    align-items: center;
    justify-content: center;
    height: calc(100vh - 60px);
    position: relative;
    z-index: 1;
}

.login-container {
    background: rgba(255, 255, 255, 0.95);
    border-radius: 12px;
    padding: 2rem;
    width: 100%;
    max-width: 400px;
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
}

.login-container h2 {
    font-size: 1.8rem;
    color: var(--primary-color);
    text-align: center;
    margin-bottom: 1rem;
}

.login-container label {
    font-size: 0.9rem;
    color: var(--text-color);
    display: block;
    margin-bottom: 0.5rem;
}

.login-container input {
    width: 100%;
    padding: 0.8rem;
    border: 1px solid var(--gray);
    border-radius: 8px;
    font-size: 1rem;
    background: var(--white);
    color: var(--text-color);
    margin-bottom: 1rem;
    transition: border-color 0.3s, box-shadow 0.3s;
}

.login-container input:focus {
    border-color: var(--primary-color);
    outline: none;
    box-shadow: 0 0 8px rgba(106, 17, 203, 0.2);
}

.login-container button {
    width: 100%;
    padding: 0.8rem;
    font-size: 1rem;
    font-weight: bold;
    color: var(--white);
    background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
    border: none;
    border-radius: 8px;
    cursor: pointer;
    transition: background 0.3s, transform 0.2s;
}

.login-container button:hover {
    transform: translateY(-2px);
    background: linear-gradient(135deg, var(--secondary-color), var(--primary-color));
}

.login-container button:active {
    transform: translateY(1px);
}

.login-container .forgot-password a {
    font-size: 0.9rem;
    color: var(--primary-color);
    text-decoration: none;
    display: block;
    text-align: right;
}

.login-container .forgot-password a:hover {
    text-decoration: underline;
}

.error-message {
    color: red;
    font-size: 0.9rem;
    text-align: center;
    margin-top: 1rem;
}

footer {
    text-align: center;
    padding: 1rem;
    font-size: 0.9rem;
    color: var(--text-color);
    background: rgba(255, 255, 255, 0.8);
    position: relative;
    z-index: 1;
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
                         <a class="text-[#0e151b] text-sm font-medium leading-normal" href="login">Login</a>
                         <a class="text-[#0e151b] text-sm font-medium leading-normal" href="aboutus">About us</a>
                        <a class="text-[#0e151b] text-sm font-medium leading-normal" href="contactus">Contact Us</a>
                    </div>
                </div>
                <div
                    class="bg-center bg-no-repeat aspect-square bg-cover rounded-full size-10"
                    style='background-image: url("https://cdn.usegalileo.ai/sdxl10/a4934d7a-7a0b-414b-948f-16ebd4f70f29.png");'
                ></div>
            </header>

            <div class="form-center">
                <div class="login-container">
    <h2>Login</h2>
    <form action="checklogin" method="post">
      <!-- Identifier field: username for admin, email for user -->
      <label for="identifier">Username / Email:</label>
      <input type="text" id="identifier" name="identifier" placeholder="Enter your username or email" required>
      
      <!-- Password field -->
      <label for="password">Password:</label>
      <input type="password" id="password" name="password" placeholder="Enter your password" required>
      
      <!-- Submit button -->
      <button type="submit">Login</button>
    </form>

    <!-- Forgot Password link -->
    <div class="forgot-password">
      <a href="forgotpassword">Forgot Password?</a>
    </div>

    <!-- Optional: Feedback message display -->
    <p id="message" class="error-message">
      <!-- Server error messages can be dynamically rendered here -->
      ${message}
    </p>
  </div>
            </div>
        </div>
    </div>
</body>
</html>
