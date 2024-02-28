<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Danh sách loại vé</title>
    <link rel="stylesheet" href="style.css">
    <style>
        body {
            background-image: url('../images/a.jpg');
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

        .ticket-list {
            list-style: none;
            padding: 0;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }

        .ticket-item {
            background-color: #ffffff;
            border: 1px solid #dee2e6;
            border-radius: 8px;
            margin: 10px;
            padding: 20px;
            max-width: 300px;
            text-align: center;
            transition: transform 0.3s ease-in-out;
        }

        .ticket-item:hover {
            transform: scale(1.05);
        }

        .ticket-item img {
            width: 100%;
            border-radius: 8px;
            margin-bottom: 10px;
        }

        .ticket-item h3 {
            font-size: 1.5em;
            margin-bottom: 10px;
        }

        .ticket-item p {
            color: #6c757d;
            margin-bottom: 15px;
        }

        .price, .quantity {
            display: block;
            margin-bottom: 10px;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        input {
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ced4da;
            border-radius: 4px;
            width: 100px;
            text-align: center;
        }

        button {
            padding: 10px 20px;
            background-color: #007bff;
            color: #ffffff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease-in-out;
        }

        button:hover {
            background-color: #0056b3;
        }

        .btn-cart {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #28a745;
            color: #ffffff;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s ease-in-out;
        }

        .btn-cart:hover {
            background-color: #218838;
        }

        .quantity-controls {
            display: flex;
            justify-content: center;
            margin-bottom: 10px;
        }

        .quantity-controls button {
            margin: 0 5px;
        }

        .total-price {
            font-size: 1.2em;
            font-weight: bold;
            margin-bottom: 10px;
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

       

                    <div class="logo"><h1>Đặt vé:</h1></div>
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
        <h2>Danh sách loại vé</h2>
        <jsp:useBean id="ttDAO" class="ModelDAO.TicketTypeDAO"></jsp:useBean>
        <ul class="ticket-list">
        <c:forEach var="ttL" items="${ttDAO.allTicketType}">           
            <c:if test="${param.parkID == ttL.parkID}">
                <li class="ticket-item">
                <h3>${ttL.typeName}</h3>
                <p>${ttL.description}</p>
                <span class="price">Giá: ${ttL.price} VNĐ</span>
                <form action="../AddToCartServlet" method="GET">
                    <input type="hidden" name="ticketTypeID" value="${ttL.ticketTypeID}">
                    <input type="number" name="quantity" min="1" max="10" value="1">
                    <input type="hidden" name="price" value="${ttL.price}">
                    <input type="hidden" name="parkID" value="${param.parkID}">
                    <input type="hidden" name="orderID" value="${param.orderID}">
                    <button type="submit">Thêm vào giỏ hàng</button>
                </form>

                </li>
            </c:if>
        </c:forEach>                          
        </ul>
        <a href="cart.jsp?orderID=${param.orderID}" class="btn-cart">Xem giỏ hàng</a>
    </main>
    <footer>
        
    </footer>

  
    
    
    
</body>
</html>
