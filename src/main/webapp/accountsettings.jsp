<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%

%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Account Settings</title>
<link rel="stylesheet" href="styles.css">
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: Arial, sans-serif;
	background-color: #f9f9f9;
}

.settings-container {
    display: flex;
    max-width: 1000px; 
    justify-content: space-between;
    max-width: 1200px; 
    width: 100%; 
    margin: 0 50%;
    background-color: #fff;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.sidebar {
	width: 250px;
	background-color: #333;
	color: white;
	padding: 20px;
}

.sidebar ul {
	list-style-type: none;
}

.sidebar ul li {
	margin: 20px 0;
}

.sidebar ul li a {
	color: #fff;
	text-decoration: none;
	display: block;
}

.sidebar ul li a:hover {
	color: #ffa500;
}

.content {
	padding: 20px;
	width: 100%;
}

.content h2 {
	margin-bottom: 20px;
	color: #333;
}

form {
	display: flex;
	flex-direction: column;
}

form label {
	margin-top: 10px;
	color: #555;
}

form input[type="text"], form input[type="date"], form input[type="file"],
	form button {
	padding: 10px;
	margin-top: 5px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

form button {
	background-color: #4CAF50;
	color: white;
	cursor: pointer;
	margin-top: 20px;
}

form button:hover {
	background-color: #45a049;
}

section {
	display: none; /* Initially hide all sections */
}

section.active {
	display: block; /* Show active section */
}
</style>
</head>
<body>
<%@include file="usernavbar.jsp"%>
	<div class="settings-container">
		<nav class="sidebar">
			<ul>
				<li><a href="javascript:void(0);" onclick="showSection('general')">General</a></li>
				<li><a href="javascript:void(0);" onclick="showSection('personal')">Personal</a></li>
			</ul>
		</nav>

		<div class="content">
			<section id="general" class="active">
				<h2>General Information</h2>
				<form>
					<label for="profile-pic">Upload Profile Picture:</label> 
					<input type="file" id="profile-pic" required="required"> 
					<label for="name">Your Name:</label> 
					<input type="text" id="name" placeholder="Enter your name" required="required"> 
					<label for="dob">Your Date of Birth:</label> 
					<input type="date" id="dob" required="required"> 
					<label>Gender:</label> 
					<input type="radio" name="gender" value="male" id="male">
					<label for="male" required="required">Male</label>
					<input type="radio" name="gender" value="female" id="female" required="required">
					<label for="female">Female</label>
					<input type="radio" name="gender" value="other" id="other" required="required">
					<label for="other">Other</label>

					<button type="submit">Save</button>
				</form>
			</section>

			<section id="personal">
    <h2>Personal Information</h2>
    <form>
        <label for="email">Email:</label>
        <input type="email" id="email" value="user@example.com" readonly required="required">

        <label for="phone">Phone Number:</label>
        <input type="text" id="phone" value="9876543210" required="required">

        <label for="country">Country:</label>
        <input type="text" id="country" placeholder="Enter your country" required="required">

        <label for="status">Account Status:</label>
        <input type="text" id="status" value="Active" readonly required="required">

        <button type="submit">Save</button>
    </form>
</section>
			<!-- Add more sections as needed -->
		</div>
	</div>

	<script>
		function showSection(sectionId) {
			// Hide all sections
			var sections = document.querySelectorAll('section');
			sections.forEach(function(section) {
				section.classList.remove('active');
			});

			// Show the selected section
			var selectedSection = document.getElementById(sectionId);
			if (selectedSection) {
				selectedSection.classList.add('active');
			}
		}
	</script>
</body>
</html>
