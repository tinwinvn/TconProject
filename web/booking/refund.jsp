<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hoàn trả vé</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="../css_god/details.css"/>
    </head>
    <body>
        <div style="background-color: white;">
            <jsp:include page="../nav.jsp"></jsp:include>
            <jsp:useBean id="ttDAO" class="ModelDAO.TicketTypeDAO"></jsp:useBean>
            <jsp:useBean id="ntDAO" class="ModelDAO.NotificationDAO"></jsp:useBean>
            <jsp:useBean id="tcDAO" class="ModelDAO.TransactionDAO"></jsp:useBean>
                <h2>Hoàn trả vé</h2>

                <form action="../TicketRefundServlet" method="POST" style="">
                    <label for="transactionCode">Transaction Code:</label>                 
                    <input type="text" id="transactionCode" name="transactionCode" required>
                    <input type="hidden" name="senderID" value="${sessionScope.acc.userID}">
                <br><br>
                <button type="submit" style="background-color: #EE2E24">Refund</button>
            </form>
            <a href="../payment/payment_history.jsp"><button type="submit" style="background-color: #EE2E24">Transaction</button></a>
            <a href="../index.jsp"><button type="submit" style="background-color: #EE2E24;">Home</button></a>
        </div>
        <footer style="background-color: white; height: 30%">
            <jsp:include page="../footer.jsp"></jsp:include>
        </footer>
    </body>
</html>



<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f4f4;
    }

    h2 {
        text-align: center;
        margin-top: 20px;
    }

    form {
        width: 50%;
        margin: 20px auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    label {
        display: block;
        margin-bottom: 10px;
    }

    input[type="text"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }

    button[type="submit"] {
        background-color: #007bff;
        color: #fff;
        border: none;
        padding: 10px 20px;
        cursor: pointer;
        border-radius: 4px;
    }

    button[type="submit"]:hover {
        background-color: #0056b3;
    }

    a {
        display: block;
        text-align: center;
        margin-bottom: 1%;
        text-decoration: none;
        color: #007bff;
    }

    a:hover {
        text-decoration: underline;
    }
</style>