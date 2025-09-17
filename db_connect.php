<?php
// db_connect.php: Enhanced database connection with error handling
$host = 'localhost';
$db   = 'chatweb';
$user = 'root';
$pass = '';
$charset = 'utf8mb4';

$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES   => false,
    PDO::ATTR_PERSISTENT         => true // Optional: for better performance
];

try {
    $pdo = new PDO($dsn, $user, $pass, $options);
    
    // Test connection immediately
    $pdo->query("SELECT 1");
} catch (PDOException $e) {
    error_log("Database connection error: " . $e->getMessage());
    die(json_encode([
        'status' => 'error',
        'message' => 'Database connection failed. Please try again later.'
    ]));
}
?>