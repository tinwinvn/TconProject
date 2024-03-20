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
        <link rel="stylesheet" href="../css/styles.css" />
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
        <div class="bg-red" style="height: 3vh; background-color: #EE2E24"></div>
        <jsp:include page="../navbar.jsp"></jsp:include>
        <jsp:useBean id="userDAO" class="ModelDAO.UserDAO"></jsp:useBean>
        <jsp:useBean id="transactionDAO" class="ModelDAO.TransactionDAO"></jsp:useBean>
        <jsp:useBean id="ticketTypeDAO" class="ModelDAO.TicketTypeDAO"></jsp:useBean>
        <jsp:useBean id="OrderDAO" class="ModelDAO.OrderDAO"></jsp:useBean>
        <jsp:useBean id="orderDetailDAO" class="ModelDAO.OrderDetailDAO"></jsp:useBean>     
        <h2 style="text-align: center; color: #EE2E24; margin-top: 5%">Lịch sử giao dịch</h2>
        <div style="display: flex; justify-content: center; align-items: center; margin-top: 2%">
        <button class="btn btn-primary" style="background-color: #EE2E24; border-color: #EE2E24" onclick="openPopup()">Hoàn vé</button>
        </div>
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
            <table border="1" style="margin-top: 2%">
                <thead>
                    <tr>
                        <th>Ngày</th>
                        <th>Mã giao dịch</th>
                        <th>Mã đơn hàng</th>
                        <th>Tổng giá trị</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="transaction" items="${transactionDAO.allTransaction}"> 
                                <tr>
                                    <td>${transaction.date}</td>
                                    <td>${transaction.getTransactionCode()}</td>
                                    <td>${transaction.orderID}</td>
                                    <td><fmt:formatNumber value="${transactionDAO.getTotalPriceByTransactionID(transaction.transactionID)}"></fmt:formatNumber> VNĐ</td>
                               
                                </tr>
                </c:forEach>
        </tbody>
    </table>
    <br>  
    <footer style="background-color: white; height: 30%; position: static">
            <jsp:include page="../footer.jsp"></jsp:include>
        </footer>
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
