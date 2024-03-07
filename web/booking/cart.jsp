<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Giỏ hàng</title>
        <link rel="stylesheet" href="style.css">
        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f8f9fa;
            }

            header {
                background-color: #343a40;
                color: #ffffff;
                padding: 20px;
                text-align: center;
            }

            main {
                display: flex;
                justify-content: center;
                align-items: center;
                flex-direction: column;
                padding: 20px;
            }

            .cart-list {
                list-style: none;
                padding: 0;
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
            }

            .cart-item {
                background-color: #ffffff;
                border: 1px solid #dee2e6;
                border-radius: 8px;
                margin: 10px;
                padding: 20px;
                max-width: 300px;
                text-align: center;
                transition: transform 0.3s ease-in-out;
            }

            .cart-item:hover {
                transform: scale(1.05);
            }

            .cart-item h3 {
                font-size: 1.5em;
                margin-bottom: 10px;
            }

            .cart-item p {
                color: #6c757d;
                margin-bottom: 15px;
            }

            a.payment-link {
                display: block;
                margin-top: 20px;
                padding: 10px 20px;
                background-color: #007bff;
                color: #ffffff;
                text-decoration: none;
                border-radius: 4px;
                transition: background-color 0.3s ease-in-out;
                text-align: center;
            }

            a.payment-link:hover {
                background-color: #0056b3;
            }

            .empty-cart-message {
                text-align: center;
                margin-top: 20px;
                color: #6c757d;
            }

            footer {
                background-color: #343a40;
                color: #ffffff;
                text-align: center;
                padding: 10px;
                width: 100%;
                position: fixed;
                bottom: 0;
            }
        </style>
    </head>
    <body>
        <header>
        </header>
        <div class="logo"><h1>Giỏ hàng</h1></div>
        <input type="date" id="experationDate" name="experationDate" required="">
        <nav>
            <ul>
                <li><a href="../index.jsp">Home</a></li>
                <li><a href="ticketType_list.jsp?parkID=${param.parkID}&transactionCode=${param.transactionCode}">Add Cart</a></li>
            </ul>
        </nav>
        <main>
            <jsp:useBean id="ttDAO" class="ModelDAO.TicketTypeDAO"></jsp:useBean>
            <jsp:useBean id="otDAO" class="ModelDAO.OrderDetailDAO"></jsp:useBean>
            <jsp:useBean id="odDAO" class="ModelDAO.OrderDAO"></jsp:useBean>
                <ul class="cart-list">
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
        <footer>
        </footer>
    </body>
</html>