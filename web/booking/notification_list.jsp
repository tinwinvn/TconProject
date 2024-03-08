
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Refund List</title>
    </head>
    <body>
        <jsp:useBean id="ntDAO" class="ModelDAO.NotificationDAO"></jsp:useBean>
            <h1>Thông báo</h1>
            <table border="1">
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
        </table>      
        <a href="../index.jsp"><button type="submit">Home</button></a>
    </body>
</html>


<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f4f4;
    }

    h1 {
        text-align: center;
        margin-top: 20px;
    }

    table {
        width: 80%;
        margin: 20px auto;
        border-collapse: collapse;
        border: 1px solid #ddd;
        background-color: #fff;
    }

    th, td {
        padding: 10px;
        text-align: left;
        border: 1px solid #ddd;
    }

    th {
        background-color: #007bff;
        color: #fff;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    tr:hover {
        background-color: #ddd;
    }

    button {
        background-color: #007bff;
        color: #fff;
        border: none;
        padding: 8px 16px;
        cursor: pointer;
        border-radius: 4px;
    }

    button:hover {
        background-color: #0056b3;
    }
</style>