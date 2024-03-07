<%-- 
    Document   : changepassword
    Created on : Feb 23, 2024, 2:48:07 AM
    Author     : tbinh
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/profile.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
        <div class="row gutters">
        <div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
        <jsp:useBean id="userAlg" class="ModelDAO.UserDAO"></jsp:useBean>
        <c:forEach var="i" items="${userAlg.allUser}">
            <c:if test="${i.userID == param.userId}">
                <div class="card h-100">
                        <div class="card-body">
                                <div class="account-settings">
                                        <div class="user-profile">
                                                 <div class="user-avatar">
                                                    <img src="../images/avatar.jpg">
                                                </div>
                                               
                                                <h5 class="user-name">${i.fullName}</h5>
                                                <h6 class="user-email">${i.email}</h6>                  
                                        </div>
                                </div>
                        </div>
                </div>
            </c:if>
        </c:forEach>
        </div>
        <div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
        <div class="card h-100">
                <div class="card-body">
                    
                    <form action="ChangePasswordServlet" method="post">
                        <div class="row gutters">
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                        <h6 class="mt-3 mb-2 text-primary">Change your password</h6>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                                <label for="oldPass">Old password</label>
                                                <input name="oldpassword" type="password" class="form-control" id="oldPass" placeholder="Enter old password">
                                        </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                                <label for="newPass">New password</label>
                                                <input name="newpassword" type="password" class="form-control" id="newPass" placeholder="Enter new password">
                                        </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                                <label for="newPassagain">New password again</label>
                                                <input name="confirmpassword" type="password" class="form-control" id="newPassagain" placeholder="Enter new password again">
                                        </div>
                                </div>
                                <input name="userId" type="hidden" value="${param.userId}">
                        </div>
                        <div class="row gutters">
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="text-right">
                                            <button type="submit" class="btn btn-primary">Update</button>
                                        </div>
                                </div>
                        </div>
                        
                </form>
                        
                </div>
        </div>
        </div>
        </div>
</div>

    </body>
</html>