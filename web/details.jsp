<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html lang="en">
    <head>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <jsp:useBean id="dDAO" class="ModelDAO.DetailsDAO" ></jsp:useBean>
        <jsp:useBean id="pDAO" class="ModelDAO.PlacesDAO"></jsp:useBean>
        <jsp:useBean id="rating" class="ModelDAO.RatingDAO"></jsp:useBean>
        <jsp:useBean id="user" class="ModelDAO.UserDAO"></jsp:useBean>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha384-dfNlPb3SjOOElnFh2PI0tJ0JWw4+x1Ec/0l2fcG6E2tS9MguqnUqsC2ZqTjp1fG" crossorigin="anonymous">
            <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
            <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Entertainment World</title>
            <link rel="stylesheet" href="styles.css">
        </head>

        <body>
            <header class="header">
            <c:forEach items="${dDAO.allDetails}" var="c"> 
                <c:set var="parkId" value="${param.id}"></c:set>
                <c:set var="id" value="${c.place_id}"/>
                <c:if test="${parkId == id}">

                    <div class="logo"><c:out value="${c.name}"/></div>
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

                    <a href="#" class="cta-button">Đặt vé</a>
                </section>
                <header class="header">
                    <div class="logo">Kính chào quý khách</div>
                </header>
                <section class="games-section" style="background-image: url('${c.image2}'); border-radius: 10px;">
                    <div class="content-wrapper" style="text-align: left;">
                        <div class="cta-button">
                            <h2>Thông tin</h2>
                            <div class="game-info">
                                <h3>Asia Park</h3>
                                <strong>Địa chỉ:</strong> <c:out value="${c.address}"/>
                                <p><strong>Giờ mở cửa:</strong> <c:out value="${c.time}"/></p>
                                <p><strong>Giá vé:</strong> <c:out value="${c.price}"/></p>
                            </div>
                        </div>
                    </div>
                </section>
                <header class="header">
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
                    <div class="comment">         
          <session class="header comment-header">
                
                <c:if test="${sessionScope.acc != null}">
                <div class="wrapper">
                        <h3>Your rating</h3>

                            <form action="RatingServlet" method="post">
                                <div class="rating">
                                        <input type="number" name="star" hidden>
                                        <i class='bx bx-star star' style="--i: 0;"></i>
                                        <i class='bx bx-star star' style="--i: 1;"></i>
                                        <i class='bx bx-star star' style="--i: 2;"></i>
                                        <i class='bx bx-star star' style="--i: 3;"></i>
                                        <i class='bx bx-star star' style="--i: 4;"></i>
                                </div>
                                <textarea name="message" cols="30" rows="5" placeholder="Your opinion..."></textarea>
                                <div class="btn-group">
                                    <input type="hidden" name="userIdC" value="${sessionScope.acc.userID}">
                                    <input type="hidden" name="receiveId" value="${param.id}">
                                    <input type="hidden" name="parkID" value="${param.id}">
                                    <button type="submit" name="button" class="btn submit">Post Comment</button>
                                </div>
                        </form>
                </div>
                </c:if>
                
                <div class="testimonial-box-container">
                <div class="testimonial-box">
                    <c:set var="rList" value="${rating.allRating}" />
                    <c:set var="uList" value="${user.allUser}"/>
                    
                    <c:forEach var="list" items="${rList}">
                        <c:if test="${param.id == list.receiveID}">
                        <c:set var="userID" value="${list.sendID}" />
                        <c:set var="username" value="${user.getUserById(userID)}" />
                        
                    <div class="box-top">
                        <div class="profile">
                            <div class="profile-img">
                                <img src="images/avatar.jpg" />
                            </div>
                            <div class="name-user">
                                <strong>${username.fullName}</strong>
                            </div>
                        </div>
                        <div class="rating-star">
                            <strong>${list.ratingValue}</strong>
                        </div> 

                    </div>
                    <div class="client-comment">
                        <p>${list.ratingText}</p>
                    </div>
                    
                    <div class="dropdown">
                        <span class="dropbtn">&#8942;</span>
                        <div class="dropdown-content">
                            <c:if test="${list.sendID == sessionScope.acc.userID}">
                                <a href="#"><i class="fas fa-edit"></i> Update</a>
                                <form action="DeleteCommentServlet" method="GET">
                                    <input type="hidden" name="rId" value="${list.ratingID}">
                                    <input type="hidden" name="parkID" value="${param.id}">
                                    <button type="submit"><i class="fas fa-trash-alt">Delete</i></button>
                                </form>
                            </c:if>
                                <a href="#"><i class="fas fa-flag"></i> Report</a>
                        </div>
                      </div>
                    </c:if>
                    </c:forEach>
                    
                    </div>
                    </div>
                         
            </session>
</div>

                    
                    <script>
                        const allStar = document.querySelectorAll('.rating .star')
                        const ratingValue = document.querySelector('.rating input')

                        allStar.forEach((item, idx)=> {
                                item.addEventListener('click', function () {
                                        let click = 0
                                        ratingValue.value = idx + 1

                                        allStar.forEach(i=> {
                                                i.classList.replace('bxs-star', 'bx-star')
                                                i.classList.remove('active')
                                        })
                                        for(let i=0; i<allStar.length; i++) {
                                                if(i <= idx) {
                                                        allStar[i].classList.replace('bx-star', 'bxs-star')
                                                        allStar[i].classList.add('active')
                                                } else {
                                                        allStar[i].style.setProperty('--i', click)
                                                        click++
                                                }
                                        }
                                })
                        })
                    </script>
            <header class="header" style="text-align: center;">
                <div class="logo"><c:out value="${c.email}"/></div>
            </header>

            <style>
                /* Style the dropdown content */
                        .dropdown-content {
                          display: none;
                          position: absolute;
                          background-color: #f9f9f9;
                          min-width: 160px;
                          box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                          z-index: 1;
                        }

                        /* Style the dots */
                        .dropbtn {
                          font-size: 24px;
                          cursor: pointer;
                        }

                        /* Style the links inside the dropdown */
                        .dropdown-content a {
                          color: black;
                          padding: 12px 16px;
                          text-decoration: none;
                          display: block;
                        }

                        /* Change color of dropdown links on hover */
                        .dropdown-content a:hover {background-color: #f1f1f1;}

                        /* Show the dropdown menu on hover */
                        .dropdown:hover .dropdown-content {
                          display: block;
                        }

                        /* Position the dropdown content */
                        .dropdown-content a i {
                          margin-right: 5px;
                        }

                        .comment-header {
                                display: flex;
                                flex-direction: column; /* Stacking items vertically */
                                justify-content: center; /* Centering items vertically */
                                align-items: center; /* Centering items horizontally */
                        }
                        .comment {
                            background: #F5F5F5;
                            align-items: center;
                        }
                        .dropdown {
                            display: flex;
                            color: #000;
                            justify-content: flex-end;
                        }
                        
                        .wrapper {
                                background: #FFF;
                                padding: 2rem;
                                max-width: 576px;
                                width: 100%;
                                border-radius: .75rem;
                                box-shadow: 8px 8px 30px rgba(0,0,0,.05);
                                text-align: center;
                        }
                        .wrapper h3 {
                                font-size: 1.5rem;
                                font-weight: 600;
                                margin-bottom: 1rem;
                        }
                        .rating {
                                display: flex;
                                justify-content: center;
                                align-items: center;
                                grid-gap: .5rem;
                                font-size: 2rem;
                                color: #FFBD13;
                                margin-bottom: 2rem;
                        }
                        .rating .star {
                                cursor: pointer;
                        }
                        .rating .star.active {
                                opacity: 0;
                                animation: animate .5s calc(var(--i) * .1s) ease-in-out forwards;
                        }

                        @keyframes animate {
                                0% {
                                        opacity: 0;
                                        transform: scale(1);
                                }
                                50% {
                                        opacity: 1;
                                        transform: scale(1.2);
                                }
                                100% {
                                        opacity: 1;
                                        transform: scale(1);
                                }
                        }


                        .rating .star:hover {
                                transform: scale(1.1);
                        }
                        textarea {
                                width: 100%;
                                background: #F5F5F5;
                                padding: 1rem;
                                border-radius: .5rem;
                                border: none;
                                outline: none;
                                resize: none;
                                margin-bottom: .5rem;
                        }
                        .btn-group {
                                display: flex;
                                grid-gap: .5rem;
                                align-items: center;
                        }
                        .btn-group .btn {
                                padding: .75rem 1rem;
                                border-radius: .5rem;
                                border: none;
                                outline: none;
                                cursor: pointer;
                                font-size: .875rem;
                                font-weight: 500;
                        }
                        .btn-group .btn.submit {
                                background: #4383FF;
                                color: #FFF;
                        }
                        .btn-group .btn.submit:hover {
                                background: #3278FF;
                        }
                        .btn-group .btn.cancel {
                                background: #FFF;
                                color: #4383FF;
                        }
                        .btn-group .btn.cancel:hover {
                                background: #F5F5F5;
                        }


                        .testimonial-box-container {
                            justify-content: center;
                            align-items: center;
                            flex-wrap: wrap;
                            width: 100%;
                        }

                        .testimonial-box {
                            width: 500px;
                            box-shadow: 2px 2px 30px #000;
                            background-color: #FFF;
                            padding: 20px;
                            margin: 15px;
                            cursor: pointer;
                        }

                        .profile-img {
                            width: 50px;
                            height: 50px;
                            border-radius: 50%;
                            overflow: hidden;
                            margin-right: 10px;
                        }

                        .profile-img img {
                            width: 100%;
                            height: 100%;
                            object-fit: cover;
                            object-position: center;
                        }

                        .profile {
                            display: flex;
                            align-items: center;
                        }

                        .name-user {
                            display: flex;
                            flex-direction: column;
                        }

                        .name-user strong{
                            color: #44525f;
                            font-size: 1.1rem;
                            letter-spacing: 0.5px;
                        }

                        .rating-star {
                            color: #FFBD13;
                        }

                        .box-top{
                            display: flex;
                            justify-content: space-between;
                            align-items: center;
                            margin-bottom: 20px;
                        }

                        .client-comment p {
                            font-size: 0.9rem;
                            color:#000;
                            margin-bottom: 10px;
                        }

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

                h3 {
                    color: #000;
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

            </body>
           
                
                
                
               
            
</html>
