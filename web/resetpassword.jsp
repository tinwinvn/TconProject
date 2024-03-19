
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Reset Password</title>
    <link rel="stylesheet" href="css/resetpassword-style.css">
</head>
<body>
    <form action="ResetPasswordServlet" method="post">
        <h2>Đặt lại mật khẩu</h2>
        <label for="newPassword" style="">Mật khẩu mới:</label>
        <input type="password" id="newPassword" name="newPassword" required>
        <label for="confirmPassword">Nhập lại mật khẩu mới:</label>
        <input type="password" id="confirmPassword" name="confirmPassword" required>
        <input type="hidden" name="userId" value="${param.userId}">
        <input type="submit" value="Xác nhận">
    </form>
</body>
</html>
