<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Check Out</title>
        <link href="assets/checkout-style.css" rel="stylesheet">     
        
    </head>
    <body>
        <jsp:useBean id="userAlg" class="ModelDAO.UserDAO"></jsp:useBean>
        <h1>Order Detail</h1>
        <c:forEach var="i" items="${userAlg.allUser}">
            <c:if test="${i.userID == param.userId}">
                <div class="card h-100">
                    <div class="card-body">
                        <div class="account-settings">
                            <div class="user-profile">
                                <div class="user-avatar">
                                    <img src="./images/avatar.jpg">
                                </div>              
                                <h5 class="user-name">Name: ${i.fullName}</h5>
                                <h6 class="user-email">Email: ${i.email}</h6>   
                                <h7 class="user-phone">Phone Number: ${i.phone}</h7><br>                              
                                <a href="vnpay_pay.jsp?price=${param.price}&orderID=${param.orderID}" class="btn btn-primary">Pay Now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:if>
        </c:forEach>
    </body>
</html>