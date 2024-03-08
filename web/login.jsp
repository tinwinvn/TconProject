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
                            <div class="brand-logo">
                                <a href="index.jsp"><img src="images\logo.png" width="200" alt="brand-logo"></a>
                            </div>
                            <!-- ./brand-logo -->
                            <p>Login using social media to get quick access</p>
                            <!-- social login buttons start -->
                            <div class="row social-buttons">
                                <div class="col-xs-4 col-sm-4 col-md-12">
                                    <a href="#" class="btn btn-block btn-google">
                                        <i class="fa fa-google-plus"></i> <span class="hidden-xs hidden-sm">Sign in with google</span>
                                    </a>
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
                                <h3 class="auth-title">Login to your account</h3>
                                <p>Don’t have an account? <a class="lnk-toggler" data-panel=".panel-signup" href="#">Sign Up Free!</a></p>
                            </div>
                            <c:set var="cookie" value="${pageContext.request.cookies}"></c:set>
                            <div class="row">
                                <div class="col-xs-12 col-sm-12">
                                    <form name="loginForm" class="loginForm" action="LoginServlet" method="POST">
                                        <div class="form-group">
                                            <input type="email" class="form-control email" value="${cookie.userC.value}" name="username" placeholder="Email address" required="">
                                        </div>
                                        <div class="form-group">
                                            <div class="pwdMask">
                                                <input type="password" class="form-control password" value="${cookie.passC.value}" name="password" placeholder="Password" required="">
                                                <span class="fa fa-eye-slash pwd-toggle"></span>
                                            </div>
                                        </div>
                                        <!-- start remember-row -->
                                        <div class="row remember-row">
                                            <div class="col-xs-6 col-sm-6">
                                                <label class="checkbox text-left">
                                                    <input type="checkbox" value="remember-me" name="remember" ${(cookie.remC!=null?'checked':'')}>
                                                    <span class="label-text">Remember me</span>
                                                </label>
                                            </div>
                                            <div class="col-xs-6 col-sm-6">
                                                <p class="forgotPwd">
                                                    <a class="lnk-toggler" data-panel=".panel-forgot">Forgot password?</a>
                                                </p>
                                            </div>
                                        </div>
                                        <!-- ./remember-row -->
                                        <div class="form-group">
                                                <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
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
                                        <h3 class="auth-title">Sign up for free!</h3>
                                    </div>
                                    <form name="signupForm" class="signupForm" action="SignUpServlet" method="POST">
                                        <div class="form-group">
                                            <input type="email" class="form-control" name="email" placeholder="Email address" required="">
                                        </div>
                                        <div class="form-group">
                                            <div class="pwdMask">
                                                <input type="password" class="form-control" name="password" placeholder="Password">
                                                <span class="fa fa-eye-slash pwd-toggle"></span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="pwdMask">
                                                <input type="password" class="form-control" name="repassword" placeholder="Confirm Password">
                                                <span class="fa fa-eye-slash pwd-toggle"></span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <p class="term-policy text-muted small">I agree to the <a href="#">privacy policy</a> and <a href="#">terms of service</a>.</p>
                                        </div>
                                        <div class="form-group">
                                            <button class="btn btn-lg btn-primary btn-block" type="submit">Sign up with email</button>
                                        </div>
                                    </form>
                                    <a class="lnk-toggler" data-panel=".panel-login" href="#">Already have an account?</a>
                                </div>
                            </div>
                        </div>
                        <!-- ./panel-signup -->
                        <!-- panel-forget start -->
                        <div class="authfy-panel panel-forgot">
                            <div class="row">
                                <div class="col-xs-12 col-sm-12">
                                    <div class="authfy-heading">
                                        <h3 class="auth-title">Recover your password</h3>
                                        <p>Fill in your e-mail address below and we will send you an email with further instructions.</p>
                                    </div>
                                    <form name="forgetForm" class="forgetForm" action="SendEmailServlet" method="POST">
                                        <div class="form-group">
                                            <input type="email" class="form-control" name="email" placeholder="Email address" required="">
                                        </div>
                                        <div class="form-group">
            
                                            <button class="btn btn-lg btn-primary btn-block" type="submit">Recover your password</button>
                                            
                                        </div>
                                        <div class="form-group">
                                            <a class="lnk-toggler" data-panel=".panel-login" href="#">Already have an account?</a>
                                        </div>
                                        <div class="form-group">
                                            <a class="lnk-toggler" data-panel=".panel-signup" href="#">Don’t have an account?</a>
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
    <script src="js\jquery-2.2.4.min.js"></script>

    <!-- for Bootstrap js -->
    <script src="js\bootstrap.min.js"></script>

    <!-- Custom js-->
    <script src="js\custom.js"></script>

</body>

</html>
