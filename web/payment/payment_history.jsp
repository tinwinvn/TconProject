<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment History</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="../css_god/details.css"/>
        <style>
            body {
                font-family: 'Arial', sans-serif;
                background-color: #f8f8f8;
                margin: 20px;
                text-align: center;
            }

            h2 {
                color: #333;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }

            th, td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: left;
            }

            th {
                background-color: #f2f2f2;
            }

            tbody tr:nth-child(even) {
                background-color: #f9f9f9;
            }

            form {
                margin-top: 20px;
            }

            input[type="submit"] {
                background-color: #4CAF50;
                color: white;
                padding: 10px 15px;
                border: none;
                border-radius: 3px;
                cursor: pointer;
            }
            button {
                background-color: #EE2E24;
                color: white;
                padding: 10px 15px;
                border: none;
                border-radius: 3px;
                cursor: pointer;
            }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
        .overlay {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5); /* Màu nền với độ trong suốt */
    }

    /* Style cho popup */
        .popup {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #fff;
            padding: 20px;
            border: 2px solid #ccc;
            z-index: 9999;
        }
    </style>
    </head>
    <body>
        <jsp:include page="../nav.jsp"></jsp:include>
        <jsp:useBean id="userDAO" class="ModelDAO.UserDAO"></jsp:useBean>
        <jsp:useBean id="transactionDAO" class="ModelDAO.TransactionDAO"></jsp:useBean>
        <jsp:useBean id="ticketTypeDAO" class="ModelDAO.TicketTypeDAO"></jsp:useBean>
        <jsp:useBean id="OrderDAO" class="ModelDAO.OrderDAO"></jsp:useBean>
        <jsp:useBean id="orderDetailDAO" class="ModelDAO.OrderDetailDAO"></jsp:useBean>     
        <h2 style="text-align: center; color: #EE2E24">Lịch sử giao dịch</h2>
        <button style="margin-left: 45%" onclick="openPopup()">Hoàn vé</button>
            <div id="overlay" class="overlay"></div>
            <div id="popup" class="popup">
                <form action="../TicketRefundServlet" method="POST">
                    <label for="transactionCode">Nhập vào mã giao dịch của bạn:</label> <br>                
                    <input type="text" id="transactionCode" name="transactionCode" required>
                    <input type="hidden" name="senderID" value="${param.userID}">
                    <br><br>
                    <button type="submit">Refund</button>
                    <button onclick="closePopup()">Close</button>
                </form>
            </div>
            <table border="1">
                <thead>
                    <tr>
                        <th>Ngày</th>
                        <th>Mã giao dịch</th>
                        <th>Chi tiết</th>
                        <th>Trạng Thái</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="transaction" items="${transactionDAO.allTransaction}"> 
                    <c:forEach var="order" items="${OrderDAO.allOrder}">
                        <c:if test="${order.userID == param.userID}">
                            <c:if test="${transaction.getOrderID() == order.orderID}">
                                <tr>
                                    <td>${transaction.date}</td>
                                    <td>${transaction.getTransactionCode()}</td>
                                    <td>
                                        <ul>
                                            <c:set var="totalPrice" value="${0}"></c:set>
                                            <c:forEach var="orderdetailList" items="${orderDetailDAO.allOrderDetail}">
                                                <c:if test="${orderdetailList.orderID == transaction.orderID}">
                                                    <c:set var="orderdetail" value="${orderDetailDAO.getOrderDetailByOrderID(transaction.orderID)}"></c:set>
                                                    <c:forEach var="tickettypeList" items="${ticketTypeDAO.allTicketType}">
                                                        <c:if test="${tickettypeList.ticketTypeID == orderdetail.ticketTypeID}">
                                                            <li>
                                                                <p>Loại vé: ${tickettypeList.typeName}</p>
                                                                <p>Số lượng: ${orderdetail.quantity}</p>                                                              
                                                                <p>Giá: <fmt:formatNumber value="${tickettypeList.price}" type="number"></fmt:formatNumber> VNĐ</p>
                                                                <c:set var="totalPrice" value="${totalPrice + orderdetail.quantity * tickettypeList.price}"></c:set>
                                                                </li>
                                                        </c:if>
                                                    </c:forEach>                                                                
                                                </c:if>                                                 
                                            </c:forEach>
                                            <p>Tổng: <fmt:formatNumber value="${totalPrice}"></fmt:formatNumber> VNĐ</p>                
                                        </ul>
                                        
                                    </td>
                                    <td>
                                        <c:if test="${transaction.getTransactionStatus() == 1}">
                                            Giao dịch thành công
                                        </c:if>
                                        <c:if test="${transaction.getTransactionStatus() == 2}">
                                        Đã hoàn vé
                                        </c:if>
                                        <c:if test="${transaction.getTransactionStatus() == 3}">
                                            Hoàn thành công
                                        </c:if>
                                        <c:if test="${transaction.getTransactionStatus() == 4}">
                                            Từ chối hoàn tiền
                                        </c:if>
                                        <c:if test="${transaction.getTransactionStatus() == 5}">
                                            Lỗi
                                        </c:if>
                                    </td>
                                </tr>
                            </c:if>
                        </c:if>
                    </c:forEach>
                </c:forEach>
        </tbody>
    </table>
    <br>  
</body>

<script>
    // Hàm mở popup
    function openPopup() {
        document.getElementById("overlay").style.display = "block";
        document.getElementById("popup").style.display = "block";
    }

    // Hàm đóng popup
    function closePopup() {
        document.getElementById("overlay").style.display = "none";
        document.getElementById("popup").style.display = "none";
    }
    
</script>
</html>
