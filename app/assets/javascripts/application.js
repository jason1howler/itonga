// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

// Persistent navbar functionality with proper cleanup
document.addEventListener('DOMContentLoaded', function() {
  // Initialize immediately when DOM loads
  initializeNavbar();
  
  // Also reinitialize if content changes via AJAX (optional)
  if (typeof Rails !== 'undefined') {
    document.addEventListener('ajax:complete', initializeNavbar);
  }
});

function initializeNavbar() {
  // Get all elements
  const navOpenBtn = document.querySelector("[data-nav-open-btn]");
  const navbar = document.querySelector("[data-navbar]");
  const navCloseBtn = document.querySelector("[data-nav-close-btn]");
  const overlay = document.querySelector("[data-overlay]");
  const navbarLinks = document.querySelectorAll("[data-navbar-link]");
  const header = document.querySelector("[data-header]");
  const goTopBtn = document.querySelector("[data-go-top]");

  // Navbar toggle function
  function toggleNavbar() {
    if (navbar) navbar.classList.toggle("active");
    if (overlay) overlay.classList.toggle("active");
  }

  // Scroll handler
  function handleScroll() {
    if (!header || !goTopBtn) return;
    
    const shouldActivate = window.scrollY >= 400;
    header.classList.toggle("active", shouldActivate);
    goTopBtn.classList.toggle("active", shouldActivate);
  }

  // Clean up previous listeners
  function removeEventListeners() {
    if (navOpenBtn) navOpenBtn.removeEventListener("click", toggleNavbar);
    if (navCloseBtn) navCloseBtn.removeEventListener("click", toggleNavbar);
    if (overlay) overlay.removeEventListener("click", toggleNavbar);
    window.removeEventListener("scroll", handleScroll);
    
    navbarLinks.forEach(link => {
      link.removeEventListener("click", toggleNavbar);
    });
  }

  // Setup new listeners
  function setupEventListeners() {
    if (navOpenBtn) navOpenBtn.addEventListener("click", toggleNavbar);
    if (navCloseBtn) navCloseBtn.addEventListener("click", toggleNavbar);
    if (overlay) overlay.addEventListener("click", toggleNavbar);
    window.addEventListener("scroll", handleScroll);
    
    navbarLinks.forEach(link => {
      link.addEventListener("click", toggleNavbar);
    });
  }
  function initializeNavbar() {
    // ... (previous code remains the same until the event listeners)
  
    navbarLinks.forEach(link => {
      link.addEventListener("click", function(e) {
        // Only toggle if it's an internal link that won't cause page reload
        if (link.href && link.href.startsWith(window.location.origin)) {
          e.preventDefault(); // Stop navigation
          toggleNavbar();
          window.location.href = link.href; // Manually navigate after closing
        } else {
          toggleNavbar(); // Just close the menu for external links
        }
      });
    });
  }

  // Perform cleanup and setup
  removeEventListeners();
  setupEventListeners();
  initializeNavbar();
  
  // Initialize scroll state
  handleScroll();
}
