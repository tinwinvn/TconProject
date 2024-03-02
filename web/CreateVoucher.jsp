<%-- 
    Document   : CreateVoucher
    Created on : 2 Mar 2024, 12:52:12
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="container">
            <h2>Create Voucher</h2>
            <form class="form-horizontal" action="createVoucher" method="post">
                <div class="form-group">
                    <label class="control-label col-sm-2" for="email">Voucher Code</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="email" placeholder="Enter Voucher Code" name="code" required="">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="pwd">Discount Rate</label>
                    <div class="col-sm-10">          
                        <input type="number" class="form-control" id="pwd" placeholder="Enter discount rate" name="discount" required="">
                    </div>
                </div>
                <div class="form-group">        
                    <div class="col-sm-offset-2 col-sm-10">
                        <div class="checkbox">
                            <label><input type="checkbox" name="used"> Is Used</label>
                        </div>
                    </div>
                </div>
                <div class="form-group">        
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-default">Create</button>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
