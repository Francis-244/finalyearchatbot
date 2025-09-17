# AI Chatbot Website

A simple PHP-based AI chatbot website with user authentication and code generation features.

## Features
- User signup and login (MySQL)
- Chatbot interface (frontend only)
- Code generation (placeholder)
- Download generated code (optional)

## Detailed Features

### User Authentication
- Secure user registration and login system.
- Passwords are hashed for security.
- Session management with optional "Remember Me" functionality.

### Template Builder
- Drag-and-drop interface for building websites.
- Real-time preview of changes.
- Component categories include:
  - **Core Structure**: Header, Footer, Section, Sidebar.
  - **Content**: Card, Text Block, Image, Video.
  - **Interactive**: Accordion, Tabs, Modal, Dropdown.
  - **Utility**: Spacer, Divider.

### AI Integration
- AI-powered image generation using prompts.
- Multiple AI models supported (e.g., Turbo, Flux).
- Generated images are stored and can be reused in projects.

### Project Management
- Save and load projects with version control.
- Export projects as downloadable HTML, CSS, and JS files.

### Template Library
- Pre-built templates for various industries:
  - Business
  - Portfolio
  - Blog
  - E-commerce
- Templates are fully customizable.

## Installation

### Prerequisites
- XAMPP or any PHP and MySQL server.
- PHP 8.2 or higher.
- MySQL 8.0 or higher.

### Steps
1. Clone the repository or download the project files.
2. Import the `chatweb (1).sql` file into your MySQL server.
3. Update the `db_connect.php` file with your database credentials.
4. Place the project folder in your XAMPP `htdocs` directory.
5. Start Apache and MySQL from the XAMPP Control Panel.
6. Access the site at [http://localhost/chatweb/](http://localhost/chatweb/).

## File Structure

### Root Directory
- `index.php`: Main landing page.
- `db_connect.php`: Database connection file.
- `login.php`: User login page.
- `signup.php`: User registration page.

### User Directory
- `dashboard.php`: User dashboard.
- `template_builder.php`: Main template builder interface.
- `ready_templates.php`: Template selection page.

### Components Directory
- `core/`: Core components like header, footer, etc.
- `content/`: Content components like text blocks, images.
- `interactive/`: Interactive components like modals, dropdowns.
- `utility/`: Utility components like spacers, dividers.

### Templates Directory
- `business_pro/`: Business templates.
- `creative_portfolio/`: Portfolio templates.
- `tech_startup/`: Startup templates.
- `restaurant/`: Restaurant templates.

### Assets Directory
- `css/`: Stylesheets.
- `js/`: JavaScript files.
- `images/`: Image assets.

### Output Directory
- Stores generated files for download.

## Security Features
- Password hashing for secure storage.
- Prepared statements to prevent SQL injection.
- Basic input validation.
- Session management to prevent unauthorized access.

## Future Enhancements
- Add CSRF protection.
- Implement advanced AI features.
- Introduce multi-language support.
- Add collaboration features for multi-user editing.
- Integrate analytics for user behavior tracking.
