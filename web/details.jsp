<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html lang="en">
    <head>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <jsp:useBean id="dDAO" class="ModelDAO.ParkDetailDAO" ></jsp:useBean>
        <jsp:useBean id="pDAO" class="ModelDAO.ParkDAO"></jsp:useBean>
        <jsp:useBean id="gDAO" class="ModelDAO.GameDAO"></jsp:useBean>

            <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha384-dfNlPb3SjOOElnFh2PI0tJ0JWw4+x1Ec/0l2fcG6E2tS9MguqnUqsC2ZqTjp1fG" crossorigin="anonymous">
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
            <link rel="stylesheet" type="text/css" href="css_god/details.css"/>
            <title>Entertainment World</title>

        </head>

        <body >


        <c:set var="i" value="0"/>
        <c:set var="parkId" value="${param.id}"></c:set>
        <c:forEach items="${pDAO.allPark}" var="r">
            <c:if test="${parkId == r.parkID}">
                <c:set var="parkName" value="${r.parkName}"></c:set>
                <c:set var="address" value="${r.address}"></c:set>                   
            </c:if>
        </c:forEach>
        <c:forEach items="${dDAO.allParkDetail}" var="c">     
            <c:set var="openrationTime" value="${c.openrationTime}"></c:set>
            <c:set var="id" value="${c.parkID}"/>
            <c:if test="${parkId == id}">

                <div class="bg-red" style="height: 5vh;"></div>
                <nav class="d-flex  bg-white" >

                    <ul class="col-5 justify-content-end ps-0 pe-5 d-flex align-items-center mb-0" >
                        <li><a href="#" class="text-red p-2">Home</a></li>
                        <li><a href="#" class="text-red p-2">Movies</a></li>
                        <li><a href="#" class="text-red p-2">Games</a></li>
                    </ul>
                    <div class="col-2 text-center logo px-4 py-2" style="color: #EE2E24"><c:out value="${parkName}"/></div>
                    <ul class="col-5 justify-content-start ps-5  d-flex align-items-center mb-0">
                        <li><a href="#" class="text-red p-2">Home</a></li>
                        <li><a href="#" class="text-red p-2">Movies</a></li>
                        <li><a href="#" class="text-red p-2">Games</a></li>
                        <a href="booking/ticketType_list.jsp?parkID=${parkId}" class="btn-cart" 
                           style="color: white; background-color: #EE2E24; padding: 0.7vw 2vh; display: inline-block;">Đặt vé</a>

                    </ul>

                </nav>

                <div class="featured-section position-relative " style="background-image: url('${c.image_bg}'); height: 70vh; background-size: cover; background-repeat:no-repeat;">
                    <div class="position-absolute d-flex align-items-center justify-content-around top-100 start-50 translate-middle">
                        <div class="card" style="background-color: #EE2E24; color: white; height: 20vh">
                            <i class="fas fa-film"></i>

                            <div class="game-info">
                                <h3>Asia Park</h3>
                                <strong>Địa chỉ:</strong> <c:out value="${address}"/>

                            </div>
                        </div>

                        <div class="card" style="background-color: #EE2E24; color: white; height: 20vh">
                            <i class="fas fa-film"></i>
                            <h3>Thông báo</h3>
                            <p style="color: white"><strong>Giờ mở cửa:</strong> <c:out value="${openrationTime}"/></p>
                        </div>

                        <c:if test="${sessionScope.acc != null}">
                            <form action="OrderServlet" method="GET">
                                <input type="hidden" name="parkID" value="${parkId}">
                                <input type="hidden" name="userID" value="${sessionScope.acc.userID}">

                            </form>
                        </c:if>
                    </div>

                </div>
                <div style="display: flex; gap: 39.5vw; margin-left: 2.5%; margin-top: 7%; color:#EE2E24">
                    <h1>BẢN ĐỒ</h1>
                    <h1>TRÒ CHƠI</h1>
                </div>       
                <div class="d-flex" style=" background-size:cover; "> 

                    <div class="map-image col-6 p-0" style="position: relative; overflow: hidden; ">

                        <img style="height: 550px; width: 100%; transform: scale(0.9);" src="${c.image3}" alt="Map Image">
                    </div>

                    <div class="games-list col-5 p-0" style="transform: scale(0.9)">

                        <div class="scroll-container"  style="max-height: 550px; border-color: lightgray">
                            <div class="content">

                                <c:forEach items="${gDAO.allGame}" var="c" varStatus="loop">
                                    <c:if test="${c.parkID == param.id}">
                                        <div class="pb-5 mb-3 border-bottom my-card" style="color: #EE2E24; background-color: #F7F7F7; border-radius: 5px;">
                                            <c:set var="GameName" value="${c.gameName}"/>     
                                            <h2 style=""> ${GameName}</h2>
                                            <c:set var="GameDescription" value="${c.getGameDescription()}"/>
                                            <p style="color: black">${GameDescription}</p>
                                            <img src="${c.image}" style="width: 100%; height: 300px" alt="Khu Vui Chơi">
                                        </div>

                                    </c:if>
                                </c:forEach>
                            </div>
                        </div>

                    </div>

                </div>
            </c:if>
        </c:forEach>
        <button id="scrollBtn" onclick="scrollToTop()" style="background-color: #EE2E24; padding: 0.1vw 0.1vh; margin-bottom: 3%;"><span class="material-symbols-outlined">arrow_upward</span></button>   
        <div style="background-color: #EE2E24">
            <div class="logo"></div>
        </div>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <script>
            $(document).ready(function () {
                $(window).scroll(function () {
                    if ($(this).scrollTop() > 100) {
                        $('#scrollBtn').fadeIn();
                    } else {
                        $('#scrollBtn').fadeOut();
                    }
                });
                $('#scrollBtn').click(function () {
                    $('html, body').animate({scrollTop: 0}, 'slow');
                });
            });
            function scrollToTop() {
                $('html, body').animate({scrollTop: 0}, 'slow');
            }
        </script>

<jsp:include page="footer.jsp"></jsp:include>
    </body>

</html>
