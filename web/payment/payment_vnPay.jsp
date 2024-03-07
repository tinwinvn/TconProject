<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Cổng thanh toán VNPAY DEMO</title>
        <!-- Bootstrap core CSS -->
        <link href="assets/bootstrap.min.css" rel="stylesheet"/>
        <!-- Custom styles for this template -->
        <link href="assets/jumbotron-narrow.css" rel="stylesheet">      
        <script src="assets/jquery-1.11.3.min.js"></script>
    </head>

    <header>
         <style>
    header {
        background-color: #343a40;
        color: #ffffff;
        padding: 20px;
        text-align: center;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .logo {
        flex-grow: 1;
    }

    .logo h1 {
        
        
        font-size: 2.5em;
    }

    nav {
        display: flex;
        justify-content: flex-end;
    }

    nav ul {
        list-style: none;
        margin: 0;
        padding: 0;
        display: flex;
    }

    nav li {
        margin-right: 20px;
    }

    nav a {
        text-decoration: none;
        color: #ffffff;
        font-weight: bold;
        font-size: 1em;
        transition: color 0.3s ease-in-out;
    }

    nav a:hover {
        color: #007bff;
    }
</style>

       

                    <div class="logo"><h1>Thanh toán:</h1></div>
                    <nav>
                        <ul>
                            <li><a href="#">Home</a></li>
                            <li><a href="#">Games</a></li>
                            <li><a href="#">Logout</a></li>
                        </ul>
                    </nav>
    </header>
    
    <body>

        <div class="container">
            <div class="header clearfix">

                <h3 class="text-muted">VNPAY</h3>
            </div>
            <div class="form-group">
                <button onclick="pay()">Giao dịch thanh toán</button><br>
            </div>
            <div class="form-group">
                <button onclick="querydr()">API truy vấn kết quả thanh toán</button><br>
            </div>
            <p>
                &nbsp;
            </p>
            <footer class="footer">
                <p>Cổng thanh toán VNPAY kính chào quý khách!</p>
            </footer>
        </div> 
        <script>
            function pay() {
                window.location.href = "payment_infor.jsp?userId=${acc.userID}&price=${param.price}&orderID=${param.orderID}";
            }
            function querydr() {
                window.location.href = "vnpay_querydr.jsp";
            }
        </script>


    </body>

    
    
    <style>
    body {
        padding-top: 20px;
        padding-bottom: 20px;
        background-color: #f8f9fa;
    }

    .container {
        
        max-width: 600px;
        margin: 0 auto;
        background-color: #ffffff;
        border: 1px solid #ddd;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        padding: 20px;
    }

    .header {
        margin-bottom: 20px;
        text-align: center;
    }

    .header h3 {
        font-size: 24px;
        margin: 0;
    }

    .form-group {
        margin-bottom: 20px;
    }

    button {
        padding: 10px 20px;
        font-size: 16px;
        cursor: pointer;
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 4px;
        transition: background-color 0.3s ease-in-out;
    }

    button:hover {
        background-color: #0056b3;
    }

    .footer {
        text-align: center;
        margin-top: 20px;
        padding: 10px;
        border-top: 1px solid #ddd;
    }
</style>

    
    
</html>
