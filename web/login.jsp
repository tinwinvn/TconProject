<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
﻿<!DOCTYPE html>
<html lang="vi">

<head>
    <!-- Basic Page Needs
  ================================================== -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Mobile Specific Metas
  ================================================== -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- For Search Engine Meta Data  -->
    <meta name="description" content="Login Form design by DevForum">
    <meta name="keywords" content="Login Form">
    <meta name="author" content="devforum.info">

    <title>Login Page</title>

    <!-- Favicon -->
    <link rel="shortcut icon" type="image/icon" href="images\android-icon-36x36.png">
    <link rel="icon" type="image/png" sizes="32x32" href="images\android-icon-36x36.png">
    <link rel="icon" type="image/png" sizes="48x48" href="images\android-icon-48x48.png">
    <link rel="icon" type="image/png" sizes="72x72" href="images\android-icon-72x72.png">

    <!-- Main structure css file -->
    <link rel="stylesheet" href="css\login-style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />

</head>

<body>
    <jsp:useBean id="userDAO" class="ModelDAO.UserDAO"></jsp:useBean>
    <!-- Start Preloader -->
    <div id="preload-block">
        <div class="square-block"></div>
    </div>
    <!-- Preloader End -->

    <div class="container-fluid">
        <div class="row">
            <div class="authfy-container col-xs-12 col-sm-10 col-md-8 col-lg-6 col-sm-offset-1 col-md-offset-2 col-lg-offset-3">
                <div class="col-sm-5 authfy-panel-left">
                    <div class="brand-col">
                        <div class="headline">
                            <!-- brand-logo start -->
                            <div class="brand-logo" style="text-align: center;">
    <a href="index.jsp"><img src="images/logo.jpg" width="200" alt="brand-logo"></a>
</div>
                            <!-- ./brand-logo -->
                            <p></p>
                            <!-- social login buttons start -->
                            <div class="row social-buttons">
                                <div class="col-xs-4 col-sm-4 col-md-12">
                                </div>
                            </div>
                            <!-- ./social-buttons -->
                        </div>
                    </div>
                </div>
                <div class="col-sm-7 authfy-panel-right">
                    <!-- authfy-login start -->
                    <div class="authfy-login">
                        <!-- panel-login start -->
                        <div class="authfy-panel panel-login text-center active">
                            <div class="authfy-heading">
                                <h3 class="auth-title">Đăng nhập vào tài khoản của bạn  </h3>
                                <p>Không có tài khoản? <a class="lnk-toggler" data-panel=".panel-signup" href="#" style="color: #ee2e24">Đăng ký ngay!</a></p>
                            </div>
                            <c:set var="cookie" value="${pageContext.request.cookies}"></c:set>
                            <div class="row">
                                <div class="col-xs-12 col-sm-12">
                                    <form name="loginForm" class="loginForm" action="LoginServlet" method="POST">
                                        <div class="form-group">
                                            <input type="email" class="form-control email" value="${cookie.userC.value}" name="username" placeholder="Địa chỉ email" required="">
                                        </div>
                                        <div class="form-group">
                                            <div class="pwdMask">
                                                <input type="password" class="form-control password" value="${cookie.passC.value}" name="password" placeholder="Mật khẩu" required="">
                                                <span class="fa fa-eye-slash pwd-toggle"></span>
                                            </div>
                                        </div>
                                        <!-- start remember-row -->
                                        <div class="row remember-row">
                                            <div class="col-xs-6 col-sm-6">
                                                <label class="checkbox text-left">
                                                    <input type="checkbox" value="remember-me" name="remember" ${(cookie.remC!=null?'checked':'')}>
                                                    <span class="label-text" >Nhớ mật khẩu</span>
                                                </label>
                                            </div>
                                            <div class="col-xs-6 col-sm-6">
                                                <p class="forgotPwd">
                                                    <a class="lnk-toggler" data-panel=".panel-forgot" style="color: #ee2e24">Quên mật khẩu ?</a>
                                                </p>
                                            </div>
                                        </div>
                                        <!-- ./remember-row -->
                                        <div class="form-group">
                                                <button class="btn btn-lg btn-primary btn-block" type="submit" style="background-color: #ee2e24; border-color: #ee2e24">Đăng nhập</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!-- ./panel-login -->
                        <!-- panel-sign up start -->
                        <div class="authfy-panel panel-signup text-center">
                            <div class="row">
                                <div class="col-xs-12 col-sm-12">
                                    <div class="authfy-heading">
                                        <h3 class="auth-title">Đăng ký miễn phí!</h3>
                                    </div>
                                    <form name="signupForm" class="signupForm" id="signupForm" action="SignUpServlet" method="POST">
                                        <div class="form-group">
                                            <input type="email" class="form-control" name="email" placeholder="Địa chỉ email" required>
                                        </div>
                                        <div class="form-group">
                                            <div class="pwdMask">
                                                <input type="password" class="form-control" name="password" placeholder="Mật khẩu" required="">
                                                <span class="fa fa-eye-slash pwd-toggle"></span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="pwdMask">
                                                <input type="password" class="form-control" name="repassword" placeholder="Nhập lại mật khẩu" required="">
                                                <span class="fa fa-eye-slash pwd-toggle"></span>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group" style="display: flex; align-items: center">
                                                <input style="margin-bottom: 4%" type="checkbox" value="accept" name="acceptance" id="acceptCheckbox" style="">
                                                <p class="term-policy text-muted small" style="margin-left: 12%">Tôi đồng ý với <a href="#" style="color: #ee2e24">chính sách bảo mật</a> và <a href="#" style="color: #ee2e24">điều khoản dịch vụ</a>.</p>
                                        </div>
                                        <div class="form-group">
                                            <button class="btn btn-lg btn-primary btn-block" type="button" onclick="submitForm()" style="background-color: #ee2e24; border-color: #ee2e24">Đăng ký với email</button>
                                        </div>
                                    </form>
                                    <a class="lnk-toggler" data-panel=".panel-login" href="#" style="color: #ee2e24">Bạn đã có tài khoản?</a>
                                </div>
                            </div>
                        </div>
                        <!-- ./panel-signup -->
                        <!-- panel-forget start -->
                        <div class="authfy-panel panel-forgot">
                            <div class="row">
                                <div class="col-xs-12 col-sm-12">
                                    <div class="authfy-heading">
                                        <h3 class="auth-title" >Khôi phục mật khẩu của bạn</h3>
                                        <p>Nhập vào địa chỉ email của bạn ở bên dưới, chúng tôi sẽ gửi cho bạn mã OTP để lấy lại mật khẩu.</p>
                                    </div>
                                    <form name="forgetForm" class="forgetForm" action="SendEmailServlet" method="POST">
                                        <div class="form-group">
                                            <input type="email" class="form-control" name="email" placeholder="Địa chỉ email" required="">
                                        </div>
                                        <div class="form-group">
            
                                            <button class="btn btn-lg btn-primary btn-block" type="submit" style="background-color: #ee2e24; border-color: #ee2e24">Khôi phục mật khẩu</button>
                                            
                                        </div>
                                        <div class="form-group">
                                            <a class="lnk-toggler" data-panel=".panel-login" href="#" style="color: #ee2e24">Bạn đã có tài khoản?</a>
                                        </div>
                                        <div class="form-group">
                                            <a class="lnk-toggler" data-panel=".panel-signup" href="#" style="color: #ee2e24">Bạn không có tài khoản?</a>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!-- ./panel-forgot -->
                    </div>
                    <!-- ./authfy-login -->
                </div>
            </div>
        </div>
        <!-- ./row -->
    </div>
    <!-- ./container -->

    <!-- Javascript Files -->

    <!-- initialize jQuery Library -->
    
    

    <script>
    function submitForm() {
        var checkbox = document.getElementById("acceptCheckbox");
        var email = document.forms["signupForm"]["email"].value;
        var password = document.forms["signupForm"]["password"].value;
        var repassword = document.forms["signupForm"]["repassword"].value;
        var acceptance = document.forms["signupForm"]["acceptance"].checked;
       if (email == null || email === "") {
        alert("Địa chỉ email không được để trống");
        return false;
    } else if (password.length < 6) {
        alert("Mật khẩu phải có ít nhất từ 8 đến 32 ký tự.");
        return false;
    } else if (password !== repassword) {
        alert("Mật khẩu nhập lại không khớp.");
        return false;
    } else if (!acceptance) {
        alert("Bạn phải đồng ý với chính sách bảo mật và điều khoản dịch vụ.");
        return false;
    } 
    // If all validations pass, you can submit the form
    document.getElementById("signupForm").submit();
    }
    </script>
    <script src="js\jquery-2.2.4.min.js"></script>

    <!-- for Bootstrap js -->
    <script src="js\bootstrap.min.js"></script>

    <!-- Custom js-->
    <script src="js\custom.js"></script>

</body>

</html>
