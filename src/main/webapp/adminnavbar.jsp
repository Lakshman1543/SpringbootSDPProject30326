<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', sans-serif;
        }

        :root {
            --primary: #4f46e5;
            --primary-hover: #4338ca;
            --background: #f9fafb;
            --sidebar-bg: #1e1b4b;
            --text-light: #e5e7eb;
            --text-muted: #9ca3af;
        }

        body {
            min-height: 100vh;
            background: var(--background);
            display: flex;
        }

        .sidebar {
            width: 280px;
            background: var(--sidebar-bg);
            color: var(--text-light);
            position: fixed;
            left: 0;
            top: 0;
            height: 100vh;
            transition: all 0.3s ease;
            z-index: 1000;
        }

        .sidebar.collapsed {
            width: 80px;
        }

        .logo-container {
            padding: 1.5rem;
            display: flex;
            align-items: center;
            gap: 1rem;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            height: 80px;
        }

        .logo-icon {
            width: 35px;
            height: 35px;
            background: var(--primary);
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
        }

        .logo-text {
            font-size: 1.25rem;
            font-weight: 600;
            white-space: nowrap;
            opacity: 1;
            transition: opacity 0.3s ease;
        }

        .sidebar.collapsed .logo-text {
            opacity: 0;
            width: 0;
        }

        .toggle-btn {
            position: absolute;
            top: 1.5rem;
            right: -12px;
            width: 24px;
            height: 24px;
            background: var(--primary);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            color: white;
            transition: transform 0.3s ease;
        }

        .sidebar.collapsed .toggle-btn i {
            transform: rotate(180deg);
        }

        .nav-menu {
            padding: 1rem 0.75rem;
            height: calc(100% - 80px);
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
        }

        .nav-item {
            list-style: none;
            position: relative;
        }

        .nav-link {
            text-decoration: none;
            color: var(--text-muted);
            padding: 0.75rem 1rem;
            border-radius: 8px;
            display: flex;
            align-items: center;
            gap: 1rem;
            transition: all 0.3s ease;
            cursor: pointer;
        }

        .nav-icon {
            font-size: 1.25rem;
            flex-shrink: 0;
        }

        .nav-text {
            white-space: nowrap;
            opacity: 1;
            transition: opacity 0.3s ease;
        }

        .sidebar.collapsed .nav-text {
            opacity: 0;
            width: 0;
        }

        .nav-link:hover,
        .nav-link.active {
            background: rgba(255, 255, 255, 0.1);
            color: var(--text-light);
        }

        .nav-link.active {
            background: var(--primary);
        }

        .submenu {
            margin-left: 3rem;
            height: 0;
            overflow: hidden;
            transition: height 0.3s ease;
        }

        .submenu.open {
            height: auto;
            margin-top: 0.5rem;
        }

        .submenu .nav-link {
            padding: 0.5rem 1rem;
            font-size: 0.9rem;
        }

        .nav-item.has-submenu .nav-link::after {
            content: '\f107';
            font-family: 'Font Awesome 5 Free';
            font-weight: 900;
            margin-left: auto;
            transition: transform 0.3s ease;
        }

        .nav-item.has-submenu.open .nav-link::after {
            transform: rotate(180deg);
        }

        .sidebar.collapsed .nav-item.has-submenu .nav-link::after {
            opacity: 0;
            width: 0;
        }

        .tooltip {
            position: absolute;
            left: 100%;
            top: 50%;
            transform: translateY(-50%);
            background: #000;
            color: white;
            padding: 0.5rem 0.75rem;
            border-radius: 4px;
            font-size: 0.875rem;
            white-space: nowrap;
            opacity: 0;
            pointer-events: none;
            transition: opacity 0.3s ease;
            margin-left: 10px;
        }

        .tooltip::before {
            content: '';
            position: absolute;
            left: -4px;
            top: 50%;
            transform: translateY(-50%);
            border-style: solid;
            border-width: 5px 5px 5px 0;
            border-color: transparent #000 transparent transparent;
        }

        .sidebar.collapsed .nav-item:hover .tooltip {
            opacity: 1;
        }

        .main-content {
            margin-left: 280px;
            padding: 2rem;
            width: 100%;
            transition: margin-left 0.3s ease;
        }

        .sidebar.collapsed + .main-content {
            margin-left: 80px;
        }

        @media (max-width: 768px) {
            .sidebar {
                transform: translateX(-100%);
            }

            .sidebar.active {
                transform: translateX(0);
            }

            .main-content {
                margin-left: 0;
            }

            .sidebar.collapsed + .main-content {
                margin-left: 0;
            }

            .mobile-toggle {
                display: block;
                position: fixed;
                top: 1rem;
                left: 1rem;
                z-index: 1001;
                background: var(--primary);
                color: white;
                width: 40px;
                height: 40px;
                border-radius: 8px;
                display: flex;
                align-items: center;
                justify-content: center;
                cursor: pointer;
            }

            .toggle-btn {
                display: none;
            }
        }
    </style>
</head>
<body>
    <div class="mobile-toggle">
        <i class="fas fa-bars"></i>
    </div>

    <aside class="sidebar">
        <div class="logo-container">
            <div class="logo-icon">
                <i class="fas fa-layer-group"></i>
            </div>
            <span class="logo-text">Admin Dashboard</span>
            <div class="toggle-btn">
                <i class="fas fa-chevron-left"></i>
            </div>
        </div>

        <ul class="nav-menu">
            <li class="nav-item">
                <a href="adminhome" class="nav-link active">
                    <i class="fas fa-home nav-icon"></i>
                    <span class="nav-text">Dashboard</span>
                </a>
                <span class="tooltip">Dashboard</span>
            </li>

            <li class="nav-item has-submenu">
                <div class="nav-link">
                    <i class="fas fa-users nav-icon"></i>
                    <span class="nav-text">User Management</span>
                </div>
                <span class="tooltip">User Management</span>
                <ul class="submenu">
                    <li class="nav-item">
                        <a href="viewallusers" class="nav-link">
                            <i class="fas fa-list nav-icon"></i>
                            <span class="nav-text">View Users</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="updateuserstatus" class="nav-link">
                            <i class="fas fa-user-check nav-icon"></i>
                            <span class="nav-text">Update Status</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="deleteuser" class="nav-link">
                            <i class="fas fa-user-minus nav-icon"></i>
                            <span class="nav-text">Delete User</span>
                        </a>
                    </li>
                </ul>
            </li>
            
            <!-- Curator Management -->
<li class="nav-item has-submenu">
    <div class="nav-link">
        <i class="fas fa-chalkboard-teacher"></i> <!-- Icon for Curator Management -->
        <span class="nav-text">Curator Management</span>
    </div>
    <span class="tooltip">Curator Management</span>
    <ul class="submenu">
        <li class="nav-item">
            <a href="addcurator" class="nav-link">
                <i class="fas fa-plus nav-icon"></i> <!-- Add Course Icon -->
                <span class="nav-text">Add Curator</span>
            </a>
        </li>
        <li class="nav-item">
            <a href="managecurators" class="nav-link">
                <i class="fas fa-edit nav-icon"></i> <!-- Edit Course Icon -->
                <span class="nav-text">Manage Curators</span>
            </a>
        </li>
        <li class="nav-item">
            <a href="viewallcurators" class="nav-link">
                <i class="fas fa-list nav-icon"></i> <!-- View Courses Icon -->
                <span class="nav-text">View Curators</span>
            </a>
        </li>
    </ul>
</li>
            
            
            <!-- Certification Management -->
            
           <li class="nav-item has-submenu">
    <div class="nav-link">
        <i class="fas fa-award"></i> <!-- Updated main icon for Certification Management -->
        <span class="nav-text">Certification Management</span>
    </div>
    <span class="tooltip">Certificate Management</span>
    <ul class="submenu">
        <li class="nav-item">
            <a href="viewcertifications" class="nav-link">
                <i class="fas fa-certificate"></i> <!-- View Certificate Icon -->
                <span class="nav-text">View Certificates</span>
            </a>
        </li>
       

    </ul>
</li>


            <li class="nav-item">
                <a href="analytics" class="nav-link">
                    <i class="fas fa-chart-bar nav-icon"></i>
                    <span class="nav-text">Analytics</span>
                </a>
                <span class="tooltip">Analytics</span>
            </li>

            <li class="nav-item" style="margin-top: auto;">
                <a href="#" class="nav-link">
                    <i class="fas fa-cog nav-icon"></i>
                    <span class="nav-text">Settings</span>
                </a>
                <span class="tooltip">Settings</span>
            </li>

            <li class="nav-item">
                <a href="logout" class="nav-link">
                    <i class="fas fa-sign-out-alt nav-icon"></i>
                    <span class="nav-text">Logout</span>
                </a>
                <span class="tooltip">Logout</span>
            </li>
        </ul>
    </aside>



    <script>
        // Toggle sidebar
        const sidebar = document.querySelector('.sidebar');
        const toggleBtn = document.querySelector('.toggle-btn');
        const mobileToggle = document.querySelector('.mobile-toggle');

        toggleBtn.addEventListener('click', () => {
            sidebar.classList.toggle('collapsed');
        });

        mobileToggle.addEventListener('click', () => {
            sidebar.classList.toggle('active');
        });

        // Handle submenu toggles
        const submenuTriggers = document.querySelectorAll('.nav-item.has-submenu .nav-link');
        submenuTriggers.forEach(trigger => {
            trigger.addEventListener('click', (e) => {
                const parent = trigger.parentElement;
                const submenu = parent.querySelector('.submenu');
                
                // Close other open submenus
                document.querySelectorAll('.nav-item.has-submenu.open').forEach(item => {
                    if (item !== parent) {
                        item.classList.remove('open');
                        item.querySelector('.submenu').classList.remove('open');
                    }
                });

                // Toggle current submenu
                parent.classList.toggle('open');
                submenu.classList.toggle('open');
            });
        });

        // Handle active states
        const navLinks = document.querySelectorAll('.nav-link');
        navLinks.forEach(link => {
            if (!link.parentElement.classList.contains('has-submenu')) {
                link.addEventListener('click', () => {
                    document.querySelector('.nav-link.active')?.classList.remove('active');
                    link.classList.add('active');
                });
            }
        });

        // Close sidebar on mobile when clicking outside
        document.addEventListener('click', (e) => {
            if (window.innerWidth <= 768 && 
                !sidebar.contains(e.target) && 
                !mobileToggle.contains(e.target)) {
                sidebar.classList.remove('active');
            }
        });

        // Handle window resize
        window.addEventListener('resize', () => {
            if (window.innerWidth > 768) {
                sidebar.classList.remove('active');
            }
        });
    </script>
</body>
</html>