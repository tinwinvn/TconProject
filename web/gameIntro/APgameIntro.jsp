
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha384-dfNlPb3SjOOElnFh2PI0tJ0JWw4+x1Ec/0l2fcG6E2tS9MguqnUqsC2ZqTjp1fG" crossorigin="anonymous">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="css_god/introduction.css"/>
        <link rel="stylesheet" type="text/css" href="../css_god/details.css"/>
        <link rel="stylesheet" type="text/css" href="AP_style.css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="../nav.jsp"></jsp:include>
        <jsp:useBean id="pDAO" class="ModelDAO.ParkDAO"></jsp:useBean>
        <div class="container">
            <div class="col-lg-3 col-md-6 col-sm-12 box-news-type">
                <div class="box-news">
                    <div class="box-img">
                        <a href="https://asiapark.sunworld.vn/trai-nghiem/sun-wheel?tax=vui-choi" title="Sun Wheel – Vòng quay Mặt Trời" style="background-image: url('https://asiapark.sunworld.vn/wp-content/uploads/2018/07/DSC_7105-270x170.jpg')">
                            <img width="270" height="170" src="https://asiapark.sunworld.vn/wp-content/uploads/2018/07/DSC_7105-270x170.jpg" class="img-fluid w-100 wp-post-image" alt="Sun Wheel – Vòng quay Mặt Trời" loading="lazy" srcset="https://asiapark.sunworld.vn/wp-content/uploads/2018/07/DSC_7105-270x170.jpg 270w, https://asiapark.sunworld.vn/wp-content/uploads/2018/07/DSC_7105-300x190.jpg 300w, https://asiapark.sunworld.vn/wp-content/uploads/2018/07/DSC_7105-768x486.jpg 768w, https://asiapark.sunworld.vn/wp-content/uploads/2018/07/DSC_7105-1024x647.jpg 1024w, https://asiapark.sunworld.vn/wp-content/uploads/2018/07/DSC_7105-93x60.jpg 93w" sizes="(max-width: 270px) 100vw, 270px">
                        </a>
                    </div>
                    <div class="box-info">
                        <h2 class="box-info-title">
                            <a href="gameAP/sunwheel.jsp" title="Sun Wheel – Vòng quay Mặt Trời">
                                Sun Wheel – Vòng quay Mặt Trời
                            </a>
                        </h2>

                        <div class="meta-info">
                            <span class="category">
                                Vui chơi
                            </span>
                        </div>
                        <div class="box-info-desc">
                            Top 5 vòng quay cao nhất thế giới,” Vòng quay Mặt Trời” là một trong những điểm đến không thể bỏ qua tại Đà Nẵng.Từ độ...
                        </div>
                        <a href="gameAP/sunwheel.jsp" class="more" title="Sun Wheel – Vòng quay Mặt Trời">Xem thêm &gt;</a>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6 col-sm-12 box-news-type">
                <div class="box-news">
                    <div class="box-img">
                        <a href="https://asiapark.sunworld.vn/trai-nghiem/highway-boat?tax=vui-choi" title="Highway Boat" style="background-image: url('https://asiapark.sunworld.vn/wp-content/uploads/2022/04/TTS4163-270x170.jpg')">
                            <img width="270" height="170" src="https://asiapark.sunworld.vn/wp-content/uploads/2022/04/TTS4163-270x170.jpg" class="img-fluid w-100 wp-post-image" alt="Highway Boat" loading="lazy" srcset="https://asiapark.sunworld.vn/wp-content/uploads/2022/04/TTS4163-270x170.jpg 270w, https://asiapark.sunworld.vn/wp-content/uploads/2022/04/TTS4163-93x60.jpg 93w" sizes="(max-width: 270px) 100vw, 270px">
                        </a>
                    </div>
                    <div class="box-info">
                        <h2 class="box-info-title">
                            <a href="gameAP/highway_boat.jsp" title="Highway Boat">
                                Highway Boat
                            </a>
                        </h2>

                        <div class="meta-info">
                            <span class="category">
                                Vui chơi
                            </span>
                        </div>
                        <div class="box-info-desc">
                            Trò chơi tạm ngưng hoạt động Tàu lượn dạng treo Highway Boat sẽ đưa quý khách lên cao và trượt xuống theo những đường lượn...
                        </div>
                        <a href="gameAP/highway_boat.jsp" class="more" title="Highway Boat">Xem thêm &gt;</a>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6 col-sm-12 box-news-type">
                <div class="box-news">
                    <div class="box-img">
                        <a href="https://asiapark.sunworld.vn/trai-nghiem/khu-vui-choi-trong-nha-danh-cho-tre-em?tax=vui-choi" title="Khu vui chơi trong nhà dành cho trẻ em" style="background-image: url('https://asiapark.sunworld.vn/wp-content/uploads/2022/05/DSC_6056-270x170.jpg')">
                            <img width="270" height="170" src="https://asiapark.sunworld.vn/wp-content/uploads/2022/05/DSC_6056-270x170.jpg" class="img-fluid w-100 wp-post-image" alt="Khu vui chơi trong nhà dành cho trẻ em" srcset="https://asiapark.sunworld.vn/wp-content/uploads/2022/05/DSC_6056-270x170.jpg 270w, https://asiapark.sunworld.vn/wp-content/uploads/2022/05/DSC_6056-93x60.jpg 93w" sizes="(max-width: 270px) 100vw, 270px">
                        </a>
                    </div>
                    <div class="box-info">
                        <h2 class="box-info-title">
                            <a href="gameAP/kid_inside_playground.jsp" title="Khu vui chơi trong nhà dành cho trẻ em">
                                Khu vui chơi trẻ em
                            </a>
                        </h2>

                        <div class="meta-info">
                            <span class="category">
                                Vui chơi
                            </span>
                        </div>
                        <div class="box-info-desc">
                            Thiên đường&nbsp;vui chơi trong nhà với hơn 30 trò chơi điện tử, khu bắn súng Grunge Station, khu&nbsp;trò&nbsp;chơi vận động Carnival Game. Không...
                        </div>
                        <a href="gameAP/kid_inside_playground.jsp" class="more" title="Khu vui chơi trong nhà dành cho trẻ em">Xem thêm &gt;</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 box-news-type">
                <div class="box-news">
                    <div class="box-img">
                        <a href="https://asiapark.sunworld.vn/trai-nghiem/festival-carousel?tax=vui-choi" title="Festival Carousel" style="background-image: url('https://asiapark.sunworld.vn/wp-content/uploads/2018/07/1M6A2544-270x170.jpg')">
                            <img width="270" height="170" src="https://asiapark.sunworld.vn/wp-content/uploads/2018/07/1M6A2544-270x170.jpg" class="img-fluid w-100 wp-post-image" alt="Festival Carousel" loading="lazy" srcset="https://asiapark.sunworld.vn/wp-content/uploads/2018/07/1M6A2544-270x170.jpg 270w, https://asiapark.sunworld.vn/wp-content/uploads/2018/07/1M6A2544-93x60.jpg 93w" sizes="(max-width: 270px) 100vw, 270px">
                        </a>
                    </div>
                    <div class="box-info">
                        <h2 class="box-info-title">
                            <a href="gameAP/carousel.jsp" title="Festival Carousel">
                                Festival Carousel
                            </a>
                        </h2>

                        <div class="meta-info">
                            <span class="category">
                                Vui chơi
                            </span>
                        </div>
                        <div class="box-info-desc">
                            Đưa du khách được tham dự lễ hội đua ngựa Pasola đầy hứng khởi trên lưng ngựa trong không gian của ánh sáng và âm nhạc đưa...
                        </div>
                        <a href="gameAP/carousel.jsp" class="more" title="Festival Carousel">Xem thêm &gt;</a>
                    </div>
                </div>
            </div>
        </div>    
    </body>
</html>
