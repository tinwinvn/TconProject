<%-- 
    Document   : admin_notification
    Created on : Mar 13, 2024, 10:35:38 AM
    Author     : admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Notification</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="admin_style.css">
    </head>
    <body>
        <jsp:include page="admin_nav.jsp"></jsp:include>
        <jsp:useBean id="ntDAO" class="ModelDAO.NotificationDAO"></jsp:useBean>
        <jsp:useBean id="orderDAO" class="ModelDAO.OrderDAO"></jsp:useBean>
        <jsp:useBean id="transactionDAO" class="ModelDAO.TransactionDAO"></jsp:useBean>
            <div class="head-title">
                <div class="left">
                    <h1>Thông báo</h1>
                    <ul class="breadcrumb">
                        <!--                        <li>
                                                    <a href="#">Dashboard</a>
                                                </li>
                                                <li><i class='bx bx-chevron-right' ></i></li>-->
                        <li>
                            <!--                            <a class="active" href="admin_notification.jsp">Thông báo</a>-->
                            <a class="active" href="../index.jsp" style="color: #EE2E24">Trang chủ</a>
                        </li>
                    </ul>
                </div>
            </div>         
            <table class="table" style="margin-top: 2%; overflow: hidden; overflow-y: scroll !important">
                <thead>
                    <tr>
                        <th scope="col">STT</th>
                        <th scope="col">Nội dung</th>
                        <th scope="col">Ngày</th>
                        <c:if test="${sessionScope.acc.role != 3}">
                        <th scope="col">Trạng thái</th>
                        <th scope="col">Ghi chú</th>
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
                                        <input type="hidden" name="ticketCode" value="${notilist.content}">
                                        <input type="hidden" name="notificationID" value="${notilist.notificationID}">
                                        <c:if test="${notilist.isConfirm == false}">
                                            <button type="submit" name="accept" value="accept" style="color: white; background-color: #EE2E24; width: 7vw; border-color: #EE2E24">Chấp nhận</button>
                                            <button type="submit" name="denied" value="denied" style="color: #EE2E24; background-color: white; width: 7vw; border-color: white">Từ chối</button>
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
    </body>
</html>
