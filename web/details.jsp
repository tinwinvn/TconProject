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
                        <li><a href="index.jsp" class="text-red p-2">Trang Chủ</a></li>
                        <li><a href="introduction.jsp" class="text-red p-2">Giới thiệu</a></li>
                        <li><a href="#" class="text-red p-2">Trải Nghiệm</a></li>
                    </ul>
                    <div class="col-2 text-center logo px-4 py-2" style="color: #EE2E24"><c:out value="${parkName}"/></div>
                    <ul class="col-5 justify-content-start ps-5  d-flex align-items-center mb-0">
                        <li><a href="#" class="text-red p-2">Trò Chơi</a></li>
                        <li><a href="#" class="text-red p-2">Tin tức</a></li>
                        <li><a href="#" class="text-red p-2">Bản đồ</a></li>
                        <c:if test="${sessionScope.acc != null}">
                        <a href="booking/ticketType_list.jsp?parkID=${parkId}" class="btn-cart" 
                           style="color: white; background-color: #EE2E24; padding: 0.7vw 2vh; display: inline-block;">Đặt vé</a>
                        </c:if>

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
                <div style="display: flex; gap: 42%; margin-left: 2.5%; margin-top: 7%; color:#EE2E24">
                    <h1>BẢN ĐỒ</h1>
                    <h1>TRÒ CHƠI</h1>
                </div>       
                <div class="d-flex" style=" background-size:cover; "> 

                    <div class="map-image col-6 p-0" style="position: relative; overflow: hidden; ">

                        <img style="height: 550px; width: 100%; transform: scale(0.9);" src="${c.image3}" alt="Map Image">
                    </div>

                    <div class="games-list col-6 p-0" style="transform: scale(0.9)">

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
                                            <form onsubmit="addToFavourites(event)">
                                                <input type="hidden" name="userID" value="${sessionScope.acc.userID}">
                                                <input type="hidden" name="favouriteItems" value="${c.gameID}">
                                                <button type="submit" class="btn btn-primary" style="margin-top: 5px; font-size: 102%;background-color: #EE2E24; border-color: #EE2E24">Yêu thích</button>
                                            </form>
                                        </div>

                                    </c:if>
                                </c:forEach>
                            </div>
                        </div>
                        
                        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        
                        <script>
                        function addToFavourites(event) {
                            event.preventDefault();
                            var form = event.target;
                            var userID = form.userID.value;
                            var favouriteItems = form.favouriteItems.value;
                            var a; // Khai báo biến a để lưu trạng thái

                            var xhr = new XMLHttpRequest();
                            xhr.open('POST', 'AddFavouriteServlet', true);
                            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                            xhr.onreadystatechange = function () {
                                if (xhr.readyState === 4) {
                                    if (xhr.status === 200) {
                                        if (xhr.responseText.trim() === "sus") {
                                            a = "sus"; // Gán giá trị "sus" cho biến a nếu thành công
                                            Swal.fire({
                                                title: 'Add Success',
                                                icon: 'success',
                                                confirmButtonText: 'OK',
                                                timer: 1500
                                            });
                                        } else {
                                            a = "fail"; // Gán giá trị "fail" cho biến a nếu thất bại
                                            Swal.fire({
                                                title: 'Đã có trong danh sách yêu thích',
                                                icon: 'error',
                                                confirmButtonText: 'OK'
                                            });
                                        }
                                    }
                                }
                            };
                            xhr.send('userID=' + encodeURIComponent(userID) + '&favouriteItems=' + encodeURIComponent(favouriteItems));
                        }

                        </script>

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
        
        <div class="bg-red" style="height: 0.5vh;"></div>
        
        <div class="rating" style="margin-top: 5vh;">
            <div class="tri table-flex">
                <table>
                    <tbody>
                        <tr>
                            <td>

                                <div class="rnb rvl">
                                    <c:set var="numList" value="${rDAO.allRating}" />
                                    <c:set var="totalRating" value="${0}" />
                                    <c:set var="size" value="${0}" />

                                    <c:forEach var="num" items="${numList}">
                                        <c:if test="${param.id == num.receiveID}">
                                            <c:set var="totalRating" value="${totalRating + num.ratingValue}" />
                                            <c:set var="size" value="${size + 1}" />
                                        </c:if>
                                    </c:forEach>

                                    <script>
                                        var totalRating = ${totalRating};
                                        var size = ${size};
                                        var averageRating = size > 0 ? totalRating / size : 0;
                                        var formattedRating = averageRating.toFixed(1);
                                        document.write("<h3>" + formattedRating + "/5.0</h3>");
                                    </script>
                                </div>
                                <div class="rnrn">
                                    <p class="rars" style="color: black">${size} Đánh giá</p>
                                </div>
                            </td>
                            <td>
                                <c:if test="${sessionScope.acc != null}">
                                    <div class="pup-button">
                                        <p style="color: black">Để lại cảm nhận của bạn tại đây!</p>
                                        <button id="show-rating"  style="background-color: #EE2E24; border-radius: 15%; width: 6vw; border-bottom-color: #EE2E24;">Đánh giá</button>
                                    </div>
                                    <div class="all-ratingform">
                                        <div class="rating-body" id="rating-form" style="">
                                            <div class="wrapper" id="rating-wrapper" style="display: none;  z-index: 1000; border: 2px solid #EE2E24; padding: 10px;">
                                                <h3 style="color: #EE2E24">Bình chọn</h3>
                                                <form action="RatingServlet" method="post" id="ratingForm">
                                                    <div class="ratingvalue">
                                                        <input type="number" name="star" hidden>
                                                        <i class='bx bx-star star' style="--i: 0;"></i>
                                                        <i class='bx bx-star star' style="--i: 1;"></i>
                                                        <i class='bx bx-star star' style="--i: 2;"></i>
                                                        <i class='bx bx-star star' style="--i: 3;"></i>
                                                        <i class='bx bx-star star' style="--i: 4;"></i>
                                                    </div>
                                                    <textarea name="message" cols="30" rows="5" placeholder="Cảm nhận của bạn là gì?"></textarea>
                                                    <div class="btn-group" style="margin-top: 3vh">
                                                        <input type="hidden" name="userIdC" value="${sessionScope.acc.userID}">
                                                        <input type="hidden" name="receiveId" value="${param.id}">
                                                        <input type="hidden" name="parkID" value="${param.id}">
                                                        <button type="submit" name="button" class="btn submit" style="background-color: #EE2E24; border-radius: 15%">Gửi</button>
                                                        <button type="button" class="btn cancel" id="cancel-btn" style="color: #EE2E24; border-radius: 15%">Thoát</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>


<div class="bg-red" style="height: 0.5vh;"></div>

       <div class="row d-flex justify-content-center" style="margin-top: 5vh; margin-left: 5vw">
            
               
                    <div class="card-body p-4"  style="">       
                        <div class="card mb-4"  style="width: 95%;">

                            <div class="card-body">
                                <c:set var="rList" value="${rDAO.allRating}"/>
                                <c:set var="uList" value="${uDAO.allUser}"/>
                                <c:set var="commentCount" value="0"/>
                                <c:forEach var="list" items="${rList}" varStatus="loop">
                                    <c:if test="${param.id == list.receiveID}">
                                        <c:set var="userID" value="${list.sendID}" />
                                        <c:set var="username" value="${uDAO.getUserById(userID)}"/>
                                        <div class="uscm ${loop.index > 2 ? 'hidden' : ''}" >  
                                            <div class="uscm-secs">
                                                <div class="us-img">
                                                    <c:choose>
                                                        <c:when test="${username.image != null}">
                                                            <img src="uploads/${username.image}" style="border-radius: 50%; border: 2px solid black">
                                                        </c:when>
                                                        <c:otherwise>
                                                            <img src="images/avatar.jpg">
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                                <div class="uscms">
                                                    <div class="us-name" style="">
                                                        <p>${username.fullName}</p>
                                                        <div class="dropdown" style="">
                                                            <button class="dropbtn" id="dropButton_${loop.index}" style="margin-right: 4vw;">&#8942;</button>
                                                            <div class="dropdown-content" id="myDropdown_${loop.index}" style="display: none;">
                                                                <c:if test="${list.sendID == sessionScope.acc.userID}">
                                                                    <!-- Button to open modal -->
                                                                    <input type="hidden" id="oldComment_${loop.index}" value="${list.ratingText}" />
                                                                    <button class="update-btn" id="updateButton_${loop.index}" data-oldcomment="${list.ratingText}" style=" width: 6vw; height: 5vh"><h6>Sửa</h6></button>
                                                                    <!-- The Modal -->

                                                                    <form action="DeleteCommentServlet" method="GET">
                                                                        <input type="hidden" name="rId" value="${list.ratingID}">
                                                                        <input type="hidden" name="parkID" value="${param.id}">
                                                                        <button type="submit" style=" width: 6vw; height: 5vh"><h6>Xóa</h6></button>
                                                                    </form>
                                                                </c:if>
                                                                    <button style=" width: 6vw; height: 5vh"><h6>Báo cáo</h6></button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="us-cmt">
                                                        <p>${list.ratingText}</p>
                                                    </div>
                                                </div>
                                            </div>
                                                    <input type="hidden" id="ratingId_${loop.index}" value="${list.ratingID}" />
                                                    <input type="hidden" id="parkID_${loop.index}" value="${param.id}" />
                                        </div> 
                                        <c:set var="commentCount" value="${commentCount + 1}"/>
                                    </c:if>
                                    
                                </c:forEach>
                                <c:if test="${commentCount > 3}">
                                    <button id="readMoreButton" style="color: #EE2E24">Xem thêm</button>
                                </c:if>           
                            </div>                    
                        </div> 
                    </div>
                
                     
        </div>
                                
                                
                                
 <div id="myModal" class="modal" style="display: none; left: 50%; top: 50%; transform: translate(-50%, -50%); max-width: 50%; background-color: rgba(255, 255, 255, 0);">
    <div class="modal-content">
        <span class="close">&times;</span>
        <form id="editForm" action="UpdateCommentServlet" method="post">
            <input type="hidden" id="ratingId" name="ratingId" value="">
            <input type="hidden" id="parkID" name="parkID" value="">
            <textarea id="ratingText" name="ratingText" rows="4" cols="50"></textarea>
            <button id="update-button" type="submit" style="background-color: #EE2E24">Lưu thay đổi</button>
        </form>
    </div>
</div>





    
            <script>
                document.addEventListener('DOMContentLoaded', function () {
                    var readMoreButton = document.getElementById('readMoreButton');

                    // Function to handle showing or hiding additional comments
                    function toggleAdditionalComments() {
                        var allComments = document.querySelectorAll('.uscm'); // Lấy tất cả các comment
                        allComments.forEach(function (comment, index) {
                            if (index >= 3) { // Ẩn các comment từ chỉ số thứ 3 trở đi
                                comment.classList.toggle('hidden');
                            }
                        });
                        // Change the text of the button based on its current state
                        if (readMoreButton.textContent === 'Xem thêm') {
                            readMoreButton.textContent = 'Ẩn';
                        } else {
                            readMoreButton.textContent = 'Xem thêm';
                        }
                    }

                    // Event listener for the read more button
                    readMoreButton.addEventListener('click', function () {
                        toggleAdditionalComments();
                    });
                });
            </script>
<script>
         // Get the modal
        var modal = document.getElementById('myModal');

        // Get the button that opens the modal
        var btns = document.querySelectorAll('[id^=updateButton_]');

        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[0];

        // When the user clicks the button, open the modal 
        for (var i = 0; i < btns.length; i++) {
            btns[i].onclick = function() {
                var index = this.id.split('_')[1];
                var ratingId = document.getElementById('ratingId');
                var parkId = document.getElementById('parkID');
                var ratingText = document.getElementById('ratingText');
                var oldComment = document.getElementById('oldComment_' + index).value;

                ratingId.value = document.getElementById('ratingId_' + index).value;
                parkId.value = document.getElementById('parkID_' + index).value;
                ratingText.value = oldComment;

                modal.style.display = "block";
            }
        }

        // When the user clicks on <span> (x), close the modal
        span.onclick = function() {
            modal.style.display = "none";
        }

        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }


    </script>


    <script>
        const allStar = document.querySelectorAll('.rating .star')
        const ratingValue = document.querySelector('.rating input')

        allStar.forEach((item, idx) => {
            item.addEventListener('click', function () {
                let click = 0
                ratingValue.value = idx + 1

                allStar.forEach(i => {
                    i.classList.replace('bxs-star', 'bx-star')
                    i.classList.remove('active')
                })
                for (let i = 0; i < allStar.length; i++) {
                    if (i <= idx) {
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
        document.addEventListener("DOMContentLoaded", function () {
            const pupButton = document.getElementById("show-rating");
            const ratingWrapper = document.getElementById("rating-wrapper");
            const cancelButton = document.getElementById("cancel-btn");

            pupButton.addEventListener("click", function () {
                ratingWrapper.style.display = "block";
            });

            cancelButton.addEventListener("click", function () {
                ratingWrapper.style.display = "none";
            });
        });
    </script>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const dropButtons = document.querySelectorAll(".dropbtn");
            const dropdowns = document.querySelectorAll(".dropdown-content");

            dropButtons.forEach((dropButton, index) => {
                const dropdown = dropdowns[index];
                dropButton.addEventListener("click", function () {
                    dropdown.style.display = dropdown.style.display === "block" ? "none" : "block";
                });
            });

            window.onclick = function (event) {
                dropdowns.forEach(dropdown => {
                    if (!event.target.matches('.dropbtn') && !dropdown.contains(event.target)) {
                        dropdown.style.display = "none";
                    }
                });
            }
        });
    </script>










    <jsp:include page="footer.jsp"></jsp:include>
</body>

</html>
