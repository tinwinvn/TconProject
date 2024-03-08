<%-- 
    Document   : supplier_form
    Created on : Mar 6, 2024, 9:26:20 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Your Business</title>
    <link rel="stylesheet" href="supplier_styles.css">
</head>
<body>
    <div class="container">
        <h1>Register Your Business</h1>
        <form action="../DetailsSupplierServlet " method="POST">
            <input type="hidden" name="senderID" value="${sessionScope.acc.userID}">
            <label for="business-owner">Business Owner</label>
            <input type="text" name="business-owner" required>

            <label for="business-name">Business Name</label>
            <input type="text" name="business-name" required>

            <label for="contact-number">Contact Number</label>
            <input type="tel" name="contact-number" required>

            <label for="address">Address</label>
            <input type="text" name="address" required>

            <button type="submit">Submit Registration</button>
        </form>
    </div>
</body>
</html>
