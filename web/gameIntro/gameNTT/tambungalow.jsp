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
                                        <p><strong>Núi Thần Tài &#8211; TẮM BUNGALOW </strong></p>
                                        <p style="text-align: justify;">                                        
                                        Một sự kết hợp hoàn hảo giữa bể tắm khoáng và nhà vườn xanh mát. Những căn bungalow này nằm trong một khu hoàn toàn riêng biệt, với thiết kế mỗi bungalow như một khu nhà vườn nho nhỏ với đầy đủ những tiện nghi cần thiết cho chuyến tham quan của bạn như: phòng thay quần áo, tủ đựng đồ cá nhân, ghế dài để nghỉ ngơi,…
                                        </p>       
                                        <p><img src="" alt="" width="632" height="421" class=" wp-image-4749 aligncenter" srcset="https://statictuoitre.mediacdn.vn/thumb_w/730/2017/photo-1-1506580493963.jpg" sizes="(max-width: 632px) 100vw, 632px" /></p>
                                        
                                        <p>Bungalow là một lựa chọn hoàn hảo cho quý vị khi muốn lưu trú trong ngày tại Núi Thần Tài, bao quanh bởi những tán cây xanh um tùm, buổi trưa tại bungalow sẽ là một trải nghiệm vô cùng lý thú.</p>
                                        <p><img src="" alt="" width="632" height="421" class=" wp-image-4749 aligncenter" srcset="https://statictuoitre.mediacdn.vn/thumb_w/730/2017/photo-1-1506580499456.jpg" sizes="(max-width: 632px) 100vw, 632px" /></p>

                                    </div>                                   
                                    <div class="clearfix"></div>           
                                    <div class="clearfix"></div>
                                    <div class="clearfix">
                                        <p style="text-align: justify;"><b>Giá vé phải chăng</b><span> Ngoài vé vào cửa (300.000đ/người lớn) để tận hưởng các dịch vụ cao cấp của Núi Thần Tài như tắm khoáng tại các hồ tự nhiên, sục massage Jacuzzi, xông hơi khô, xông hơi ướt, trượt thác sông Lười, vui chơi công viên nước…, bạn chỉ cần đặt thêm 800.000đ/bungalow cho một ngày nghỉ dưỡng sang chảnh dành cho 2 người trở lên.</span></p>
                                        <p style="text-align: justify;"><b>Tại sao nên tắm bungalow Núi Thần Tài?</b><span>Không chỉ ấn tượng du khách bởi không gian tuyệt vời, tắm bungalow Núi Thần Tài còn xứng đáng là một nơi bạn và người thương phải đến nếu muốn ‘đi trốn’ khỏi những xô bồ hằng ngày. </span></p>
                                        <p style="text-align: justify;"><span>Chất lượng dịch vụ tắm bungalow Núi Thần Tài cực kì đẳng cấp từ không gian, trang thiết bị nội thất cho đến nhân viên. Bungalow còn là địa điểm lưu trú lý tưởng trong ngày tại Núi Thần Tài khi bạn muốn nghỉ ngơi một cách riêng tư và yên tĩnh sau những trải nghiệm thú vị với công viên nước, tắm khoáng nóng, tắm bùn, xông hơi, massagae sục Jacuzi…</span></p>                                   
                                           
                                    </div>
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
