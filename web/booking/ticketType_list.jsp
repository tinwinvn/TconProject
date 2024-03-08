<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Danh sách loại vé</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha384-dfNlPb3SjOOElnFh2PI0tJ0JWw4+x1Ec/0l2fcG6E2tS9MguqnUqsC2ZqTjp1fG" crossorigin="anonymous">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="../css_god/details.css"/>
    </head>
    <body>

        <jsp:include page="../nav.jsp"></jsp:include>

        <div class="bg-red" style="height: 0.5vh; margin-bottom: 15px"></div>

        <jsp:useBean id="ttDAO" class="ModelDAO.TicketTypeDAO"></jsp:useBean>       
            <div class="container d-flex justify-content-center align-items-center" style="margin-top: 5vh">
                <div class="row" >

                <c:forEach var="ttL" items="${ttDAO.allTicketType}">
                    <c:if test="${param.parkID == ttL.parkID}">
                        <div class="col-md-6 mb-3" style="">
                            <div class="card" style="width: 15rem; height: 100%" >
                                <img class="card-img-top" src="../images/a.jpg" alt="">
                                <div class="card-body text-center d-flex flex-column align-items-center" style="background-color:white; color: black">
                                    <h3>${ttL.typeName}</h3>
                                    <p>${ttL.description}</p>
                                    <span class="price">Giá: ${ttL.price} VNĐ</span>
                                    <form action="../AddToCartServlet" method="GET">
                                        <input type="hidden" name="ticketTypeID" value="${ttL.ticketTypeID}">
                                        <input type="number" name="quantity" min="1" value="1">
                                        <input type="hidden" name="price" value="${ttL.price}">
                                        <input type="hidden" name="parkID" value="${param.parkID}">
                                        <input type="hidden" name="orderID" value="${param.orderID}">
                                        <input type="hidden" name="transactionCode" value="${param.transactionCode}">
                                        <button type="submit" style="margin-top: 3%; background-color: #EE2E24; color: white; border-color: #EE2E24;" class="btn btn-primary">Thêm vào giỏ hàng</button>

                                    </form>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>

            </div>
        </div>

        <div class="container text-center">
            <a href="cart.jsp?orderID=${param.orderID}&parkID=${param.parkID}" class="btn-cart"><button type="submit" style="margin-top: 3%; background-color: #EE2E24; color: white; border-color: #EE2E24;" class="btn btn-primary">Xem giỏ hàng</button></a>
        </div>

 


  





<jsp:include page="../footer.jsp"></jsp:include>
    </body>
</html>
