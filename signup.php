<?php
session_start();
require_once 'db_connect.php';

$success = false;
$errors = [];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = trim($_POST['username']);
    $email = trim($_POST['email']);
    $password = $_POST['password'];
    $confirm_password = $_POST['confirm_password'];
    $terms = isset($_POST['terms']) ? true : false;

    // Server-side validation
    if (strlen($username) < 3) {
        $errors[] = "Username must be at least 3 characters long.";
    }
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $errors[] = "Invalid email format.";
    }
    if (strlen($password) < 8) {
        $errors[] = "Password must be at least 8 characters long.";
    }
    if ($password !== $confirm_password) {
        $errors[] = "Passwords do not match.";
    }
    if (!$terms) {
        $errors[] = "You must agree to the Terms of Service and Privacy Policy.";
    }

    // Check for existing username or email
    if (empty($errors)) {
        try {
            $stmt = $pdo->prepare("SELECT COUNT(*) FROM users WHERE username = ? OR email = ?");
            $stmt->execute([$username, $email]);
            if ($stmt->fetchColumn() > 0) {
                $errors[] = "Username or email already exists.";
            }
        } catch (PDOException $e) {
            $errors[] = "Database error: " . $e->getMessage();
        }
    }

    // If no errors, insert user
    if (empty($errors)) {
        try {
            $hashed_password = password_hash($password, PASSWORD_DEFAULT);
            $stmt = $pdo->prepare("INSERT INTO users (username, email, password) VALUES (?, ?, ?)");
            $stmt->execute([$username, $email, $hashed_password]);
            $_SESSION['user'] = $username;
            $success = true;
        } catch (PDOException $e) {
            $errors[] = "Registration failed: " . $e->getMessage();
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up - AI Website Builder</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary: #4361ee;
            --primary-light: #4cc9f0;
            --secondary: #3f37c9;
            --accent: #f72585;
            --light: #f8f9fa;
            --dark: #1a1a2e;
            --gray: #6c757d;
            --success: #4cc9f0;
            --warning: #f8961e;
            --danger: #ef233c;
            --glass: rgba(255, 255, 255, 0.1);
            --glass-border: rgba(255, 255, 255, 0.2);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
        }

        body {
            background: linear-gradient(135deg, #0f0c29, #302b63, #24243e);
            color: white;
            line-height: 1.6;
            min-height: 100vh;
        }

        /* Modern Glass Navbar */
        .navbar {
            background: var(--glass);
            backdrop-filter: blur(15px);
            -webkit-backdrop-filter: blur(15px);
            border-bottom: 1px solid var(--glass-border);
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
        }

        .navbar-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1rem 2rem;
            max-width: 1400px;
            margin: 0 auto;
        }

        .logo {
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 1.5rem;
            font-weight: 700;
            color: white;
            text-decoration: none;
        }

        .logo img {
            height: 36px;
        }

        /* Auth Section - Glass Morphism */
        .auth-section {
            padding: 120px 20px 80px;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            overflow: hidden;
        }

        .auth-section::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(67,97,238,0.1) 0%, rgba(0,0,0,0) 70%);
            z-index: 0;
            animation: rotate 20s linear infinite;
        }

        .auth-container {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 0;
            max-width: 1000px;
            margin: 0 auto;
            background: var(--glass);
            backdrop-filter: blur(15px);
            -webkit-backdrop-filter: blur(15px);
            border-radius: 20px;
            box-shadow: 0 25px 45px rgba(0, 0, 0, 0.2);
            overflow: hidden;
            border: 1px solid var(--glass-border);
            position: relative;
            z-index: 1;
        }

        .auth-form {
            padding: 3rem;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .auth-form h2 {
            font-size: 2.2rem;
            color: white;
            margin-bottom: 1rem;
            font-weight: 700;
            background: linear-gradient(to right, var(--primary), var(--primary-light));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .auth-form p {
            color: rgba(255, 255, 255, 0.8);
            margin-bottom: 2rem;
            font-size: 1.05rem;
        }

        .error-message {
            background: rgba(239, 35, 60, 0.2);
            color: white;
            padding: 1rem;
            border-radius: 10px;
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            border-left: 4px solid var(--danger);
            backdrop-filter: blur(5px);
        }

        .success-message {
            background: rgba(76, 201, 240, 0.2);
            color: white;
            padding: 1.5rem;
            border-radius: 10px;
            margin-bottom: 1.5rem;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 1rem;
            border-left: 4px solid var(--success);
            backdrop-filter: blur(5px);
            text-align: center;
        }

        .success-message i {
            font-size: 2.5rem;
            color: var(--success);
        }

        .success-message h3 {
            font-size: 1.5rem;
            margin: 0;
        }

        .success-message p {
            margin: 0;
        }

        .success-actions {
            display: flex;
            gap: 1rem;
            margin-top: 1rem;
        }

        .success-actions a {
            padding: 0.8rem 1.5rem;
            border-radius: 8px;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s;
        }

        .success-actions .btn-primary {
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            color: white;
        }

        .success-actions .btn-outline {
            background: transparent;
            color: var(--primary-light);
            border: 2px solid var(--primary-light);
        }

        .success-actions a:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        .form-group {
            margin-bottom: 1.5rem;
            position: relative;
        }

        .form-group label {
            display: block;
            font-size: 0.9rem;
            color: rgba(255, 255, 255, 0.8);
            margin-bottom: 0.5rem;
            font-weight: 500;
        }

        .input-wrapper {
            position: relative;
        }

        .input-wrapper i {
            position: absolute;
            top: 50%;
            left: 15px;
            transform: translateY(-50%);
            color: rgba(255, 255, 255, 0.7);
            transition: all 0.3s;
        }

        .auth-form input {
            width: 100%;
            padding: 0.9rem 0.9rem 0.9rem 2.8rem;
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            font-size: 1rem;
            color: white;
            transition: all 0.3s;
        }

        .auth-form input:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.3);
            background: rgba(255, 255, 255, 0.15);
        }

        .auth-form input:focus + i {
            color: var(--primary-light);
        }

        .auth-form input::placeholder {
            color: rgba(255, 255, 255, 0.5);
        }

        .password-strength {
            height: 4px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 2px;
            margin-top: 0.5rem;
            overflow: hidden;
            position: relative;
        }

        .password-strength-bar {
            height: 100%;
            width: 0;
            background: var(--danger);
            transition: width 0.3s, background 0.3s;
        }

        .password-hint {
            font-size: 0.8rem;
            color: rgba(255, 255, 255, 0.6);
            margin-top: 0.3rem;
            display: none;
        }

        .auth-form button {
            width: 100%;
            padding: 1rem;
            font-size: 1rem;
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            color: white;
            border: none;
            border-radius: 10px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            margin-top: 1rem;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            box-shadow: 0 4px 15px rgba(67, 97, 238, 0.3);
        }

        .auth-form button:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(67, 97, 238, 0.4);
        }

        .auth-form button:active {
            transform: translateY(0);
        }

        .auth-link {
            margin-top: 1.5rem;
            text-align: center;
            color: rgba(255, 255, 255, 0.7);
            font-size: 0.95rem;
        }

        .auth-link a {
            color: var(--primary-light);
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s;
        }

        .auth-link a:hover {
            text-decoration: underline;
            color: white;
        }

        .auth-image {
            background: url('https://images.unsplash.com/photo-1551434678-e076c223a692?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=800&q=80') no-repeat center/cover;
            position: relative;
            display: flex;
            align-items: flex-end;
        }

        .auth-image::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, rgba(67, 97, 238, 0.7) 0%, rgba(63, 55, 201, 0.8) 100%);
        }

        .auth-image-content {
            position: relative;
            z-index: 1;
            padding: 3rem;
            color: white;
        }

        .auth-image-content h3 {
            font-size: 1.8rem;
            margin-bottom: 1rem;
            line-height: 1.3;
        }

        .auth-image-content p {
            opacity: 0.9;
            margin-bottom: 0;
        }

        /* Password toggle */
        .password-toggle {
            position: absolute;
            top: 50%;
            right: 15px;
            transform: translateY(-50%);
            color: rgba(255, 255, 255, 0.7);
            cursor: pointer;
            transition: color 0.3s;
        }

        .password-toggle:hover {
            color: var(--primary-light);
        }

        /* Terms checkbox */
        .terms-group {
            display: flex;
            align-items: flex-start;
            gap: 10px;
            margin: 1.5rem 0;
        }

        .terms-group input {
            margin-top: 3px;
        }

        .terms-group label {
            font-size: 0.85rem;
            color: rgba(255, 255, 255, 0.7);
            margin-bottom: 0;
        }

        .terms-group a {
            color: var(--primary-light);
            text-decoration: none;
        }

        .terms-group a:hover {
            text-decoration: underline;
        }

        /* Animations */
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes rotate {
            from {
                transform: rotate(0deg);
            }
            to {
                transform: rotate(360deg);
            }
        }

        /* Responsive Design */
        @media (max-width: 992px) {
            .auth-container {
                grid-template-columns: 1fr;
            }

            .auth-image {
                display: none;
            }

            .auth-form h2 {
                font-size: 1.8rem;
            }
        }

        @media (max-width: 768px) {
            .auth-section {
                padding: 100px 20px 60px;
            }

            .auth-form {
                padding: 2rem;
            }

            .auth-form h2 {
                font-size: 1.6rem;
            }

            .auth-form p {
                font-size: 1rem;
            }
        }

        @media (max-width: 576px) {
            .navbar-container {
                padding: 1rem;
            }

            .auth-form h2 {
                font-size: 1.4rem;
            }

            .auth-form input {
                padding: 0.8rem 0.8rem 0.8rem 2.5rem;
            }

            .success-actions {
                flex-direction: column;
                gap: 0.5rem;
            }

            .success-actions a {
                width: 100%;
                text-align: center;
            }
        }
    </style>
</head>
<body>
    <nav class="navbar">
        <div class="navbar-container">
            <a href="index.php" class="logo">
                <img src="assets/images/logo.png" alt="AI Builder Logo">
                <span>AI Builder</span>
            </a>
            <div class="auth-buttons">
                <a href="login.php" class="btn btn-outline">Login</a>
            </div>
        </div>
    </nav>

    <main>
        <section class="auth-section">
            <div class="auth-container">
                <div class="auth-form">
                    <?php if ($success): ?>
                        <div class="success-message">
                            <i class="fas fa-check-circle"></i>
                            <h3>Account Created Successfully!</h3>
                            <p>Welcome, <?php echo htmlspecialchars($username); ?>! Your account has been successfully created.</p>
                            
                            <div class="success-actions">
                                <a href="wordpress_builder/dashboard.php" class="btn-primary">Go to Dashboard</a>
                                <a href="index.php" class="btn-outline">Back to Home</a>
                            </div>
                        </div>
                    <?php else: ?>
                        <h2>Create Your Account</h2>
                        <p>Join our AI-powered platform and start building websites effortlessly</p>
                        
                        <?php if (!empty($errors)): ?>
                            <div class="error-message">
                                <i class="fas fa-exclamation-circle"></i>
                                <?php echo implode('<br>', array_map('htmlspecialchars', $errors)); ?>
                            </div>
                        <?php endif; ?>
                        
                        <form method="POST" action="signup.php" id="signup-form">
                            <div class="form-group">
                                <label for="username">Username</label>
                                <div class="input-wrapper">
                                    <i class="fas fa-user"></i>
                                    <input type="text" id="username" name="username" placeholder="Enter your username" required value="<?php echo isset($_POST['username']) ? htmlspecialchars($_POST['username']) : ''; ?>">
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label for="email">Email Address</label>
                                <div class="input-wrapper">
                                    <i class="fas fa-envelope"></i>
                                    <input type="email" id="email" name="email" placeholder="Enter your email" required value="<?php echo isset($_POST['email']) ? htmlspecialchars($_POST['email']) : ''; ?>">
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label for="password">Password</label>
                                <div class="input-wrapper">
                                    <i class="fas fa-lock"></i>
                                    <input type="password" id="password" name="password" placeholder="Create a password" required>
                                    <span class="password-toggle" id="togglePassword">
                                        <i class="fas fa-eye"></i>
                                    </span>
                                </div>
                                <div class="password-strength">
                                    <div class="password-strength-bar" id="passwordStrength"></div>
                                </div>
                                <div class="password-hint" id="passwordHint">
                                    Password should be at least 8 characters long
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label for="confirm_password">Confirm Password</label>
                                <div class="input-wrapper">
                                    <i class="fas fa-lock"></i>
                                    <input type="password" id="confirm_password" name="confirm_password" placeholder="Confirm your password" required>
                                    <span class="password-toggle" id="toggleConfirmPassword">
                                        <i class="fas fa-eye"></i>
                                    </span>
                                </div>
                            </div>
                            
                            <div class="terms-group">
                                <input type="checkbox" id="terms" name="terms" required <?php echo isset($_POST['terms']) ? 'checked' : ''; ?>>
                                <label for="terms">I agree to the <a href="#">Terms of Service</a> and <a href="#">Privacy Policy</a></label>
                            </div>
                            
                            <button type="submit">
                                <i class="fas fa-user-plus"></i> Create Account
                            </button>
                        </form>
                        
                        <p class="auth-link">Already have an account? <a href="login.php">Sign in here</a></p>
                    <?php endif; ?>
                </div>
                
                <div class="auth-image">
                    <div class="auth-image-content">
                        <h3>Build Stunning Websites with AI</h3>
                        <p>Join thousands of creators who are transforming their ideas into reality</p>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <script>
        // Password toggle functionality
        const togglePassword = document.querySelector('#togglePassword');
        const password = document.querySelector('#password');
        const toggleConfirmPassword = document.querySelector('#toggleConfirmPassword');
        const confirmPassword = document.querySelector('#confirm_password');
        
        togglePassword.addEventListener('click', function() {
            const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
            password.setAttribute('type', type);
            this.innerHTML = type === 'password' ? '<i class="fas fa-eye"></i>' : '<i class="fas fa-eye-slash"></i>';
        });
        
        toggleConfirmPassword.addEventListener('click', function() {
            const type = confirmPassword.getAttribute('type') === 'password' ? 'text' : 'password';
            confirmPassword.setAttribute('type', type);
            this.innerHTML = type === 'password' ? '<i class="fas fa-eye"></i>' : '<i class="fas fa-eye-slash"></i>';
        });
        
        // Password strength indicator
        password.addEventListener('input', function() {
            const strengthBar = document.getElementById('passwordStrength');
            const hint = document.getElementById('passwordHint');
            const passwordValue = this.value;
            let strength = 0;
            
            // Check password length
            if (passwordValue.length >= 8) strength += 1;
            if (passwordValue.length >= 12) strength += 1;
            
            // Check for mixed case
            if (/[a-z]/.test(passwordValue) && /[A-Z]/.test(passwordValue)) strength += 1;
            
            // Check for numbers
            if (/\d/.test(passwordValue)) strength += 1;
            
            // Check for special chars
            if (/[^a-zA-Z0-9]/.test(passwordValue)) strength += 1;
            
            // Update strength bar
            const width = (strength / 5) * 100;
            strengthBar.style.width = width + '%';
            
            // Update colors
            if (strength <= 1) {
                strengthBar.style.background = 'var(--danger)';
                hint.textContent = 'Weak password';
            } else if (strength <= 3) {
                strengthBar.style.background = 'var(--warning)';
                hint.textContent = 'Moderate password';
            } else {
                strengthBar.style.background = 'var(--success)';
                hint.textContent = 'Strong password';
            }
            
            // Show/hide hint
            if (passwordValue.length > 0) {
                hint.style.display = 'block';
            } else {
                hint.style.display = 'none';
            }
        });
    </script>
</body>
</html>