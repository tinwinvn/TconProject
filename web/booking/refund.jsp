

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hoàn trả vé</title>
    </head>
    <body>
        <h2>Hoàn trả vé</h2>
        <form action="TicketRefundServlet" method="POST">
            <label for="transactionCode">Transaction Code:</label>
            <input type="text" id="transactionCode" name="transactionCode" required>
            <br><br>
            <input type="submit" value="Refund">
        </form>
    </body>
</html>
