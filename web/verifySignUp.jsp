<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Verify OTP</title>
    <link rel="stylesheet" href="./css/verify-style.css">
</head>
<body>   
    <form action="VerifyOTPServlet" method="post">
        <h2>Enter OTP to Sign Up</h2>
        <label for="otp">OTP:</label>
        <input type="text" id="otp" name="otp" required>
        <input type="hidden" name="email" value="${param.email}">
        <input type="hidden" name="password" value="${param.password}">
        <p>${param.password}</p>
        <input type="submit" value="Verify">
    </form>
</body>
</html>