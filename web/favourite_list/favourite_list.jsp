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
            <h1>Danh sách các công viên yêu thích</h1>
            <div style="margin-left: 22%">
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
    </body>
</html>


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