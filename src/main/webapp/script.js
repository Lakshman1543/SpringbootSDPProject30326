// Create stars
const starsContainer = document.querySelector('.stars');
for (let i = 0; i < 100; i++) {
    const star = document.createElement('div');
    star.classList.add('star');
    star.style.left = `${Math.random() * 100}%`;
    star.style.top = `${Math.random() * 100}%`;
    star.style.animationDelay = `${Math.random() * 5}s`;
    starsContainer.appendChild(star);
}

// Create floating badges
for (let i = 0; i < 5; i++) {
    const badge = document.createElement('div');
    badge.classList.add('badge');
    badge.style.left = `${Math.random() * 100}%`;
    badge.style.top = `${Math.random() * 100}%`;
    badge.style.animationDelay = `${Math.random() * 6}s`;
    document.body.appendChild(badge);
}

// Navbar toggle functionality
const navbar = document.querySelector('.navbar');
const navbarToggle = document.querySelector('.navbar-toggle');
const navbarMenu = document.querySelector('.navbar-menu');

navbarToggle.addEventListener('click', () => {
    navbarToggle.classList.toggle('active');
    navbarMenu.classList.toggle('active');
});

// Navbar scroll effect
window.addEventListener('scroll', () => {
    if (window.scrollY > 50) {
        navbar.style.background = 'rgba(0, 0, 0, 0.8)';
    } else {
        navbar.style.background = 'rgba(255, 255, 255, 0.1)';
    }
});