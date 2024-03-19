
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
        <h2>Chúng tôi đã gửi OTP đến email của bạn, hãy kiểm tra trong hộp thư</h2>
        <label for="otp">OTP:</label>
        <input type="text" id="otp" name="otp" required>
        <input type="hidden" name="userId" value="${param.userId}">
        <input type="submit" value="Verify" style="background-color: #EE2E24; width: 20%">
    </form>
</body>
</html>
