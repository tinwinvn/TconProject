<%-- 
    Document   : park_management
    Created on : Mar 18, 2024, 5:37:55 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <!-- My CSS -->
        <link rel="stylesheet" href="admin_style.css">
        <title>Game Management</title>
    </head>

    <style>
        .container {
            display: flex;
            flex-wrap: wrap;
        }

        /* CSS để ẩn form ban đầu */
        .form-container {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.4);
            padding-top: 60px; /* Căn giữa form */
        }

        .form-container form {
            background-color: #fefefe;
            margin: 5% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
        }

        .form-container form .form-group {
            margin-bottom: 20px;
        }
    </style>
    <body>
        <jsp:include page="admin_nav.jsp"></jsp:include>
        <jsp:useBean id="gameDAO" class="ModelDAO.GameDAO"></jsp:useBean>
        <jsp:useBean id="parkDAO" class="ModelDAO.ParkDAO"></jsp:useBean>
        <c:set var="parkID" value="${parkDAO.getParkIDByUserID(sessionScope.acc.userID)}"></c:set>

            <div class="head-title">
                <div class="left">
                    <h1>Dashboard</h1>
                    <ul class="breadcrumb">
                        <li>
                            <a href="#">Dashboard</a>
                        </li>
                        <li><i class='bx bx-chevron-right' ></i></li>
                        <li>
                            <a class="active" href="../index.jsp">Quản lý trò chơi</a>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- Add new Game -->
            <button id="openAddButton" style="background-color: #007bff; color: #fff; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer; margin-left: 7%;">Thêm mới</button>
            <div  class="container" style="margin-top : 5%; margin-left: 5%;">
            <c:forEach var="game" items="${gameDAO.allGame}" varStatus="loop">
                <c:if test="${game.parkID == parkID}">
                    <div class="card" style="width: 18rem; margin-bottom: 2% ; margin-right: 2%">
                        <img class="card-img-top" src="../${game.image}" alt="Card image cap" style="height: 250px">
                        <div class="card-body">
                            <h5 class="card-title" style="height: 50px">${game.gameName}</h5>
                            <p class="card-text" style="height: 100px; overflow-y: auto">${game.gameDescription}</p>
                        </div>  
                        <div class="card-body">
                            <button id="openFormButton_${loop.index}" style="background-color: #007bff; color: #fff; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;">Cập nhật</button>
                            <button id="openDeleteButton_${loop.index}" style="background-color: #007bff; color: #fff; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;">Xóa</button>
                        </div>
                    </div>
                    <div id="myForm_${loop.index}" class="form-container" style="left: 15% !important; width: 80%;">
                        <form action="../UpdateGameServlet" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="parkID" value="${parkID}">
                            <input type="hidden" name="gameID" value="${game.gameID}">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Tên Trò chơi</label>
                                <input type="text" name="gameName" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="${game.gameName}">
                            </div>
                            <div class="form-group">
                                <label for="exampleFormControlTextarea1">Mô tả</label>
                                <textarea class="form-control" name="description" id="exampleFormControlTextarea1" rows="7">${game.gameDescription}</textarea>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputFile">Ảnh Đại diện</label>
                                <img id="previewImage" src="../${game.image}" alt="Image" style="max-width: 100px; max-height: 100px;">
                                <input type="file" name="image" class="form-control-file" id="fileUpload" aria-describedby="fileHelp" >
                                <small id="fileHelp" class="form-text text-muted">Vui lòng tải lên một ảnh đại diện cho trò chơi của bạn.</small>
                            </div>
                                <button class="btn btn-primary" onclick="updateGame()">Cập nhật</button>
                                <button type="button" id="closeFormButton_${loop.index}" class="btn btn-primary">Đóng</button>
                        </form>
                    </div>

                    <div id="deleteFormContainer_${loop.index}" class="form-container" style="left: 20% !important; width: 80%;">
                        <form id="deleteForm_${loop.index}" action="../DeleteGameServlet" method="post">
                            <input type="hidden" name="gameID" value="${game.gameID}">
                            <p>Bạn có muốn xóa trò chơi "${game.gameName}" không?</p>
                            <button type="submit" class="btn btn-danger">Xác nhận</button>
                            <button type="button" id="closeDeleteButton_${loop.index}" class="btn btn-secondary">Hủy</button>
                        </form>
                    </div> 
                </c:if>       
            </c:forEach>
        </div>
            
            
        <!-- form Add New Game -->    
        <div id="myAddForm" class="form-container" style="left: 15% !important; width: 80%;">
            <form action="../AddNewGameServlet" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <input type="hidden" name="parkID" value="${parkID}">
                    <label for="exampleInputEmail1">Tên Trò chơi</label>
                    <input type="text" name="gameName" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                </div>
                <div class="form-group">
                    <label for="exampleFormControlTextarea1">Mô tả</label>
                    <textarea class="form-control" name="description" id="exampleFormControlTextarea1" rows="7"></textarea>
                </div>
                <div class="form-group">
                    <label for="exampleInputFile">Ảnh Đại diện</label>
                    <input type="file" name="image" class="form-control-file" id="exampleInputFile" aria-describedby="fileHelp" >
                    <small id="fileHelp" class="form-text text-muted">Vui lòng tải lên một ảnh đại diện cho trò chơi của bạn.</small>
                </div>
                <button type="submit" class="btn btn-primary">Thêm mới</button>
                <button id="closeFormButton" class="btn btn-primary">Đóng</button>
            </form>
        </div>
    </body>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var formContainers = document.querySelectorAll('[id^="myForm_"]');
            var openFormButtons = document.querySelectorAll('[id^="openFormButton_"]');
            var closeFormButtons = document.querySelectorAll('[id^="closeFormButton_"]');
            var deleteFormContainers = document.querySelectorAll('[id^="deleteFormContainer_"]');
            var openDeleteButtons = document.querySelectorAll('[id^="openDeleteButton_"]');
            var closeDeleteButtons = document.querySelectorAll('[id^="closeDeleteButton_"]');
            openFormButtons.forEach(function (openFormButton, index) {
                var formContainer = formContainers[index];
                console.log(formContainer);
                openFormButton.onclick = function () {
                    formContainer.style.display = "block";
                };
            });

            closeFormButtons.forEach(function (closeFormButton, index) {
                var formContainer = formContainers[index];
                closeFormButton.onclick = function () {
                    formContainer.style.display = "none";
                };
            });
            openDeleteButtons.forEach(function (openDeleteButton, index) {
                var deleteFormContainer = deleteFormContainers[index];
                openDeleteButton.onclick = function () {
                    deleteFormContainer.style.display = "block";
                };
            });

            closeDeleteButtons.forEach(function (closeDeleteButton, index) {
                var deleteFormContainer = deleteFormContainers[index];
                closeDeleteButton.onclick = function () {
                    deleteFormContainer.style.display = "none";
                };
            });

        });
        document.addEventListener("DOMContentLoaded", function () {
            var openAddButton = document.getElementById("openAddButton");
            var formAddContainer = document.getElementById("myAddForm");

            openAddButton.onclick = function () {
                formAddContainer.style.display = "block";
            };

            var closeAddButton = document.getElementById("closeAddButton");
            closeAddButton.onclick = function () {
                formAddContainer.style.display = "none";
            };
        });      
    </script>
</html>
