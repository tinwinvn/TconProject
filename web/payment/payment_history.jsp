<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Payment History</title>
</head>
<body>
<jsp:useBean id="transactionDAO" class="ModelDAO.TransactionDAO"></jsp:useBean>
<h2>Payment History</h2>
<c:forEach var="transaction" items="${transactionDAO.allTransaction}">
    <c:if test="${transaction.getOrderID() == param.orderId}">
        <div>
            <label>Name: ${transaction.getName()}</label><br>
            <label>Phone Number: ${transaction.getPhoneNumber()}</label><br>
            <label>Price: ${transaction.getPrice()}</label><br>
            <label>Date: ${transaction.getDate()}</label><br>
            <label>Transaction Code: ${transaction.getTransactionCode()}</label><br>
            <label>Payment Time: ${transaction.getPaymentTime()}</label><br>
        </div>
    </c:if>
</c:forEach>
</body>
</html>
