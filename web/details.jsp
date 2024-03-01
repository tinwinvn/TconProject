<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html lang="en">
    <head>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <jsp:useBean id="dDAO" class="ModelDAO.ParkDetailDAO" ></jsp:useBean>
        <jsp:useBean id="pDAO" class="ModelDAO.ParkDAO"></jsp:useBean>
        <jsp:useBean id="gDAO" class="ModelDAO.GameDAO"></jsp:useBean>
        <jsp:useBean id="rDAO" class="ModelDAO.RatingDAO"></jsp:useBean>
        <jsp:useBean id="uDAO" class="ModelDAO.UserDAO"></jsp:useBean>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha384-dfNlPb3SjOOElnFh2PI0tJ0JWw4+x1Ec/0l2fcG6E2tS9MguqnUqsC2ZqTjp1fG" crossorigin="anonymous">
            <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
            <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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
                <header class="header">
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
            <section class="rating">
                <div class="tri table-flex">
                <table>
                    <tbody>
                        <tr>
                            <td>
                                
                                <div class="rnb rvl">
                                    <c:set var="numList" value="${rDAO.allRating}" />
                                    <c:forEach var="num" items="${numList}">
                                        <c:if test="${param.id == num.receiveID}">
                                            <c:set var="totalRating" value="${totalRating + num.ratingValue}"/>
                                            <c:set var="size" value="${size + 1}"/>
                                        </c:if>
                                    </c:forEach>
                                    <h3>${totalRating / size}/5.0</h3>
                                </div>
                                <div class="rnrn">
                                    <p class="rars">${size} Reviews</p>
                                </div>
                            </td>
                            <td>
                                <div class="rpb">
                                    <div class="rnpb">
                                        <label>5 <i class="small material-icons">star</i></label>
                                        <div class="ropb">
                                            <div class="ripb" style="width:20%"></div>
                                        </div>
                                        <div class="label">(1)</div>
                                    </div>
                                    <div class="rnpb">
                                        <label>4 <i class="small material-icons">star</i></label>
                                        <div class="ropb">
                                            <div class="ripb" style="width:50%"></div>
                                        </div>
                                        <div class="label">(2)</div>
                                    </div>
                                    <div class="rnpb">
                                        <label>3 <i class="small material-icons">star</i></label>
                                        <div class="ropb">
                                            <div class="ripb" style="width:80%"></div>
                                        </div>
                                        <div class="label">(3)</div>
                                    </div>
                                    <div class="rnpb">
                                        <label>2 <i class="small material-icons">star</i></label>
                                        <div class="ropb">
                                            <div class="ripb" style="width:30%"></div>
                                        </div>
                                        <div class="label">(4)</div>
                                    </div>
                                    <div class="rnpb">
                                        <label>1 <i class="small material-icons">star</i></label>
                                        <div class="ropb">
                                            <div class="ripb" style="width:40%"></div>
                                        </div>
                                        <div class="label">(5)</div>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <c:if test="${sessionScope.acc != null}">
                                <div class="pup-button">
                                    <p>Leave Your Rating Here!</p>
                                    <button id="show-rating">Add rating</button>
                                </div>
                                <section class="all-ratingform">
                                    <section class="rating-body" id="rating-form">
                                        <div class="wrapper" id="rating-wrapper" style="display: none;">
                                            <h3>Lorem ipsum dolor sit amet.</h3>
                                            <form action="RatingServlet" method="post" id="ratingForm">
                                                <div class="ratingvalue">
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
                                                    <button type="submit" name="button" class="btn submit">Submit</button>
                                                    <button type="button" class="btn cancel" id="cancel-btn">Cancel</button>
                                                </div>
                                            </form>
                                        </div>
                                    </section>
                                </section>
                                </c:if>
                            </td>
                        </tr>
                    </tbody>
                </table>
                
                </div>
                <div class="bri">
                    <c:set var="rList" value="${rDAO.allRating}"/>
                    <c:set var="uList" value="${uDAO.allUser}"/>
                    
                    <c:forEach var="list" items="${rList}" varStatus="loop">
                        <c:if test="${param.id == list.receiveID}">
                            <c:set var="userID" value="${list.sendID}" />
                            <c:set var="username" value="${uDAO.getUserById(userID)}"/>
                            
                    <div class="uscm">  
                        <div class="uscm-secs">
                            <div class="us-img">
                                <img src="images/avatar.jpg" />
                            </div>
                            <div class="uscms">
                                <div class="us-name">
                                    <p>${username.fullName}</p>
                                    <div class="dropdown">
                                        <button class="dropbtn" id="dropButton_${loop.index}">&#8942;</button>
                                    <div class="dropdown-content" id="myDropdown_${loop.index}" style="display: none;">
                                        <c:if test="${list.sendID == sessionScope.acc.userID}">
                                            <!-- Button to open modal -->
                                            <button class="update-btn" id="updateButton_${loop.index}">Update</button>
                                            <!-- The Modal -->
                                            <div id="myModal_${loop.index}" class="modal" style="display: none;">
                                              <!-- Modal content -->
                                              <div class="modal-content">
                                                  <span class="close" id="cancel_${loop.index}">&times;</span>
                                                <form id="editForm_${loop.index}" action="UpdateCommentServlet" method="post">
                                                  <input type="hidden" name="ratingId" value="${list.ratingID}">
                                                  <input type="hidden" name="parkID" value="${param.id}">
                                                  <textarea id="ratingText_${loop.index}" name="ratingText" rows="4" cols="50" placeholder="${list.ratingText}"></textarea>
                                                  <button type="submit">Save Changes</button>
                                                </form>
                                              </div>
                                            </div>
                                            <form action="DeleteCommentServlet" method="GET">
                                                <input type="hidden" name="rId" value="${list.ratingID}">
                                                <input type="hidden" name="parkID" value="${param.id}">
                                                <button type="submit"><i class="fas fa-trash-alt"></i>Delete</button>
                                            </form>
                                        </c:if>
                                            <button><i class="fas fa-flag"></i>Report</button>
                                    </div>
                                  </div>
                                </div>
                                <div class="us-cmt">
                                    <p>${list.ratingText}</p>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                        </c:if>
                    </c:forEach>
                </div>
            </section>
                    <script>
                        document.addEventListener("DOMContentLoaded", function() {
                        const updateButtons = document.querySelectorAll(".update-btn");
                        const updateModals = document.querySelectorAll(".modal");
                        const cancelButtons = document.querySelectorAll(".close");

                        updateButtons.forEach((updateButton, index) => {
                            const updateModal = updateModals[index];
                            const cancelButton = cancelButtons[index];
                            
                            updateButton.addEventListener("click", function() {
                                updateModal.style.display = "block";
                            });
                            
                            cancelButton.addEventListener("click", function() {
                               updateModal.style.display = "none"; 
                            });
                        });

                        window.onclick = function(event) {
                            updateModals.forEach(updateModal => {
                                if (!event.target.matches('.update-btn') && !updateModal.contains(event.target)) {
                                    updateModal.style.display = "none";
                                }
                            });
                        }
                    });

                        
                    </script>
                    <style>
                        /* Modal */
                        .modal {
                          position: fixed;
                          z-index: 1;
                          top: 50%;
                          left: 50%;
                          transform: translate(-50%, -50%);
                          width: 100%;
                          height: 100%;
                          overflow: auto;
                          background-color: rgba(0,0,0,0.4);
                        }

                        /* Modal Content */
                        .modal-content {
                          background-color: #fefefe;
                          margin: 20% auto;
                          padding: 20px;
                          border: 1px solid #888;
                          width: 80%;
                        }

                        /* Close Button */
                        .close {
                          color: #aaa;
                          float: right;
                          font-size: 28px;
                          font-weight: bold;
                        }

                        .close:hover,
                        .close:focus {
                          color: black;
                          text-decoration: none;
                          cursor: pointer;
                        }

                        /* Textarea and Button inside Modal Content */
                        .modal-content textarea {
                          width: 100%;
                          padding: 10px;
                          margin-bottom: 10px;
                        }

                        .modal-content button {
                          background-color: #4CAF50;
                          color: white;
                          padding: 10px 15px;
                          border: none;
                          border-radius: 5px;
                          cursor: pointer;
                        }

                        .modal-content button:hover {
                          background-color: #45a049;
                        }
                    </style>
                    
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
            <script>
                document.addEventListener("DOMContentLoaded", function() {
                const pupButton = document.getElementById("show-rating");
                const ratingWrapper = document.getElementById("rating-wrapper");
                const cancelButton = document.getElementById("cancel-btn");

                pupButton.addEventListener("click", function() {
                    ratingWrapper.style.display = "block";
                });

                cancelButton.addEventListener("click", function() {
                    ratingWrapper.style.display = "none";
                });
            });
            </script>
            <script>
                        document.addEventListener("DOMContentLoaded", function() {
                        const dropButtons = document.querySelectorAll(".dropbtn");
                        const dropdowns = document.querySelectorAll(".dropdown-content");

                        dropButtons.forEach((dropButton, index) => {
                            const dropdown = dropdowns[index];
                            dropButton.addEventListener("click", function() {
                                dropdown.style.display = dropdown.style.display === "block" ? "none" : "block";
                            });
                        });

                        window.onclick = function(event) {
                            dropdowns.forEach(dropdown => {
                                if (!event.target.matches('.dropbtn') && !dropdown.contains(event.target)) {
                                    dropdown.style.display = "none";
                                }
                            });
                        }
                    });
            </script>

            <header style="text-align: center;">
                <div class="logo"><c:out value=""/></div>
            </header>

            <style>
                            /* Your existing CSS */
                            .rating {
                                color: #000;
                                box-sizing: border-box;
                                background-color: #ffffff;
                            }
                            .ratingvalue {
                                display: flex;
                                justify-content: center;
                                align-items: center;
                                grid-gap: .5rem;
                                font-size: 2rem;
                                color: #FFBD13;
                                margin-bottom: 2rem;
                            }
                            .rating table {
                                width: 100%;
                                margin: 0;
                                border-collapse: collapse;
                                border-spacing: 0;
                                color:#cccccc;
                                margin-bottom:.625rem;
                            }
                            .rating table,
                            .rating td{
                                font-size: .8125rem;
                                text-align: center;
                            }
                            
                            .rating td{
                                padding: 1rem;
                                width:33.3%;
                            }
                            
                            .tri {
                                border-bottom: 1px solid #cccccc;
                                padding: 12px;
                            }
                            
                            .rnb h3 {
                                color: #FFBD13;
                                font-size: 2.4rem;
                            }
                            
                            .tri .pdt-rate {
                                height: 40px;
                                display: flex;
                                justify-content: center;
                                align-items: center;
                                flex-direction: column;
                            }
                            
                            .rating-stars {
                                position: relative;
                                vertical-align:baseline;
                                color: #cccccc;
                                line-height: 10px;
                                float: left;
                            }
                            
                            .grey-stars{
                                height: 100%
                            }
                            
                            .filled-stars {
                                position: absolute;
                                left: 0;
                                top: 0;
                                height: 100%;
                                overflow: hidden;
                                color: #FFBD13;
                            }
                            .rpb {
                                width: 100%;
                                display: flex;
                                flex-direction: column;
                                align-items: center;
                            }
                            
                            .rnpb{
                                display: flex;
                                width: 100%;
                            }
                            .rnpb label:first-child {
                                margin-right: 5px;
                                margin-top: -2px;
                            }
                            
                            .rnpb label:last-child {
                                margin-left: 3px;
                                margin-top: -2px;
                            }
                            
                            .rnpb label i {
                                color: #FFBD13;
                            }
                            
                            .ropb {
                                height: 10px;
                                width: 75%;
                                background-color: #f1f1f1;
                                position: relative;
                                margin-bottom: 10px;
                            }
                            
                            .ripb {
                                height: 100%;
                                background-color: #FFBD13;
                                border: 0.5px solid #cccccc;
                            }
                            .pup-button p {
                                
                            }
                            .pup-button button {
                                width: 220px;
                                height: 40px;
                                background-color: #007BFF;
                                color: #FFF;
                                border: 0;
                                outline: none;
                                font-size: 1.2rem;
                                box-shadow: 0px 2px 2px #007BFF;
                                cursor: pointer;
                            }
                            
                            .pup-button:hover{
                                opacity: .9;
                            }
                            .bri {
                                overflow: hidden;
                                height: 100%;
                            }
                            .uscm-secs {
                                margin-left: 30px;
                                padding: 10px;
                                display: flex;
                                width: 100%;
                                height: 100%;
                                border-bottom: 1px solid #cccccc;
                            }
                            .us-img {
                                display: flex;
                                justify-content: center;
                                align-items: center;
                                width: 60px;
                                height: 60px;
                                line-height: 45px;
                                border-radius: 50%;
                                overflow: hidden;
                                margin-right: 10px;
                            }
                            
                            .us-img img {
                                width: 100%;
                                height: 100%;
                                object-fit: cover;
                                object-position: center;
                            }
                            
                            .uscms {
                                display: flex;
                                flex-direction: column;
                                width: 90%;
                                text-align: left;
                            }
                            
                            .us-cmt p {
                                font-size: .9rem;
                                padding: 10px 10px 10px 0;
                                color: #333;
                                font-weight: 500;
                                font-family: raleway;
                                margin: 0;
                            }
                            
                            .us-name{
                                display: flex;
                                justify-content: space-between;
                                flex-grow: 1;
                                font-size: 18px;
                            }
                            
                            .dropbtn {
                                color: black;
                                padding: 0;
                                font-size: 24px;
                                border: none; /* Remove border */
                                background-color: transparent; /* Remove background color */
                                cursor: pointer;
                            }

                            /* Style the dropdown content (hidden by default) */
                            .dropdown-content {
                                display: none;
                                position: absolute;
                                background-color: #f9f9f9;
                                min-width: 160px;
                                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                                
                                z-index: 1;
                            }

                            /* Style the buttons inside the dropdown */
                            .dropdown-content button {
                                background-color: inherit;
                                color: black;
                                padding: 12px 16px;
                                text-decoration: none;
                                display: block;
                                border: none;
                                width: 100%;
                                text-align: left;
                                cursor: pointer;
                            }

                            /* Change color of dropdown links on hover */
                            .dropdown-content button:hover {
                                background-color: #f1f1f1;
                            }
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
                        
                

                        :root {
                            --yellow: #FFBD13;
                            --blue: #4383FF;
                            --blue-d-1: #3278FF;
                            --light: #F5F5F5;
                            --grey: #AAA;
                            --white: #FFF;
                            --shadow: 8px 8px 30px rgba(0,0,0,.05);
                            }
                        .all-ratingform {
                            margin: 0;
                            padding: 0;
                            box-sizing: border-box;
                            font-family: 'Poppins', sans-serif;
                        }
                        .rating-body {
                            display: flex;
                            justify-content: center;
                            align-items: center;
                            padding: 1rem;
                        }
                        .wrapper {
                                background: var(--white);
                                padding: 2rem;
                                max-width: 576px;
                                width: 100%;
                                border-radius: .75rem;
                                box-shadow: var(--shadow);
                                text-align: center;
                                position: fixed;
                                top: 50%;
                                left: 50%;
                                transform: translate(-50%, -50%);
                        }
                        .btn cancel {
                            
                        }
                        .wrapper .active {
                            
                        }
                        
                       
                        
                        .wrapper h3 {
                                font-size: 1.5rem;
                                font-weight: 600;
                                margin-bottom: 1rem;
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
                                background: var(--light);
                                padding: 1rem;
                                border-radius: .5rem;
                                border: none;
                                outline: none;
                                resize: none;
                                margin-bottom: .5rem;
                                width: 90%;
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
                                background: var(--blue);
                                color: var(--white);
                        }
                        .btn-group .btn.submit:hover {
                                background: var(--blue-d-1);
                        }
                        .btn-group .btn.cancel {
                                background: var(--white);
                                color: var(--blue);
                        }
                        .btn-group .btn.cancel:hover {
                                background: var(--light);
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
