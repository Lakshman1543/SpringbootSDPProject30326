<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contact Us - Certification Management System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
       <link rel="stylesheet" href="main.css">
    <link rel="stylesheet" href="navbar.css">
</head>
<style>
   html, body {
    margin: 0;
    padding: 0;
    height: 100%; /* Ensure the body takes the full viewport height */
    background-image: url('https://images.unsplash.com/photo-1658235081483-8f06aa0882cf?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    background-attachment: fixed;
}

.page-container {
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 20px;
    min-height: calc(100vh - 70px); /* Ensure content is visible within viewport height */
}


    

    .card-container {
        background: #fff;
        border-radius: 8px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        width: 90%;
        max-width: 500px;
        padding: 20px;
        margin-bottom: 30px;
    }

    .card-header h3 {
        margin: 0;
        text-align: center;
        color: var(--primary-color, #6a11cb);
        margin-bottom: 20px;
    }

    .form-group {
        display: flex;
        align-items: center;
        margin-bottom: 20px;
        position: relative;
    }

    .form-group i {
        position: absolute;
        left: 10px;
        color: #aaa;
        font-size: 18px;
    }

    .form-group input,
    .form-group textarea {
        width: 100%;
        padding: 12px 12px 12px 40px;
        border: 1px solid #ccc;
        border-radius: 8px;
        font-size: 16px;
        transition: border-color 0.3s ease, box-shadow 0.3s ease;
    }

    .form-group input:focus,
    .form-group textarea:focus {
        border-color: var(--primary-color, #6a11cb);
        outline: none;
        box-shadow: 0 0 8px rgba(106, 17, 203, 0.2);
    }

    .form-group textarea {
        resize: none;
        height: 100px;
    }

    .submit-button {
        width: 100%;
        padding: 12px;
        background: linear-gradient(135deg, var(--primary-color, #6a11cb), var(--secondary-color, #2575fc));
        color: #fff
        border: none;
        border-radius: 8px;
        font-size: 16px;
        cursor: pointer;
        transition: transform 0.3s ease, opacity 0.3s ease;
    }

    .submit-button:hover {
        transform: translateY(-2px);
        opacity: 0.9;
    }

    .map {
        text-align: center;
        margin: 30px 0;
        width: 90%;
        max-width: 800px;
        background: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    }

    .map h3 {
        margin-bottom: 20px;
        color: var(--primary-color, #6a11cb);
    }

    .map iframe {
        border: none;
        width: 100%;
        height: 300px;
        border-radius: 8px;
    }

    @media (max-width: 768px) {
        .card-container,
        .map {
            width: 100%;
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
			  <a class="text-[#0e151b] text-sm font-medium leading-normal" href="aboutus">About us</a>
              <a class="text-[#0e151b] text-sm font-medium leading-normal" href="contactus">Contact Us</a>
            </div>
            </div>
            <div
              class="bg-center bg-no-repeat aspect-square bg-cover rounded-full size-10"
              style='background-image: url("https://cdn.usegalileo.ai/sdxl10/a4934d7a-7a0b-414b-948f-16ebd4f70f29.png");'
            >
            </div>
          </div> 
    <div class="page-container">
        <div class="card-container">
            <div class="card-header">
                <h3>Contact Us</h3>
            </div>
            
            <div class="card-content">
                <!-- Update form to submit data to backend (Controller) -->
                <form action="addconmessage" method="post" >
                    <div class="form-group">
                        <i class="fas fa-user"></i>
                        <input type="text" name="name" placeholder="Your Name" required>
                    </div>
                    
                    <div class="form-group">
                        <i class="fas fa-envelope"></i>
                        <input type="email" name="email" placeholder="Your Email" required>
                    </div>
                    
                    <div class="form-group">
                        <i class="fas fa-envelope"></i>
                        <input type="conct" name="contact" placeholder="Your Contact Number" required>
                    </div>
                    
                    <div class="form-group">
                        <i class="fas fa-tag"></i>
                        <input type="text" name="subject" placeholder="Subject" required>
                    </div>
                    
                    <div class="form-group">
                        <i class="fas fa-comment-dots"></i>
                        <textarea name="message" placeholder="Your Message" required></textarea>
                    </div>
                    
                    <button type="submit" class="submit-button">
                        <i class="fas fa-paper-plane"></i>
                        Submit
                    </button>
                </form>
            </div>
        </div>

        <div class="map">
            <h3>Find Us Here</h3>
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d61226.610330271746!2d80.55049682167972!3d16.441925699999995!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3a35f0a2a7d81943%3A0x8ba5d78f65df94b8!2sK%20L%20E%20F%20Deemed%20To%20Be%20University!5e0!3m2!1sen!2sin!4v1731695991613!5m2!1sen!2sin" 
                    allowfullscreen="" 
                    loading="lazy" 
                    referrerpolicy="no-referrer-when-downgrade">
            </iframe>
        </div>
    </div>
</body>
</html>