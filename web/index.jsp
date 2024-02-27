<!DOCTYPE html>



<html lang="en">

    <head>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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



        <body>

            <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js" integrity="sha512-bPs7Ae6pVvhOSiIcyUClR7/q2OAsRiovw4vAkX+zJbw3ShAeeqezq50RIIcIURq7Oa20rW2n2q+fyXBNcU9lrw==" crossorigin="anonymous"
            referrerpolicy="no-referrer"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.js" integrity="sha512-gY25nC63ddE0LcLPhxUJGFxa2GoIyA5FLym4UJqHDEMHjp8RET6Zn/SHo1sltt3WuVtqfyxECP38/daUc/WVEA==" crossorigin="anonymous"
            referrerpolicy="no-referrer"></script>

            <section class="rooms">
                <div class="container top">
                    <div class="heading">
                        <h1>Khám phá</h1>
                        <h2>Các địa điểm</h2>
                        <p>Mỗi địa điểm đều đem lại cảm giác và trải nghiệm khác nhau, hãy chọn lựa cho mình một nơi để gửi gắm.</p>
                    </div>

                    <div class="container top">
                        <div class="content mtop">
                            <div class="owl-carousel owl-carousel1 owl-theme">
                                <!-- Các thẻ items ở đây -->
                            </div>
                            <div class="carousel-navigation">
                                <button class="prev-btn" onclick="prevSlide()">❮</button>
                                <button class="next-btn" onclick="nextSlide()">❯</button>
                            </div>
                        </div>
                    </div>

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


                    <div class="content mtop">
                        <div class="owl-carousel owl-carousel1 owl-theme">
                        <jsp:useBean id="pDAO" class="ModelDAO.ParkDAO" ></jsp:useBean>
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
                                            <form action="AddFavouriteServlet" method="POST">
                                            <input type="hidden" name="userID" value="${sessionScope.acc.userID}">
                                            <input type="hidden" name="favouriteItems" value="${c.parkID}">
                                            <button type="submit" class="primary-btn">Thêm vào mục yêu thích</button>
                                        </form>
                                        </c:if>
                                        <h3><span> <br>  </span> </h3>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>


                    </div>
                </div>
            </div>
        </section>
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
    </body>




    <section class="banner__container">
        <div class="section__container">
            <div class="banner__content">
                <h2>Discount 10-30% Off</h2>
                <p>
                    Travel the world on a budget with our unbeatable discounted travel
                    deals. Whether you're looking for a last-minute escape or planning
                    ahead, we've got you covered with incredible discounts on flights,
                    hotels, and packages. Don't wait, book now and experience the
                    adventure of a lifetime without breaking the bank.
                </p>
                <button>See Tours</button>
            </div>
        </div>
    </section>

    <section class="display__container">
        <div class="section__container">
            <h2 class="section__title">Why Choose Us</h2>
            <p class="section__subtitle">
                The gladdest moment in human life, is a departure into unknown lands.
            </p>
            <div class="display__grid">
                <div class="display__card grid-1">
                    <img src="images/grid-1.jpg" alt="grid" />
                </div>
                <div class="display__card">
                    <i class="ri-earth-line"></i>
                    <h4>Passionate Travel</h4>
                    <p>Fuel your passion for adventure and discover new horizons</p>
                </div>
                <div class="display__card">
                    <img src="images/grid-2.jpg" alt="grid" />
                </div>
                <div class="display__card">
                    <img src="images/grid-3.jpg" alt="grid" />
                </div>
                <div class="display__card">
                    <i class="ri-road-map-line"></i>
                    <h4>Beautiful Places</h4>
                    <p>Uncover the world's most breathtakingly beautiful places</p>
                </div>
            </div>
        </div>
    </section>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>




<style>

    .heading h1 {
        font-size: 36px;
        color: #333;

    }


    .owl-carousel1 .items {
        background: #f8f8f8;
        border-radius: 8px;
        overflow: hidden;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        transition: transform 0.3s ease-in-out;
    }

    .owl-carousel1 .items:hover {
        transform: scale(1.05);
    }

    .owl-carousel1 .items .image img {
        width: 100%;
        height: auto;
        border-bottom: 1px solid #ddd;
    }

    .owl-carousel1 .items .text {
        padding: 20px;
    }

    .owl-carousel1 .items h2 {
        font-size: 24px;
        color: #333;
        margin-bottom: 10px;
    }

    .owl-carousel1 .items .rate {
        color: #f39c12;
        margin-bottom: 10px;
    }

    .owl-carousel1 .items p {
        color: #777;
        margin-bottom: 10px;
    }

    .owl-carousel1 .items .button {
        margin-top: 10px;
    }

    .owl-carousel1 .items .button .primary-btn {
        background-color: #3498db;
        color: #fff;
        padding: 10px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s ease-in-out;
    }

    .owl-carousel1 .items .button .primary-btn:hover {
        background-color: #2c3e50;
    }
</style>


<style>
    .heading {
        text-align: center;
        padding: 40px 20px;
        background-color: #f8f8f8;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .heading h1 {
        font-size: 42px;
        color: rgba(51, 51, 51, 0.5);
        margin-bottom: 10px;
    }

    .heading h2 {
        position: relative;
        font-size: 28px;
        color: #555;
        margin-bottom: 20px;
    }

    .heading h2::before {
        content: '';
        top: 0;
        left: 50%;
        transform: translateX(-50%);
        width: 100%;
        height: 100%;
        background: rgba(51, 51, 51, 0.2);
        z-index: -1;
    }

    .heading p {
        font-size: 18px;
        color: #777;
        max-width: 800px;
        margin: 0 auto;
    }
</style>


<style>
    .carousel-navigation {
        text-align: right;
        margin-top: 10px;
        margin-bottom: 10px;
        margin-right:  10px;
    }

    .prev-btn,
    .next-btn {
        font-size: 18px;
        padding: 10px 20px;
        background-color: #3498db;
        color: #fff;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s ease-in-out;
    }

    .prev-btn:hover,
    .next-btn:hover {
        background-color: #2c3e50;
    }

</style>


