<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đổi vé</title>
    </head>
    <body>
        <jsp:useBean id="ttDAO" class="ModelDAO.TicketTypeDAO"></jsp:useBean>
        <jsp:useBean id="ntDAO" class="ModelDAO.NotificationDAO"></jsp:useBean>
        <jsp:useBean id="tcDAO" class="ModelDAO.TransactionDAO"></jsp:useBean>
        <h2>Đổi vé</h2>
        
        <form action="../TicketChangeServlet" method="POST">
                    <label for="transactionCode">Transaction Code:</label>                 
                    <input type="text" id="transactionCode" name="transactionCode" required>                  
                    <br><br>
                    <button type="submit">Change</button>
                </form>
    </body>
</html>
