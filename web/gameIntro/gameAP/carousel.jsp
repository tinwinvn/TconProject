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
                                        <p><strong>ASIA PARK &#8211; Festival Carousel </strong></p>
                                        <p style="text-align: justify;">                                        
                                        Đưa du khách được tham dự lễ hội đua ngựa Pasola đầy hứng khởi trên lưng ngựa trong không gian của ánh sáng và âm nhạc đưa người chơi trở về với các ký ức tuổi thơ đầy sắc màu.
                                        </p>       
                                        <p>Loại trò chơi: Gia đình.</p>
                                        <P>Chiều cao tham gia: Từ 106cm ( Từ 85cm-105cm phải có người lớn đi kèm)</P>    

                                        <P>Thời lượng: 120s.</P>    

                                        <P>Mô tả: Người chơi ngồi lên những cỗ xe xoay tròn theo vòng thuận chiều đồng hồ và được nâng lên xuống theo phương thẳng đứng khi quay.</P>    
 
                                        <p><img src="" alt="" width="632" height="421" class=" wp-image-4749 aligncenter" srcset="https://asiapark.sunworld.vn/wp-content/uploads/2018/07/1M6A2544-770x500.jpg)" sizes="(max-width: 632px) 100vw, 632px" /></p>
                                        
                                    </div>                                   
                                    <div class="clearfix"></div>
                                    <div class="w100">
                                        <img loading="lazy" alt="" width="657" height="525" class=" wp-image-4760 aligncenter" srcset="https://asiapark.sunworld.vn/wp-content/uploads/2018/07/6J9A5587-770x500.jpg" sizes="(max-width: 657px) 100vw, 657px" />
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="clearfix">
                                        <p style="text-align: justify;"><span>Ngoài ưu đãi </span><b>MIỄN PHÍ VÀO CỬA</b><span> tham quan cho toàn bộ du khách, Công viên Châu Á còn triển khai các hình thức vé ưu đãi dành cho du khách muốn trải nghiệm </span><span>không giới hạn các </span><span>dịch vụ và các trò chơi đẳng cấp, gồm:</span></p>
                                        <p style="text-align: justify;"><b>✔️Vé trọn gói trải nghiệm không giới hạn tất cả các trò chơi</b><span> sẽ có giá 250.000 đồng/vé dành cho người lớn; 150.000 đồng/vé dành cho trẻ em 1m-1m4; miễn phí tất cả các trò chơi cho trẻ em dưới 1m theo quy định an toàn.</span></p>
                                        <p style="text-align: justify;"><b>✔️Vé trải nghiệm Vòng quay Sun Wheel</b><span> có giá 150.000 đồng/lượt người lớn; 75.000 đồng/lượt dành cho trẻ em 1m-1m4 và miễn phí tất cả các trò chơi cho trẻ em dưới 1m theo quy định an toàn.</span></p>
                                        <p style="text-align: justify;"><b>✔️Vé Khu vui chơi trong nhà (FEC) có giá 35.000 đồng/ 1 vé dành cho tất cả du khách từ 1m trở lên (dưới 1m miễn phí)</b></p>
                                        <p style="text-align: justify;"><b>✔️</b><b>Gói vé lẻ: </b><em><strong>Đ</strong></em><b><i>ến Asia Park vào khung giờ 19h00-21h30</i></b><span>, bạn sẽ thỏa sức lựa chọn những ưu đãi siêu hời:</span></p>
                                        <ul>
                                            <li style="text-align: justify;"><span>Người lớn: 50.000 đồng/ 1 lượt game; 100.000/ 3 lượt game</span></li>
                                            <li style="text-align: justify;"><span>Trẻ em: 30.000 đồng/1 lượt game; 60.000/ 3 lượt game </span><em>(Miễn phí các trò chơi cho trẻ em dưới 1m theo quy định an toàn)</em></li>
                                        </ul>
                                    </div>
                                    <div class="clearfix"><em style="text-align: justify;">Cùng khám phá một châu Á ngoạn mục trong từng khu văn hóa, thỏa sức trải nghiệm và thử thách bản thân với những trò chơi hàng đầu thế giới, và tận hưởng cảm giác được nuông chiều bản thân khi đi dạo trên những lối đi xanh mướt, hít hà không khí trong lành của một ốc đảo xanh, quên đi mọi ưu phiền và chiêu đãi vị giác bằng những món ngon khó cưỡng, chỉ cần đến Asia Park thôi cũng đã có một kỳ nghỉ hoàn hảo ở Đà Nẵng rồi.</em></div>
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
