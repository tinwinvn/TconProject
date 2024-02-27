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
            <h1>Danh sách các công viên yêu thích</h1>
            <table border="1">
                <thead>
                    <tr>
                        <th>Park ID</th>  
                        <th>Park</th>                 
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
                                </c:if>
                            </tr>
                        </c:if>
                    </c:forEach>
                </c:forEach>
            </tbody>
        </table>

        <table border="1">
            <thead>
                <tr>
                    <th>Game ID</th>  
                    <th>Game</th>                 
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
                                </c:if>
                            </tr>
                        </c:if>
                    </c:forEach>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
