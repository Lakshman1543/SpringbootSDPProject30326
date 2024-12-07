<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Certification Management System</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    
    <style>
        /* Reset and Base Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }

        body {
            background-color: #f4f7fc;
            min-height: 100vh;
            padding-left: 100px;
        }

      

        /* Navigation */
        .nav-container {
            position: fixed;
            left: 0;
            top: 0;
            height: 100vh;
            width: 100px;
            background: linear-gradient(180deg, #2c3e50 0%, #1a2634 100%);
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px 0;
            transition: width 0.3s ease;
            z-index: 1000;
            box-shadow: 4px 0 10px rgba(0, 0, 0, 0.1);
        }

        .nav-container:hover {
            width: 240px;
        }

        /* Brand */
        .nav-brand {
            color: white;
            text-align: center;
            margin-bottom: 30px;
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 0 20px;
        }

        .brand-icon {
            font-size: 2em;
            color: #fff;
            background: rgba(255, 255, 255, 0.1);
            padding: 10px;
            border-radius: 10px;
        }

        .brand-text {
            margin-left: 15px;
            font-size: 1.2em;
            white-space: nowrap;
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .nav-container:hover .brand-text {
            opacity: 1;
        }

        /* Navigation List */
        .nav-list {
            list-style: none;
            width: 100%;
            padding: 0 15px;
        }

        .nav-item {
            position: relative;
            width: 100%;
            margin-bottom: 10px;
        }

        .nav-link {
            display: flex;
            align-items: center;
            text-decoration: none;
            color: #fff;
            padding: 12px;
            border-radius: 10px;
            transition: all 0.3s ease;
            white-space: nowrap;
            overflow: hidden;
        }

        .nav-link:hover {
            background: rgba(255, 255, 255, 0.1);
            transform: translateX(5px);
        }

        .nav-icon {
            min-width: 40px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.2em;
            border-radius: 8px;
            background: rgba(255, 255, 255, 0.1);
            margin-right: 15px;
            transition: all 0.3s ease;
        }

        .nav-text {
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .nav-container:hover .nav-text {
            opacity: 1;
        }

        /* Submenu */
        .settings-submenu {
            position: absolute;
            left: 100%;
            top: 0;
            background: white;
            border-radius: 10px;
            padding: 10px;
            width: 200px;
            box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.1);
            visibility: hidden;
            opacity: 0;
            transition: all 0.3s ease;
            transform: translateX(20px);
        }

        .nav-item:hover .settings-submenu {
            visibility: visible;
            opacity: 1;
            transform: translateX(10px);
        }

        .submenu-link {
            display: block;
            padding: 10px 15px;
            color: #2c3e50;
            text-decoration: none;
            border-radius: 5px;
            transition: all 0.3s ease;
        }

        .submenu-link:hover {
            background: #f4f7fc;
            padding-left: 20px;
            color: #1a5f7a;
        }

        /* Active State */
        .nav-item.active .nav-link {
            background: #1a5f7a;
        }

        .nav-item.active .nav-icon {
            background: rgba(255, 255, 255, 0.2);
        }

        /* Divider */
        .nav-divider {
            width: 70%;
            height: 1px;
            background: rgba(255, 255, 255, 0.1);
            margin: 15px auto;
        }

        /* Logout */
        .nav-item.logout {
            margin-top: auto;
        }

        .nav-item.logout .nav-link {
            color: #ff6b6b;
        }

        .nav-item.logout .nav-icon {
            background: rgba(255, 107, 107, 0.1);
        }

        /* Tooltip */
        .nav-tooltip {
            position: absolute;
            left: 100%;
            top: 50%;
            transform: translateY(-50%);
            background: rgba(0, 0, 0, 0.8);
            color: white;
            padding: 5px 10px;
            border-radius: 5px;
            font-size: 0.8em;
            white-space: nowrap;
            pointer-events: none;
            opacity: 0;
            transition: all 0.3s ease;
        }

        .nav-item:hover .nav-tooltip {
            opacity: 1;
            transform: translateY(-50%) translateX(10px);
        }

        .nav-container:hover .nav-tooltip {
            display: none;
        }

        /* Responsive */
        @media (max-width: 768px) {
            body {
                padding-left: 70px;
            }
            
            .nav-container {
                width: 70px;
            }
            
            .nav-container:hover {
                width: 200px;
            }
        }

        /* Content Area */
        .content {
            padding: 20px;
            margin-left: 100px;
        }
    </style>
</head>
<body>
    

    <nav class="nav-container">
        <div class="nav-brand">
            <i class="fas fa-medal brand-icon"></i>
            <span class="brand-text">CMS</span>
        </div>

        <ul class="nav-list">
            <li class="nav-item">
                <a href="userhome" class="nav-link">
                    <span class="nav-icon"><i class="fas fa-home"></i></span>
                    <span class="nav-text">Dashboard</span>
                </a>
                <span class="nav-tooltip">Dashboard</span>
            </li>
            
            <li class="nav-item">
                <a href="userprofile" class="nav-link">
                    <span class="nav-icon"><i class="fas fa-user"></i></span>
                    <span class="nav-text">My Profile</span>
                </a>
                <span class="nav-tooltip">My Profile</span>
            </li>

            <li class="nav-item">
                <a href="#" class="nav-link">
                    <span class="nav-icon"><i class="fas fa-certificate"></i></span>
                    <span class="nav-text">Certifications</span>
                </a>
                <span class="nav-tooltip">Certifications</span>
                <div class="settings-submenu">
                    <a href="addcertification" class="submenu-link">Add Certification</a>
                    <a href="viewallcertifications" class="submenu-link">View All</a>
                    <a href="#" class="submenu-link">Update</a>
                    <a href="#" class="submenu-link">Delete</a>
                </div>
            </li>
            
            <li class="nav-item">
                <a href="training" class="nav-link">
                    <span class="nav-icon"><i class="fas fa-graduation-cap"></i></span>
                    <span class="nav-text">Training</span>
                </a>
                <span class="nav-tooltip">Training</span>
            </li>

            <div class="nav-divider"></div>
            
            <li class="nav-item">
                <a href="#" class="nav-link">
                    <span class="nav-icon"><i class="fas fa-cog"></i></span>
                    <span class="nav-text">Settings</span>
                </a>
                <span class="nav-tooltip">Settings</span>
                <div class="settings-submenu">
                    <a href="accountsettings" class="submenu-link">Account Settings</a>
                </div>
            </li>
            
            <li class="nav-item logout">
                <a href="logout" class="nav-link">
                    <span class="nav-icon"><i class="fas fa-sign-out-alt"></i></span>
                    <span class="nav-text">Logout</span>
                </a>
                <span class="nav-tooltip">Logout</span>
            </li>
        </ul>
    </nav>

    <div class="content">
        <!-- Your page content goes here -->
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Set active state based on current page
            const currentPage = window.location.pathname;
            const navLinks = document.querySelectorAll('.nav-link');
            
            navLinks.forEach(link => {
                if (link.getAttribute('href') === currentPage) {
                    link.parentElement.classList.add('active');
                }
            });

            // Handle submenu animations
            const navItems = document.querySelectorAll('.nav-item');
            
            navItems.forEach(item => {
                const submenu = item.querySelector('.settings-submenu');
                if (submenu) {
                    item.addEventListener('mouseenter', () => {
                        submenu.style.visibility = 'visible';
                        submenu.style.opacity = '1';
                        submenu.style.transform = 'translateX(10px)';
                    });
                    
                    item.addEventListener('mouseleave', () => {
                        submenu.style.visibility = 'hidden';
                        submenu.style.opacity = '0';
                        submenu.style.transform = 'translateX(20px)';
                    });
                }
            });

            // Add smooth hover effects
            const navContainer = document.querySelector('.nav-container');
            let hoverTimeout;

            navContainer.addEventListener('mouseenter', () => {
                clearTimeout(hoverTimeout);
                navContainer.style.width = '240px';
            });

            navContainer.addEventListener('mouseleave', () => {
                hoverTimeout = setTimeout(() => {
                    navContainer.style.width = '100px';
                }, 300);
            });
        });
    </script>
</body>
</html>