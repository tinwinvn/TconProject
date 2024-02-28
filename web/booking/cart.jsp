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
          
        
        <style>
    header {
        background-color: #343a40;
        color: #ffffff;
        padding: 20px;
        text-align: center;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .logo {
        flex-grow: 1;
    }

    .logo h1 {
        
        
        font-size: 2.5em;
    }

    nav {
        display: flex;
        justify-content: flex-end;
    }

    nav ul {
        list-style: none;
        margin: 0;
        padding: 0;
        display: flex;
    }

    nav li {
        margin-right: 20px;
    }

    nav a {
        text-decoration: none;
        color: #ffffff;
        font-weight: bold;
        font-size: 1em;
        transition: color 0.3s ease-in-out;
    }

    nav a:hover {
        color: #007bff;
    }
</style>

       

                    <div class="logo"><h1>Giỏ hàng:</h1></div>
                    <nav>
                        <ul>
                            <li><a href="#">Home</a></li>
                            <li><a href="#">Games</a></li>
                            <li><a href="#">Logout</a></li>
                        </ul>
                    </nav>
    
    </header>
    <nav>
    </nav>
    <main>
        
        <jsp:useBean id="ttDAO" class="ModelDAO.TicketTypeDAO"></jsp:useBean>
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
                </li>
                
                <c:set var="totalPrice" value="${totalPrice + price * quantity}"></c:set>
            </c:forEach>
            
            <c:if test="${empty sessionScope.cart}">
                <p class="empty-cart-message">Giỏ hàng trống</p>
            </c:if>
        </ul>
            <c:if test="${not empty sessionScope.cart}">
                <a href="../payment/payment_vnPay.jsp?price=${totalPrice}&orderID=${param.orderID}" class="payment-link">Thanh Toán</a>               
            </c:if>
    </main>
    <footer>
    </footer>
</body>
</html>
