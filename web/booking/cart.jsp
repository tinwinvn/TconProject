<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Giỏ hàng</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="../css_god/details.css"/>
    </head>






    <body>
        <jsp:include page="../nav.jsp"></jsp:include>
        <div class="bg-red" style="height: 0.5vh; margin-bottom: 15px"></div>
        <nav>
            <ul>
                <li><a href="../index.jsp">Home</a></li>
                <li><a href="ticketType_list.jsp?parkID=${param.parkID}&transactionCode=${param.transactionCode}">Add Cart</a></li>
            </ul>
        </nav>


        <jsp:useBean id="ttDAO" class="ModelDAO.TicketTypeDAO"></jsp:useBean>
        <jsp:useBean id="otDAO" class="ModelDAO.OrderDetailDAO"></jsp:useBean>
        <jsp:useBean id="odDAO" class="ModelDAO.OrderDAO"></jsp:useBean>

        
       <div class="container d-flex justify-content-center align-items-center">
                <div class="row" >
                <c:forEach var="item" items="${sessionScope.cart}">
                    <div class="card mx-3" style="width: 15rem; height: 50%">

                        <div class="card-body text-center d-flex flex-column align-items-center">
                            <img class="card-img-top" src="../images/a.jpg" alt="">


                            <c:set var="ticketType" value="${ttDAO.getTicketTypeByID(item.key)}"></c:set>
                            <c:set var="ticketTypeName" value="${ticketType.typeName}" />
                            <c:set var="quantity" value="${item.value.quantity}" />
                            <c:set var="price" value="${ticketType.price}"></c:set>
                            <c:set var="parkID" value="${ticketType.parkID}"></c:set>
                                <h3>${ticketTypeName}</h3>
                            <p>Số lượng: ${quantity}</p>
                            <p>Giá: ${price * quantity} VNĐ</p>
                            <form action="../DeleteCartServlet" method="POST">                              
                                <input type="hidden" name="ticketType" value="${item.key}">
                                <input type="hidden" name="parkID" value="${param.parkID}">
                                <input type="hidden" name="transactionCode" value="${param.transactionCode}">
                                <button type="submit" class="btn btn-primary" style="background-color: #EE2E24; border-color: #EE2E24">Xóa</button>
                            </form>


                            <c:set var="totalPrice" value="${totalPrice + price * quantity}"></c:set>
                            <c:set var="voucherPrice" value="${totalPrice * discountrate}"></c:set>
                            <c:set var="finalPrice" value="${empty param.voucher ? totalPrice : voucherPrice}" />    
                            <c:if test="${empty sessionScope.cart}">
                                <p class="empty-cart-message">Giỏ hàng trống</p>
                            </c:if>

                            <c:if test="${not empty sessionScope.cart}">

                            </c:if>

                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div>
        <c:if test="${not empty sessionScope.cart}">
                <c:if test="${empty param.transactionCode}">
                    <form action="../PaymentServlet" method="post" style="text-align: center; margin-top: 2%">
                        <div style="display: flex; align-items: center; justify-content: center">
                            <p style="margin-top: 0.7%; margin-right: 10px">Ngày sử dụng: </p>
                            <input type="date" id="experationDate" name="experationDate" required="">
                        </div>
                        <div style="display: flex; align-items: center; justify-content: center">
                            <p style="margin-top: 0.7%; margin-right: 10px">Voucher: </p>
                            <input type="text" id="experationDate" name="experationDate" required="">
                        </div>
                        <input type="hidden" name="totalPrice" value="${totalPrice}">
                        <input type="hidden" name="orderID" value="${param.orderID}">
                        <input type="hidden" name="parkID" value="${param.parkID}">
                        <div style="margin-top: 1%">
                        <button type="submit" class="btn btn-primary" style="background-color: #EE2E24; border-color: #EE2E24">Thanh toán</button>                   
                    </form>  
                        </div>
                        </form> 
                </c:if>
                <c:if test="${not empty param.transactionCode}">
                    <form action="../ConfirmChangeTicketServlet" method="get">
                        <input type="hidden" name="senderID" value="${sessionScope.acc.userID}">
                        <input type="hidden" name="transactionCode" value="${param.transactionCode}">
                        <button type="submit" class="payment-link">Đổi vé</button>
                    </form>                  
                </c:if>
            </c:if>
        </div>
        
        

       
        <jsp:include page="../footer.jsp"></jsp:include>
    </body>
    
    <script>
        // Lấy ngày hiện tại
        var currentDate = new Date();

        // Format ngày hiện tại thành chuỗi yyyy-mm-dd
        var formattedDate = currentDate.toISOString().split('T')[0];

        // Đặt giá trị min cho trường input date
        document.getElementById("experationDate").setAttribute("min", formattedDate);
    </script>
</html>
