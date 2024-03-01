<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment History</title>
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
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
    </head>
    <body>
        <jsp:useBean id="userDAO" class="ModelDAO.UserDAO"></jsp:useBean>
        <jsp:useBean id="transactionDAO" class="ModelDAO.TransactionDAO"></jsp:useBean>
        <jsp:useBean id="ticketTypeDAO" class="ModelDAO.TicketTypeDAO"></jsp:useBean>
        <jsp:useBean id="OrderDAO" class="ModelDAO.OrderDAO"></jsp:useBean>
        <jsp:useBean id="orderDetailDAO" class="ModelDAO.OrderDetailDAO"></jsp:useBean>
            <h2>Payment History</h2>
            <table border="1">
                <thead>
                    <tr>
                        <th>Date</th>
                        <th>Transaction Code</th>
                        <th>Order Detail</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="transaction" items="${transactionDAO.allTransaction}"> 
                    <c:forEach var="order" items="${OrderDAO.allOrder}">
                        <c:if test="${order.userID == param.userID}">
                            <c:if test="${transaction.getOrderID() == order.orderID}">
                                <tr>
                                    <td>${transaction.getDate()}</td>
                                    <td>${transaction.getTransactionCode()}</td>
                                    <td>
                                        <ul>
                                            <c:forEach var="orderdetailList" items="${orderDetailDAO.allOrderDetail}">
                                                <c:if test="${orderdetailList.orderID == transaction.orderID}">
                                                    <c:set var="orderdetail" value="${orderDetailDAO.getOrderDetailByOrderID(transaction.orderID)}"></c:set>
                                                    <c:forEach var="tickettypeList" items="${ticketTypeDAO.allTicketType}">
                                                        <c:if test="${tickettypeList.ticketTypeID == orderdetail.ticketTypeID}">
                                                            <li>${orderdetail.quantity} 
                                                                ${tickettypeList.typeName}
                                                                ${tickettypeList.price}
                                                                
                                                            </li>    
                                                        </c:if>
                                                    </c:forEach>
                                                </c:if>
                                            </c:forEach>
                                        </ul>
                                    </td>
                                    <td>
                                        <c:if test="${transaction.getTransactionStatus() == 1}">
                                        Giao dịch thành công
                                        </c:if>
                                        <c:if test="${transaction.getTransactionStatus() == 2}">
                                        Đang hoàn tiền
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
                    </c:if>
                </c:forEach>
            </c:forEach>
        </tbody>
    </table>
    <br>
    <form action="../index.jsp">
        <input type="submit" value="Back To Home">
    </form> 
</body>
</html>
