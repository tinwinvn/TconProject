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
        <link rel="stylesheet" type="text/css" href="../../css_god/details.css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="../../nav.jsp"></jsp:include>
        <div class="bg-red" style="height: 0.5vh"></div>
        <style>
            .main-content {
                background-color: #fcf3f3;
            }
            .container {
                padding: 30px;
            }
            .col-lg-9 {
                
                padding-right: 16px;
            }
            .detail-content {
                background-color: #fff;
                padding: 16px;
            }
            .col-lg-3 {
                
                padding-left: 16px;
            }
            .list-boxall {
                background-color: #fff;
                padding: 16px;
            }
            
            .w100 {
                display: block;
            }
            .widget_get_categories_widget {
                font-weight: bold;
            }
            .widget_get_categories_widget .list-box .box {
                border-bottom: 0.063rem solid #eceff1;
                margin-bottom: 0.938rem;
                position: relative;
                z-index: 1;
            }

            .widget_get_categories_widget .list-box .box .title {
                font-size: 1.25rem;
                text-transform: capitalize;
                color: #000;
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
                display: block;
            }
            .widget_get_categories_widget .list-box .box .image-box {
                height: 6.875rem;
                overflow: hidden;
                border-radius: 0.313rem;
                position: relative;
                background-size: cover;
                background-position: center;
                background-repeat: no-repeat;
            }
            a {
                text-decoration: none !important;
                color: #ff3333;
                background-color: transparent;
                transition: unset;
            }
            .aligncenter {
                display: block;
                margin: 0.5rem auto;
                height: auto;
            }
            
            .box a:hover .title {
                color: #ff3333 !important; /* Màu đỏ */
            }

            .box a:hover img {
                filter: grayscale(90%) contrast(100%) brightness(80%) sepia(100%) hue-rotate(-50deg) saturate(200%);
            }
        </style>
        <div class="wrap-content">
            <div class="main-content">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-9 col-md-8 col-12">
                            <div class="detail-content about-iframe">
                                <div id="header">
                                    <div class="logo"></div>
                                </div>
                                <div id="content" style="text-align: left;">
                                    <div class="w60"></div>
                                    <div class="w55">                                      
                                        <p><strong>Công viên nước Holie &#8211; Holie Water Park </strong></p>
                                        <p style="text-align: justify;">
                                        Công viên nước Holie - là công viên nước bằng phao khổng lồ đầu tiên tại Đà Nẵng. Nằm ngay trong làng thể thao Tuyên Sơn, đường Nại Nam 2, phường Hòa Cường Bắc, Hải Châu, Đà Nẵng, cách trung tâm vui chơi giải trí Helio Center 150m. Đây là một trong những địa điểm vui chơi hè hấp dẫn và đầy thú vị mà mọi người không nên bỏ lỡ trong dịp hè này.
                                        </p> 
                                        <p><img src="" alt="" width="632" height="421" class=" wp-image-4749 aligncenter" srcset="https://danangfantasticity.com/wp-content/uploads/2023/07/Cong-vien-nuoc-holie-da-nang-lang-the-thao-tuyen-son-nai-nam-2-010.jpg" sizes="(max-width: 632px) 100vw, 632px" /></p>

                                        <p>Công viên nước Holie hay còn được gọi là công viên nước Helio có 8 hồ phao với kích thước khác nhau phù hợp cho mọi độ tuổi tham gia vui chơi. Bạn chỉ cần mua 1 vé là đã có thể thoải mái chơi đùa tất cả các nhà phao, không giới hạn trò chơi và thời gian chơi nhé.</p>
                                        <P>Bạn có thể lên một lịch trình kết hợp cùng cả gia đình vui chơi tại Holie và Helio vào những ngày nghỉ. Sau khi khám phá công viên nước xong mình ghé chợ đêm thưởng thức các món ngon rồi cùng bé tham gia làm Workshop. Cả nhà cùng chill với âm nhạc, hay cùng con vui chơi ở Helio Kids hoặc Helio Play, xem phim Metiz quá trọn vẹn và tuyệt vời.</P>                    
                                    </div>       
                                    
                                    <div class="w55">                                      
                                        <p><strong>CÔNG VIÊN NƯỚC HOLIE CÓ GÌ?</strong></p>
                                        <p style="text-align: justify;"> 
                                        Với mức giá siêu hời chỉ từ 50k/người là bạn có thể khám phá hết tất cả các khu vực trò chơi tại công viên nước rồi đó nha. Holie sẽ bao gồm tổ hợp các nhà phao khổng lồ với nhiều khu trò chơi dưới nước khác nhau.    
                                        </p>                                            
                                        <p><img src="" alt="" width="632" height="421" class=" wp-image-4749 aligncenter" srcset="https://danangfantasticity.com/wp-content/uploads/2023/07/Cong-vien-nuoc-holie-da-nang-lang-the-thao-tuyen-son-nai-nam-2-03.jpg" sizes="(max-width: 632px) 100vw, 632px" /></p>
                                        <p style="text-align: justify;"> 
                                        Phù hợp cho mọi độ tuổi từ trẻ nhỏ đến người lớn nên rất thích hợp cho các gia đình muốn đi chơi vào những ngày nắng nóng. Với rất nhiều các trò chơi dưới nước siêu vui, xứng đáng là điểm thư giãn, giải trí lý tưởng dành cho mùa hè này tại Đà Nẵng.    
                                        </p>   
                                    </div>
                                    <div class="clearfix"></div>
                                    
                                    <div class="clearfix"></div>                                  
                                </div>
                                <div class="clearfix" style="text-align: left;"></div>
                                <div id="footer" style="text-align: left;">
                                    <div class="borderfooter"></div>
                                </div>
                                <p>&nbsp;</p>

                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-12 about-us">
                            <section class="widget get_categories_widget-2 widget_get_categories_widget">
                                <div class="list-boxall">
                                <h3>Trải nghiệm</h3>                
                                <div class="list-box">
                                    <div class="box">
                                        <a href="https://asiapark.sunworld.vn/danh-muc-trai-nghiem/van-hoa" title="Văn hóa">
                                            <div class="image-box" style="background-image: url('https://asiapark.sunworld.vn/wp-content/uploads/2022/05/DJI_0198-scaled.jpg')">
                                                <img src="https://asiapark.sunworld.vn/wp-content/uploads/2022/05/DJI_0198-scaled.jpg" class="img-fluid w-100" alt="">
                                                <i class="icon icon-plus"></i>
                                            </div>
                                            <p class="title">Văn hóa</p>
                                        </a>
                                    </div>
                                    <div class="box">
                                        <a href="https://asiapark.sunworld.vn/danh-muc-trai-nghiem/vui-choi" title="Vui chơi">
                                            <div class="image-box" style="background-image: url('https://asiapark.sunworld.vn/wp-content/uploads/2020/05/image8-1.jpg')">
                                                <img src="https://asiapark.sunworld.vn/wp-content/uploads/2020/05/image8-1.jpg" class="img-fluid w-100" alt="">
                                                <i class="icon icon-plus"></i>
                                            </div>
                                            <p class="title">Vui chơi</p>
                                        </a>
                                    </div>
                                    <div class="box">
                                        <a href="https://asiapark.sunworld.vn/danh-muc-trai-nghiem/am-thuc-va-mua-sam" title="Ẩm thực và mua sắm">
                                            <div class="image-box" style="background-image: url('https://asiapark.sunworld.vn/wp-content/uploads/2022/05/775A4300-scaled.jpg')">
                                                <img src="https://asiapark.sunworld.vn/wp-content/uploads/2022/05/775A4300-scaled.jpg" class="img-fluid w-100" alt="">
                                                <i class="icon icon-plus"></i>
                                            </div>
                                            <p class="title">Ẩm thực và mua sắm</p>
                                        </a>
                                    </div>
                                    <div class="box">
                                        <a href="https://asiapark.sunworld.vn/danh-muc-trai-nghiem/su-kien" title="Sự kiện">
                                            <div class="image-box" style="background-image: url('https://asiapark.sunworld.vn/wp-content/uploads/2020/09/image15.jpg')">
                                                <img src="https://asiapark.sunworld.vn/wp-content/uploads/2020/09/image15.jpg" class="img-fluid w-100" alt="">
                                                <i class="icon icon-plus"></i>
                                            </div>
                                            <p class="title">Sự kiện</p>
                                        </a>
                                    </div>
                                </div>
                                </div>
                            </section>                </div>
                    </div>
                </div>
            </div>
        </div>    </body>
</html>
