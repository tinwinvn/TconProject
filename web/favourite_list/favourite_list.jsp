<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Danh sách yêu thích</title>
    </head>
    <body>
        <h1>Danh sách các công viên yêu thích</h1>
        <jsp:useBean id="afDAO" class="ModelDAO.AddFavouriteDAO"></jsp:useBean>
            <c:forEach var="aflist" items="${afDAO.allAddFavourite}">
                <c:if test="${sessionScope.acc.userID == aflist.userID}">
                    ${aflist.favouriteItems}
                </c:if>
            </c:forEach>
    </body>
</html>
