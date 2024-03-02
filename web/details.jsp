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

            <title>Entertainment World</title>
            <style>
                .bg-white {
                    background: white;
                }
                .bg-red {
                    background: rgb(238, 46, 36);
                }
                .text-red {
                    color: rgb(238, 46, 36);
                }

                .text-black {
                    color: black;
                }
            </style>
        </head>

        <body >
            <div class="bg-red" style="height: 5vh"></div>
            <div >
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

<!--                    <div class="logo"><c:out value="${parkName}"/></div>
                    <nav>
                        <ul>
                            <li><a href="#">Home</a></li>
                            <li><a href="#">Movies</a></li>
                            <li><a href="#">Games</a></li>
                            <li><a href="#">Events</a></li>
                            <li><a href="#">About Us</a></li>
                        </ul>
                    </nav>-->
                    <nav class="d-flex justify-content-evenly align-items-center bg-white">

                        <ul class="d-flex align-items-center mb-0" >
                            <li><a href="#" class="text-red p-2">Home</a></li>
                            <li><a href="#" class="text-red p-2">Movies</a></li>
                            <li><a href="#" class="text-red p-2">Games</a></li>
                        </ul>
                        <div class="logo text-black p-2"><c:out value="${parkName}"/></div>
                        <ul class="align-items-center mb-0">
                            <li><a href="#" class="text-red p-2">Home</a></li>
                            <li><a href="#" class="text-red p-2">Movies</a></li>
                            <li><a href="#" class="text-red p-2">Games</a></li>
                        </ul>

                    </nav>
                </header>

                <section class="featured-section position-relative " style="background-image: url('${c.image_bg}'); height: 70vh; background-size: cover; background-repeat:no-repeat;">
                    <div class="position-absolute d-flex align-items-center justify-content-around top-100 start-50 translate-middle ">
                        <div class="card" style="">
                            <i class="fas fa-film"></i>
                            <h3>Mô tả</h3>
                            <p>Description of Movie 1. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        </div>

                        <div class="card" style="">
                            <i class="fas fa-film"></i>
                            <h3>Thông báo</h3>
                            <p>Description of Movie 2. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        </div>
                        <!-- Add more cards as needed -->
                        <c:if test="${sessionScope.acc != null}">
                                <a href="booking/ticketType_list.jsp?parkID=${parkId}" class="cta-button">Đặt vé</a>
                        </c:if>
                    </div>
                </section>
                <header>
                    <div class="logo">Kính chào quý khách</div>
                </header>
                <section class="games-section" style="background-image: url('${c.image2}');">
                    <div class="content-wrapper" style="text-align: left;">
                        <div class="cta-button">
                            <h2>Thông tin</h2>
                            <div class="game-info">
                                <h3>${parkName}</h3>
                                <strong>Địa chỉ:</strong> <c:out value="${address}"/>
                                <p><strong>Giờ mở cửa:</strong> <c:out value="${openrationTime}"/></p>
                            </div>
                        </div>
                    </div>
                </section>
                <header>
                    <div class="logo">Các loại trò chơi</div>
                </header>

                <section class="row" style="background-image: url('${c.image_bg}'); background-size:cover;">     
                    <div class="map-image col-6 p-0" style="">
                        <img style="height: 100%; width: 100%" src="${c.image3}" alt="Map Image">
                    </div>
                    <div class="games-list col-6 p-0 ">
                        <div class="scroll-container">
                            <div class="content">
                                <c:forEach items="${gDAO.allGame}" var="c">
                                    <c:if test="${c.parkID == param.id}">
                                        <session>
                                            <c:set var="GameName" value="${c.gameName}"/>
                                            <h2>${GameName}</h2>
                                            <c:set var="GameDescription" value="${c.getGameDescription()}"/>
                                            <p>${GameDescription}</p>
                                            <img src="${c.image}" style="width: 500px; height: 300px" alt="Khu Vui Chơi">
                                        </session>
                                    </c:if>
                                </c:forEach>

                            </div>
                        </div>

                        <button id="scrollBtn" onclick="scrollToTop()"><span class="material-symbols-outlined">arrow_upward</span></button>                     
                        <style>
                            /* CSS để giảm chiều rộng của thanh cuộn */
                            .scroll-container::-webkit-scrollbar {
                                width: 2px; /* Đặt chiều rộng của thanh cuộn */
                                border-radius: 10px;
                            }

                            /* CSS để tùy chỉnh màu sắc của thanh cuộn */
                            .scroll-container::-webkit-scrollbar-thumb {
                                background-color: #007BFF; /* Đặt màu sắc cho phần thanh cuộn */
                                border-radius: 10px;
                            }

                            /* CSS để tùy chỉnh màu sắc của nền của thanh cuộn */
                            .scroll-container::-webkit-scrollbar-track {
                                background-color: #ccc; /* Đặt màu sắc cho phần nền của thanh cuộn */
                                border-radius: 10px;
                            }

                            .scroll-container {
                                /*width: 575px;*/
                                height: 557px;
                                overflow-y: scroll;
                                border: 2px solid #ccc;
                                padding: 20px;
                                background-color: #000;
                                color: #fff;
                                border-radius: 10px;
                            }

                            #scrollBtn {
                                display: none;
                                position: fixed;
                                bottom: 20px;
                                right: 20px;
                                background-color: #007BFF;
                                color: #fff;
                                border: none;
                                border-radius: 5px;
                                padding: 10px 20px;
                                cursor: pointer;
                                font-size: 10px;
                            }

                            #scrollBtn:hover {
                                background-color: #0056b3;
                            }

                        </style>
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
                    </div>
                </section>

                <header style="text-align: center;">
                    <div class="logo"><c:out value=""/></div>
                </header>



                <style>


                    .events-section {
                        background-image: url('images_details/i.jpg');
                        background-size: cover;
                        background-position: center;
                        color: #fff;
                        text-align: center;
                    }

                    .events-section h2 {
                        font-size: 2.5em;
                        margin-bottom: 20px;
                    }

                    .events-content {
                        display: flex;
                        justify-content: space-around;
                        align-items: center;
                        flex-wrap: wrap;
                    }



                    .games-list {
                        flex-grow: 1;

                        text-align: left;
                    }

                    .scroll-bar {
                        overflow-x: auto;
                        white-space: nowrap;
                        margin-top: 20px;
                    }

                    body {
                        font-family: Arial, sans-serif;
                        margin: 0;
                        padding: 0;
                        box-sizing: border-box;
                    }

                    header {
                        background-color: #333;
                        color: white;
                        padding: 30px 20px;

                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                    }

                    .logo {
                        font-size: 24px;
                        font-weight: bold;
                        border-radius: 5px;
                    }

                    nav ul {
                        list-style: none;
                        display: flex;
                    }

                    nav li {
                        margin-right: 20px;
                    }

                    nav a {
                        text-decoration: none;
                        color: white;
                        font-weight: bold;
                        border-radius: 5px;
                    }

                    .hero-section {
                        background-image: url('background.jpg');
                        background-size: cover;
                        background-position: center;
                        color: white;
                        text-align: center;
                        padding: 100px 20px;

                    }

                    .cta-button {
                        display: inline-block;
                        padding: 10px 20px;
                        background-color: #ff6600;
                        color: white;
                        text-decoration: none;
                        font-weight: bold;
                        border-radius: 5px;
                        margin-top: 20px;
                    }

                    .featured-section,
                    .games-section
                    {
                        padding: 40px 20px;
                    }

                    footer {
                        background-color: #333;
                        color: white;
                        text-align: center;
                        padding: 10px 0;
                        position: fixed;
                        bottom: 0;
                        width: 100%;
                    }

                    body {
                        margin: 0;
                        padding: 0;
                        font-family: 'Arial', sans-serif;
                    }

                    /*                    .featured-section {
                                            position: relative;
                                            background-image: url('/${c.image_bg}');
                                            background-size: cover;
                                            color: #fff;
                                            text-align: center;
                                            padding: 100px 0;
                                            border-radius: 10px;
                                        }*/

                    .featured-section h2 {
                        font-size: 3em;
                        margin-bottom: 20px;
                    }


                    .card {
                        height: 50%;
                        background: rgba(255, 255, 255, 0.8);
                        border-radius: 10px;
                        padding: 20px;
                        width: 35vw;
                        overflow: hidden;
                        transition: transform 0.3s ease-in-out;
                    }

                    .card:hover {
                        transform: scale(1.05);
                    }

                    .card i {
                        font-size: 2em;
                        color: #3498db;
                        margin-bottom: 10px;
                    }

                    .card h3 {
                        font-size: 1.5em;
                        margin-bottom: 10px;
                    }

                    .card p {
                        font-size: 1em;
                        color: #333;
                    }

                </style>
            </c:if>
        </c:forEach>

</html>
