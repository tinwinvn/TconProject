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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="../css_god/details.css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="../nav.jsp"></jsp:include>
        <div class="bg-red" style="height: 0.2vh; margin-bottom: 15px"></div>
        <jsp:useBean id="orderDetailDAO" class="ModelDAO.OrderDetailDAO"></jsp:useBean>     
        <jsp:useBean id="ticketTypeDAO" class="ModelDAO.TicketTypeDAO"></jsp:useBean>
        <jsp:useBean id="orderDAO" class="ModelDAO.OrderDAO"></jsp:useBean>
        <div class="card h-100" style="margin-left: 33%">
            <h1 style="text-align: center">Thông tin</h1>
            <c:forEach var="i" items="${orderDetailDAO.getOrderDetailListByOrderID(param.orderID)}">
                <c:set var="ticketType" value="${ticketTypeDAO.getTicketTypeByID(i.ticketTypeID)}"></c:set> 
                <p>Loại vé: ${ticketType.typeName}</p>
                <p>Số lượng: ${i.quantity}</p>
                <div class="bg-red" style="height: 0.2vh; margin-bottom: 15px"></div>
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
                        <button type="submit" class="btn btn-primary" style="background-color: #EE2E24; border-color: #EE2E24">Xác nhận</button>
                    </form>
    
              </div>          
                        <footer style="background-color: white; height: 30%">
            <jsp:include page="../footer.jsp"></jsp:include>
        </footer>
</body>
</html>



