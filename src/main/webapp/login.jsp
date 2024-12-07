<!DOCTYPE html>
<html>
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
    <style>
      /* Enhanced Flip Card Styles */
      .flip-card-container {
         perspective: 1000px;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: calc(100vh - 100px);
        background-image: url('https://images.unsplash.com/photo-1658235081483-8f06aa0882cf?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        padding: 20px;
        position: relative;
      }
      
      .flip-card {
        width: 100%;
        max-width: 450px;
        height: 650px;
        position: relative;
        transform-style: preserve-3d;
        transition: transform 0.8s cubic-bezier(0.175, 0.885, 0.32, 1.275);
        box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
      }
      
      .flip-card.flipped {
        transform: rotateY(180deg);
      }

      .flip-card-form {
        backface-visibility: hidden;
        position: absolute;
        width: 100%;
        height: 100%;
        top: 0;
        left: 0;
        display: flex;
        flex-direction: column;
        justify-content: center;
        padding: 40px;
        background: white;
        border-radius: 15px;
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        transform: rotateY(0);
      }

      .flip-card-back {
        transform: rotateY(180deg);
      }

      /* Enhanced Form Styles */
      .form-group {
        margin-bottom: 20px;
        position: relative;
      }
      
      .error-message {
    color: red;            /* Text color */
    text-align: center;    /* Center alignment */
    font-weight: bold;     /* Optional: Makes the text bold */
    margin: 10px 0;        /* Adds some spacing */
}
      
      
      .form-input {
        width: 100%;
        padding: 12px 15px;
        border-radius: 10px;
        border: 2px solid #e0e0e0;
        font-size: 1rem;
        transition: all 0.3s ease;
        background-color: #f9f9f9;
      }

      .form-input:focus {
        outline: none;
        border-color: #6a11cb;
        box-shadow: 0 0 0 3px rgba(106, 17, 203, 0.1);
      }
      
      .btn {
        background: linear-gradient(to right, #6a11cb 0%, #2575fc 100%);
        color: white;
        padding: 12px;
        border-radius: 10px;
        border: none;
        width: 100%;
        cursor: pointer;
        font-size: 1rem;
        transition: transform 0.2s, box-shadow 0.2s;
        text-transform: uppercase;
        letter-spacing: 1px;
        font-weight: 600;
      }

      .btn:hover {
        transform: translateY(-2px);
        box-shadow: 0 7px 14px rgba(50, 50, 93, 0.1), 0 3px 6px rgba(0, 0, 0, 0.08);
      }

      .btn:active {
        transform: translateY(1px);
      }

      /* Link Styles */
      a {
        color: #6a11cb;
        text-decoration: none;
        transition: color 0.3s ease;
      }

      a:hover {
        color: #2575fc;
        text-decoration: underline;
      }

      /* Responsive Adjustments */
      @media (max-width: 600px) {
        .flip-card {
          max-width: 95%;
          height: auto;
        }

        .flip-card-form {
          padding: 20px;
        }
      }
    </style>
  </head>
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
    <div class="relative flex size-full min-h-screen flex-col bg-[#f8fafb] group/design-root overflow-x-hidden" style='font-family: Inter, "Noto Sans", sans-serif;'>
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
               <a class="text-[#0e151b] text-sm font-medium leading-normal" href="aboutus">About Us</a>
              <a class="text-[#0e151b] text-sm font-medium leading-normal" href="contactus">Contact Us</a>
            </div>
            </div>
            <div
              class="bg-center bg-no-repeat aspect-square bg-cover rounded-full size-10"
              style='background-image: url("https://cdn.usegalileo.ai/sdxl10/a4934d7a-7a0b-414b-948f-16ebd4f70f29.png");'
            ></div>
          </div>
        </header>

        <div class="flip-card-container">
          <div id="cardWrapper" class="flip-card">
            <!-- Login Form (First side) -->
            <div class="flip-card-form">
              <h2 class="text-center text-primary text-2xl font-bold mb-6">Login</h2>
              <form method="post" action="checklogin">
                <div class="form-group">
                  <input type="text" id="identifier" name="identifier" class="form-input" placeholder="Enter your username or email" required>
                </div>
                <div class="form-group">
                  <input type="password" id="password" name="password" class="form-input" placeholder="Enter your password" required>
                </div>
                <button type="submit" class="btn">Login</button>
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

              <div class="text-center mt-4">
                <a href="#" id="switchToRegister">Don't have an account? Register here.</a>
              </div>
            </div>
            <!-- Register Form (Back side) -->
            <div class="flip-card-form flip-card-back">
              <h2 class="text-center text-primary text-2xl font-bold mb-6">Register</h2>
              <form method="post" action="insertuser" novalidate>
                <div class="form-group">
                  <input type="text" class="form-input" name="name" placeholder="Full Name" required minlength="3" />
                </div>
                <div class="form-group">
                  <select class="form-input" name="gender" required>
                    <option value="" disabled selected>Select your gender</option>
                    <option value="male">Male</option>
                    <option value="female">Female</option>
                    <option value="other">Other</option>
                  </select>
                </div>
                <div class="form-group">
                  <input type="email" class="form-input" name="email" placeholder="Email Address" required />
                </div>
                <div class="form-group">
                  <input type="password" class="form-input" name="pwd" placeholder="Password" required minlength="6" />
                </div>
                <div class="form-group">
                  <input type="tel" class="form-input" name="phoneNumber" placeholder="Contact Number" required pattern="^\d{10}$" />
                </div>
                <div class="form-group">
                  <input type="text" class="form-input" name="location" placeholder="Location" required />
                </div>
                <button type="submit" class="btn">Register</button>
              </form>
  
              <div class="text-center mt-4">
                <a href="#" id="switchToLogin">Already have an account? Login here.</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <script>
      // Handle toggle between login and register forms
      document.getElementById('switchToRegister').addEventListener('click', function (e) {
        e.preventDefault();
        document.getElementById('cardWrapper').classList.add('flipped');
      });

      document.getElementById('switchToLogin').addEventListener('click', function (e) {
        e.preventDefault();
        document.getElementById('cardWrapper').classList.remove('flipped');
      });
    </script>
  </body>
</html>