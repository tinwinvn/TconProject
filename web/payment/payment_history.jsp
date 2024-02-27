<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Payment History</title>
</head>
<body>
    <jsp:useBean id="userDAO" class="ModelDAO.UserDAO"></jsp:useBean>
    <jsp:useBean id="transactionDAO" class="ModelDAO.TransactionDAO"></jsp:useBean>
    <jsp:useBean id="ticketTypeDAO" class="ModelDAO.TicketTypeDAO"></jsp:useBean>
    <jsp:useBean id="OrderDAO" class="ModelDAO.OrderDAO"></jsp:useBean>
    <h2>Payment History</h2>
    <table border="1">
        <thead>
            <tr>
                <th>Date</th>
                <th>Transaction Code</th>
                <th>OrderID</th>
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
                                <td>${transaction.orderID}</td>
                            </tr>
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
