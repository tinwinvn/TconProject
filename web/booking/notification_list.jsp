<%-- 
    Document   : refund_list
    Created on : Feb 28, 2024, 8:11:55 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Refund List</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="../css_god/details.css"/>
    </head>
    <body>
        <jsp:include page="../nav.jsp"></jsp:include>
        <jsp:useBean id="ntDAO" class="ModelDAO.NotificationDAO"></jsp:useBean>
        <jsp:useBean id="orderDAO" class="ModelDAO.OrderDAO"></jsp:useBean>
        <jsp:useBean id="transactionDAO" class="ModelDAO.TransactionDAO"></jsp:useBean>
            <h1>Thông báo</h1>
            
            
            
            <table class="table">
  <thead>
    <tr>
      <th scope="col">Title</th>
      <th scope="col">Content</th>
      <th scope="col">Date</th>
      <c:if test="${sessionScope.acc.role != 3}">
      <th scope="col">Action</th>
      <th scope="col">Status</th>
       </c:if>
    </tr>
  </thead>
  <tbody>
    <c:forEach var="notilist" items="${ntDAO.allNotification}">

                <c:if test="${sessionScope.acc.userID == notilist.receiverID}">

                    <tr>
                        <td>${notilist.title}</td> 
                        <td>${notilist.content}</td>
                        <td>${notilist.notificationDate}</td>
                        <c:if test="${sessionScope.acc.role!=3}">
                            <td>
                                <form action="../ResponeRefundServler" method="POST">
                                    <input type="hidden" name="senderID" value="${notilist.receiverID}">
                                    <input type="hidden" name="receiverID" value="${notilist.senderID}">
                                    <input type="hidden" name="transactionCode" value="${notilist.content}">
                                    <input type="hidden" name="notificationID" value="${notilist.notificationID}">
                                    <c:if test="${notilist.isConfirm == false}">
                                    <button type="submit" name="accept" value="accept">Accept</button>
                                    <button type="submit" name="denied" value="denied">Denied</button>
                                    <a href="../payment/verification_order.jsp?orderID=${orderDAO.getOrderbyOrderID(transactionDAO.getOrderIDbyTransactionCode(notilist.content)).orderID}">Detail</a>
                                    </c:if>
                                </form>
                            </td>
                        </c:if>
                        <c:if test="${sessionScope.acc.role != 3}">
                        <td>   
                            <c:if test="${notilist.isConfirm == true}">
                                Đã xử lí
                            </c:if>
                            <c:if test="${notilist.isConfirm == false}">
                                Đang chờ xử lí
                            </c:if>
                        </td>    
                        </c:if>    
                    </tr>

                </c:if>
            </c:forEach>
  </tbody>
</table>
            
            
            
            
<!--            <table border="1">
                <tr>
                    <th>Title</th>
                    <th>Content</th>
                    <th>Date</th>
                    <c:if test="${sessionScope.acc.role != 3}">
                    <th>Action</th>
                    <th>Status</th>
                    </c:if>

            </tr>
            <c:forEach var="notilist" items="${ntDAO.allNotification}">             
                <c:if test="${sessionScope.acc.userID == notilist.receiverID}">

                    <tr>
                        <td>${notilist.title}</td> 
                        <td>${notilist.content}</td>
                        <td>${notilist.notificationDate}</td>
                        <c:if test="${sessionScope.acc.role!=3}">
                            <td>
                                <form action="../ResponeRefundServler" method="POST">
                                    <input type="hidden" name="senderID" value="${notilist.receiverID}">
                                    <input type="hidden" name="receiverID" value="${notilist.senderID}">
                                    <input type="hidden" name="transactionCode" value="${notilist.content}">
                                    <input type="hidden" name="notificationID" value="${notilist.notificationID}">
                                    <c:if test="${notilist.isConfirm == false}">
                                        <button type="submit" name="accept" value="accept">Accept</button>
                                        <button type="submit" name="denied" value="denied">Denied</button>  
                                        <a href="../payment/verification_order.jsp?orderID=${orderDAO.getOrderbyOrderID(transactionDAO.getOrderIDbyTransactionCode(notilist.content)).orderID}">Detail</a>
                                    </c:if>
                                </form>
                            </td>
                        </c:if>
                        <c:if test="${sessionScope.acc.role != 3}">
                            <td>   
                                <c:if test="${notilist.isConfirm == true}">
                                    Đã xử lí
                                </c:if>
                                <c:if test="${notilist.isConfirm == false}">
                                    Đang chờ xử lí
                                </c:if>
                            </td>    
                        </c:if>    
                    </tr>

                </c:if>

            </c:forEach>
        </table>   -->
            
            
        <a href="../index.jsp"><button type="submit">Home</button></a>
        <footer style="background-color: white; height: 30%">
            <jsp:include page="../footer.jsp"></jsp:include>
        </footer>
    </body>


</html>


