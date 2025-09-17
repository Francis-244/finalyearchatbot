<?php
session_start();
require_once 'db_connect.php';

// Enable detailed error reporting for debugging
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Initialize CSRF token
if (empty($_SESSION['csrf_token'])) {
    $_SESSION['csrf_token'] = bin2hex(random_bytes(32));
}

// Handle login request
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    try {
        // Validate CSRF token
        if (!isset($_POST['csrf_token']) || !hash_equals($_SESSION['csrf_token'], $_POST['csrf_token'])) {
            throw new Exception('Invalid form submission');
        }

        // Get and sanitize inputs
        $username = trim($_POST['username'] ?? '');
        $password = $_POST['password'] ?? '';
        $remember = isset($_POST['remember']);

        // Basic validation
        if (empty($username) || empty($password)) {
            throw new Exception('Username and password are required');
        }

        // Check login attempts
        $loginAttempts = $_SESSION['login_attempts'] ?? 0;
        if ($loginAttempts >= 3) {
            throw new Exception('Too many failed attempts. Please try again later.');
        }

        // Find user in database
        $stmt = $pdo->prepare("SELECT * FROM users WHERE username = :username OR email = :email LIMIT 1");
        $stmt->execute([':username' => $username, ':email' => $username]);
        $user = $stmt->fetch();

        if (!$user) {
            $_SESSION['login_attempts'] = $loginAttempts + 1;
            throw new Exception('Invalid username or password');
        }

        // Verify password
        if (!password_verify($password, $user['password'])) {
            $_SESSION['login_attempts'] = $loginAttempts + 1;
            throw new Exception('Invalid username or password');
        }

        // Login successful
        $_SESSION['user'] = [
            'id' => $user['id'],
            'username' => $user['username'],
            'email' => $user['email'],
            'last_login' => $user['last_login']
        ];
        $_SESSION['login_attempts'] = 0;

        // Update last login
        $pdo->prepare("UPDATE users SET last_login = NOW() WHERE id = ?")->execute([$user['id']]);

        // Handle "remember me"
        if ($remember) {
            $token = bin2hex(random_bytes(32));
            $expiry = time() + 60 * 60 * 24 * 30; // 30 days
            setcookie('remember_token', $token, $expiry, '/', '', true, true);
            
            // Store hashed token in database
            $hashedToken = password_hash($token, PASSWORD_DEFAULT);
            $pdo->prepare("UPDATE users SET remember_token = ?, token_expiry = ? WHERE id = ?")
                ->execute([$hashedToken, date('Y-m-d H:i:s', $expiry), $user['id']]);
        }

        // Redirect to dashboard
        header('Location: user/chatbot.php');
        exit;

    } catch (Exception $e) {
        $error = $e->getMessage();
    }
}
?>


<?php require_once 'includes/header.php'; ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | AI Website Builder Pro</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <script src="assets/js/main.js" defer></script>
    <style>
        :root {
            --primary: #4F46E5;
            --primary-dark: #4338CA;
            --primary-light: #6366F1;
            --secondary: #10B981;
            --accent: #F59E0B;
            --light: #F9FAFB;
            --dark: #111827;
            --dark-gray: #374151;
            --gray: #6B7280;
            --light-gray: #E5E7EB;
            --success: #10B981;
            --warning: #F59E0B;
            --danger: #EF4444;
            --white: #FFFFFF;
            --shadow-sm: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
            --shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px 0 rgba(0, 0, 0, 0.06);
            --shadow-md: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            --shadow-lg: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
            --shadow-xl: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
            --radius-sm: 0.125rem;
            --radius: 0.25rem;
            --radius-md: 0.375rem;
            --radius-lg: 0.5rem;
            --radius-xl: 0.75rem;
            --radius-full: 9999px;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
        }

        body {
            background-color: var(--light);
            color: var(--dark);
            line-height: 1.5;
            -webkit-font-smoothing: antialiased;
        }

        .auth-section {
            display: flex;
            min-height: 100vh;
            align-items: center;
            justify-content: center;
            padding: 1.5rem;
            background-color: var(--white);
            background-image: radial-gradient(at top right, rgba(79, 70, 229, 0.05) 0%, transparent 50%),
                              radial-gradient(at bottom left, rgba(16, 185, 129, 0.05) 0%, transparent 50%);
        }

        .auth-container {
            width: 100%;
            max-width: 64rem;
            display: grid;
            grid-template-columns: 1fr 1fr;
            background-color: var(--white);
            border-radius: var(--radius-xl);
            overflow: hidden;
            box-shadow: var(--shadow-xl);
            min-height: 40rem;
        }

        .auth-form-container {
            padding: 4rem 3rem;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .auth-logo {
            margin-bottom: 2.5rem;
            display: flex;
            align-items: center;
            gap: 0.75rem;
            font-weight: 600;
            font-size: 1.25rem;
            color: var(--dark);
        }

        .auth-logo svg {
            width: 2rem;
            height: 2rem;
            color: var(--primary);
        }

        .auth-header {
            margin-bottom: 2rem;
        }

        .auth-header h1 {
            font-size: 1.875rem;
            font-weight: 700;
            color: var(--dark);
            margin-bottom: 0.75rem;
            line-height: 1.25;
        }

        .auth-header p {
            color: var(--gray);
            font-size: 1rem;
        }

        .auth-form {
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
        }

        .form-group label {
            font-size: 0.875rem;
            font-weight: 500;
            color: var(--dark-gray);
        }

        .input-wrapper {
            position: relative;
        }

        .input-wrapper i {
            position: absolute;
            top: 50%;
            left: 1rem;
            transform: translateY(-50%);
            color: var(--gray);
            transition: color 0.15s ease;
        }

        .auth-form input {
            width: 100%;
            padding: 0.75rem 1rem 0.75rem 2.5rem;
            font-size: 0.875rem;
            border: 1px solid var(--light-gray);
            border-radius: var(--radius-md);
            background-color: var(--white);
            color: var(--dark);
            transition: all 0.15s ease;
            box-shadow: var(--shadow-sm);
        }

        .auth-form input:focus {
            outline: none;
            border-color: var(--primary-light);
            box-shadow: 0 0 0 3px rgba(79, 70, 229, 0.1);
        }

        .auth-form input:focus + i {
            color: var(--primary);
        }

        .password-toggle {
            position: absolute;
            top: 50%;
            right: 1rem;
            transform: translateY(-50%);
            color: var(--gray);
            cursor: pointer;
            transition: color 0.15s ease;
        }

        .password-toggle:hover {
            color: var(--dark-gray);
        }

        .auth-actions {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-top: -0.5rem;
        }

        .remember-me {
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .remember-me input {
            width: 1rem;
            height: 1rem;
            border-radius: var(--radius-sm);
            border: 1px solid var(--light-gray);
            accent-color: var(--primary);
        }

        .remember-me label {
            font-size: 0.875rem;
            color: var(--gray);
            cursor: pointer;
        }

        .forgot-password {
            font-size: 0.875rem;
            color: var(--primary);
            font-weight: 500;
            text-decoration: none;
            transition: color 0.15s ease;
        }

        .forgot-password:hover {
            color: var(--primary-dark);
            text-decoration: underline;
        }

        .auth-button {
            width: 100%;
            padding: 0.75rem 1.5rem;
            font-size: 0.875rem;
            font-weight: 500;
            color: var(--white);
            background-color: var(--primary);
            border: none;
            border-radius: var(--radius-md);
            cursor: pointer;
            transition: all 0.15s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            box-shadow: var(--shadow-sm);
        }

        .auth-button:hover {
            background-color: var(--primary-dark);
            transform: translateY(-1px);
            box-shadow: var(--shadow);
        }

        .auth-button:active {
            transform: translateY(0);
        }

        .auth-divider {
            display: flex;
            align-items: center;
            gap: 1rem;
            margin: 1rem 0;
        }

        .auth-divider::before,
        .auth-divider::after {
            content: '';
            flex: 1;
            height: 1px;
            background-color: var(--light-gray);
        }

        .auth-divider span {
            font-size: 0.875rem;
            color: var(--gray);
        }

        .social-login {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 1rem;
            margin-bottom: 1.5rem;
        }

        .social-button {
            padding: 0.5rem;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            font-size: 0.875rem;
            font-weight: 500;
            border: 1px solid var(--light-gray);
            border-radius: var(--radius-md);
            background-color: var(--white);
            color: var(--dark-gray);
            cursor: pointer;
            transition: all 0.15s ease;
        }

        .social-button:hover {
            background-color: var(--light);
        }

        .social-button i {
            font-size: 1rem;
        }

        .auth-footer {
            margin-top: 1.5rem;
            text-align: center;
            font-size: 0.875rem;
            color: var(--gray);
        }

        .auth-footer a {
            color: var(--primary);
            font-weight: 500;
            text-decoration: none;
            transition: color 0.15s ease;
        }

        .auth-footer a:hover {
            color: var(--primary-dark);
            text-decoration: underline;
        }

        .error-message {
            padding: 0.75rem 1rem;
            background-color: rgba(239, 68, 68, 0.1);
            color: var(--danger);
            font-size: 0.875rem;
            border-radius: var(--radius-md);
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            border-left: 3px solid var(--danger);
        }

        .error-message i {
            font-size: 1rem;
        }

        .auth-image {
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            position: relative;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 3rem;
            color: var(--white);
        }

        .auth-image::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-image: url('https://images.unsplash.com/photo-1551434678-e076c223a692?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=800&q=80');
            background-size: cover;
            background-position: center;
            opacity: 0.15;
        }

        .auth-image-content {
            position: relative;
            z-index: 1;
            max-width: 28rem;
        }

        .auth-image-content h2 {
            font-size: 1.875rem;
            font-weight: 700;
            line-height: 1.25;
            margin-bottom: 1.5rem;
        }

        .auth-image-content p {
            opacity: 0.9;
            margin-bottom: 2rem;
        }

        .features-list {
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        .feature-item {
            display: flex;
            align-items: flex-start;
            gap: 0.75rem;
        }

        .feature-item i {
            font-size: 1.25rem;
            color: var(--accent);
            margin-top: 0.125rem;
        }

        .feature-item div {
            flex: 1;
        }

        .feature-item h3 {
            font-size: 1rem;
            font-weight: 600;
            margin-bottom: 0.25rem;
        }

        .feature-item p {
            font-size: 0.875rem;
            opacity: 0.8;
            margin-bottom: 0;
        }

        @media (max-width: 1024px) {
            .auth-container {
                grid-template-columns: 1fr;
                max-width: 40rem;
            }

            .auth-image {
                display: none;
            }
        }

        @media (max-width: 640px) {
            .auth-section {
                padding: 1rem;
            }

            .auth-form-container {
                padding: 2.5rem 1.5rem;
            }

            .social-login {
                grid-template-columns: 1fr;
            }

            .auth-header h1 {
                font-size: 1.5rem;
            }
        }

        /* Animations */
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(1rem);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .auth-container {
            animation: fadeIn 0.5s ease-out;
        }

        .auth-header, .auth-form {
            animation: slideUp 0.5s ease-out;
        }

        .auth-header {
            animation-delay: 0.1s;
        }

        .auth-form {
            animation-delay: 0.2s;
        }
    </style>
</head>
<body>
    <main>
        <section class="auth-section">
            <div class="auth-container">
                <div class="auth-form-container">
                    <div class="auth-logo">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor">
                            <path fill-rule="evenodd" d="M9 4.5a.75.75 0 01.721.544l.813 2.846a3.75 3.75 0 002.576 2.576l2.846.813a.75.75 0 010 1.442l-2.846.813a3.75 3.75 0 00-2.576 2.576l-.813 2.846a.75.75 0 01-1.442 0l-.813-2.846a3.75 3.75 0 00-2.576-2.576l-2.846-.813a.75.75 0 010-1.442l2.846-.813A3.75 3.75 0 007.466 7.89l.813-2.846A.75.75 0 019 4.5zM18 1.5a.75.75 0 01.728.568l.258 1.036c.236.94.97 1.674 1.91 1.91l1.036.258a.75.75 0 010 1.456l-1.036.258c-.94.236-1.674.97-1.91 1.91l-.258 1.036a.75.75 0 01-1.456 0l-.258-1.036a2.625 2.625 0 00-1.91-1.91l-1.036-.258a.75.75 0 010-1.456l1.036-.258a2.625 2.625 0 001.91-1.91l.258-1.036A.75.75 0 0118 1.5zM16.5 15a.75.75 0 01.712.513l.394 1.183c.15.447.5.799.948.948l1.183.395a.75.75 0 010 1.422l-1.183.395c-.447.15-.799.5-.948.948l-.395 1.183a.75.75 0 01-1.422 0l-.395-1.183a1.5 1.5 0 00-.948-.948l-1.183-.395a.75.75 0 010-1.422l1.183-.395c.447-.15.799-.5.948-.948l.395-1.183A.75.75 0 0116.5 15z" clip-rule="evenodd" />
                        </svg>
                        <span>AI Builder Pro</span>
                    </div>
                    
                    <div class="auth-header">
                        <h1>Welcome back</h1>
                        <p>Sign in to your account to continue building amazing websites</p>
                    </div>

                    <?php if (isset($error)): ?>
                        <div class="error-message">
                            <i class="fas fa-exclamation-circle"></i>
                            <span><?php echo htmlspecialchars($error); ?></span>
                        </div>
                    <?php endif; ?>

                    <form method="POST" action="login.php" class="auth-form">
                        <input type="hidden" name="csrf_token" value="<?php echo $_SESSION['csrf_token']; ?>">
                        
                        <div class="form-group">
                            <label for="username">Username or Email</label>
                            <div class="input-wrapper">
                                <i class="fas fa-user"></i>
                                <input type="text" id="username" name="username" placeholder="Enter your username or email" required autofocus>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="password">Password</label>
                            <div class="input-wrapper">
                                <i class="fas fa-lock"></i>
                                <input type="password" id="password" name="password" placeholder="Enter your password" required>
                                <i class="fas fa-eye password-toggle" id="togglePassword"></i>
                            </div>
                        </div>
                        
                        <div class="auth-actions">
                            <div class="remember-me">
                                <input type="checkbox" id="remember" name="remember">
                                <label for="remember">Remember me</label>
                            </div>
                            <a href="forgot-password.php" class="forgot-password">Forgot password?</a>
                        </div>
                        
                        <button type="submit" class="auth-button">
                            <i class="fas fa-sign-in-alt"></i> Sign In
                        </button>
                        
                        <div class="auth-divider">
                            <span>OR</span>
                        </div>
                        
                        <div class="social-login">
                            <button type="button" class="social-button">
                                <i class="fab fa-google"></i> Google
                            </button>
                            <button type="button" class="social-button">
                                <i class="fab fa-microsoft"></i> Microsoft
                            </button>
                        </div>
                    </form>
                    
                    <div class="auth-footer">
                        Don't have an account? <a href="signup.php">Sign up</a>
                    </div>
                </div>
                
                <div class="auth-image">
                    <div class="auth-image-content">
                        <h2>Build stunning websites with AI</h2>
                        <p>Join thousands of professionals who are transforming their ideas into reality with our platform.</p>
                        
                        <div class="features-list">
                            <div class="feature-item">
                                <i class="fas fa-bolt"></i>
                                <div>
                                    <h3>AI-Powered Design</h3>
                                    <p>Generate beautiful designs in seconds with our advanced AI technology.</p>
                                </div>
                            </div>
                            <div class="feature-item">
                                <i class="fas fa-mobile-alt"></i>
                                <div>
                                    <h3>Fully Responsive</h3>
                                    <p>All websites automatically adapt to any screen size and device.</p>
                                </div>
                            </div>
                            <div class="feature-item">
                                <i class="fas fa-chart-line"></i>
                                <div>
                                    <h3>Performance Optimized</h3>
                                    <p>Lightning fast load times with our optimized code and hosting.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <script>
        // Toggle password visibility
        const togglePassword = document.querySelector('#togglePassword');
        const password = document.querySelector('#password');
        
        togglePassword.addEventListener('click', function() {
            const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
            password.setAttribute('type', type);
            this.classList.toggle('fa-eye-slash');
        });
        
        // Form validation
        const form = document.querySelector('.auth-form');
        form.addEventListener('submit', function(e) {
            const username = document.querySelector('#username').value.trim();
            const password = document.querySelector('#password').value.trim();
            
            if (!username || !password) {
                e.preventDefault();
                alert('Please fill in all fields');
            }
        });
    </script>
</body>
</html>

<?php require_once 'includes/footer.php'; ?>