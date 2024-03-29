<%-- 
    Document   : nav
    Created on : Mar 4, 2024, 10:10:01 PM
    Author     : Nguyen Nhu Loc
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha384-dfNlPb3SjOOElnFh2PI0tJ0JWw4+x1Ec/0l2fcG6E2tS9MguqnUqsC2ZqTjp1fG" crossorigin="anonymous">
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
            <link rel="stylesheet" type="text/css" href="css_god/details.css"/>
    </head>
    <body>
    <div class="bg-red" style="height: 3vh;"></div>
    <nav class="d-flex bg-white">
        <jsp:useBean id="parkDAO" class="ModelDAO.ParkDAO"></jsp:useBean>
        <c:set var="parkName" value="${parkDAO.getParkNameByParkID(param.parkID)}"></c:set>
        <ul class="col-5 justify-content-end ps-0 pe-5 d-flex align-items-center mb-0">
            <li><a href="../index.jsp" class="text-red p-2" style="padding: 0.5rem;">Trang Chủ</a></li>
            <li><a href="../introduction.jsp" class="text-red p-2" style="padding: 0.5rem;">Giới Thiệu</a></li>
        </ul>
        <div class="col-2 text-center logo px-4 py-2" style="color: #EE2E24; padding: 0.5rem 1rem;"><c:out value="${parkName}"/></div>
        <ul class="col-5 justify-content-start ps-5 d-flex align-items-center mb-0">
            <li><a href="#" class="text-red p-2" style="padding: 0.5rem;">Trải nghiệm</a></li>
            <li><a href="#" class="text-red p-2" style="padding: 0.5rem;">Liên hệ</a></li>
        </ul>
    </nav>
</body>

    
    
</html>
