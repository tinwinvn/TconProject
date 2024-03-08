<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Danh sách yêu thích</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="../css_god/details.css"/>
    </head>
    <body>
        <jsp:include page="../nav.jsp"></jsp:include>
        
        
        <jsp:useBean id="afDAO" class="ModelDAO.AddFavouriteDAO"></jsp:useBean>
        <jsp:useBean id="pkDAO" class="ModelDAO.ParkDAO"></jsp:useBean>
        <jsp:useBean id="gmDAO" class="ModelDAO.GameDAO"></jsp:useBean>
            <h1>Danh sách các công viên yêu thích</h1>
            
            
            
            <table class="table">
  <thead>
    <tr>
      <th scope="col">STT</th>
      <th scope="col">Park ID</th>
      <th scope="col">Park</th>
      <th scope="col">Action</th>
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
            
            
            
            
            
            
            
<!--            
            
            
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
                                    <td>  Thêm nút xóa 
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
            -->
            
            
              <footer style="background-color: white; height: 30%">
            <jsp:include page="../footer.jsp"></jsp:include>
        </footer>
    </body>
</html>


