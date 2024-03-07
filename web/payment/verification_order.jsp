<%-- 
    Document   : verification_order
    Created on : Mar 6, 2024, 8:32:36 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="orderDetailDAO" class="ModelDAO.OrderDetailDAO"></jsp:useBean>     
        <jsp:useBean id="ticketTypeDAO" class="ModelDAO.TicketTypeDAO"></jsp:useBean>
        <jsp:useBean id="orderDAO" class="ModelDAO.OrderDAO"></jsp:useBean>
            <h1>Thông tin</h1>
            <c:forEach var="i" items="${orderDetailDAO.getOrderDetailListByOrderID(param.orderID)}">
                <c:set var="ticketType" value="${ticketTypeDAO.getTicketTypeByID(i.ticketTypeID)}"></c:set>
                <p>Loại vé: ${ticketType.typeName}</p>
                <p>Số lượng: ${i.quantity}</p>
            </c:forEach>               
                <p>Ngày sử dụng: ${orderDAO.getOrderbyOrderID(param.orderID).experationDate}</p>  
                <c:if test="${orderDAO.getOrderbyOrderID(param.orderID).orderStatus == 1}">
                    <p>Hợp lệ</p>
                </c:if>
                <c:if test="${orderDAO.getOrderbyOrderID(param.orderID).orderStatus == 2}">
                    <p>Đã được sử dụng</p>
                </c:if>
                <c:if test="${orderDAO.getOrderbyOrderID(param.orderID).orderStatus == 3}">
                    <p>Đã hoàn vé</p>
                </c:if>
                    <form action="../AcceptVerificationOrderServlet" method="post"> 
                        <input type="hidden" name="orderID" value="${param.orderID}">
                        <button type="submit">Xác nhận</button>
                    </form>
    <form action="../AcceptVerificationOrderServlet"> 
        <button type="submit">Exchange Ticket</button>
    </form>
</body>
</html>
