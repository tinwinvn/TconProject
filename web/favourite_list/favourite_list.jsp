<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Danh sách yêu thích</title>
    </head>
    <body>
        <jsp:useBean id="afDAO" class="ModelDAO.AddFavouriteDAO"></jsp:useBean>
        <jsp:useBean id="pkDAO" class="ModelDAO.ParkDAO"></jsp:useBean>
        <jsp:useBean id="gmDAO" class="ModelDAO.GameDAO"></jsp:useBean>
        <nav class="d-flex justify-content-evenly align-items-center bg-white">
            <ul class="d-flex align-items-center mb-0" >
                <li><a href="../index.jsp" class="text-red p-2">Home</a></li>
                <li><a href="#" class="text-red p-2" onclick="showFavorites('parks')">Danh sách công viên yêu thích</a></li>
                <li><a href="#" class="text-red p-2" onclick="showFavorites('games')">Danh sách Trò chơi yêu thích</a></li>
            </ul>
            <div class="logo text-black p-2"></div>
        </nav>

            <div id="favoritesTable" style="margin-left: 22%">
                <table border="1" >
                    <thead>
                        <tr>
                            <th>Park ID</th>  
                            <th>Park</th>   
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>

                    <c:forEach var="aflist" items="${afDAO.allAddFavourite}">
                        <c:forEach var="parklist" items="${pkDAO.allPark}">
                            <c:if test="${sessionScope.acc.userID == aflist.userID}">
                                <tr>
                                    <c:if test="${aflist.favouriteItems == parklist.parkID}">
                                        <td>${aflist.favouriteItems}</td>    
                                        <td>${parklist.parkName}</td>
                                        <td> <!-- Thêm nút xóa -->
                                            <form action="../DeleteFavouriteServlet" method="POST">
                                                <input type="hidden" name="userID" value="${aflist.userID}">
                                                <input type="hidden" name="favouriteID" value="${aflist.favouriteID}">
                                                <button type="submit">Xóa</button>
                                            </form>
                                        </c:if>
                                </tr>
                            </c:if>
                        </c:forEach>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <div id="gamesTable" style="margin-left: 22%; display: none;">
            <table border="1" >
                <thead>
                    <tr>
                        <th>Game ID</th>  
                        <th>Game</th>   
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="aflist" items="${afDAO.allAddFavourite}">
                        <c:forEach var="gamelist" items="${gmDAO.allGame}">
                            <c:if test="${sessionScope.acc.userID == aflist.userID}">
                                <tr>
                                    <c:if test="${aflist.favouriteItems == gamelist.gameID}">
                                        <td>${aflist.favouriteItems}</td>    
                                        <td>${gamelist.gameName}</td>
                                        <td> <!-- Thêm nút xóa -->
                                            <form action="../DeleteFavouriteServlet" method="POST">
                                                <input type="hidden" name="userID" value="${aflist.userID}">
                                                <input type="hidden" name="favouriteID" value="${aflist.favouriteID}">
                                                <button type="submit">Xóa</button>
                                            </form>
                                        </td>
                                    </c:if>
                                </tr>
                            </c:if>
                        </c:forEach>
                    </c:forEach>
                </tbody>
            </table>
        </div>

    </body>
</html>

<style>
    #favoritesTable {
        display: none;
    }
</style>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        // Gọi hàm showFavorites với tham số 'parks' khi trang được tải
        showFavorites('parks');
    });

    function showFavorites(type) {
        var tableParks = document.getElementById("favoritesTable");
        var tableGames = document.getElementById("gamesTable");
        if (type === 'parks') {
            tableParks.style.display = "block";
            tableGames.style.display = "none";
        } else {
            tableParks.style.display = "none";
            tableGames.style.display = "block";
        }
        // Gửi yêu cầu AJAX tương ứng với loại (parks hoặc games)
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                if (type === 'parks') {
                    tableParks.innerHTML = this.responseText;
                } else {
                    tableGames.innerHTML = this.responseText;
                }
            }
        };
        xhttp.open("GET", "../GetFavoritesServlet?type=" + type, true);
        xhttp.send();
    }
</script>


<style>
    /* Style for the body */
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f4f4;
    }

    /* Style for the h1 */
    h1 {
        color: #333;
        text-align: center; /* Center the heading */
    }

    /* Style for the container */
    .container {
        width: 100%;
        display: flex;
        justify-content: center; /* Center the contents horizontally */
    }

    /* Style for the table */
    table {
        width: 70%; /* Set table width to 70% */
        border-collapse: collapse;
        margin-top: 20px; /* Add some space on top */
    }

    table th, table td {
        padding: 10px;
        text-align: left;
    }

    table th {
        background-color: #007bff;
        color: #fff;
    }

    table tbody tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    table tbody tr:hover {
        background-color: #ddd;
    }

    /* Style for the form and button */
    form {
        display: inline-block;
    }

    button {
        background-color: #dc3545;
        color: #fff;
        border: none;
        padding: 8px 16px;
        cursor: pointer;
        border-radius: 4px;
    }

    button:hover {
        background-color: #c82333;
    }
</style>