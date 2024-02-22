

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách loại vé</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <header>
        </header>
    <nav>
        </nav>
    <main>
        <h2>Danh sách loại vé</h2>
        <ul class="ticket-list">
            <li class="ticket-item">
                <img src="images/ticket-adult.png" alt="Vé người lớn">
                <h3>Vé người lớn</h3>
                <p>Vé dành cho người từ 18 tuổi trở lên.</p>
                <span class="price">Giá: 200.000 VNĐ</span>
                <span class="quantity">Còn lại: 10</span>
                <form action="../AddToCartServlet" method="GET">
                    <input type="hidden" name="ticketType" value="adult">
                    <input type="number" name="quantity" min="1" max="10" value="1">
                    <input type="hidden" name="price" value="${200000}">
                    <button type="submit">Thêm vào giỏ hàng</button>
                </form>
            </li>
            <li class="ticket-item">
                <img src="images/ticket-child.png" alt="Vé trẻ em">
                <h3>Vé trẻ em</h3>
                <p>Vé dành cho trẻ em từ 6 đến 17 tuổi.</p>
                <span class="price">Giá: 150.000 VNĐ</span>
                <span class="quantity">Còn lại: 20</span>
                <form action="../AddToCartServlet" method="GET">
                    <input type="hidden" name="ticketType" value="child">
                    <input type="number" name="quantity" min="1" max="20" value="1">
                    <input type="hidden" name="price" value="${150000}">
                    <button type="submit">Thêm vào giỏ hàng</button>
                </form>
            </li>
            <a href="cart.jsp" class="btn-cart">Xem giỏ hàng</a>
        </ul>
    </main>
    <footer>
        </footer>
</body>
</html>