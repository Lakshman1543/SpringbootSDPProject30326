<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin="" />
<link rel="stylesheet" as="style" onload="this.rel='stylesheet'"
	href="https://fonts.googleapis.com/css2?display=swap&amp;family=Inter%3Awght%40400%3B500%3B700%3B900&amp;family=Noto+Sans%3Awght%40400%3B500%3B700%3B900" />
<title>Online Certification Management</title>
<link rel="icon" type="image/x-icon" href="data:image/x-icon;base64," />
<script
	src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
</head>
<body>
	<div
		class="relative flex size-full min-h-screen flex-col bg-[#f8fafb] group/design-root overflow-x-hidden"
		style='font-family: Inter, "Noto Sans", sans-serif;'>
		<div class="layout-container flex h-full grow flex-col">
			<header
				class="flex items-center justify-between whitespace-nowrap border-b border-solid border-b-[#e8eef3] px-10 py-3">
				<div class="flex items-center gap-4 text-[#0e151b]">
					<div class="size-4">
						<svg viewBox="0 0 48 48" fill="none"
							xmlns="http://www.w3.org/2000/svg">
                <path
								d="M42.4379 44C42.4379 44 36.0744 33.9038 41.1692 24C46.8624 12.9336 42.2078 4 42.2078 4L7.01134 4C7.01134 4 11.6577 12.932 5.96912 23.9969C0.876273 33.9029 7.27094 44 7.27094 44L42.4379 44Z"
								fill="currentColor"></path>
              </svg>
					</div>
					<h2
						class="text-[#0e151b] text-lg font-bold leading-tight tracking-[-0.015em]">
						SkillCertify</h2>
				</div>
				<div class="flex flex-1 justify-end gap-8">
					<div class="flex items-center gap-9">
						<a class="text-[#0e151b] text-sm font-medium leading-normal"
							href="/">Home</a> <a class="text-[#0e151b] text-sm font-medium leading-normal" href="login">Login</a>
               <a class="text-[#0e151b] text-sm font-medium leading-normal" href="aboutus">About Us</a>
                <a
							class="text-[#0e151b] text-sm font-medium leading-normal"
							href="contactus">Contact Us</a>
					</div>
				</div>
				<div
					class="bg-center bg-no-repeat aspect-square bg-cover rounded-full size-10"
					style='background-image: url("https://cdn.usegalileo.ai/sdxl10/a4934d7a-7a0b-414b-948f-16ebd4f70f29.png");'></div>
			</header>

			<!-- Heading -->
			<div class="p-10">
				<h1 class="text-3xl font-extrabold text-black text-center mb-10">
					Our Team</h1>
				<!-- Team Grid -->
				<div class="grid grid-cols-4 gap-6">
					<!-- Card 1 -->
					<div
						class="bg-white rounded-lg shadow-2xl hover:shadow-3xl transition-shadow duration-300 p-6">
						<div class="flex flex-col items-center gap-6">
							<div
								class="bg-center bg-no-repeat bg-cover rounded-full w-48 h-48"
								style="background-image: url('https://i.ibb.co/PGj4w93/Mentor.png');"></div>
							<a href="https://www.linkedin.com/in/suryakiran1993/"
								target="_blank"
								class="text-lg font-bold text-blue-600 text-center hover:underline">
								Mr. J Surya Kiran </a>
							<p class="text-sm text-gray-600 font-semibold text-center">
								<b>Assistant Professor</b>
							</p>
							<p class="text-black-500 font-medium text-center">Mentor</p>
						</div>
					</div>

					<!-- Card 2 -->
					<div
						class="bg-white rounded-lg shadow-2xl hover:shadow-3xl transition-shadow duration-300 p-6">
						<div class="flex flex-col items-center gap-6">
							<div
								class="bg-center bg-no-repeat bg-cover rounded-full w-48 h-48"
								style="background-image: url('https://i.ibb.co/tBHR5F1/curator.jpg');"></div>
							<a href="https://www.linkedin.com/in/lakshmana-swamy-49a428255/"
								target="_blank"
								class="text-lg font-bold text-blue-600 text-center hover:underline">
								V. Lakshmana Swamy </a>
							<p class="text-sm text-gray-600 font-semibold text-center">
								<b>Team Lead</b>
							</p>
							<p class="text-black-500 font-medium text-center">2200030326</p>
						</div>
					</div>

					<!-- Card 3 -->
					<div
						class="bg-white rounded-lg shadow-2xl hover:shadow-3xl transition-shadow duration-300 p-6">
						<div class="flex flex-col items-center gap-6">
							<div
								class="bg-center bg-no-repeat bg-cover rounded-full w-48 h-48"
								style="background-image: url('https://i.ibb.co/g6MV2X6/Nikhil.jpg');"></div>
							<a href="https://www.linkedin.com/in/nikhil-maddela/"
								target="_blank"
								class="text-lg font-bold text-blue-600 text-center hover:underline">
								M. Nikhil </a>
							<p class="text-sm text-gray-600 font-semibold text-center">
								<b>Developer</b>
							</p>
							<p class="text-black-500 font-medium text-center">2200030611</p>
						</div>
					</div>

					<!-- Card 4 -->
					<div
						class="bg-white rounded-lg shadow-2xl hover:shadow-3xl transition-shadow duration-300 p-6">
						<div class="flex flex-col items-center gap-6">
							<div
								class="bg-center bg-no-repeat bg-cover rounded-full w-48 h-48"
								style="background-image: url('https://i.ibb.co/m0cZvxF/Sat.png');"></div>
							<a href="https://www.linkedin.com/in/kstsathvik/" target="_blank"
								class="text-lg font-bold text-blue-600 text-center hover:underline">
								K.S.T Sathvik </a>
							<p class="text-sm text-gray-600 font-semibold text-center">
								<b>Developer</b>
							</p>
							<p class="text-black-500 font-medium text-center">2200030633</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
