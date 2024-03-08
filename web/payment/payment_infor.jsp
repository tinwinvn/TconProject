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
        <jsp:include page="../nav.jsp"></jsp:include>
        <jsp:useBean id="userAlg" class="ModelDAO.UserDAO"></jsp:useBean>
        <div style=" margin-left: 32%; margin-top: 4%">
        <c:forEach var="i" items="${userAlg.allUser}">
            <c:if test="${i.userID == param.userId}">
               
                <div class="card h-100">
                    <div class="card-body">
                        <div class="account-settings">
                            <div class="user-profile">
                                <div class="user-avatar">
                                    <img src="../images/avatar.jpg">
                                </div>              
                                <h5 class="user-name" style="color: #EE2E24">Name: ${i.fullName}</h5>
                                <h6 class="user-email">Email: ${i.email}</h6>   
                                <h7 class="user-phone">Phone Number: ${i.phone}</h7><br>   
                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                                    Pay Now
                                </button>

                                <!-- Modal -->
                                <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h1 class="modal-title fs-5" id="staticBackdropLabel">Modal title</h1>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                Bạn có đồng ý thực hiện giao dịch này ?
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                                <a href="vnpay_pay.jsp?price=${param.price}&orderID=${param.orderID}" class="btn btn-primary">Yes</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:if>
        </c:forEach>
        </div>
            
        <footer style="background-color: white; height: 30%">
            <jsp:include page="../footer.jsp"></jsp:include>
        </footer>
    </body>
</html>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!-- Button trigger modal -->
