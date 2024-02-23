<%-- 
    Document   : profile
    Created on : Jan 15, 2024, 4:25:13 PM
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
        <title>Profile</title>
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
                                                <!-- <form action="UpdateAvatarServlet" id="frmUploadPhoto" enctype="multipart/form-data" method="post">
                                                    <i class="material-icons">&#xe439;</i>
                                                    <input class="input-cover-photo" type="file" id="userCoverPhoto" name="userCoverPhoto"/>
                                                    <button type="submit" class="btn btn-primary">Update</button>
                                                </form>
                                                -->
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
                    <form action="ProfileUpdateServlet" method="post"> 
                    <c:forEach var="i" items="${userAlg.allUser}">
                            <c:if test="${i.userID == param.userId}">
                                <div class="row gutters">
                                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                                <h6 class="mb-2 text-primary">Personal Details</h6>
                                        </div>
                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                <div class="form-group">
                                                        <label for="fullName">Full Name</label>
                                                        <input type="text" class="form-control" id="fullName" name="name" placeholder="${i.fullName}">
                                                </div>
                                        </div>               
                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                <div class="form-group">
                                                        <label for="phone">Phone</label>
                                                        <input type="text" class="form-control" id="phone" name="phone" placeholder="${i.phone}">
                                                </div>
                                        </div>
                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                <div class="form-group">
                                                        <label for="eMail">Date of Birth</label>
                                                        <input type="date" class="form-control" id="eMail" name="dob"}>
                                                </div>
                                        </div>
                                                <input name="userId" type="hidden" value="${i.userID}"/>
                                </div>           
                            </c:if>
                        </c:forEach>
                        <div class="row gutters">
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="text-right">
                                            <button type="submit" class="btn btn-primary">Update</button>
                                            <button type="submit" class="btn btn-secondary"><a href="changepassword.jsp">Change Password</a></button>
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
