<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Supplier Details</title>
    <link rel="stylesheet" href="supplier_styles.css">
</head>
<body>
    <div class="container">
        <h1>Supplier Details</h1>
        <div>
            <label for="business-owner">Business Owner:</label>
            <span>${businessOwner}</span>
        </div>
        <div>
            <label for="business-name">Business Name:</label>
            <span>${businessName}</span>
        </div>
        <div>
            <label for="contact-number">Contact Number:</label>
            <span>${contactNumber}</span>
        </div>
        <div>
            <label for="address">Address:</label>
            <span>${address}</span>
        </div>
    </div>
</body>
</html>
