
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Giỏ hàng</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <header>
    </header>
    <nav>
    </nav>
    <main>
        <h2>Giỏ hàng</h2>
        <ul class="cart-list">
            <c:forEach var="item" items="${sessionScope.cart}">
                <c:set var="ticketType" value="${item.key}" />
                <c:set var="quantity" value="${item.value}" />
                <c:set var="price" value="${item.value}" /> 

                <li class="cart-item">
                    <h3>${ticketType}</h3>
                    <p>Số lượng: ${quantity}</p>
                    <p>Giá: ${price * quantity} VNĐ</p>
                </li>
            </c:forEach>
                <a href="../payment/payment_vnPay.jsp?price=${price}">Thanh Toán</a>    
            <c:if test="${empty sessionScope.cart}">
                <li class="cart-item">
                    <p>Giỏ hàng trống</p>
                </li>
            </c:if>
                
        </ul>
    </main>
    <footer>
    </footer>
</body>
</html>
