<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Cổng thanh toán VNPAY DEMO</title>     
        <script src="assets/jquery-1.11.3.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="../css_god/details.css"/>
    </head>

   

    <body>
        <jsp:include page="../nav.jsp"></jsp:include>


          <div class="card-body" style="border: 2px solid; padding: 2%; border-radius: 10px; border-color: lightgray; width: 30vw; position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
                <div class="" style="text-align: center">

                    <h3 class="text-muted" style="color: black">VNPAY</h3>
                </div>
                <div class="form-group">
                    <button onclick="pay()" style="margin-top: 3%; background-color: #EE2E24; color: white; border-color: #EE2E24;" class="btn btn-primary">Giao dịch thanh toán</button><br>
                </div>
                <div class="form-group">
                    <button onclick="querydr()" style="margin-top: 3%; background-color: #EE2E24; color: white; border-color: #EE2E24;" class="btn btn-primary">API truy vấn kết quả thanh toán</button><br>
                </div>
                
                <div style="text-align: center; margin-top: 10%">
                    <p>Cổng thanh toán VNPAY kính chào quý khách!</p>
                </div>
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






</html>
