<%-- 
    Document   : request
    Created on : Mar 9, 2024, 3:10:00 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <h2>Submit Your Request</h2>
            <form action="submitRequest" method="post">
                <div class="form-group">
                    <label for="title">Title:</label>
                    <input type="text" id="title" name="title" required>
                </div>
                <div class="form-group">
                    <label for="content">Content:</label>
                    <textarea id="content" name="content" rows="5" required></textarea>
                </div>
                <div class="form-group">
                    <input type="submit" value="Submit">
                </div>
            </form>
        </div>
    </body>
</html>
