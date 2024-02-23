<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html lang="en">
    <head>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <jsp:useBean id="dDAO" class="ModelDAO.ParkDetailDAO" ></jsp:useBean>
        <jsp:useBean id="pDAO" class="ModelDAO.ParkDAO"></jsp:useBean>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha384-dfNlPb3SjOOElnFh2PI0tJ0JWw4+x1Ec/0l2fcG6E2tS9MguqnUqsC2ZqTjp1fG" crossorigin="anonymous">
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Entertainment World</title>
            <link rel="stylesheet" href="styles.css">
        </head>

        <body>
            <header>
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

                    <div class="logo"><c:out value="${parkName}"/></div>
                    <nav>
                        <ul>
                            <li><a href="#">Home</a></li>
                            <li><a href="#">Movies</a></li>
                            <li><a href="#">Games</a></li>
                            <li><a href="#">Events</a></li>
                            <li><a href="#">About Us</a></li>
                        </ul>
                    </nav>
                </header>

                <section class="featured-section">
                    <div class="info-card" style="color: orange">
                        <div class="card" style="margin-left: -200px;">
                            <i class="fas fa-film"></i>
                            <h3>Mô tả</h3>
                            <p>Description of Movie 1. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        </div>

                        <div class="card" style="margin-right: -200px;">
                            <i class="fas fa-film"></i>
                            <h3>Thông báo</h3>
                            <p>Description of Movie 2. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        </div>
                        <!-- Add more cards as needed -->
                    </div>
                    <c:if test="${sessionScope.acc != null}">
                        <form action="OrderServlet" method="GET">
                            <input type="hidden" name="parkID" value="${parkId}">
                            <input type="hidden" name="userID" value="${sessionScope.acc.userID}">
                            <button type="submit" class="cta-button">Đặt vé</button>
                        </form>
                    </c:if>
                    
                </section>
                <header>
                    <div class="logo">Kính chào quý khách</div>
                </header>
                <section class="games-section" style="background-image: url('${c.image2}'); border-radius: 10px;">
                    <div class="content-wrapper" style="text-align: left;">
                        <div class="cta-button">
                            <h2>Thông tin</h2>
                            <div class="game-info">
                                <h3>Asia Park</h3>
                                <strong>Địa chỉ:</strong> <c:out value="${address}"/>
                                <p><strong>Giờ mở cửa:</strong> <c:out value="${openrationTime}"/></p>
                            </div>
                        </div>
                    </div>
                </section>
                <header>
                    <div class="logo">Các loại trò chơi</div>
                </header>
                            
            <body class="events-section" style="background-image: url('${c.image_bg}');">     
                <div class="events-content">
                    <div class="map-image">
                        <img style="width: 860px; height: 600px; border-radius: 10px;" src="${c.image3}" alt="Map Image">
                    </div>
                    <div class="games-list">
                        <div class="scroll-container">
                            <div class="content">
                                
                                <session>
                                <h2>Thiên đường vui chơi trong nhà</h2>
                                <p>Khu trò chơi trong nhà được chia làm 4 khu gồm:

                                    Soft Play: rộng 400m2 dành riêng cho trẻ em với các trò chơi vận động, trí tuệ, khám phá giúp kích thích phát triển trí não và rèn luyện sức khỏe cho bé.
                                    Thế giới game xu (Redemption Game): kinh điển với những trò chơi thử thách sự nhanh nhẹn, tư duy logic dành cho mọi lứa tuổi.
                                    Khu vực game bắn súng Sun Blaster: quy mô lớn tới 250m2, phù hợp với các nhóm bạn bè, gia đình.
                                    Khu trò chơi vận động Carnival Game: dành cho tất cả lứa tuổi, đặc biệt phù hợp với thanh thiếu niên.</p>
                                <img src="images/a.jpg" style="width: 500px; height: 300px" alt="Khu Vui Chơi">
                                </session>
                                <session>
                                <h2>Thiên đường vui chơi trong nhà</h2>
                                <p>Khu trò chơi trong nhà được chia làm 4 khu gồm:

                                    Soft Play: rộng 400m2 dành riêng cho trẻ em với các trò chơi vận động, trí tuệ, khám phá giúp kích thích phát triển trí não và rèn luyện sức khỏe cho bé.
                                    Thế giới game xu (Redemption Game): kinh điển với những trò chơi thử thách sự nhanh nhẹn, tư duy logic dành cho mọi lứa tuổi.
                                    Khu vực game bắn súng Sun Blaster: quy mô lớn tới 250m2, phù hợp với các nhóm bạn bè, gia đình.
                                    Khu trò chơi vận động Carnival Game: dành cho tất cả lứa tuổi, đặc biệt phù hợp với thanh thiếu niên.</p>
                                <img src="images/a.jpg" style="width: 500px; height: 300px" alt="Khu Vui Chơi">
                                </session>

                            </div>
                        </div>

                        <button id="scrollBtn" onclick="scrollToTop()">Scroll To Top</button>                     
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
                                width: 575px;
                                height: 560px;
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
                </div>
            </body>
           
            <header style="text-align: center;">
                <div class="logo"><c:out value=""/></div>
            </header>



            <style>
                

                .events-section {
                    background-image: url('images_details/i.jpg');
                    background-size: cover;
                    background-position: center;
                    color: #fff;
                    padding: 40px 20px;
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
                    border-radius: 10px;
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
                .games-section,
                .events-section {
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

                .featured-section {
                    position: relative;
                    background-image: url('${c.image1}');
                    background-size: cover;
                    color: #fff;
                    text-align: center;
                    padding: 100px 0;
                    border-radius: 10px;
                }

                .featured-section h2 {
                    font-size: 3em;
                    margin-bottom: 20px;
                }

                .info-card {
                    display: flex;
                    justify-content: space-around;
                    flex-wrap: wrap;
                    margin-top: 30px;

                }

                .info-card .card {
                    background: rgba(255, 255, 255, 0.8);
                    border-radius: 10px;
                    padding: 20px;
                    margin: 20px;
                    width: 300px;
                    overflow: hidden;
                    transition: transform 0.3s ease-in-out;
                }

                .info-card .card:hover {
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
