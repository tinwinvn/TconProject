<!DOCTYPE html>



<html lang="en">

    <head>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>


        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link href="https://cdn.jsdelivr.net/npm/remixicon@3.0.0/fonts/remixicon.css" rel="stylesheet"/>
        <link rel="stylesheet" href="css/styles.css" />
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Tcon</title>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.css" integrity="sha512-UTNP5BXLIptsaj5WdKFrkFov94lDx+eBvbKyoe1YAfjeRPC+gT5kyZ10kOHCfNZqEui1sxmqvodNUx3KbuYI/A==" crossorigin="anonymous"
              referrerpolicy="no-referrer" />
        <script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
        <link rel="stylesheet" type="text/css" href="css_god/index.css"/>
        <jsp:useBean id="rDAO" class="ModelDAO.RatingDAO"></jsp:useBean>
        <jsp:useBean id="uDAO" class="ModelDAO.UserDAO"></jsp:useBean>
    </head>

    <body>
        <jsp:include page="navbar.jsp"></jsp:include>
            <header>
                <div class="section__container">
                    <div class="header__content">
                        <h1>Travel</h1>
                        <p>
                            xin chào mọi người
                        </p>
                        <button>Read more</button>
                    </div>
                </div>
            </header>



            <div class="rooms">
                <div class="container top">
                    <div class="heading">
                        <h1>Khám phá</h1>
                        <h2>Các địa điểm</h2>
                        <p>Mỗi địa điểm đều đem lại cảm giác và trải nghiệm khác nhau, hãy chọn lựa cho mình một nơi để gửi gắm.</p>
                    </div>

                    <div class="container top" style="">
                        <div class="content mtop">
                            <div class="owl-carousel owl-carousel1 owl-theme">

                            </div>
                            <div class="carousel-navigation">
                                <button class="prev-btn" onclick="prevSlide()">❮</button>
                                <button class="next-btn" onclick="nextSlide()">❯</button>
                            </div>
                        </div>
                    </div>


                    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js" integrity="sha512-bPs7Ae6pVvhOSiIcyUClR7/q2OAsRiovw4vAkX+zJbw3ShAeeqezq50RIIcIURq7Oa20rW2n2q+fyXBNcU9lrw==" crossorigin="anonymous"
                    referrerpolicy="no-referrer"></script>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.js" integrity="sha512-gY25nC63ddE0LcLPhxUJGFxa2GoIyA5FLym4UJqHDEMHjp8RET6Zn/SHo1sltt3WuVtqfyxECP38/daUc/WVEA==" crossorigin="anonymous"
                    referrerpolicy="no-referrer"></script>
                    <script>
                        $('.owl-carousel1').owlCarousel({
                            loop: true,
                            margin: 40,
                            nav: false,
                            dots: false,
                            responsive: {
                                0: {
                                    items: 1
                                },
                                768: {
                                    items: 2,
                                    margin: 10
                                },
                                1000: {
                                    items: 3
                                }
                            }
                        })
                    </script>


                    <div class="content mtop">
                        <div class="owl-carousel owl-carousel1 owl-theme">
                        <jsp:useBean id="pDAO" class="ModelDAO.ParkDAO"></jsp:useBean>
                        <c:forEach items="${pDAO.allPark}" var="c"> 
                            <c:set var="id" value="${c.parkID}"/>
                            <div class="items">
                                <div class="image">
                                    <img src="${c.image}"/>
                                </div>
                                <div class="text">
                                    <h2><c:out value="${c.parkName}" /></h2>
                                    <p><c:out value="${c.address}" /></p>
                                    <div class="button flex">
                                        <a href="details.jsp?id=${id}"><button class="primary-btn">Xem chi tiết</button></a>
                                        <c:if test="${sessionScope.acc != null}">
                                            <form onsubmit="addToFavourites(event)">
                                                <input type="hidden" name="userID" value="${sessionScope.acc.userID}">
                                                <input type="hidden" name="favouriteItems" value="${c.parkID}">
                                                <button type="submit" class="primary-btn" style="margin-top: 5px; font-size: 102%">Yêu thích</button>
                                            </form>
                                        </c:if>
                                        <div class="rnb rvl">
                                            
                                            <c:set var="numList" value="${rDAO.allRating}" />
                                            <c:set var="totalRating" value="${0}" />
                                            <c:set var="size" value="${0}" />

                                            <c:forEach var="num" items="${numList}">
                                                <c:if test="${id == num.receiveID}">
                                                    <c:set var="totalRating" value="${totalRating + num.ratingValue}" />
                                                    <c:set var="size" value="${size + 1}" />
                                                </c:if>
                                            </c:forEach>

                                            <c:choose>
                                                <c:when test="${size > 0}">
                                                    <div class="valueRating">
                                                        
                                                        <h3 id="starRating">
                                                            <fmt:formatNumber type="number" maxFractionDigits="1" value="${totalRating / size}"/>
                                                        </h3>
                                                        
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="valueRating">
                                                        <h3>0</h3>
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                            
                                        </div>
                                        <h3><span> <br>  </span> </h3>
                                        
                                    </div>
                                        
                                </div>
                            </div>
                        </c:forEach>


                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        
        <script>
            function addToFavourites(event) {
                event.preventDefault();
                var form = event.target;
                var userID = form.userID.value;
                var favouriteItems = form.favouriteItems.value;

                var xhr = new XMLHttpRequest();
                xhr.open('POST', 'AddFavouriteServlet', true);
                xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                Swal.fire({
                title: 'Add Success',
                icon: 'success',
                confirmButtonText: 'OK',
                timer: 1500
                });
                setTimeout(function () {
                }, 1500);
                }
            };
            xhr.send('userID=' + encodeURIComponent(userID) + '&favouriteItems=' + encodeURIComponent(favouriteItems));
        }
        </script>                    

        <script>
            $('.owl-carousel1').owlCarousel({
                loop: true,
                margin: 40,
                nav: true,
                dots: false,
                navText: ["<i class = 'fa fa-chevron-left'></i>", "<i class = 'fa fa-chevron-right'></i>"],
                responsive: {
                    0: {
                        items: 1
                    },
                    768: {
                        items: 2,
                        margin: 10
                    },
                    1000: {
                        items: 3
                    }
                }
            });
        </script>
          <div class="bg-red" style="height: 0.5vh;"></div>              
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>



<script>
    function nextSlide() {
        $(".owl-carousel1").trigger("next.owl.carousel");
    }

    function prevSlide() {
        $(".owl-carousel1").trigger("prev.owl.carousel");
    }

    $('.owl-carousel1').owlCarousel({
        loop: true,
        margin: 40,
        nav: false,
        dots: false,
        responsive: {
            0: {
                items: 1
            },
            768: {
                items: 2,
                margin: 10,
            },
            1000: {
                items: 3
            }
        }
    })
</script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>   
<script>
    function addToFavourites(event) {
        event.preventDefault();
        var form = event.target;
        var userID = form.userID.value;
        var favouriteItems = form.favouriteItems.value;

        var xhr = new XMLHttpRequest();
        xhr.open('POST', 'AddFavouriteServlet', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                Swal.fire({
                    title: 'Add Success',
                    icon: 'success',
                    confirmButtonText: 'OK',
                    timer: 1500
                });
                setTimeout(function () {
                }, 1500);
            }
        };
        xhr.send('userID=' + encodeURIComponent(userID) + '&favouriteItems=' + encodeURIComponent(favouriteItems));
    }
</script>                    
<script>
    $('.owl-carousel1').owlCarousel({
        loop: true,
        margin: 40,
        nav: true,
        dots: false,
        navText: ["<i class = 'fa fa-chevron-left'></i>", "<i class = 'fa fa-chevron-right'></i>"],
        responsive: {
            0: {
                items: 1
            },
            768: {
                items: 2,
                margin: 10,
            },
            1000: {
                items: 3
            }
        }
    })
</script>
