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
        <div class="form-group">
            <label>Mã giao dịch thanh toán:</label>
            <label><%= responseJson.has("vnp_TxnRef") ? responseJson.get("vnp_TxnRef").getAsString() : ""%></label>
        </div>
        <div class="form-group">
            <label>Số tiền:</label>
            <label><%= responseJson.has("vnp_Amount") ? responseJson.get("vnp_Amount").getAsString() : ""%></label>
        </div>
        
        <div class="form-group">
                <a href="index.jsp" class="btn btn-primary">Back to Home</a>
        </div>

    </body>
</html>
