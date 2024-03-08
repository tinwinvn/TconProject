<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Giỏ hàng</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="../css_god/details.css"/>
    </head>






    <body>
        <jsp:include page="../nav.jsp"></jsp:include>
        <div class="logo"><h1>Giỏ hàng</h1></div>
        <nav>
            <ul>
                <li><a href="../index.jsp">Home</a></li>
                <li><a href="ticketType_list.jsp?parkID=${param.parkID}&transactionCode=${param.transactionCode}">Add Cart</a></li>
            </ul>
        </nav>


        <jsp:useBean id="ttDAO" class="ModelDAO.TicketTypeDAO"></jsp:useBean>
        <jsp:useBean id="otDAO" class="ModelDAO.OrderDetailDAO"></jsp:useBean>
        <jsp:useBean id="odDAO" class="ModelDAO.OrderDAO"></jsp:useBean>



            <div class="container d-flex justify-content-center align-items-center">
                <div class="row" >
                <c:forEach var="item" items="${sessionScope.cart}">
                    <c:set var="ticketType" value="${ttDAO.getTicketTypeByID(item.key)}"></c:set>
                    <c:set var="ticketTypeName" value="${ticketType.typeName}" />
                    <c:set var="quantity" value="${item.value.quantity}" />
                    <c:set var="price" value="${ticketType.price}"></c:set>
                        <li class="cart-item">
                            <h3>${ticketTypeName}</h3>
                        <p>Số lượng: ${quantity}</p>
                        <p>Giá: ${price * quantity} VNĐ</p>
                        <form action="../DeleteCartServlet" method="POST">                              
                            <input type="hidden" name="ticketType" value="${item.key}">
                            <input type="hidden" name="parkID" value="${param.parkID}">
                            <input type="hidden" name="transactionCode" value="${param.transactionCode}">
                            <button type="submit">Xóa</button>
                        </form>
                    </li>
                    <c:set var="totalPrice" value="${totalPrice + price * quantity}"></c:set>
                </c:forEach>         
                <c:if test="${empty sessionScope.cart}">
                    <p class="empty-cart-message">Giỏ hàng trống</p>
                </c:if>
            </ul>
            <c:if test="${not empty sessionScope.cart}">
                <c:if test="${empty param.transactionCode}">
                    <form action="../PaymentServlet" method="post">
                        <input type="date" id="experationDate" name="experationDate" required="">
                        <input type="hidden" name="totalPrice" value="${totalPrice}">
                        <input type="hidden" name="orderID" value="${param.orderID}">
                        <button type="submit" class="payment-link">Thanh Toán</button>
                    </form>  
                </c:if>
                <c:if test="${not empty param.transactionCode}">
                    <form action="../ConfirmChangeTicketServlet" method="get">
                        <input type="hidden" name="senderID" value="${sessionScope.acc.userID}">
                        <input type="hidden" name="transactionCode" value="${param.transactionCode}">
                        <button type="submit" class="payment-link">Đổi vé</button>
                    </form>                  
                </c:if>
            </c:if>
        </main>
        <jsp:include page="../footer.jsp"></jsp:include>
    </body>
</html>
