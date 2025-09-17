# Login/Signup Builder - User Guide

## Overview
The Login/Signup Builder is a powerful drag-and-drop tool that allows you to create professional login and signup pages using pre-built templates. You can customize every element and export the complete code for use in your projects.

## Features

### 🎨 **Ready-Made Templates**
- **Business Pro**: Corporate-style login/signup pages with blue gradient backgrounds
- **Creative Portfolio**: Designer-focused pages with purple/pink gradients  
- **Tech Startup**: Modern SaaS-style pages with vibrant gradients
- **Restaurant**: Elegant dining-themed pages with warm colors
- **E-commerce**: Shopping-focused pages with clean, professional styling
- **Blog**: Content creator pages with green/teal gradients

### 🛠️ **Drag & Drop Components**
- **Logo**: Add your brand logo with customizable URL and alt text
- **Heading**: Add titles with H1, H2, or H3 levels
- **Text**: Add descriptive paragraphs and instructions
- **Input Field**: Create form fields (email, password, text, phone) with labels and validation
- **Button**: Add submit buttons or action buttons with primary/secondary styles
- **Link**: Add navigation links (forgot password, terms, etc.)
- **Divider**: Add visual separators with "or" text
- **Social Login**: Add social authentication buttons (Google, Facebook, Twitter, GitHub)

### ⚡ **Advanced Features**
- **Live Preview**: See your changes in real-time
- **Element Editing**: Double-click any element to customize its properties
- **Drag to Reorder**: Move elements up/down to change layout
- **Template Switching**: Switch between login and signup page types
- **Export Functionality**: Generate complete HTML, CSS, and JS files

## How to Use

### 1. **Access the Builder**
Navigate to: `http://localhost/chatweb/user/login_signup_builder.php`
Or click "Login/Signup Builder" in the navigation menu.

### 2. **Choose a Template**
- Click on any template in the sidebar (Business Pro, Creative Portfolio, etc.)
- The builder will automatically load the template's login/signup page
- All elements will be parsed and made editable

### 3. **Switch Page Type**
- Use the "Login" and "Signup" buttons to switch between page types
- Each template has both login and signup variations

### 4. **Customize Elements**
- **Add New Elements**: Drag components from the sidebar to the canvas
- **Edit Elements**: Click the "Edit" button on any element to modify its properties
- **Delete Elements**: Click the "Delete" button to remove unwanted elements
- **Reorder Elements**: Use the ↑ and ↓ buttons to change element order

### 5. **Preview Your Page**
- Click the "Preview" button to see how your page will look
- The preview opens in a modal with the actual rendered HTML

### 6. **Export Your Page**
- Click the "Export" button to generate your page files
- The system creates a folder with:
  - `login.html` or `signup.html` (main HTML file)
  - `styles.css` (CSS styles)
  - `scripts.js` (JavaScript functionality)
  - `README.md` (usage instructions)

## Element Customization Options

### **Logo Element**
- Image URL: Link to your logo image
- Alt Text: Accessibility description

### **Heading Element**
- Text: The heading content
- Level: H1, H2, or H3 styling

### **Text Element**
- Text: Paragraph content (supports multiple lines)

### **Input Field Element**
- Label: Field label text
- Type: text, email, password, or phone
- Name: Form field name attribute
- Placeholder: Hint text inside the field
- Required: Whether the field is mandatory

### **Button Element**
- Text: Button label
- Type: submit or button
- Style: primary (colored) or secondary (outlined)

### **Link Element**
- Text: Link text
- URL: Link destination

### **Social Login Element**
- Text: Button text
- Provider: google, facebook, twitter, or github

## Export Details

### **Generated Files**
1. **HTML File**: Complete, responsive page with form structure
2. **CSS File**: Tailwind CSS + custom styles for animations and effects
3. **JS File**: Form validation, input animations, and interactive features
4. **README**: Instructions for using the exported files

### **Features Included in Export**
- ✅ Responsive design (mobile-friendly)
- ✅ Form validation
- ✅ Input focus animations
- ✅ Hover effects
- ✅ Professional styling
- ✅ Cross-browser compatibility

### **How to Use Exported Files**
1. Extract the exported folder from the `exports` directory
2. Open the HTML file in any web browser to test
3. Upload all files to your web server
4. Integrate with your backend authentication system

## Template Styles

### **Business Pro**
- **Colors**: Blue gradient background
- **Style**: Professional, corporate
- **Best For**: Business websites, corporate portals

### **Creative Portfolio**
- **Colors**: Purple/pink gradient
- **Style**: Artistic, modern
- **Best For**: Designer portfolios, creative agencies

### **Tech Startup**
- **Colors**: Vibrant purple/pink/red gradient
- **Style**: Modern, innovative
- **Best For**: SaaS products, tech companies

### **Restaurant**
- **Colors**: Red/orange warm tones
- **Style**: Elegant, inviting
- **Best For**: Restaurants, food services

### **E-commerce**
- **Colors**: Blue/gray professional
- **Style**: Clean, trustworthy
- **Best For**: Online stores, marketplaces

### **Blog**
- **Colors**: Green/teal nature tones
- **Style**: Clean, readable
- **Best For**: Blogs, content sites

## Tips for Best Results

### **Design Tips**
- Keep forms simple and focused
- Use clear, descriptive labels
- Maintain consistent spacing
- Choose appropriate input types
- Include helpful placeholder text

### **UX Best Practices**
- Always include a logo for branding
- Provide clear error messages
- Use primary buttons for main actions
- Include "forgot password" links on login pages
- Add social login options for convenience

### **Technical Tips**
- Test exported pages in multiple browsers
- Validate form fields appropriately
- Use HTTPS for production login pages
- Implement proper backend validation
- Consider accessibility requirements

## Troubleshooting

### **Template Not Loading**
- Check that the template files exist in the `templates` directory
- Ensure proper file permissions
- Try refreshing the page

### **Export Not Working**
- Verify the `exports` directory exists and is writable
- Check that `assets/css` and `assets/js` directories exist
- Ensure PHP has write permissions

### **Elements Not Saving**
- Make sure to click "Save" in the edit modal
- Check browser console for JavaScript errors
- Try refreshing the page and starting over

## Support
For technical support or feature requests, please contact the development team or check the project documentation.

---

**Happy Building! 🚀**
