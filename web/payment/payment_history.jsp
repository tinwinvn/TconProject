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
        <jsp:useBean id="orderDetailDAO" class="ModelDAO.OrderDetailDAO"></jsp:useBean>
            <h2>Payment History</h2>
            <table border="1">
                <thead>
                    <tr>
                        <th>Date</th>
                        <th>Transaction Code</th>
                        <th>Order Detail</th>
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
