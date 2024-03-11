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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="../css_god/details.css"/>
        <title>Profile</title>
    </head>
    <body>
        <jsp:include page="nav.jsp"></jsp:include>
        <div class="container" style="margin-top: 5%;">
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
                                                    <img src="uploads/${i.image}">
                                                    <div class="round">
                                                        <i class = "fa fa-camera" style = "color: #000;"></i>
                                                      </div>
                                                </div>
                                                <!-- Popup Form -->
                                                <div id="popupForm" class="popup-form">
                                                    <form action="UploadServlet" method="post" enctype="multipart/form-data" id="uploadForm" class="form-container">
                                                        <input type="file" name="file" accept="image/*">
                                                        <input type="hidden" name="userId" value="${param.userId}">
                                                        
                                                        <button type="submit" value="Upload" class="btn btn-primary">Save</button>
                                                        <button type="button" class="btn btn-secondary" onclick="closePopup()">Cancel</button>
                                                    </form>
                                                </div>
                                                
                                                <h5 class="user-name">${i.fullName}</h5>
                                                <h6 class="user-email">${i.email}</h6>
                                                <h6 class="user-email">${i.dob}</h6>
                                        </div>
                                </div>
                        </div>
                </div>
                                        <style>
                                            .user-avatar {
                                                position: relative;
                                                margin: auto;
                                            }
                                            .user-avatar .round{
                                              position: absolute;
                                              bottom: 0;
                                              right: 0;
                                              background: #cccccc;
                                              width: 32px;
                                              height: 32px;
                                              line-height: 33px;
                                              text-align: center;
                                              border-radius: 50%;
                                              overflow: hidden;
                                              margin-right: 60px; 
                                            }
                                            .popup-form {
                                                display: none;
                                                position: fixed;
                                                top: 50%;
                                                left: 50%;
                                                transform: translate(-50%, -50%);
                                                background-color: #fff;
                                                padding: 20px;
                                                border: 1px solid #ccc;
                                                z-index: 999;
                                            }

                                            .form-container {
                                                width: 300px;
                                            }

                                        </style>
                                        <script>
                                            // Function to show the popup form
                                                function showPopup() {
                                                    document.getElementById('popupForm').style.display = 'block';
                                                }

                                                // Function to close the popup form
                                                function closePopup() {
                                                    document.getElementById('popupForm').style.display = 'none';
                                                }

                                                // Event listener to show the popup form when the camera icon is clicked
                                                document.querySelector('.round').addEventListener('click', showPopup);
                                        </script>
            </c:if>
        </c:forEach>
        </div>
        <div class="col-xl-1 col-lg-1" style="margin-left:20% ">
        <div class="card h-100">
                <div class="card-body">
                    <form action="ProfileUpdateServlet" method="post"> 
                    <c:forEach var="i" items="${userAlg.allUser}">
                            <c:if test="${i.userID == param.userId}">
                                <div class="row gutters">
                                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                                <h6 class="mb-2 text-primary" style="color: #EE2E24 !important">Personal Details</h6>
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
                                                        <input type="date" class="form-control" id="eMail" name="dob"} placeholder="${i.dob}"> 
                                                </div>
                                        </div>
                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                <div class="form-group">
                                                        <label for="eMail">Your Point</label>
                                                        <input type="text" class="form-control" id="point" name="point" value="${i.point}" readonly=""}>
                                                </div>
                                        </div>
                                                <input name="userId" type="hidden" value="${i.userID}"/>
                                </div>           
                            </c:if>
                        </c:forEach>
                        <div class="row gutters">
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="text-right">
                                            <button type="submit" class="btn btn-primary" style="background-color: #EE2E24">Update</button>
                                            <button type="submit" class="btn btn-secondary" style="background-color: white;"><a href="changepassword.jsp?userId=${param.userId}" style="color: #EE2E24">Change Password</a></button>
                                        </div>
                                </div>
                        </div>
                        
                    </form>
                    
                        
                </div>
        </div>
        </div>
        </div>
</div>

        <jsp:include page="footer.jsp"></jsp:include>
    </body>
   
</html>
