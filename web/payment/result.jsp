<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kết quả giao dịch</title>
    </head>
    <body>
        <%
            // Lấy dữ liệu từ thuộc tính responseData
            String responseData = (String) request.getAttribute("responseData");
            // Parse dữ liệu JSON từ chuỗi
            JsonObject responseJson = new JsonObject();
            if (responseData != null && !responseData.isEmpty()) {
                responseJson = new Gson().fromJson(responseData, JsonObject.class);
            }
        %>

        <!-- Hiển thị thông tin từ responseJson -->
        <jsp:useBean id="trDAO" class="ModelDAO.TransactionDAO"></jsp:useBean>
        <jsp:useBean id="ttDAO" class="ModelDAO.TicketTypeDAO"></jsp:useBean>
        <c:forEach var="item" items="${sessionScope.result}"> 
            <c:set var="orderCode" value="${trDAO}"></c:set>
            <div class="form-group">
                <label>Mã giao dịch thanh toán:</label>
                <label><%= responseJson.has("vnp_TxnRef") ? responseJson.get("vnp_TxnRef").getAsString() : ""%></label>
            </div>
            <div class="form-group">
                <label>Số tiền:</label>
                <label><%= responseJson.has("vnp_Amount") ? responseJson.get("vnp_Amount").getAsString() : ""%></label>
            </div>
        </c:forEach>
        <div class="form-group">
            <a href="index.jsp" class="btn btn-primary">Back to Home</a>
        </div>

    </body>
</html>
