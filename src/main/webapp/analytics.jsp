<%@page import="com.klef.jfsd.springboot.model.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
Admin admin = (Admin) session.getAttribute("admin");
if (admin == null) {
    response.sendRedirect("adminsessionexpiry");
    return;
}
%>
<%@include file="adminnavbar.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Enhanced Analytics Dashboard - CMS</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js"></script>
    <style>
        :root {
            --primary-color: #1a237e;
            --secondary-color: #303f9f;
            --accent-color: #3949ab;
            --success-color: #4caf50;
            --warning-color: #ff9800;
            --danger-color: #f44336;
            --background-light: #f5f6fa;
            --text-light: #ffffff;
            --text-dark: #141b4d;
        }

        body {
            background-color: var(--background-light);
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .main-content {
            padding-top: 80px;
            min-height: calc(100vh - 80px);
        }

        .dashboard-container {
            padding: 2rem;
            max-width: 1400px;
            margin: 0 auto;
        }

        .dashboard-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
        }

        .date-filter {
            display: flex;
            gap: 1rem;
            align-items: center;
        }

        .date-filter select {
            padding: 0.5rem;
            border-radius: 5px;
            border: 1px solid #ddd;
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        .stat-card {
            background: white;
            padding: 1.5rem;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border-top: 4px solid var(--primary-color);
            transition: transform 0.3s ease;
        }

        .stat-card:hover {
            transform: translateY(-5px);
        }

        .stat-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1rem;
        }

        .stat-icon {
            background: var(--primary-color);
            color: white;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .stat-info h3 {
            margin: 0;
            color: var(--text-dark);
            font-size: 2rem;
        }

        .stat-info p {
            margin: 0;
            color: #666;
        }

        .charts-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(500px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        .chart-card {
            background: white;
            padding: 1.5rem;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .chart-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1rem;
        }

        .chart-title {
            color: var(--text-dark);
            font-size: 1.2rem;
            font-weight: 600;
        }

        .chart-actions {
            display: flex;
            gap: 1rem;
        }

        .chart-button {
            padding: 0.5rem 1rem;
            border: none;
            border-radius: 5px;
            background: var(--primary-color);
            color: white;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .chart-button:hover {
            background: var(--secondary-color);
        }

        .chart-container {
            position: relative;
            height: 300px;
            width: 100%;
        }

        .trend-indicator {
            display: flex;
            align-items: center;
            font-size: 0.9rem;
            margin-top: 0.5rem;
            gap: 0.25rem;
        }

        .trend-up {
            color: var(--success-color);
        }

        .trend-down {
            color: var(--danger-color);
        }

        .performance-metrics {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1rem;
            margin-bottom: 2rem;
        }

        .metric-card {
            background: white;
            padding: 1rem;
            border-radius: 10px;
            text-align: center;
        }

        .metric-value {
            font-size: 1.5rem;
            font-weight: bold;
            color: var(--primary-color);
        }

        .metric-label {
            color: #666;
            font-size: 0.9rem;
        }

        @media (max-width: 768px) {
            .charts-grid {
                grid-template-columns: 1fr;
            }
            
            .dashboard-header {
                flex-direction: column;
                gap: 1rem;
            }
        }
    </style>
</head>
<body>
    <div class="main-content">
        <div class="dashboard-container">
            <div class="dashboard-header">
                <h2>Analytics Dashboard</h2>
                <div class="date-filter">
                    <label>Time Period:</label>
                    <select id="timeFilter" onchange="updateCharts()">
                        <option value="7">Last 7 days</option>
                        <option value="30" selected>Last 30 days</option>
                        <option value="90">Last 90 days</option>
                        <option value="365">Last year</option>
                    </select>
                </div>
            </div>

            <div class="stats-grid">
                <div class="stat-card">
                    <div class="stat-header">
                        <div class="stat-icon">
                            <i class="fas fa-users"></i>
                        </div>
                        <div class="stat-info">
                            <h3><%= request.getAttribute("count") %></h3>
                            <p>Active Users</p>
                            <div class="trend-indicator trend-up">
                                <i class="fas fa-arrow-up"></i> 12.5%
                                <span>vs last period</span>
                            </div>
                        </div>
                    </div>
                </div>
               
                </div>
                <div class="stat-card">
                    <div class="stat-header">
                        <div class="stat-icon">
                            <i class="fas fa-graduation-cap"></i>
                        </div>
                        <div class="stat-info">
                            <h3>92%</h3>
                            <p>Completion Rate</p>
                            <div class="trend-indicator trend-up">
                                <i class="fas fa-arrow-up"></i> 3.2%
                                <span>vs last period</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="stat-card">
                    <div class="stat-header">
                        <div class="stat-icon">
                            <i class="fas fa-clock"></i>
                        </div>
                        <div class="stat-info">
                            <h3>4.2</h3>
                            <p>Avg. Completion Time (days)</p>
                            <div class="trend-indicator trend-down">
                                <i class="fas fa-arrow-down"></i> 1.5%
                                <span>vs last period</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="performance-metrics">
                <div class="metric-card">
                    <div class="metric-value">98.5%</div>
                    <div class="metric-label">System Uptime</div>
                </div>
                <div class="metric-card">
                    <div class="metric-value">2.3s</div>
                    <div class="metric-label">Avg. Response Time</div>
                </div>
                <div class="metric-card">
                    <div class="metric-value">4.8/5.0</div>
                    <div class="metric-label">User Satisfaction</div>
                </div>
                <div class="metric-card">
                    <div class="metric-value">456</div>
                    <div class="metric-label">Active Sessions Today</div>
                </div>
            </div>

            <div class="charts-grid">
                <div class="chart-card">
                    <div class="chart-header">
                        <div class="chart-title">Certification Progress Overview</div>
                        <div class="chart-actions">
                            <button class="chart-button" onclick="exportChart('progressChart')">
                                <i class="fas fa-download"></i> Export
                            </button>
                        </div>
                    </div>
                    <div class="chart-container">
                        <canvas id="progressChart"></canvas>
                    </div>
                </div>
                <div class="chart-card">
                    <div class="chart-header">
                        <div class="chart-title">User Engagement Metrics</div>
                        <div class="chart-actions">
                            <button class="chart-button" onclick="exportChart('engagementChart')">
                                <i class="fas fa-download"></i> Export
                            </button>
                        </div>
                    </div>
                    <div class="chart-container">
                        <canvas id="engagementChart"></canvas>
                    </div>
                </div>
                <div class="chart-card">
                    <div class="chart-header">
                        <div class="chart-title">Certification Success Rate by Category</div>
                        <div class="chart-actions">
                            <button class="chart-button" onclick="exportChart('successRateChart')">
                                <i class="fas fa-download"></i> Export
                            </button>
                        </div>
                    </div>
                    <div class="chart-container">
                        <canvas id="successRateChart"></canvas>
                    </div>
                </div>
                <div class="chart-card">
                    <div class="chart-header">
                        <div class="chart-title">User Activity Heatmap</div>
                        <div class="chart-actions">
                            <button class="chart-button" onclick="exportChart('activityChart')">
                                <i class="fas fa-download"></i> Export
                            </button>
                        </div>
                    </div>
                    <div class="chart-container">
                        <canvas id="activityChart"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Progress Chart
        const progressCtx = document.getElementById('progressChart').getContext('2d');
        new Chart(progressCtx, {
            type: 'line',
            data: {
                labels: ['Week 1', 'Week 2', 'Week 3', 'Week 4', 'Week 5', 'Week 6'],
                datasets: [{
                    label: 'Started',
                    data: [150, 180, 220, 280, 320, 350],
                    borderColor: '#1a237e',
                    tension: 0.4
                }, {
                    label: 'Completed',
                    data: [100, 140, 180, 240, 290, 330],
                    borderColor: '#4caf50',
                    tension: 0.4
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        position: 'top'
                    }
                }
            }
        });

        // Engagement Chart
        const engagementCtx = document.getElementById('engagementChart').getContext('2d');
        new Chart(engagementCtx, {
            type: 'bar',
            data: {
                labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
                datasets: [{
                    label: 'Active Users',
                    data: [420, 380, 450, 475, 380, 250, 280],
                    backgroundColor: '#303f9f'
                }, {
                    label: 'Course Access',
                    data: [380, 350, 420, 440, 350, 220, 250],
                    backgroundColor: '#7986cb'
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        position: 'top'
                    }
                }
            }
        });

       
     // Success Rate Chart
        const successRateCtx = document.getElementById('successRateChart').getContext('2d');
        new Chart(successRateCtx, {
            type: 'doughnut',
            data: {
                labels: ['Technical', 'Management', 'Soft Skills', 'Professional'],
                datasets: [{
                    data: [85, 78, 92, 88],
                    backgroundColor: ['#1a237e', '#303f9f', '#3949ab', '#5c6bc0'],
                    borderWidth: 0
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        position: 'bottom'
                    }
                }
            }
        });

        // Activity Heatmap Chart
        const activityCtx = document.getElementById('activityChart').getContext('2d');
        new Chart(activityCtx, {
            type: 'bar',
            data: {
                labels: ['00:00', '04:00', '08:00', '12:00', '16:00', '20:00'],
                datasets: [{
                    label: 'Weekdays',
                    data: [50, 30, 280, 450, 380, 240],
                    backgroundColor: '#1a237e'
                }, {
                    label: 'Weekends',
                    data: [80, 45, 150, 260, 290, 190],
                    backgroundColor: '#3949ab'
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        position: 'top'
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true,
                        title: {
                            display: true,
                            text: 'Number of Active Users'
                        }
                    },
                    x: {
                        title: {
                            display: true,
                            text: 'Time of Day'
                        }
                    }
                }
            }
        });

        // Function to update charts based on time filter
        function updateCharts() {
            const timeFilter = document.getElementById('timeFilter').value;
            // Add API call or data update logic here
            console.log('Updating charts for time period:', timeFilter);
            // Refresh charts with new data
        }

        // Function to export chart data
        function exportChart(chartId) {
            const canvas = document.getElementById(chartId);
            const imageURL = canvas.toDataURL('image/png');
            const downloadLink = document.createElement('a');
            downloadLink.href = imageURL;
            downloadLink.download = `${chartId}_export.png`;
            document.body.appendChild(downloadLink);
            downloadLink.click();
            document.body.removeChild(downloadLink);
        }

        // Initialize tooltips if using Bootstrap
        if (typeof bootstrap !== 'undefined') {
            const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
            tooltipTriggerList.map(function (tooltipTriggerEl) {
                return new bootstrap.Tooltip(tooltipTriggerEl);
            });
        }
    </script>
</body>
</html>