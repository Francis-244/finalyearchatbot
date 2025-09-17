-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 12, 2025 at 12:33 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chatweb`
--

-- --------------------------------------------------------

--
-- Table structure for table `ai_images`
--

CREATE TABLE `ai_images` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `image_prompt` text NOT NULL,
  `image_url` varchar(500) DEFAULT NULL,
  `image_path` varchar(500) DEFAULT NULL,
  `component_id` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `file_size` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `component_library`
--

CREATE TABLE `component_library` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `default_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`default_data`)),
  `category` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `user_id`, `file_path`, `created_at`) VALUES
(1, 4, 'assets/uploads/687f9f0621557-crop.png', '2025-07-22 14:24:06');

-- --------------------------------------------------------

--
-- Table structure for table `newsletter_subscriptions`
--

CREATE TABLE `newsletter_subscriptions` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `subscribed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `newsletter_subscriptions`
--

INSERT INTO `newsletter_subscriptions` (`id`, `email`, `subscribed_at`) VALUES
(1, 'news1@example.com', '2025-07-19 16:18:27'),
(2, 'news2@example.com', '2025-07-19 16:18:27');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `project_name` varchar(100) NOT NULL,
  `html_content` text DEFAULT NULL,
  `css_content` text DEFAULT NULL,
  `js_content` text DEFAULT NULL,
  `template_type` varchar(50) DEFAULT NULL,
  `is_template` tinyint(1) NOT NULL DEFAULT 0,
  `project_data` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `image_url` varchar(500) DEFAULT NULL,
  `prompt` text DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `user_id`, `project_name`, `html_content`, `css_content`, `js_content`, `template_type`, `is_template`, `project_data`, `created_at`, `updated_at`, `image_url`, `prompt`, `model`) VALUES
(1, 1, 'Sample Portfolio', '<!DOCTYPE html><html><head><title>Portfolio</title></head><body><h1>My Portfolio</h1></body></html>', 'body { background: #f8f9fa; }', '// Sample JS', NULL, 1, NULL, '2025-07-19 16:18:27', '2025-07-23 16:13:54', NULL, NULL, NULL),
(2, 1, 'Sample Blog', '<!DOCTYPE html><html><head><title>Blog</title></head><body><h1>My Blog</h1></body></html>', 'body { background: #fff; }', '// Blog JS', NULL, 1, NULL, '2025-07-19 16:18:27', '2025-07-23 16:13:54', NULL, NULL, NULL),
(3, 1, 'Portfolio Template', NULL, NULL, NULL, 'image', 1, '{\"elements\":[{\"type\":\"header\",\"content\":{\"title\":\"My Portfolio\",\"navLinks\":[\"Home\",\"About\",\"Portfolio\",\"Contact\"]}}]}', '2025-07-23 15:01:38', '2025-09-02 10:34:49', NULL, NULL, NULL),
(4, 1, 'Business Template', NULL, NULL, NULL, 'image', 1, '{\"elements\":[{\"type\":\"header\",\"content\":{\"title\":\"Business Website\",\"navLinks\":[\"Home\",\"Services\",\"About\",\"Contact\"]}}]}', '2025-07-23 15:01:38', '2025-09-02 10:34:49', NULL, NULL, NULL),
(5, 1, 'Business Template', NULL, NULL, NULL, 'image', 1, '{\"elements\":[{\"type\":\"header\",\"content\":{\"title\":\"Business Website\",\"navLinks\":[\"Home\",\"Services\",\"About\",\"Contact\"]}},{\"type\":\"hero\",\"content\":{\"title\":\"Professional Services\",\"subtitle\":\"Quality solutions for your business\",\"buttonText\":\"Get Started\"}}]}', '2025-07-23 16:13:54', '2025-09-02 10:34:49', NULL, NULL, NULL),
(6, 1, 'Portfolio Template', NULL, NULL, NULL, 'image', 1, '{\"elements\":[{\"type\":\"header\",\"content\":{\"title\":\"My Portfolio\",\"navLinks\":[\"Home\",\"Work\",\"About\",\"Contact\"]}},{\"type\":\"hero\",\"content\":{\"title\":\"Creative Showcase\",\"subtitle\":\"View my latest projects\",\"buttonText\":\"View Portfolio\"}}]}', '2025-07-23 16:13:54', '2025-09-02 10:34:49', NULL, NULL, NULL),
(7, 4, 'Sample Blog - Copy', NULL, NULL, NULL, 'image', 0, '{\"elements\":[]}', '2025-07-23 16:25:42', '2025-09-02 10:34:49', NULL, NULL, NULL),
(8, 4, 'Sample Portfolio - Copy', NULL, NULL, NULL, 'image', 0, '[]', '2025-07-23 16:26:24', '2025-09-02 10:34:49', NULL, NULL, NULL),
(9, 5, 'Sample Portfolio - Copy', NULL, NULL, NULL, 'image', 0, '{\"elements\":[]}', '2025-08-11 10:29:23', '2025-09-02 10:34:49', NULL, NULL, NULL),
(10, 5, 'Sample Portfolio - Copy', NULL, NULL, NULL, 'image', 0, '{\"elements\":[]}', '2025-08-11 10:33:54', '2025-09-02 10:34:49', NULL, NULL, NULL),
(11, 5, 'Sample Blog - Copy', NULL, NULL, NULL, 'image', 0, '{\"elements\":[]}', '2025-08-11 10:33:58', '2025-09-02 10:34:49', NULL, NULL, NULL),
(12, 5, 'Sample Blog - Copy', NULL, NULL, NULL, 'image', 0, '{\"elements\":[]}', '2025-08-11 10:37:07', '2025-09-02 10:34:49', NULL, NULL, NULL),
(13, 5, 'Sample Blog - Copy', NULL, NULL, NULL, 'image', 0, '{\"elements\":[]}', '2025-08-11 10:45:31', '2025-09-02 10:34:49', NULL, NULL, NULL),
(14, 4, 'Business Template - Copy', NULL, NULL, NULL, 'image', 0, '{\"elements\":[{\"type\":\"header\",\"content\":{\"title\":\"Business Website\",\"navLinks\":[\"Home\",\"Services\",\"About\",\"Contact\"]}},{\"type\":\"hero\",\"content\":{\"title\":\"Professional Services\",\"subtitle\":\"Quality solutions for your business\",\"buttonText\":\"Get Started\"}}]}', '2025-08-11 11:46:20', '2025-09-02 10:34:49', NULL, NULL, NULL),
(15, 5, 'Sample Blog - Copy', NULL, NULL, NULL, 'image', 0, '{\"elements\":[]}', '2025-08-11 12:23:26', '2025-09-02 10:34:49', NULL, NULL, NULL),
(16, 5, 'Business Template - Copy', NULL, NULL, NULL, 'image', 0, '{\"elements\":[{\"type\":\"header\",\"content\":{\"title\":\"Business Website\",\"navLinks\":[\"Home\",\"Services\",\"About\",\"Contact\"]}},{\"type\":\"hero\",\"content\":{\"title\":\"Professional Services\",\"subtitle\":\"Quality solutions for your business\",\"buttonText\":\"Get Started\"}}]}', '2025-08-11 12:23:41', '2025-09-02 10:34:49', NULL, NULL, NULL),
(17, 4, 'Sample Blog - Copy', NULL, NULL, NULL, 'image', 0, '{\"elements\":[]}', '2025-08-15 20:55:15', '2025-09-02 10:34:49', NULL, NULL, NULL),
(18, 5, 'Portfolio Template - Copy', NULL, NULL, NULL, 'image', 0, '{\"elements\":[{\"type\":\"header\",\"content\":{\"title\":\"My Portfolio\",\"navLinks\":[\"Home\",\"Work\",\"About\",\"Contact\"]}},{\"type\":\"hero\",\"content\":{\"title\":\"Creative Showcase\",\"subtitle\":\"View my latest projects\",\"buttonText\":\"View Portfolio\"}}]}', '2025-08-23 17:55:03', '2025-09-02 10:34:49', NULL, NULL, NULL),
(19, 5, 'Business Template - Copy', NULL, NULL, NULL, 'image', 0, '{\"elements\":[{\"type\":\"header\",\"content\":{\"title\":\"Business Website\",\"navLinks\":[\"Home\",\"Services\",\"About\",\"Contact\"]}},{\"type\":\"hero\",\"content\":{\"title\":\"Professional Services\",\"subtitle\":\"Quality solutions for your business\",\"buttonText\":\"Get Started\"}}]}', '2025-08-23 17:55:23', '2025-09-02 10:34:49', NULL, NULL, NULL),
(20, 5, 'Business Template - Copy', NULL, NULL, NULL, 'image', 0, '{\"elements\":[{\"type\":\"header\",\"content\":{\"title\":\"Business Website\",\"navLinks\":[\"Home\",\"Services\",\"About\",\"Contact\"]}},{\"type\":\"hero\",\"content\":{\"title\":\"Professional Services\",\"subtitle\":\"Quality solutions for your business\",\"buttonText\":\"Get Started\"}}]}', '2025-08-25 08:47:08', '2025-09-02 10:34:49', NULL, NULL, NULL),
(21, 5, 'Portfolio Template - Copy', NULL, NULL, NULL, 'image', 0, '{\"elements\":[{\"type\":\"header\",\"content\":{\"title\":\"My Portfolio\",\"navLinks\":[\"Home\",\"Work\",\"About\",\"Contact\"]}},{\"type\":\"hero\",\"content\":{\"title\":\"Creative Showcase\",\"subtitle\":\"View my latest projects\",\"buttonText\":\"View Portfolio\"}}]}', '2025-08-25 10:15:17', '2025-09-02 10:34:49', NULL, NULL, NULL),
(22, 5, 'Portfolio Template - Copy', NULL, NULL, NULL, 'image', 0, '{\"elements\":[{\"type\":\"header\",\"content\":{\"title\":\"My Portfolio\",\"navLinks\":[\"Home\",\"About\",\"Portfolio\",\"Contact\"]}}]}', '2025-08-26 09:54:01', '2025-09-02 10:34:49', NULL, NULL, NULL),
(23, 5, 'Business Template - Copy', NULL, NULL, NULL, 'image', 0, '{\"elements\":[{\"type\":\"header\",\"content\":{\"title\":\"Business Website\",\"navLinks\":[\"Home\",\"Services\",\"About\",\"Contact\"]}},{\"type\":\"hero\",\"content\":{\"title\":\"Professional Services\",\"subtitle\":\"Quality solutions for your business\",\"buttonText\":\"Get Started\"}}]}', '2025-08-30 16:01:52', '2025-09-02 10:34:49', NULL, NULL, NULL),
(24, 6, 'AI_Project_1756808749', '<!DOCTYPE html>\r\n<html lang=\"en\">\r\n<head>\r\n    <meta charset=\"UTF-8\">\r\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    <title>GENERATE A BIRD IMAGE</title>\r\n    <link rel=\"stylesheet\" href=\"style.css\">\r\n    <link href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css\" rel=\"stylesheet\">\r\n</head>\r\n<body class=\"light-theme\">\r\n    <nav class=\"navbar\">\r\n        <div class=\"nav-container\">\r\n            <div class=\"nav-logo\">\r\n                <h2>GENERATE A BIRD IMAGE</h2>\r\n            </div>\r\n            <ul class=\"nav-menu\">\r\n                <li class=\"nav-item\"><a href=\"#home\" class=\"nav-link\">Home</a></li>\r\n                <li class=\"nav-item\"><a href=\"#features\" class=\"nav-link\">Features</a></li>\r\n                <li class=\"nav-item\"><a href=\"#about\" class=\"nav-link\">About</a></li>\r\n                <li class=\"nav-item\"><a href=\"#contact\" class=\"nav-link\">Contact</a></li>\r\n            </ul>\r\n            <div class=\"hamburger\">\r\n                <span class=\"bar\"></span>\r\n                <span class=\"bar\"></span>\r\n                <span class=\"bar\"></span>\r\n            </div>\r\n        </div>\r\n    </nav>\r\n\r\n    <section id=\"home\" class=\"hero\">\r\n        <div class=\"hero-content\">\r\n            <h1 class=\"hero-title\">Welcome to GENERATE A BIRD IMAGE</h1>\r\n            <p class=\"hero-subtitle\">GENERATE A BIRD IMAGE</p>\r\n            <div class=\"hero-buttons\">\r\n                <a href=\"#about\" class=\"btn btn-primary\">Learn More</a>\r\n                <a href=\"#contact\" class=\"btn btn-secondary\">Get Started</a>\r\n            </div>\r\n        </div>\r\n    </section>\r\n    <section id=\"features\" class=\"features\">\r\n        <div class=\"container\">\r\n            <h2>Features</h2>\r\n            <div class=\"feature-grid\">\r\n                <div class=\"feature-card\">\r\n                    <i class=\"fas fa-rocket\"></i>\r\n                    <h3>Fast</h3>\r\n                    <p>Lightning fast performance</p>\r\n                </div>\r\n                <div class=\"feature-card\">\r\n                    <i class=\"fas fa-shield-alt\"></i>\r\n                    <h3>Secure</h3>\r\n                    <p>Top-notch security</p>\r\n                </div>\r\n                <div class=\"feature-card\">\r\n                    <i class=\"fas fa-cog\"></i>\r\n                    <h3>Reliable</h3>\r\n                    <p>99.9% uptime guarantee</p>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </section>\r\n\r\n    <section id=\"about\" class=\"about\">\r\n        <div class=\"container\">\r\n            <h2>About</h2>\r\n            <p>Learn more about what we do and how we can help you achieve your goals.</p>\r\n        </div>\r\n    </section>\r\n    <footer class=\"footer\">\r\n        <div class=\"footer-content\">\r\n            <p>&copy; 2025 GENERATE A BIRD IMAGE. All rights reserved.</p>\r\n        </div>\r\n    </footer>\r\n\r\n    <script src=\"script.js\"></script>\r\n</body>\r\n</html>', '* {\r\n    margin: 0;\r\n    padding: 0;\r\n    box-sizing: border-box;\r\n}\r\n\r\nbody {\r\n    font-family: \"Arial\", sans-serif;\r\n    line-height: 1.6;\r\n    color: #333333;\r\n    background-color: #ffffff;\r\n}\r\n\r\n.container {\r\n    max-width: 1200px;\r\n    margin: 0 auto;\r\n    padding: 0 20px;\r\n}\r\n\r\n/* Navigation */\r\n.navbar {\r\n    background: rgba(255, 255, 255, 0.95);\r\n    backdrop-filter: blur(10px);\r\n    position: fixed;\r\n    top: 0;\r\n    width: 100%;\r\n    z-index: 1000;\r\n    padding: 1rem 0;\r\n    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);\r\n}\r\n\r\n.nav-container {\r\n    max-width: 1200px;\r\n    margin: 0 auto;\r\n    padding: 0 20px;\r\n    display: flex;\r\n    justify-content: space-between;\r\n    align-items: center;\r\n}\r\n\r\n.nav-logo h2 {\r\n    color: #28a745;\r\n    font-size: 1.5rem;\r\n}\r\n\r\n.nav-menu {\r\n    display: flex;\r\n    list-style: none;\r\n    gap: 2rem;\r\n}\r\n\r\n.nav-link {\r\n    color: #333333;\r\n    text-decoration: none;\r\n    font-weight: 500;\r\n    transition: color 0.3s ease;\r\n}\r\n\r\n.nav-link:hover {\r\n    color: #28a745;\r\n}\r\n\r\n/* Hero Section */\r\n.hero {\r\n    background: linear-gradient(135deg, #28a745, #f8f9fa);\r\n    min-height: 100vh;\r\n    display: flex;\r\n    align-items: center;\r\n    justify-content: center;\r\n    text-align: center;\r\n    color: white;\r\n}\r\n\r\n.hero-content {\r\n    max-width: 800px;\r\n    padding: 0 20px;\r\n}\r\n\r\n.hero-title {\r\n    font-size: 3.5rem;\r\n    margin-bottom: 1rem;\r\n    font-weight: 700;\r\n}\r\n\r\n.hero-subtitle {\r\n    font-size: 1.25rem;\r\n    margin-bottom: 2rem;\r\n    opacity: 0.9;\r\n}\r\n\r\n.hero-buttons {\r\n    display: flex;\r\n    gap: 1rem;\r\n    justify-content: center;\r\n    flex-wrap: wrap;\r\n}\r\n\r\n/* Buttons */\r\n.btn {\r\n    display: inline-block;\r\n    padding: 12px 30px;\r\n    border-radius: 50px;\r\n    text-decoration: none;\r\n    font-weight: 600;\r\n    transition: all 0.3s ease;\r\n    border: 2px solid transparent;\r\n}\r\n\r\n.btn-primary {\r\n    background: white;\r\n    color: #28a745;\r\n    border-color: white;\r\n}\r\n\r\n.btn-primary:hover {\r\n    background: transparent;\r\n    color: white;\r\n    border-color: white;\r\n    transform: translateY(-2px);\r\n}\r\n\r\n.btn-secondary {\r\n    background: transparent;\r\n    color: white;\r\n    border-color: white;\r\n}\r\n\r\n.btn-secondary:hover {\r\n    background: white;\r\n    color: #28a745;\r\n    transform: translateY(-2px);\r\n}\r\n\r\n/* Sections */\r\nsection {\r\n    padding: 80px 0;\r\n}\r\n\r\nsection:nth-child(even) {\r\n    background: #f8f9fa;\r\n}\r\n\r\nh2 {\r\n    font-size: 2.5rem;\r\n    text-align: center;\r\n    margin-bottom: 3rem;\r\n    color: #28a745;\r\n}\r\n\r\n/* Grids */\r\n.feature-grid,\r\n.service-grid,\r\n.project-grid,\r\n.post-grid {\r\n    display: grid;\r\n    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));\r\n    gap: 2rem;\r\n    margin-top: 2rem;\r\n}\r\n\r\n.feature-card,\r\n.service-card,\r\n.project-card,\r\n.post-card {\r\n    background: white;\r\n    padding: 2rem;\r\n    border-radius: 10px;\r\n    text-align: center;\r\n    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);\r\n    transition: transform 0.3s ease;\r\n}\r\n\r\n.feature-card:hover,\r\n.service-card:hover,\r\n.project-card:hover,\r\n.post-card:hover {\r\n    transform: translateY(-5px);\r\n}\r\n\r\n.feature-card i,\r\n.service-card i {\r\n    font-size: 3rem;\r\n    color: #28a745;\r\n    margin-bottom: 1rem;\r\n}\r\n\r\n.feature-card h3,\r\n.service-card h3,\r\n.project-card h3,\r\n.post-card h3 {\r\n    margin-bottom: 1rem;\r\n    color: #28a745;\r\n}\r\n\r\n/* Footer */\r\n.footer {\r\n    background: #333;\r\n    color: white;\r\n    text-align: center;\r\n    padding: 2rem 0;\r\n}\r\n\r\n/* Mobile Responsive */\r\n.hamburger {\r\n    display: none;\r\n    flex-direction: column;\r\n    cursor: pointer;\r\n}\r\n\r\n.bar {\r\n    width: 25px;\r\n    height: 3px;\r\n    background: #333333;\r\n    margin: 3px 0;\r\n    transition: 0.3s;\r\n}\r\n\r\n@media (max-width: 768px) {\r\n    .nav-menu {\r\n        position: fixed;\r\n        left: -100%;\r\n        top: 70px;\r\n        flex-direction: column;\r\n        background: white;\r\n        width: 100%;\r\n        text-align: center;\r\n        transition: 0.3s;\r\n        padding: 2rem 0;\r\n        box-shadow: 0 10px 27px rgba(0, 0, 0, 0.05);\r\n    }\r\n\r\n    .nav-menu.active {\r\n        left: 0;\r\n    }\r\n\r\n    .hamburger {\r\n        display: flex;\r\n    }\r\n\r\n    .hero-title {\r\n        font-size: 2.5rem;\r\n    }\r\n\r\n    .hero-buttons {\r\n        flex-direction: column;\r\n        align-items: center;\r\n    }\r\n\r\n    .feature-grid,\r\n    .service-grid,\r\n    .project-grid,\r\n    .post-grid {\r\n        grid-template-columns: 1fr;\r\n    }\r\n}', 'document.addEventListener(\"DOMContentLoaded\", function() {\r\n    // Mobile menu toggle\r\n    const hamburger = document.querySelector(\".hamburger\");\r\n    const navMenu = document.querySelector(\".nav-menu\");\r\n\r\n    hamburger.addEventListener(\"click\", function() {\r\n        hamburger.classList.toggle(\"active\");\r\n        navMenu.classList.toggle(\"active\");\r\n    });\r\n\r\n    // Close mobile menu when clicking on a link\r\n    document.querySelectorAll(\".nav-link\").forEach(n => n.addEventListener(\"click\", () => {\r\n        hamburger.classList.remove(\"active\");\r\n        navMenu.classList.remove(\"active\");\r\n    }));\r\n\r\n    // Smooth scrolling for navigation links\r\n    document.querySelectorAll(\'a[href^=\"#\"]\').forEach(anchor => {\r\n        anchor.addEventListener(\"click\", function(e) {\r\n            e.preventDefault();\r\n            const target = document.querySelector(this.getAttribute(\"href\"));\r\n            if (target) {\r\n                target.scrollIntoView({\r\n                    behavior: \"smooth\",\r\n                    block: \"start\"\r\n                });\r\n            }\r\n        });\r\n    });\r\n\r\n    // Add scroll effect to navbar\r\n    window.addEventListener(\"scroll\", function() {\r\n        const navbar = document.querySelector(\".navbar\");\r\n        if (window.scrollY > 50) {\r\n            navbar.style.background = \"rgba(255, 255, 255, 0.98)\";\r\n        } else {\r\n            navbar.style.background = \"rgba(255, 255, 255, 0.95)\";\r\n        }\r\n    });\r\n\r\n    // Add animation on scroll\r\n    const observerOptions = {\r\n        threshold: 0.1,\r\n        rootMargin: \"0px 0px -50px 0px\"\r\n    };\r\n\r\n    const observer = new IntersectionObserver(function(entries) {\r\n        entries.forEach(entry => {\r\n            if (entry.isIntersecting) {\r\n                entry.target.style.opacity = \"1\";\r\n                entry.target.style.transform = \"translateY(0)\";\r\n            }\r\n        });\r\n    }, observerOptions);\r\n\r\n    // Observe all cards for animation\r\n    document.querySelectorAll(\".feature-card, .service-card, .project-card, .post-card\").forEach(card => {\r\n        card.style.opacity = \"0\";\r\n        card.style.transform = \"translateY(30px)\";\r\n        card.style.transition = \"opacity 0.6s ease, transform 0.6s ease\";\r\n        observer.observe(card);\r\n    });\r\n\r\n    console.log(\"Website initialized successfully!\");\r\n});', NULL, 0, NULL, '2025-09-02 10:25:49', '2025-09-02 10:25:49', NULL, NULL, NULL),
(28, 1, 'AI_Image_1757326884', NULL, NULL, NULL, 'image', 0, NULL, '2025-09-08 10:21:24', '2025-09-08 10:21:24', 'assets/uploads/ai_generated_fluxkontext_60b4207b0e9c4330a0ae5a79984bec67_1757326882.jpeg', 'A beautiful mountain landscape at sunset', 'flux-kontext'),
(31, 1, 'KIE_Fallback_Flux_1757333440', NULL, NULL, NULL, 'kie_ai_fallback', 0, NULL, '2025-09-08 12:10:40', '2025-09-08 12:10:40', 'data:image/svg+xml;base64,DQogICAgICAgIDxzdmcgd2lkdGg9IjEwMjQiIGhlaWdodD0iMTAyNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4NCiAgICAgICAgICAgIDxkZWZzPg0KICAgICAgICAgICAgICAgIDxsaW5lYXJHcmFkaWVudCBpZD0iYmciIHgxPSIwJSIgeTE9IjAlIiB4Mj0iMTAwJSIgeTI9IjEwMCUiPg0KICAgICAgICAgICAgICAgICAgICA8c3RvcCBvZmZzZXQ9IjAlIiBzdHlsZT0ic3RvcC1jb2xvcjojNjY3ZWVhO3N0b3Atb3BhY2l0eToxIiAvPg0KICAgICAgICAgICAgICAgICAgICA8c3RvcCBvZmZzZXQ9IjEwMCUiIHN0eWxlPSJzdG9wLWNvbG9yOiM3NjRiYTI7c3RvcC1vcGFjaXR5OjEiIC8+DQogICAgICAgIC', 'A simple red apple on white background', 'flux'),
(32, 1, 'KIE_Fallback_Flux_1757339471', NULL, NULL, NULL, 'kie_ai_fallback', 0, NULL, '2025-09-08 13:51:11', '2025-09-08 13:51:11', 'data:image/svg+xml;base64,DQogICAgICAgIDxzdmcgd2lkdGg9IjEwMjQiIGhlaWdodD0iMTAyNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4NCiAgICAgICAgICAgIDxkZWZzPg0KICAgICAgICAgICAgICAgIDxsaW5lYXJHcmFkaWVudCBpZD0iYmciIHgxPSIwJSIgeTE9IjAlIiB4Mj0iMTAwJSIgeTI9IjEwMCUiPg0KICAgICAgICAgICAgICAgICAgICA8c3RvcCBvZmZzZXQ9IjAlIiBzdHlsZT0ic3RvcC1jb2xvcjojNjY3ZWVhO3N0b3Atb3BhY2l0eToxIiAvPg0KICAgICAgICAgICAgICAgICAgICA8c3RvcCBvZmZzZXQ9IjEwMCUiIHN0eWxlPSJzdG9wLWNvbG9yOiM3NjRiYTI7c3RvcC1vcGFjaXR5OjEiIC8+DQogICAgICAgIC', 'A simple red apple on white background', 'flux'),
(35, 1, 'KIE_Fallback_Flux_1757340796', NULL, NULL, NULL, 'kie_ai_fallback', 0, NULL, '2025-09-08 14:13:16', '2025-09-08 14:13:16', 'data:image/svg+xml;base64,DQogICAgICAgIDxzdmcgd2lkdGg9IjEwMjQiIGhlaWdodD0iMTAyNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4NCiAgICAgICAgICAgIDxkZWZzPg0KICAgICAgICAgICAgICAgIDxsaW5lYXJHcmFkaWVudCBpZD0iYmciIHgxPSIwJSIgeTE9IjAlIiB4Mj0iMTAwJSIgeTI9IjEwMCUiPg0KICAgICAgICAgICAgICAgICAgICA8c3RvcCBvZmZzZXQ9IjAlIiBzdHlsZT0ic3RvcC1jb2xvcjojNjY3ZWVhO3N0b3Atb3BhY2l0eToxIiAvPg0KICAgICAgICAgICAgICAgICAgICA8c3RvcCBvZmZzZXQ9IjEwMCUiIHN0eWxlPSJzdG9wLWNvbG9yOiM3NjRiYTI7c3RvcC1vcGFjaXR5OjEiIC8+DQogICAgICAgIC', 'test prompt', 'flux'),
(36, 1, 'KIE_Fallback_Flux_1757340912', NULL, NULL, NULL, 'kie_ai_fallback', 0, NULL, '2025-09-08 14:15:12', '2025-09-08 14:15:12', 'data:image/svg+xml;base64,DQogICAgICAgIDxzdmcgd2lkdGg9IjEwMjQiIGhlaWdodD0iMTAyNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4NCiAgICAgICAgICAgIDxkZWZzPg0KICAgICAgICAgICAgICAgIDxsaW5lYXJHcmFkaWVudCBpZD0iYmciIHgxPSIwJSIgeTE9IjAlIiB4Mj0iMTAwJSIgeTI9IjEwMCUiPg0KICAgICAgICAgICAgICAgICAgICA8c3RvcCBvZmZzZXQ9IjAlIiBzdHlsZT0ic3RvcC1jb2xvcjojNjY3ZWVhO3N0b3Atb3BhY2l0eToxIiAvPg0KICAgICAgICAgICAgICAgICAgICA8c3RvcCBvZmZzZXQ9IjEwMCUiIHN0eWxlPSJzdG9wLWNvbG9yOiM3NjRiYTI7c3RvcC1vcGFjaXR5OjEiIC8+DQogICAgICAgIC', 'test prompt', 'flux'),
(37, 1, 'KIE_Fallback_Flux_1757340967', NULL, NULL, NULL, 'kie_ai_fallback', 0, NULL, '2025-09-08 14:16:07', '2025-09-08 14:16:07', 'data:image/svg+xml;base64,DQogICAgICAgIDxzdmcgd2lkdGg9IjEwMjQiIGhlaWdodD0iMTAyNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4NCiAgICAgICAgICAgIDxkZWZzPg0KICAgICAgICAgICAgICAgIDxsaW5lYXJHcmFkaWVudCBpZD0iYmciIHgxPSIwJSIgeTE9IjAlIiB4Mj0iMTAwJSIgeTI9IjEwMCUiPg0KICAgICAgICAgICAgICAgICAgICA8c3RvcCBvZmZzZXQ9IjAlIiBzdHlsZT0ic3RvcC1jb2xvcjojNjY3ZWVhO3N0b3Atb3BhY2l0eToxIiAvPg0KICAgICAgICAgICAgICAgICAgICA8c3RvcCBvZmZzZXQ9IjEwMCUiIHN0eWxlPSJzdG9wLWNvbG9yOiM3NjRiYTI7c3RvcC1vcGFjaXR5OjEiIC8+DQogICAgICAgIC', 'test prompt', 'flux'),
(38, 1, 'KIE_Fallback_Flux_1757341129', NULL, NULL, NULL, 'kie_ai_fallback', 0, NULL, '2025-09-08 14:18:49', '2025-09-08 14:18:49', 'data:image/svg+xml;base64,DQogICAgICAgIDxzdmcgd2lkdGg9IjEwMjQiIGhlaWdodD0iMTAyNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4NCiAgICAgICAgICAgIDxkZWZzPg0KICAgICAgICAgICAgICAgIDxsaW5lYXJHcmFkaWVudCBpZD0iYmciIHgxPSIwJSIgeTE9IjAlIiB4Mj0iMTAwJSIgeTI9IjEwMCUiPg0KICAgICAgICAgICAgICAgICAgICA8c3RvcCBvZmZzZXQ9IjAlIiBzdHlsZT0ic3RvcC1jb2xvcjojNjY3ZWVhO3N0b3Atb3BhY2l0eToxIiAvPg0KICAgICAgICAgICAgICAgICAgICA8c3RvcCBvZmZzZXQ9IjEwMCUiIHN0eWxlPSJzdG9wLWNvbG9yOiM3NjRiYTI7c3RvcC1vcGFjaXR5OjEiIC8+DQogICAgICAgIC', 'test prompt', 'flux'),
(39, 1, 'KIE_Fallback_Flux_1757341374', NULL, NULL, NULL, 'kie_ai_fallback', 0, NULL, '2025-09-08 14:22:54', '2025-09-08 14:22:54', 'data:image/svg+xml;base64,DQogICAgICAgIDxzdmcgd2lkdGg9IjEwMjQiIGhlaWdodD0iMTAyNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4NCiAgICAgICAgICAgIDxkZWZzPg0KICAgICAgICAgICAgICAgIDxsaW5lYXJHcmFkaWVudCBpZD0iYmciIHgxPSIwJSIgeTE9IjAlIiB4Mj0iMTAwJSIgeTI9IjEwMCUiPg0KICAgICAgICAgICAgICAgICAgICA8c3RvcCBvZmZzZXQ9IjAlIiBzdHlsZT0ic3RvcC1jb2xvcjojNjY3ZWVhO3N0b3Atb3BhY2l0eToxIiAvPg0KICAgICAgICAgICAgICAgICAgICA8c3RvcCBvZmZzZXQ9IjEwMCUiIHN0eWxlPSJzdG9wLWNvbG9yOiM3NjRiYTI7c3RvcC1vcGFjaXR5OjEiIC8+DQogICAgICAgIC', 'test prompt', 'flux'),
(40, 1, 'KIE_Flux_1757341570', NULL, NULL, NULL, 'kie_ai_image', 0, NULL, '2025-09-08 14:26:10', '2025-09-08 14:26:10', 'assets/uploads/ai_generated_1757341568_6445.png', 'test prompt', 'flux'),
(41, 6, 'KIE_Flux_1757343684', NULL, NULL, NULL, 'kie_ai_image', 0, NULL, '2025-09-08 15:01:24', '2025-09-08 15:01:24', 'assets/uploads/ai_generated_1757343683_1998.png', 'a lady standing', 'flux'),
(42, 1, 'KIE_Fallback_Flux_1757343919', NULL, NULL, NULL, 'kie_ai_fallback', 0, NULL, '2025-09-08 15:05:19', '2025-09-08 15:05:19', 'assets/uploads/kie_fallback_flux_1757343919_2926.svg', 'test prompt', 'flux'),
(44, 1, 'KIE_Flux_1757344527', NULL, NULL, NULL, 'kie_ai_image', 0, NULL, '2025-09-08 15:15:27', '2025-09-08 15:15:27', 'assets/uploads/kie_ai_flux_1757344526_3626.jpg', 'test prompt', 'flux'),
(45, 6, 'KIE_Flux_1757344642', NULL, NULL, NULL, 'kie_ai_image', 0, NULL, '2025-09-08 15:17:22', '2025-09-08 15:17:22', 'assets/uploads/kie_ai_flux_1757344640_5164.jpg', 'a boy riding a bycircle', 'flux'),
(46, 1, 'KIE_Flux_1757345631', NULL, NULL, NULL, 'kie_ai_image', 0, NULL, '2025-09-08 15:33:51', '2025-09-08 15:33:51', 'assets/uploads/kie_ai_flux_1757345629_5868.jpg', 'test prompt', 'flux'),
(47, 6, 'KIE_Flux_1757345849', NULL, NULL, NULL, 'kie_ai_image', 0, NULL, '2025-09-08 15:37:29', '2025-09-08 15:37:29', 'assets/uploads/kie_ai_flux_1757345847_5956.jpg', 'ifo graphic images of milk pouring down', 'flux'),
(48, 6, 'KIE_Flux_1757670906', NULL, NULL, NULL, 'kie_ai_image', 0, NULL, '2025-09-12 09:55:06', '2025-09-12 09:55:06', 'assets/uploads/kie_ai_flux_1757670901_3229.jpg', 'generate an image of a farmer in a garden', 'flux');

--
-- Triggers `projects`
--
DELIMITER $$
CREATE TRIGGER `validate_project_data_json` BEFORE INSERT ON `projects` FOR EACH ROW BEGIN
    IF NEW.project_data IS NOT NULL THEN
        IF JSON_VALID(NEW.project_data) = 0 THEN
            SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'project_data must contain valid JSON';
        END IF;
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `validate_project_data_json_update` BEFORE UPDATE ON `projects` FOR EACH ROW BEGIN
    IF NEW.project_data IS NOT NULL THEN
        IF JSON_VALID(NEW.project_data) = 0 THEN
            SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'project_data must contain valid JSON';
        END IF;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `sites`
--

CREATE TABLE `sites` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`content`)),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sites`
--

INSERT INTO `sites` (`id`, `user_id`, `content`, `created_at`) VALUES
(1, 5, '[{\"id\":\"element-1755971603363\",\"type\":\"body\",\"content\":[]},{\"id\":\"element-1755971606849\",\"type\":\"post\",\"content\":{\"title\":\"Blog Post Title\",\"content\":\"Blog post content goes here...\",\"image\":\"\"}},{\"id\":\"element-1755971621389\",\"type\":\"image\",\"content\":{\"src\":\"https:\\/\\/via.placeholder.com\\/300\",\"alt\":\"Sample Image\"}},{\"id\":\"element-1755971669816\",\"type\":\"footer\",\"content\":{\"text\":\"\\u00a9 2025 My Website\",\"socialLinks\":[\"Twitter\",\"Facebook\",\"Instagram\"]}}]', '2025-08-23 17:54:47');

-- --------------------------------------------------------

--
-- Table structure for table `templates`
--

CREATE TABLE `templates` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `templates`
--

INSERT INTO `templates` (`id`, `name`, `description`, `thumbnail`, `created_at`, `updated_at`) VALUES
(1, 'New Template', NULL, NULL, '2025-07-23 17:05:21', '2025-07-23 17:05:21'),
(2, 'New Template', NULL, NULL, '2025-08-11 10:34:08', '2025-08-11 10:34:08'),
(3, 'New Template', NULL, NULL, '2025-08-11 10:45:35', '2025-08-11 10:45:35'),
(4, 'New Template', NULL, NULL, '2025-08-11 10:46:45', '2025-08-11 10:46:45'),
(5, 'New Template', NULL, NULL, '2025-08-11 10:47:27', '2025-08-11 10:47:27'),
(6, 'New Template', NULL, NULL, '2025-08-11 19:04:23', '2025-08-11 19:04:23'),
(7, 'New Template', NULL, NULL, '2025-08-11 19:04:30', '2025-08-11 19:04:30'),
(8, 'New Template', NULL, NULL, '2025-08-11 19:09:45', '2025-08-11 19:09:45'),
(9, 'New Template', NULL, NULL, '2025-08-11 21:07:32', '2025-08-11 21:07:32'),
(10, 'New Template', NULL, NULL, '2025-08-12 10:11:55', '2025-08-12 10:11:55'),
(11, 'New Template', NULL, NULL, '2025-08-12 10:14:52', '2025-08-12 10:14:52'),
(12, 'New Template', NULL, NULL, '2025-08-12 10:15:16', '2025-08-12 10:15:16'),
(13, 'New Template', NULL, NULL, '2025-08-12 10:15:18', '2025-08-12 10:15:18'),
(14, 'New Template', NULL, NULL, '2025-08-12 10:20:21', '2025-08-12 10:20:21'),
(15, 'New Template', NULL, NULL, '2025-08-12 10:20:52', '2025-08-12 10:20:52'),
(16, 'New Template', NULL, NULL, '2025-08-12 10:40:11', '2025-08-12 10:40:11'),
(17, 'New Template', NULL, NULL, '2025-08-12 10:47:18', '2025-08-12 10:47:18'),
(18, 'New Template', NULL, NULL, '2025-08-12 10:47:31', '2025-08-12 10:47:31'),
(19, 'New Template', NULL, NULL, '2025-08-15 20:11:51', '2025-08-15 20:11:51'),
(20, 'New Template', NULL, NULL, '2025-08-15 20:40:11', '2025-08-15 20:40:11'),
(21, 'New Template', NULL, NULL, '2025-08-15 20:54:59', '2025-08-15 20:54:59'),
(22, 'New Template', NULL, NULL, '2025-08-20 16:40:33', '2025-08-20 16:40:33'),
(23, 'New Template', NULL, NULL, '2025-08-23 17:55:13', '2025-08-23 17:55:13'),
(24, 'New Template', NULL, NULL, '2025-08-23 17:58:53', '2025-08-23 17:58:53'),
(25, 'New Template', NULL, NULL, '2025-08-24 16:22:10', '2025-08-24 16:22:10'),
(26, 'New Template', NULL, NULL, '2025-08-24 16:54:17', '2025-08-24 16:54:17'),
(27, 'New Template', NULL, NULL, '2025-08-24 17:01:38', '2025-08-24 17:01:38'),
(28, 'New Template', NULL, NULL, '2025-08-24 17:04:32', '2025-08-24 17:04:32'),
(29, 'New Template', NULL, NULL, '2025-08-25 08:31:56', '2025-08-25 08:31:56'),
(30, 'New Template', NULL, NULL, '2025-08-25 08:47:21', '2025-08-25 08:47:21'),
(31, 'New Template', NULL, NULL, '2025-08-25 08:47:34', '2025-08-25 08:47:34'),
(32, 'rolkhokho', 'A new template', NULL, '2025-08-25 08:56:43', '2025-08-25 08:57:06'),
(33, 'New Template', NULL, NULL, '2025-08-25 09:07:38', '2025-08-25 09:07:38'),
(34, 'New Template', NULL, NULL, '2025-08-25 10:05:13', '2025-08-25 10:05:13'),
(35, 'New Template', NULL, NULL, '2025-08-25 10:30:00', '2025-08-25 10:30:00'),
(36, 'New Template', NULL, NULL, '2025-08-25 10:30:40', '2025-08-25 10:30:40'),
(37, 'New Template', NULL, NULL, '2025-08-25 11:54:57', '2025-08-25 11:54:57'),
(38, 'New Template', NULL, NULL, '2025-08-26 08:46:59', '2025-08-26 08:46:59'),
(39, 'New Template', NULL, NULL, '2025-08-26 09:48:52', '2025-08-26 09:48:52'),
(40, 'New Template', NULL, NULL, '2025-08-26 10:03:40', '2025-08-26 10:03:40'),
(41, 'New Template', NULL, NULL, '2025-08-26 10:08:39', '2025-08-26 10:08:39'),
(42, 'New Template', NULL, NULL, '2025-08-26 10:11:12', '2025-08-26 10:11:12'),
(43, 'New Template', NULL, NULL, '2025-08-30 14:53:29', '2025-08-30 14:53:29'),
(44, 'New Template', NULL, NULL, '2025-08-30 14:54:46', '2025-08-30 14:54:46'),
(45, 'New Template', NULL, NULL, '2025-08-30 15:28:41', '2025-08-30 15:28:41'),
(46, 'New Template', NULL, NULL, '2025-08-30 15:39:11', '2025-08-30 15:39:11'),
(47, 'New Template', NULL, NULL, '2025-08-30 15:57:46', '2025-08-30 15:57:46'),
(48, 'New Template', NULL, NULL, '2025-08-30 16:04:09', '2025-08-30 16:04:09'),
(49, 'New Template', NULL, NULL, '2025-08-30 16:07:34', '2025-08-30 16:07:34'),
(50, 'New Template', NULL, NULL, '2025-08-30 16:14:26', '2025-08-30 16:14:26'),
(51, 'New Template', NULL, NULL, '2025-08-30 19:31:43', '2025-08-30 19:31:43'),
(52, 'New Template', NULL, NULL, '2025-08-30 19:38:22', '2025-08-30 19:38:22'),
(53, 'New Template', NULL, NULL, '2025-08-30 20:17:25', '2025-08-30 20:17:25'),
(54, 'New Template', NULL, NULL, '2025-08-30 20:18:59', '2025-08-30 20:18:59'),
(55, 'New Template', NULL, NULL, '2025-09-02 09:29:00', '2025-09-02 09:29:00'),
(56, 'New Template', NULL, NULL, '2025-09-02 09:29:25', '2025-09-02 09:29:25'),
(57, 'New Template', NULL, NULL, '2025-09-02 09:32:35', '2025-09-02 09:32:35'),
(58, 'New Template', NULL, NULL, '2025-09-02 09:32:50', '2025-09-02 09:32:50'),
(59, 'New Template', NULL, NULL, '2025-09-02 10:48:45', '2025-09-02 10:48:45'),
(60, 'New Template', NULL, NULL, '2025-09-02 10:49:22', '2025-09-02 10:49:22'),
(61, 'New Template', NULL, NULL, '2025-09-02 10:49:28', '2025-09-02 10:49:28'),
(62, 'New Template', NULL, NULL, '2025-09-06 19:36:53', '2025-09-06 19:36:53'),
(63, 'New Template', NULL, NULL, '2025-09-08 10:29:04', '2025-09-08 10:29:04'),
(64, 'New Template', NULL, NULL, '2025-09-08 10:33:21', '2025-09-08 10:33:21'),
(65, 'New Template', NULL, NULL, '2025-09-08 11:27:15', '2025-09-08 11:27:15'),
(66, 'New Template', NULL, NULL, '2025-09-08 11:29:57', '2025-09-08 11:29:57'),
(67, 'New Template', NULL, NULL, '2025-09-08 11:35:44', '2025-09-08 11:35:44'),
(68, 'New Template', NULL, NULL, '2025-09-08 11:39:34', '2025-09-08 11:39:34'),
(69, 'New Template', NULL, NULL, '2025-09-08 11:39:44', '2025-09-08 11:39:44'),
(70, 'New Template', NULL, NULL, '2025-09-08 11:39:55', '2025-09-08 11:39:55'),
(71, 'New Template', NULL, NULL, '2025-09-08 11:40:03', '2025-09-08 11:40:03'),
(72, 'New Template', NULL, NULL, '2025-09-08 13:58:18', '2025-09-08 13:58:18'),
(73, 'New Template', NULL, NULL, '2025-09-08 16:22:10', '2025-09-08 16:22:10'),
(74, 'New Template', NULL, NULL, '2025-09-08 16:22:18', '2025-09-08 16:22:18'),
(75, 'New Template', NULL, NULL, '2025-09-08 16:24:21', '2025-09-08 16:24:21'),
(76, 'New Template', NULL, NULL, '2025-09-08 16:34:51', '2025-09-08 16:34:51'),
(77, 'New Template', NULL, NULL, '2025-09-08 17:08:49', '2025-09-08 17:08:49'),
(78, 'New Template', NULL, NULL, '2025-09-09 07:59:54', '2025-09-09 07:59:54'),
(79, 'New Template', NULL, NULL, '2025-09-09 08:05:52', '2025-09-09 08:05:52'),
(80, 'New Template', NULL, NULL, '2025-09-09 08:07:16', '2025-09-09 08:07:16'),
(81, 'New Template', NULL, NULL, '2025-09-09 08:08:01', '2025-09-09 08:08:01'),
(82, 'New Template', NULL, NULL, '2025-09-09 08:09:13', '2025-09-09 08:09:13'),
(83, 'New Template', NULL, NULL, '2025-09-09 08:09:34', '2025-09-09 08:09:34'),
(84, 'New Template', NULL, NULL, '2025-09-09 08:15:37', '2025-09-09 08:15:37'),
(85, 'New Template', NULL, NULL, '2025-09-09 08:16:37', '2025-09-09 08:16:37'),
(86, 'New Template', NULL, NULL, '2025-09-09 08:36:09', '2025-09-09 08:36:09'),
(87, 'New Template', NULL, NULL, '2025-09-09 08:44:56', '2025-09-09 08:44:56'),
(88, 'New Template', NULL, NULL, '2025-09-09 08:45:04', '2025-09-09 08:45:04'),
(89, 'New Template', NULL, NULL, '2025-09-09 08:49:10', '2025-09-09 08:49:10'),
(90, 'New Template', NULL, NULL, '2025-09-09 08:56:20', '2025-09-09 08:56:20'),
(91, 'New Template', NULL, NULL, '2025-09-09 08:56:27', '2025-09-09 08:56:27'),
(92, 'New Template', NULL, NULL, '2025-09-09 08:59:05', '2025-09-09 08:59:05'),
(93, 'New Template', NULL, NULL, '2025-09-09 09:35:28', '2025-09-09 09:35:28'),
(94, 'New Template', NULL, NULL, '2025-09-09 09:38:47', '2025-09-09 09:38:47'),
(95, 'New Template', NULL, NULL, '2025-09-09 09:43:46', '2025-09-09 09:43:46'),
(96, 'New Template', NULL, NULL, '2025-09-09 09:43:57', '2025-09-09 09:43:57'),
(97, 'New Template', NULL, NULL, '2025-09-09 09:44:04', '2025-09-09 09:44:04'),
(98, 'New Template', NULL, NULL, '2025-09-09 09:54:24', '2025-09-09 09:54:24'),
(99, 'New Template', NULL, NULL, '2025-09-09 09:56:19', '2025-09-09 09:56:19'),
(100, 'New Template', NULL, NULL, '2025-09-09 11:08:21', '2025-09-09 11:08:21'),
(101, 'New Template', NULL, NULL, '2025-09-09 11:08:49', '2025-09-09 11:08:49'),
(102, 'New Template', NULL, NULL, '2025-09-09 11:08:53', '2025-09-09 11:08:53'),
(103, 'New Template', NULL, NULL, '2025-09-09 11:15:07', '2025-09-09 11:15:07'),
(104, 'New Template', NULL, NULL, '2025-09-09 11:15:12', '2025-09-09 11:15:12'),
(105, 'New Template', NULL, NULL, '2025-09-09 11:19:08', '2025-09-09 11:19:08'),
(106, 'New Template', NULL, NULL, '2025-09-09 11:27:53', '2025-09-09 11:27:53'),
(107, 'New Template', NULL, NULL, '2025-09-09 11:34:56', '2025-09-09 11:34:56'),
(108, 'New Template', NULL, NULL, '2025-09-09 11:35:21', '2025-09-09 11:35:21'),
(109, 'New Template', NULL, NULL, '2025-09-09 11:35:29', '2025-09-09 11:35:29'),
(110, 'New Template', NULL, NULL, '2025-09-09 12:00:07', '2025-09-09 12:00:07'),
(111, 'New Template', NULL, NULL, '2025-09-09 12:01:42', '2025-09-09 12:01:42'),
(112, 'New Template', NULL, NULL, '2025-09-09 12:32:44', '2025-09-09 12:32:44'),
(113, 'New Template', NULL, NULL, '2025-09-09 12:39:55', '2025-09-09 12:39:55'),
(114, 'New Template', NULL, NULL, '2025-09-09 12:45:42', '2025-09-09 12:45:42'),
(115, 'New Template', NULL, NULL, '2025-09-09 12:45:49', '2025-09-09 12:45:49'),
(116, 'New Template', NULL, NULL, '2025-09-09 12:47:25', '2025-09-09 12:47:25'),
(117, 'New Template', NULL, NULL, '2025-09-09 13:17:34', '2025-09-09 13:17:34'),
(118, 'New Template', NULL, NULL, '2025-09-09 13:29:43', '2025-09-09 13:29:43'),
(119, 'New Template', NULL, NULL, '2025-09-09 14:39:01', '2025-09-09 14:39:01'),
(120, 'New Template', NULL, NULL, '2025-09-09 14:41:35', '2025-09-09 14:41:35'),
(121, 'New Template', NULL, NULL, '2025-09-09 14:46:51', '2025-09-09 14:46:51'),
(122, 'New Template', NULL, NULL, '2025-09-09 15:00:40', '2025-09-09 15:00:40'),
(123, 'New Template', NULL, NULL, '2025-09-09 15:24:05', '2025-09-09 15:24:05'),
(124, 'New Template', NULL, NULL, '2025-09-09 15:24:48', '2025-09-09 15:24:48');

-- --------------------------------------------------------

--
-- Table structure for table `template_categories`
--

CREATE TABLE `template_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `template_categories`
--

INSERT INTO `template_categories` (`id`, `name`, `description`, `created_at`) VALUES
(1, 'Portfolio', 'Showcase your work', '2025-07-22 15:26:54'),
(2, 'Business', 'Professional business websites', '2025-07-22 15:26:54'),
(3, 'Blog', 'Content publishing platforms', '2025-07-22 15:26:54'),
(4, 'E-commerce', 'Online store templates', '2025-07-22 15:26:54'),
(5, 'Portfolio', 'Showcase your work and skills', '2025-09-02 10:16:13'),
(6, 'Business', 'Professional business websites', '2025-09-02 10:16:13'),
(7, 'Blog', 'Content publishing platforms', '2025-09-02 10:16:13'),
(8, 'E-commerce', 'Online store templates', '2025-09-02 10:16:13');

-- --------------------------------------------------------

--
-- Table structure for table `template_components`
--

CREATE TABLE `template_components` (
  `id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`data`)),
  `sort_order` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `template_elements`
--

CREATE TABLE `template_elements` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `default_content` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `template_elements`
--

INSERT INTO `template_elements` (`id`, `name`, `type`, `icon`, `default_content`, `created_at`) VALUES
(1, 'Header', 'header', 'fa-heading', '{\"title\":\"Website Header\",\"navLinks\":[\"Home\",\"About\",\"Contact\"]}', '2025-07-23 16:38:19'),
(2, 'Hero Section', 'hero', 'fa-star', '{\"title\":\"Welcome to Our Website\",\"subtitle\":\"Discover our amazing features\",\"buttonText\":\"Get Started\"}', '2025-07-23 16:38:19'),
(3, 'Login Form', 'login_form', 'fa-sign-in-alt', '{\"title\":\"Login to Your Account\",\"showRemember\":true,\"showSocialLogin\":true}', '2025-07-23 16:38:19'),
(4, 'Signup Form', 'signup_form', 'fa-user-plus', '{\"title\":\"Create an Account\",\"showTerms\":true,\"showSocialSignup\":true}', '2025-07-23 16:38:19'),
(5, 'Text Block', 'text', 'fa-paragraph', '{\"content\":\"<p>This is a sample text block. Edit this content.</p>\"}', '2025-07-23 16:38:19'),
(6, 'Image', 'image', 'fa-image', '{\"src\":\"https://via.placeholder.com/800x400\",\"alt\":\"Sample Image\"}', '2025-07-23 16:38:19');

-- --------------------------------------------------------

--
-- Table structure for table `template_library`
--

CREATE TABLE `template_library` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `config_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`config_data`)),
  `template_data` longtext DEFAULT NULL,
  `preview_image` varchar(500) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`tags`)),
  `downloads_count` int(11) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `template_library`
--

INSERT INTO `template_library` (`id`, `name`, `description`, `config_data`, `template_data`, `preview_image`, `category`, `tags`, `downloads_count`, `is_active`, `created_at`) VALUES
(1, 'Business Website', 'Professional business website template', '{\"name\": \"Professional Business Website\", \"description\": \"A complete business website template\", \"version\": \"1.0\", \"pages\": [\"index\", \"login\", \"signup\"]}', '{\"index\": {\"title\": \"Professional Business Solutions\", \"description\": \"Your trusted partner for business growth\", \"components\": []}}', NULL, 'business', '[\"business\", \"professional\", \"corporate\"]', 0, 1, '2025-08-30 14:50:26'),
(2, 'Creative Portfolio', 'Stunning portfolio for creative professionals', '{\"name\": \"Creative Portfolio\", \"description\": \"A beautiful portfolio template for artists\", \"version\": \"1.0\", \"pages\": [\"index\", \"login\", \"signup\"]}', '{\"index\": {\"title\": \"Creative Portfolio\", \"description\": \"Showcase your creative work\", \"components\": []}}', NULL, 'portfolio', '[\"portfolio\", \"creative\", \"artist\", \"designer\"]', 0, 1, '2025-08-30 14:50:26'),
(3, 'Business Website', 'Professional business website template', '{\"name\": \"Professional Business Website\", \"description\": \"A complete business website template\", \"version\": \"1.0\", \"pages\": [\"index\", \"login\", \"signup\"]}', '{\"index\": {\"title\": \"Professional Business Solutions\", \"description\": \"Your trusted partner for business growth\", \"components\": []}}', NULL, 'business', '[\"business\", \"professional\", \"corporate\"]', 0, 1, '2025-08-30 14:51:09'),
(4, 'Creative Portfolio', 'Stunning portfolio for creative professionals', '{\"name\": \"Creative Portfolio\", \"description\": \"A beautiful portfolio template for artists\", \"version\": \"1.0\", \"pages\": [\"index\", \"login\", \"signup\"]}', '{\"index\": {\"title\": \"Creative Portfolio\", \"description\": \"Showcase your creative work\", \"components\": []}}', NULL, 'portfolio', '[\"portfolio\", \"creative\", \"artist\", \"designer\"]', 0, 1, '2025-08-30 14:51:09');

-- --------------------------------------------------------

--
-- Table structure for table `template_pages`
--

CREATE TABLE `template_pages` (
  `id` int(11) NOT NULL,
  `template_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `title` varchar(100) NOT NULL,
  `is_default` tinyint(1) DEFAULT 0,
  `sort_order` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `template_pages`
--

INSERT INTO `template_pages` (`id`, `template_id`, `name`, `title`, `is_default`, `sort_order`) VALUES
(1, 1, 'index', 'Home', 1, 0),
(2, 1, 'login', 'Login', NULL, 0),
(3, 1, 'signup', 'Sign Up', NULL, 0),
(4, 2, 'index', 'Home', 1, 0),
(5, 2, 'login', 'Login', NULL, 0),
(6, 2, 'signup', 'Sign Up', NULL, 0),
(7, 3, 'index', 'Home', 1, 0),
(8, 3, 'login', 'Login', NULL, 0),
(9, 3, 'signup', 'Sign Up', NULL, 0),
(10, 4, 'index', 'Home', 1, 0),
(11, 4, 'login', 'Login', NULL, 0),
(12, 4, 'signup', 'Sign Up', NULL, 0),
(13, 5, 'index', 'Home', 1, 0),
(14, 5, 'login', 'Login', NULL, 0),
(15, 5, 'signup', 'Sign Up', NULL, 0),
(16, 6, 'index', 'Home', 1, 0),
(17, 6, 'login', 'Login', NULL, 0),
(18, 6, 'signup', 'Sign Up', NULL, 0),
(19, 7, 'index', 'Home', 1, 0),
(20, 7, 'login', 'Login', NULL, 0),
(21, 7, 'signup', 'Sign Up', NULL, 0),
(22, 8, 'index', 'Home', 1, 0),
(23, 8, 'login', 'Login', NULL, 0),
(24, 8, 'signup', 'Sign Up', NULL, 0),
(25, 9, 'index', 'Home', 1, 0),
(26, 9, 'login', 'Login', NULL, 0),
(27, 9, 'signup', 'Sign Up', NULL, 0),
(28, 10, 'index', 'Home', 1, 0),
(29, 10, 'login', 'Login', NULL, 0),
(30, 10, 'signup', 'Sign Up', NULL, 0),
(31, 11, 'index', 'Home', 1, 0),
(32, 11, 'login', 'Login', NULL, 0),
(33, 11, 'signup', 'Sign Up', NULL, 0),
(34, 12, 'index', 'Home', 1, 0),
(35, 12, 'login', 'Login', NULL, 0),
(36, 12, 'signup', 'Sign Up', NULL, 0),
(37, 13, 'index', 'Home', 1, 0),
(38, 13, 'login', 'Login', NULL, 0),
(39, 13, 'signup', 'Sign Up', NULL, 0),
(40, 14, 'index', 'Home', 1, 0),
(41, 14, 'login', 'Login', NULL, 0),
(42, 14, 'signup', 'Sign Up', NULL, 0),
(43, 15, 'index', 'Home', 1, 0),
(44, 15, 'login', 'Login', NULL, 0),
(45, 15, 'signup', 'Sign Up', NULL, 0),
(46, 16, 'index', 'Home', 1, 0),
(47, 16, 'login', 'Login', NULL, 0),
(48, 16, 'signup', 'Sign Up', NULL, 0),
(49, 17, 'index', 'Home', 1, 0),
(50, 17, 'login', 'Login', NULL, 0),
(51, 17, 'signup', 'Sign Up', NULL, 0),
(52, 18, 'index', 'Home', 1, 0),
(53, 18, 'login', 'Login', NULL, 0),
(54, 18, 'signup', 'Sign Up', NULL, 0),
(55, 19, 'index', 'Home', 1, 0),
(56, 19, 'login', 'Login', NULL, 0),
(57, 19, 'signup', 'Sign Up', NULL, 0),
(58, 20, 'index', 'Home', 1, 0),
(59, 20, 'login', 'Login', NULL, 0),
(60, 20, 'signup', 'Sign Up', NULL, 0),
(61, 21, 'index', 'Home', 1, 0),
(62, 21, 'login', 'Login', NULL, 0),
(63, 21, 'signup', 'Sign Up', NULL, 0),
(64, 22, 'index', 'Home', 1, 0),
(65, 22, 'login', 'Login', NULL, 0),
(66, 22, 'signup', 'Sign Up', NULL, 0),
(67, 23, 'index', 'Home', 1, 0),
(68, 23, 'login', 'Login', NULL, 0),
(69, 23, 'signup', 'Sign Up', NULL, 0),
(70, 24, 'index', 'Home', 1, 0),
(71, 24, 'login', 'Login', NULL, 0),
(72, 24, 'signup', 'Sign Up', NULL, 0),
(73, 25, 'index', 'Home', 1, 0),
(74, 25, 'login', 'Login', NULL, 0),
(75, 25, 'signup', 'Sign Up', NULL, 0),
(76, 26, 'index', 'Home', 1, 0),
(77, 26, 'login', 'Login', NULL, 0),
(78, 26, 'signup', 'Sign Up', NULL, 0),
(79, 27, 'index', 'Home', 1, 0),
(80, 27, 'login', 'Login', NULL, 0),
(81, 27, 'signup', 'Sign Up', NULL, 0),
(82, 28, 'index', 'Home', 1, 0),
(83, 28, 'login', 'Login', NULL, 0),
(84, 28, 'signup', 'Sign Up', NULL, 0),
(85, 29, 'index', 'Home', 1, 0),
(86, 29, 'login', 'Login', NULL, 0),
(87, 29, 'signup', 'Sign Up', NULL, 0),
(88, 30, 'index', 'Home', 1, 0),
(89, 30, 'login', 'Login', NULL, 0),
(90, 30, 'signup', 'Sign Up', NULL, 0),
(91, 31, 'index', 'Home', 1, 0),
(92, 31, 'login', 'Login', NULL, 0),
(93, 31, 'signup', 'Sign Up', NULL, 0),
(94, 32, 'index', 'Home', 1, 0),
(95, 32, 'login', 'Login', 0, 1),
(96, 32, 'signup', 'Sign Up', 0, 2),
(97, 33, 'index', 'Home', 1, 0),
(98, 33, 'login', 'Login', NULL, 0),
(99, 33, 'signup', 'Sign Up', NULL, 0),
(100, 34, 'index', 'Home', 1, 0),
(101, 34, 'login', 'Login', NULL, 0),
(102, 34, 'signup', 'Sign Up', NULL, 0),
(103, 35, 'index', 'Home', 1, 0),
(104, 35, 'login', 'Login', NULL, 0),
(105, 35, 'signup', 'Sign Up', NULL, 0),
(106, 36, 'index', 'Home', 1, 0),
(107, 36, 'login', 'Login', NULL, 0),
(108, 36, 'signup', 'Sign Up', NULL, 0),
(109, 37, 'index', 'Home', 1, 0),
(110, 37, 'login', 'Login', NULL, 0),
(111, 37, 'signup', 'Sign Up', NULL, 0),
(112, 38, 'index', 'Home', 1, 0),
(113, 38, 'login', 'Login', NULL, 0),
(114, 38, 'signup', 'Sign Up', NULL, 0),
(115, 39, 'index', 'Home', 1, 0),
(116, 39, 'login', 'Login', NULL, 0),
(117, 39, 'signup', 'Sign Up', NULL, 0),
(118, 40, 'index', 'Home', 1, 0),
(119, 40, 'login', 'Login', NULL, 0),
(120, 40, 'signup', 'Sign Up', NULL, 0),
(121, 41, 'index', 'Home', 1, 0),
(122, 41, 'login', 'Login', NULL, 0),
(123, 41, 'signup', 'Sign Up', NULL, 0),
(124, 42, 'index', 'Home', 1, 0),
(125, 42, 'login', 'Login', NULL, 0),
(126, 42, 'signup', 'Sign Up', NULL, 0),
(127, 43, 'index', 'Home', 1, 0),
(128, 43, 'login', 'Login', NULL, 0),
(129, 43, 'signup', 'Sign Up', NULL, 0),
(130, 44, 'index', 'Home', 1, 0),
(131, 44, 'login', 'Login', NULL, 0),
(132, 44, 'signup', 'Sign Up', NULL, 0),
(133, 45, 'index', 'Home', 1, 0),
(134, 45, 'login', 'Login', NULL, 0),
(135, 45, 'signup', 'Sign Up', NULL, 0),
(136, 46, 'index', 'Home', 1, 0),
(137, 46, 'login', 'Login', NULL, 0),
(138, 46, 'signup', 'Sign Up', NULL, 0),
(139, 47, 'index', 'Home', 1, 0),
(140, 47, 'login', 'Login', NULL, 0),
(141, 47, 'signup', 'Sign Up', NULL, 0),
(142, 48, 'index', 'Home', 1, 0),
(143, 48, 'login', 'Login', NULL, 0),
(144, 48, 'signup', 'Sign Up', NULL, 0),
(145, 49, 'index', 'Home', 1, 0),
(146, 49, 'login', 'Login', NULL, 0),
(147, 49, 'signup', 'Sign Up', NULL, 0),
(148, 50, 'index', 'Home', 1, 0),
(149, 50, 'login', 'Login', NULL, 0),
(150, 50, 'signup', 'Sign Up', NULL, 0),
(151, 51, 'index', 'Home', 1, 0),
(152, 51, 'login', 'Login', NULL, 0),
(153, 51, 'signup', 'Sign Up', NULL, 0),
(154, 52, 'index', 'Home', 1, 0),
(155, 52, 'login', 'Login', NULL, 0),
(156, 52, 'signup', 'Sign Up', NULL, 0),
(157, 53, 'index', 'Home', 1, 0),
(158, 53, 'login', 'Login', NULL, 0),
(159, 53, 'signup', 'Sign Up', NULL, 0),
(160, 54, 'index', 'Home', 1, 0),
(161, 54, 'login', 'Login', NULL, 0),
(162, 54, 'signup', 'Sign Up', NULL, 0),
(163, 55, 'index', 'Home', 1, 0),
(164, 55, 'login', 'Login', NULL, 0),
(165, 55, 'signup', 'Sign Up', NULL, 0),
(166, 56, 'index', 'Home', 1, 0),
(167, 56, 'login', 'Login', NULL, 0),
(168, 56, 'signup', 'Sign Up', NULL, 0),
(169, 57, 'index', 'Home', 1, 0),
(170, 57, 'login', 'Login', NULL, 0),
(171, 57, 'signup', 'Sign Up', NULL, 0),
(172, 58, 'index', 'Home', 1, 0),
(173, 58, 'login', 'Login', NULL, 0),
(174, 58, 'signup', 'Sign Up', NULL, 0),
(175, 59, 'index', 'Home', 1, 0),
(176, 59, 'login', 'Login', NULL, 0),
(177, 59, 'signup', 'Sign Up', NULL, 0),
(178, 60, 'index', 'Home', 1, 0),
(179, 60, 'login', 'Login', NULL, 0),
(180, 60, 'signup', 'Sign Up', NULL, 0),
(181, 61, 'index', 'Home', 1, 0),
(182, 61, 'login', 'Login', NULL, 0),
(183, 61, 'signup', 'Sign Up', NULL, 0),
(184, 62, 'index', 'Home', 1, 0),
(185, 62, 'login', 'Login', NULL, 0),
(186, 62, 'signup', 'Sign Up', NULL, 0),
(187, 63, 'index', 'Home', 1, 0),
(188, 63, 'login', 'Login', NULL, 0),
(189, 63, 'signup', 'Sign Up', NULL, 0),
(190, 64, 'index', 'Home', 1, 0),
(191, 64, 'login', 'Login', NULL, 0),
(192, 64, 'signup', 'Sign Up', NULL, 0),
(193, 65, 'index', 'Home', 1, 0),
(194, 65, 'login', 'Login', NULL, 0),
(195, 65, 'signup', 'Sign Up', NULL, 0),
(196, 66, 'index', 'Home', 1, 0),
(197, 66, 'login', 'Login', NULL, 0),
(198, 66, 'signup', 'Sign Up', NULL, 0),
(199, 67, 'index', 'Home', 1, 0),
(200, 67, 'login', 'Login', NULL, 0),
(201, 67, 'signup', 'Sign Up', NULL, 0),
(202, 68, 'index', 'Home', 1, 0),
(203, 68, 'login', 'Login', NULL, 0),
(204, 68, 'signup', 'Sign Up', NULL, 0),
(205, 69, 'index', 'Home', 1, 0),
(206, 69, 'login', 'Login', NULL, 0),
(207, 69, 'signup', 'Sign Up', NULL, 0),
(208, 70, 'index', 'Home', 1, 0),
(209, 70, 'login', 'Login', NULL, 0),
(210, 70, 'signup', 'Sign Up', NULL, 0),
(211, 71, 'index', 'Home', 1, 0),
(212, 71, 'login', 'Login', NULL, 0),
(213, 71, 'signup', 'Sign Up', NULL, 0),
(214, 72, 'index', 'Home', 1, 0),
(215, 72, 'login', 'Login', NULL, 0),
(216, 72, 'signup', 'Sign Up', NULL, 0),
(217, 73, 'index', 'Home', 1, 0),
(218, 73, 'login', 'Login', NULL, 0),
(219, 73, 'signup', 'Sign Up', NULL, 0),
(220, 74, 'index', 'Home', 1, 0),
(221, 74, 'login', 'Login', NULL, 0),
(222, 74, 'signup', 'Sign Up', NULL, 0),
(223, 75, 'index', 'Home', 1, 0),
(224, 75, 'login', 'Login', NULL, 0),
(225, 75, 'signup', 'Sign Up', NULL, 0),
(226, 76, 'index', 'Home', 1, 0),
(227, 76, 'login', 'Login', NULL, 0),
(228, 76, 'signup', 'Sign Up', NULL, 0),
(229, 77, 'index', 'Home', 1, 0),
(230, 77, 'login', 'Login', NULL, 0),
(231, 77, 'signup', 'Sign Up', NULL, 0),
(232, 78, 'index', 'Home', 1, 0),
(233, 78, 'login', 'Login', NULL, 0),
(234, 78, 'signup', 'Sign Up', NULL, 0),
(235, 79, 'index', 'Home', 1, 0),
(236, 79, 'login', 'Login', NULL, 0),
(237, 79, 'signup', 'Sign Up', NULL, 0),
(238, 80, 'index', 'Home', 1, 0),
(239, 80, 'login', 'Login', NULL, 0),
(240, 80, 'signup', 'Sign Up', NULL, 0),
(241, 81, 'index', 'Home', 1, 0),
(242, 81, 'login', 'Login', NULL, 0),
(243, 81, 'signup', 'Sign Up', NULL, 0),
(244, 82, 'index', 'Home', 1, 0),
(245, 82, 'login', 'Login', NULL, 0),
(246, 82, 'signup', 'Sign Up', NULL, 0),
(247, 83, 'index', 'Home', 1, 0),
(248, 83, 'login', 'Login', NULL, 0),
(249, 83, 'signup', 'Sign Up', NULL, 0),
(250, 84, 'index', 'Home', 1, 0),
(251, 84, 'login', 'Login', NULL, 0),
(252, 84, 'signup', 'Sign Up', NULL, 0),
(253, 85, 'index', 'Home', 1, 0),
(254, 85, 'login', 'Login', NULL, 0),
(255, 85, 'signup', 'Sign Up', NULL, 0),
(256, 86, 'index', 'Home', 1, 0),
(257, 86, 'login', 'Login', NULL, 0),
(258, 86, 'signup', 'Sign Up', NULL, 0),
(259, 87, 'index', 'Home', 1, 0),
(260, 87, 'login', 'Login', NULL, 0),
(261, 87, 'signup', 'Sign Up', NULL, 0),
(262, 88, 'index', 'Home', 1, 0),
(263, 88, 'login', 'Login', NULL, 0),
(264, 88, 'signup', 'Sign Up', NULL, 0),
(265, 89, 'index', 'Home', 1, 0),
(266, 89, 'login', 'Login', NULL, 0),
(267, 89, 'signup', 'Sign Up', NULL, 0),
(268, 90, 'index', 'Home', 1, 0),
(269, 90, 'login', 'Login', NULL, 0),
(270, 90, 'signup', 'Sign Up', NULL, 0),
(271, 91, 'index', 'Home', 1, 0),
(272, 91, 'login', 'Login', NULL, 0),
(273, 91, 'signup', 'Sign Up', NULL, 0),
(274, 92, 'index', 'Home', 1, 0),
(275, 92, 'login', 'Login', NULL, 0),
(276, 92, 'signup', 'Sign Up', NULL, 0),
(277, 93, 'index', 'Home', 1, 0),
(278, 93, 'login', 'Login', NULL, 0),
(279, 93, 'signup', 'Sign Up', NULL, 0),
(280, 94, 'index', 'Home', 1, 0),
(281, 94, 'login', 'Login', NULL, 0),
(282, 94, 'signup', 'Sign Up', NULL, 0),
(283, 95, 'index', 'Home', 1, 0),
(284, 95, 'login', 'Login', NULL, 0),
(285, 95, 'signup', 'Sign Up', NULL, 0),
(286, 96, 'index', 'Home', 1, 0),
(287, 96, 'login', 'Login', NULL, 0),
(288, 96, 'signup', 'Sign Up', NULL, 0),
(289, 97, 'index', 'Home', 1, 0),
(290, 97, 'login', 'Login', NULL, 0),
(291, 97, 'signup', 'Sign Up', NULL, 0),
(292, 98, 'index', 'Home', 1, 0),
(293, 98, 'login', 'Login', NULL, 0),
(294, 98, 'signup', 'Sign Up', NULL, 0),
(295, 99, 'index', 'Home', 1, 0),
(296, 99, 'login', 'Login', NULL, 0),
(297, 99, 'signup', 'Sign Up', NULL, 0),
(298, 100, 'index', 'Home', 1, 0),
(299, 100, 'login', 'Login', NULL, 0),
(300, 100, 'signup', 'Sign Up', NULL, 0),
(301, 101, 'index', 'Home', 1, 0),
(302, 101, 'login', 'Login', NULL, 0),
(303, 101, 'signup', 'Sign Up', NULL, 0),
(304, 102, 'index', 'Home', 1, 0),
(305, 102, 'login', 'Login', NULL, 0),
(306, 102, 'signup', 'Sign Up', NULL, 0),
(307, 103, 'index', 'Home', 1, 0),
(308, 103, 'login', 'Login', NULL, 0),
(309, 103, 'signup', 'Sign Up', NULL, 0),
(310, 104, 'index', 'Home', 1, 0),
(311, 104, 'login', 'Login', NULL, 0),
(312, 104, 'signup', 'Sign Up', NULL, 0),
(313, 105, 'index', 'Home', 1, 0),
(314, 105, 'login', 'Login', NULL, 0),
(315, 105, 'signup', 'Sign Up', NULL, 0),
(316, 106, 'index', 'Home', 1, 0),
(317, 106, 'login', 'Login', NULL, 0),
(318, 106, 'signup', 'Sign Up', NULL, 0),
(319, 107, 'index', 'Home', 1, 0),
(320, 107, 'login', 'Login', NULL, 0),
(321, 107, 'signup', 'Sign Up', NULL, 0),
(322, 108, 'index', 'Home', 1, 0),
(323, 108, 'login', 'Login', NULL, 0),
(324, 108, 'signup', 'Sign Up', NULL, 0),
(325, 109, 'index', 'Home', 1, 0),
(326, 109, 'login', 'Login', NULL, 0),
(327, 109, 'signup', 'Sign Up', NULL, 0),
(328, 110, 'index', 'Home', 1, 0),
(329, 110, 'login', 'Login', NULL, 0),
(330, 110, 'signup', 'Sign Up', NULL, 0),
(331, 111, 'index', 'Home', 1, 0),
(332, 111, 'login', 'Login', NULL, 0),
(333, 111, 'signup', 'Sign Up', NULL, 0),
(334, 112, 'index', 'Home', 1, 0),
(335, 112, 'login', 'Login', NULL, 0),
(336, 112, 'signup', 'Sign Up', NULL, 0),
(337, 113, 'index', 'Home', 1, 0),
(338, 113, 'login', 'Login', NULL, 0),
(339, 113, 'signup', 'Sign Up', NULL, 0),
(340, 114, 'index', 'Home', 1, 0),
(341, 114, 'login', 'Login', NULL, 0),
(342, 114, 'signup', 'Sign Up', NULL, 0),
(343, 115, 'index', 'Home', 1, 0),
(344, 115, 'login', 'Login', NULL, 0),
(345, 115, 'signup', 'Sign Up', NULL, 0),
(346, 116, 'index', 'Home', 1, 0),
(347, 116, 'login', 'Login', NULL, 0),
(348, 116, 'signup', 'Sign Up', NULL, 0),
(349, 117, 'index', 'Home', 1, 0),
(350, 117, 'login', 'Login', NULL, 0),
(351, 117, 'signup', 'Sign Up', NULL, 0),
(352, 118, 'index', 'Home', 1, 0),
(353, 118, 'login', 'Login', NULL, 0),
(354, 118, 'signup', 'Sign Up', NULL, 0),
(355, 119, 'index', 'Home', 1, 0),
(356, 119, 'login', 'Login', NULL, 0),
(357, 119, 'signup', 'Sign Up', NULL, 0),
(358, 120, 'index', 'Home', 1, 0),
(359, 120, 'login', 'Login', NULL, 0),
(360, 120, 'signup', 'Sign Up', NULL, 0),
(361, 121, 'index', 'Home', 1, 0),
(362, 121, 'login', 'Login', NULL, 0),
(363, 121, 'signup', 'Sign Up', NULL, 0),
(364, 122, 'index', 'Home', 1, 0),
(365, 122, 'login', 'Login', NULL, 0),
(366, 122, 'signup', 'Sign Up', NULL, 0),
(367, 123, 'index', 'Home', 1, 0),
(368, 123, 'login', 'Login', NULL, 0),
(369, 123, 'signup', 'Sign Up', NULL, 0),
(370, 124, 'index', 'Home', 1, 0),
(371, 124, 'login', 'Login', NULL, 0),
(372, 124, 'signup', 'Sign Up', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_login` datetime DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `token_expiry` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `created_at`, `last_login`, `remember_token`, `token_expiry`) VALUES
(1, 'testuser1', '$2y$10$3X9Z7z8y9X9Z7z8y9X9Z7u9X9Z7z8y9X9Z7z8y9X9Z7z8y9X9Z', 'test1@example.com', '2025-07-19 16:18:27', NULL, NULL, NULL),
(2, 'testuser2', '$2y$10$4Y0A8a9z0A8a9z0A8a9z0v0A8a9z0A8a9z0A8a9z0A8a9z0A8a9z', 'test2@example.com', '2025-07-19 16:18:27', NULL, NULL, NULL),
(3, 'COLLINSZXO@GMAIL.COM', '$2y$10$y1MiowvE10Z3puMr/EhB3.Cxlj/NQ4OqkCVgy99tKkgHmo2hWIIEi', 'COLLINSZXO@GMAIL.COM', '2025-07-19 16:43:11', NULL, NULL, NULL),
(4, '11COLLINSZXO@GMAIL.COM', '$2y$10$HjawRC/BXe5hvYrfbFRYKuGOLiGwYSsR4g5XJ.Du.2zp7KXKeAH1i', '11COLLINSZXO@GMAIL.COM', '2025-07-20 15:10:56', '2025-08-20 17:40:27', NULL, NULL),
(5, '90COLLINSZXO@GMAIL.COM', '$2y$10$3kuS/lKALd9UADQaWP3wL.6SdJs0LecJvv53xne29sqHUyiPpckBC', '90COLLINSZXO@GMAIL.COM', '2025-08-11 08:59:24', '2025-08-30 16:39:03', NULL, NULL),
(6, '0COLLINSZXO@GMAIL.COM', '$2y$10$/5OVR57GFuHYaYMZXtIUJeewyFw/gdT3fOgCMMs.atN7ri1uSm3xu', '0COLLINSZXO@GMAIL.COM', '2025-08-11 09:50:17', '2025-09-12 10:59:35', NULL, NULL),
(7, 'nkem@gmail.com', '$2y$10$p10LRnWF/LgmoFnehQtRq.HEoHVg3OctCuI/7XPAW2rrjPx2UqTwK', 'nkem@gmail.com', '2025-08-30 16:12:45', '2025-08-30 20:31:35', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_templates`
--

CREATE TABLE `user_templates` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `template_name` varchar(255) NOT NULL,
  `pages_data` longtext NOT NULL,
  `template_type` varchar(100) DEFAULT 'custom',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `generated_files_path` varchar(500) DEFAULT NULL,
  `is_published` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_builder_pages`
--

CREATE TABLE `wp_builder_pages` (
  `id` int(11) NOT NULL,
  `site_id` int(11) DEFAULT NULL,
  `page_name` varchar(255) NOT NULL,
  `page_slug` varchar(255) NOT NULL,
  `page_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`page_content`)),
  `is_home` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wp_builder_pages`
--

INSERT INTO `wp_builder_pages` (`id`, `site_id`, `page_name`, `page_slug`, `page_content`, `is_home`, `created_at`, `updated_at`) VALUES
(1, 1, 'Home', 'home', '\"[{\\\"html\\\":\\\"<div class=\\\\\\\"canvas-element p-2 fade-in selected\\\\\\\" data-component-type=\\\\\\\"image\\\\\\\" id=\\\\\\\"component-1756804191915\\\\\\\" style=\\\\\\\"position: absolute; left: 267.004px; top: 0px;\\\\\\\">\\\\n                            <div class=\\\\\\\"w-full h-48 bg-gray-200 border-2 border-dashed border-gray-400 flex items-center justify-center\\\\\\\">\\\\n                                <div class=\\\\\\\"text-center text-gray-500\\\\\\\">\\\\n                                    <i class=\\\\\\\"fas fa-image text-3xl mb-2\\\\\\\"><\\/i>\\\\n                                    <p>Click to add image<\\/p>\\\\n                                <\\/div>\\\\n                            <\\/div>\\\\n                        <\\/div>\\\",\\\"position\\\":\\\"absolute\\\",\\\"left\\\":\\\"267.004px\\\",\\\"top\\\":\\\"0px\\\"}]\"', 1, '2025-09-02 08:49:40', '2025-09-02 09:10:02'),
(2, 2, 'Home', 'home', '[]', 1, '2025-09-06 20:00:30', '2025-09-06 20:00:30'),
(3, 2, 'jyjy', 'jyjy', '\"[{\\\"html\\\":\\\"<div class=\\\\\\\"canvas-element flex space-x-4 p-4 bg-gray-50 border border-gray-200 fade-in selected\\\\\\\" data-component-type=\\\\\\\"row\\\\\\\" id=\\\\\\\"component-1757188843717\\\\\\\" style=\\\\\\\"position: absolute; left: 380px; top: 0px;\\\\\\\">\\\\n                            <div class=\\\\\\\"flex-1 p-4 bg-white border border-gray-300 text-center text-gray-500\\\\\\\">Column 1<\\/div>\\\\n                            <div class=\\\\\\\"flex-1 p-4 bg-white border border-gray-300 text-center text-gray-500\\\\\\\">Column 2<\\/div>\\\\n                        <\\/div>\\\",\\\"position\\\":\\\"absolute\\\",\\\"left\\\":\\\"380px\\\",\\\"top\\\":\\\"0px\\\"}]\"', 0, '2025-09-06 20:00:37', '2025-09-06 20:01:07');

-- --------------------------------------------------------

--
-- Table structure for table `wp_builder_sites`
--

CREATE TABLE `wp_builder_sites` (
  `id` int(11) NOT NULL,
  `site_name` varchar(255) NOT NULL,
  `site_description` text DEFAULT NULL,
  `theme` varchar(100) DEFAULT 'modern',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_id` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wp_builder_sites`
--

INSERT INTO `wp_builder_sites` (`id`, `site_name`, `site_description`, `theme`, `created_at`, `updated_at`, `user_id`) VALUES
(1, 'OKK', '888', 'elegant', '2025-09-02 08:49:40', '2025-09-02 08:49:40', 1),
(2, 'OKK', ',,,,,,,,,', 'modern', '2025-09-06 20:00:30', '2025-09-06 20:00:30', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ai_images`
--
ALTER TABLE `ai_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_created_at` (`created_at`);

--
-- Indexes for table `component_library`
--
ALTER TABLE `component_library`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `newsletter_subscriptions`
--
ALTER TABLE `newsletter_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_email` (`email`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`);

--
-- Indexes for table `sites`
--
ALTER TABLE `sites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `templates`
--
ALTER TABLE `templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `template_categories`
--
ALTER TABLE `template_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `template_components`
--
ALTER TABLE `template_components`
  ADD PRIMARY KEY (`id`),
  ADD KEY `page_id` (`page_id`);

--
-- Indexes for table `template_elements`
--
ALTER TABLE `template_elements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `template_library`
--
ALTER TABLE `template_library`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_category` (`category`),
  ADD KEY `idx_name` (`name`),
  ADD KEY `idx_active` (`is_active`);

--
-- Indexes for table `template_pages`
--
ALTER TABLE `template_pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `template_id` (`template_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_username` (`username`);

--
-- Indexes for table `user_templates`
--
ALTER TABLE `user_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_template_name` (`template_name`),
  ADD KEY `idx_created_at` (`created_at`);

--
-- Indexes for table `wp_builder_pages`
--
ALTER TABLE `wp_builder_pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `wp_builder_sites`
--
ALTER TABLE `wp_builder_sites`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ai_images`
--
ALTER TABLE `ai_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `component_library`
--
ALTER TABLE `component_library`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `newsletter_subscriptions`
--
ALTER TABLE `newsletter_subscriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `sites`
--
ALTER TABLE `sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `templates`
--
ALTER TABLE `templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT for table `template_categories`
--
ALTER TABLE `template_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `template_components`
--
ALTER TABLE `template_components`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `template_elements`
--
ALTER TABLE `template_elements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `template_library`
--
ALTER TABLE `template_library`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `template_pages`
--
ALTER TABLE `template_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=373;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user_templates`
--
ALTER TABLE `user_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_builder_pages`
--
ALTER TABLE `wp_builder_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wp_builder_sites`
--
ALTER TABLE `wp_builder_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `media_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sites`
--
ALTER TABLE `sites`
  ADD CONSTRAINT `sites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `template_components`
--
ALTER TABLE `template_components`
  ADD CONSTRAINT `template_components_ibfk_1` FOREIGN KEY (`page_id`) REFERENCES `template_pages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `template_pages`
--
ALTER TABLE `template_pages`
  ADD CONSTRAINT `template_pages_ibfk_1` FOREIGN KEY (`template_id`) REFERENCES `templates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wp_builder_pages`
--
ALTER TABLE `wp_builder_pages`
  ADD CONSTRAINT `wp_builder_pages_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `wp_builder_sites` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
