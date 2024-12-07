<%@page import="com.klef.jfsd.springboot.model.Curator"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TrainX - Curator Navbar</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&family=Arial&family=Roboto:wght@300;400;700&family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
    <style id="dynamicStyles">
        :root {
            --sidebar-position: left;
            --font-primary: 'Inter', sans-serif;
            --font-secondary: 'Arial', sans-serif;
            /* Default Theme */
            --primary-bg: #e6f2ff;
            --secondary-bg: #b6e3ff;
            --text-primary: #1a365d;
            --text-secondary: #2c5282;
            --accent-color: #2c5282;
            --hover-bg: #90cdf4;
            --border-color: #63b3ed;
        }

        /* Theme Variations */
        .theme-dark {
            --primary-bg: #1a202c;
            --secondary-bg: #2d3748;
            --text-primary: #ffffff;
            --text-secondary: #cbd5e0;
            --accent-color: #4299e1;
            --hover-bg: #2d3748;
            --border-color: #4a5568;
        }

        .theme-ocean {
            --primary-bg: #e6f2ff;
            --secondary-bg: #b6e3ff;
            --text-primary: #1a365d;
            --text-secondary: #2c5282;
            --accent-color: #2c5282;
            --hover-bg: #90cdf4;
            --border-color: #63b3ed;
        }

        .theme-forest {
            --primary-bg: #f0fff4;
            --secondary-bg: #c6f6d5;
            --text-primary: #22543d;
            --text-secondary: #2f855a;
            --accent-color: #2f855a;
            --hover-bg: #9ae6b4;
            --border-color: #68d391;
        }

        body {
            font-family: var(--font-primary);
            background-color: var(--secondary-bg);
            color: var(--text-primary);
            transition: all 0.3s ease;
        }

        #sidebar {
            width: var(--sidebar-width);
            position: fixed;
            top: 0;
            bottom: 0;
            background-color: var(--primary-bg);
            border-right: 1px solid var(--border-color);
            transition: all 0.3s ease;
            z-index: 50;
        }

        /* Profile Section */
        .profile-section {
            background-color: var(--primary-bg);
            border-top: 1px solid var(--border-color);
            padding: 15px;
            margin-top: auto;
            border-radius: 8px;
        }

        .profile-section .profile-content {
            display: flex;
            align-items: center;
            space-x-3;
        }

        .profile-section img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            object-cover: cover;
        }

        .profile-section h4 {
            font-weight: 600;
        }

        .profile-section p {
            font-size: 12px;
            color: #a0aec0;
        }

        /* Sidebar Hover */
        .nav-item {
            color: var(--text-secondary);
            transition: all 0.3s ease;
        }

        .nav-item:hover {
            background-color: var(--hover-bg);
            color: var(--accent-color);
        }

        .dropdown-menu {
            background-color: var(--primary-bg);
            border: 1px solid var(--border-color);
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }

        #customizationModal {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: var(--primary-bg);
            border: 1px solid var(--border-color);
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            z-index: 100;
            display: none;
            max-width: 500px;
            width: 90%;
        }

        .modal-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.5);
            z-index: 99;
            display: none;
        }
        .course-item a {
      display: inline-block;
      width: 100%; /* Full width to match dropdown items */
      text-decoration: none;
      font-size: 14px;
      font-weight: bold;
  }

  .course-item a:hover {
      background-color: #2563eb; /* Darker shade for hover effect */
      color: white;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
  }

  .course-item i {
      margin-right: 8px;
  }

  .dropdown-menu .course-item {
      border-top: 1px solid #e5e7eb; /* Light separator between courses */
  }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div id="sidebar" class="p-6 flex flex-col relative shadow-2xl">
      <!-- Logo Section -->
      <div class="mb-10 flex items-center justify-between">
          <div class="flex items-center space-x-4">
              <!-- Course Icon (Font Awesome Icon for Book) -->
              <i class="fas fa-book text-4xl text-gray-800"></i> <!-- Use the appropriate icon -->
              <h1 class="text-2xl font-bold tracking-wide">TrainX</h1>
          </div>
      </div>

      <!-- Navigation Menu -->
      <nav class="space-y-2 flex-grow">
          <!-- Dashboard -->
          <a href="curatorhome" class="nav-item flex items-center p-3 rounded-lg transition group">
              <i class="fas fa-home mr-3 text-lg opacity-75"></i>
              <span class="font-medium">Dashboard</span>
          </a>

          <!-- Courses Dropdown -->
          <div class="relative group">
              <button id="coursesDropdown" class="nav-item flex items-center p-3 rounded-lg w-full transition">
                  <i class="fas fa-graduation-cap mr-3 text-lg opacity-75"></i>
                  <span class="font-medium flex-grow">Courses</span>
                  <i class="fas fa-chevron-down text-lg opacity-75 transition-transform duration-300 group-[.open]:rotate-180"></i>
              </button>

             <!-- Dropdown Content -->
<div id="coursesDropdownContent" class="dropdown-menu hidden mt-2 rounded-lg overflow-hidden">
    <a href="addtrainingcourse" class="block p-3 hover:bg-gray-100 transition">
        <i class="fas fa-plus-circle mr-2"></i>Add Course
    </a>
    <a href="viewalltrainingcourses" class="block p-3 hover:bg-gray-100 transition">
        <i class="fas fa-list mr-2"></i>View Courses
    </a>
    <c:forEach var="course" items="${courses}">
        <div class="course-item p-3 hover:bg-gray-100 transition">
            <a href="updatecourse?courseId=${course.courseId}" 
               class="block px-4 py-2 rounded-lg text-center bg-blue-500 text-white hover:bg-blue-600 transition">
               <i class="fas fa-edit mr-2"></i>Update Course:${course.title}
            </a>
        </div>
    </c:forEach>
</div>

      </nav>

      <!-- Profile Section -->
      <div class="profile-section">
          <div class="profile-content">
              <img src="displaycuratorimage?id=${curator.id}" alt="Profile" class="w-10 h-10 rounded-full object-cover">
              <div class="flex-1">
                  <h4 class="font-semibold">${curator.username}</h4>
                  <p class="text-xs text-gray-500">Curator</p>
              </div>
              <a href=logout class="text-red-500 hover:text-red-700 transition duration-300">
                  <i class="fas fa-sign-out-alt text-lg"></i>
              </a>
          </div>
      </div>

      <!-- Customization Button -->
      <button id="openCustomizationBtn" class="mt-4 p-2 bg-blue-500 text-white rounded hover:bg-blue-600 transition">
          <i class="fas fa-cogs mr-2"></i>Customize Navbar
      </button>
    </div>

    <!-- Modal Overlay -->
    <div id="modalOverlay" class="modal-overlay"></div>

    <!-- Customization Modal -->
    <div id="customizationModal" class="p-6 rounded-lg">
        <div class="flex justify-between items-center mb-4">
            <h2 class="text-2xl font-bold">Navbar Customization</h2>
            <button id="closeCustomizationBtn" class="text-gray-600 hover:text-gray-900">
                <i class="fas fa-times text-xl"></i>
            </button>
        </div>

        <!-- Customization Options -->
        <div class="space-y-4">
            <!-- Theme Selection -->
            <div>
                <label class="block mb-2 font-semibold">Theme</label>
                <select id="themeSelector" class="w-full p-2 border rounded">
                    <option value="">Default</option>
                    <option value="theme-dark">Dark</option>
                    <option value="theme-ocean">Ocean</option>
                    <option value="theme-forest">Forest</option>
                </select>
            </div>

            <!-- Sidebar Width -->
            <div>
                <label class="block mb-2 font-semibold">Sidebar Width</label>
                <input type="range" id="sidebarWidthSlider" min="250" max="400" value="288" class="w-full">
                <div class="text-sm text-gray-600 mt-1">Current Width: <span id="currentWidthDisplay">288px</span></div>
            </div>

            <!-- Sidebar Position -->
            <div>
                <label class="block mb-2 font-semibold">Sidebar Position</label>
                <select id="sidebarPositionSelector" class="w-full p-2 border rounded">
                    <option value="left">Left</option>
                    <option value="right">Right</option>
                </select>
            </div>

            <!-- Font Selection -->
            <div>
                <label class="block mb-2 font-semibold">Primary Font</label>
                <select id="primaryFontSelector" class="w-full p-2 border rounded">
                    <option value="'Inter', sans-serif">Inter</option>
                    <option value="'Arial', sans-serif">Arial</option>
                    <option value="'Roboto', sans-serif">Roboto</option>
                    <option value="'Poppins', sans-serif">Poppins</option>
                </select>
            </div>
        </div>

        <!-- Action Buttons -->
        <div class="flex justify-between mt-6">
            <button id="applyCustomizationBtn" class="bg-green-500 text-white p-2 rounded hover:bg-green-600">Apply Changes</button>
            <button id="resetCustomizationBtn" class="bg-gray-300 text-gray-700 p-2 rounded hover:bg-gray-400">Reset to Default</button>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const openCustomizationBtn = document.getElementById('openCustomizationBtn');
            const customizationModal = document.getElementById('customizationModal');
            const modalOverlay = document.getElementById('modalOverlay');
            const closeCustomizationBtn = document.getElementById('closeCustomizationBtn');
            const applyCustomizationBtn = document.getElementById('applyCustomizationBtn');
            const resetCustomizationBtn = document.getElementById('resetCustomizationBtn');
            const body = document.body;

            // Modal Controls
            function openModal() {
                customizationModal.style.display = 'block';
                modalOverlay.style.display = 'block';
            }

            function closeModal() {
                customizationModal.style.display = 'none';
                modalOverlay.style.display = 'none';
            }

            openCustomizationBtn.addEventListener('click', openModal);
            closeCustomizationBtn.addEventListener('click', closeModal);
            modalOverlay.addEventListener('click', closeModal);

            // Sidebar Width Display
            const sidebarWidthSlider = document.getElementById('sidebarWidthSlider');
            const currentWidthDisplay = document.getElementById('currentWidthDisplay');
            
            sidebarWidthSlider.addEventListener('input', () => {
                currentWidthDisplay.textContent = `${sidebarWidthSlider.value}px`;
            });

            // Apply Customization
            applyCustomizationBtn.addEventListener('click', () => {
                // Theme Customization
                const themeSelector = document.getElementById('themeSelector');
                body.className = themeSelector.value;

                // Sidebar Width Customization
                document.documentElement.style.setProperty('--sidebar-width', `${sidebarWidthSlider.value}px`);

                // Sidebar Position Customization
                const sidebarPositionSelector = document.getElementById('sidebarPositionSelector');
                body.setAttribute('data-sidebar-position', sidebarPositionSelector.value);

                // Font Customization
                const primaryFontSelector = document.getElementById('primaryFontSelector');
                document.documentElement.style.setProperty('--font-primary', primaryFontSelector.value);

                // Close Modal
                closeModal();
            });

            // Reset to Default
            resetCustomizationBtn.addEventListener('click', () => {
                // Reset Theme
                document.getElementById('themeSelector').selectedIndex = 0;
                body.className = '';

                // Reset Sidebar Width
                sidebarWidthSlider.value = 288;
                currentWidthDisplay.textContent = '288px';
                document.documentElement.style.setProperty('--sidebar-width', '18rem');

                // Reset Sidebar Position
                document.getElementById('sidebarPositionSelector').selectedIndex = 0;
                body.setAttribute('data-sidebar-position', 'left');

                // Reset Font
                document.getElementById('primaryFontSelector').selectedIndex = 0;
                document.documentElement.style.setProperty('--font-primary', "'Inter', sans-serif");
            });

            // Existing Dropdown Functionality
            const coursesDropdown = document.getElementById('coursesDropdown');
            const coursesDropdownContent = document.getElementById('coursesDropdownContent');

            coursesDropdown.addEventListener('click', () => {
                coursesDropdown.parentElement.classList.toggle('open');
                coursesDropdownContent.classList.toggle('hidden');
            });
        });
    </script>
</body>
</html>
