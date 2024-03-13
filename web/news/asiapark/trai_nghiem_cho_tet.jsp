<%-- 
    Document   : introduction
    Created on : Mar 9, 2024, 10:52:42 PM
    Author     : tbinh
--%>

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
                                        <p><strong>ASIA PARK &#8211; Trải nghiệm Chợ Tết Vui Phết tại Công viên châu Á dịp Tết Nguyên đán 2024 </strong></p>
                                        <p style="text-align: justify;">Dịp Tết Nguyên đán năm nay, công viên Châu Á sẽ dành tặng du khách một không gian chợ Tết truyền thống đặc sắc, tươi vui mang chủ đề “Chợ Tết Vui Phết”, kéo dài từ mùng 2 đến mùng 10 Âm lịch (11/02 đến 19/02/2024).<br />
                                        <p><img src="https://asiapark.sunworld.vn/wp-content/uploads/2022/05/DJI_0198-300x200.jpg" alt="" width="632" height="421" class=" wp-image-4749 aligncenter" srcset="https://asiapark.sunworld.vn/wp-content/uploads/2024/01/2.jpg" sizes="(max-width: 632px) 100vw, 632px" /></p>
                                        <p class="f-17 texj" style="text-align: justify;"><span class="dropcap"></span>Chào đón năm mới Giáp Thìn 2024, công viên Châu Á sẽ khoác lên mình bộ cánh rực rỡ, mang đậm không khí Tết cổ truyền. Với mong muốn mang lại sự may mắn, sung túc và niềm vui cho du khách trong những ngày đầu năm mới, toàn bộ công viên sẽ rạng ngời sắc xuân với hoa đào, hoa mai rực rỡ, đi cùng những tiểu cảnh, đại cảnh được tạo hình nghệ thuật sống động. Điểm nhấn của dịp tết Giáp Thìn là con đường 5000 đèn lồng đỏ ấn tượng, trải dài từ khu vực Cổng Hàn Quốc đến khu trung tâm Rồng Trung Quốc. Con đường tượng trưng hình dáng của một chú rồng uốn lượn, đưa du khách khám phá cảnh quan công viên và tạo nên không gian thẩm mỹ đậm chất Á Đông.</p>
                                    </div>
                                    <div class="clearfix"><img loading="lazy" src="https://asiapark.sunworld.vn/wp-content/uploads/2022/05/Brown-Mothers-Day-Vintage-Scrapbook-Photo-Collage-1-300x240.png" alt="" width="641" height="513" class=" wp-image-4756 aligncenter" srcset="https://asiapark.sunworld.vn/wp-content/uploads/2024/01/1.jpg" sizes="(max-width: 641px) 100vw, 641px" /></div>
                                    <div class="w100"></div>
                                    <div class="clearfix"></div>
                                    <div class="w55">
                                        <p class="f-17 texj" style="text-align: justify;">Đến với Chợ Tết Vui Phết, du khách sẽ đắm chìm vào không gian ẩm thực phong phú với 22 gian hàng ẩm thực đặc trưng của các quốc gia châu Á và “người anh em” Ba Na Hills, đi kèm vô vàn đồ lưu niệm đặc trưng. Đặc biệt hơn, ngay trong ngày mùng 2 Tết (11/02 Dương lịch), công viên Châu Á sẽ trở thành điểm sáng mới trên bản đồ ẩm thực Đà Nẵng với sự kiện khai trương nhà hàng Trung Quốc. Nhà hàng sẽ mang tới cho du khách tinh hoa ẩm thực Trung Hoa với những đặc sản như vịt quay hay dimsum…</p>
                                    </div>
                                    <div class="clearfix" style="text-align: center;"></div>
                                    <div class="clearfix" style="text-align: center;"></div>
                                    <div class="w55">
                                        <p class="f-17 texj" style="text-align: justify;"><span class="dropcap"></span></p>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="w100"><img loading="lazy" src="https://asiapark.sunworld.vn/wp-content/uploads/2022/05/Brown-Mothers-Day-Vintage-Scrapbook-Photo-Collage-300x240.png" alt="" width="681" height="544" class=" wp-image-4754 aligncenter" srcset="https://asiapark.sunworld.vn/wp-content/uploads/2024/01/3.jpg" sizes="(max-width: 681px) 100vw, 681px" /></div>
                                    <div class="clearfix"></div>
                                    <div class="w55">
                                        <p class="f-17 texj" style="text-align: justify;">Bên cạnh những khung cảnh rực rỡ và gian hàng đa dạng, du khách sẽ được hòa mình không khí hội xuân tưng bừng suốt cả ngày dài, với nhiều hoạt động trải nghiệm thú vị dành cho du khách bao gồm: ông đồ viết thư pháp, vẽ chân dung, check in với nghệ sĩ body-painting, trò chơi lô tô, trò chơi dân gian….</p>
                                    </div>
                                    <div class="w100"><img loading="lazy" src="https://asiapark.sunworld.vn/wp-content/uploads/2023/01/bc5bb1d36c13b54dec02-1-300x225.jpg" alt="" width="682" height="511" class="wp-image-5350 aligncenter" srcset="https://asiapark.sunworld.vn/wp-content/uploads/2024/01/5.jpg" sizes="(max-width: 682px) 100vw, 682px" /> <img loading="lazy" src="https://asiapark.sunworld.vn/wp-content/uploads/2022/08/R6_3078-1-300x200.jpg" alt="" width="687" height="458" class="wp-image-4840 aligncenter" srcset="https://asiapark.sunworld.vn/wp-content/uploads/2022/08/R6_3078-1-300x200.jpg 300w, https://asiapark.sunworld.vn/wp-content/uploads/2022/08/R6_3078-1-1024x683.jpg 1024w, https://asiapark.sunworld.vn/wp-content/uploads/2022/08/R6_3078-1-768x512.jpg 768w, https://asiapark.sunworld.vn/wp-content/uploads/2022/08/R6_3078-1-1536x1024.jpg 1536w, https://asiapark.sunworld.vn/wp-content/uploads/2022/08/R6_3078-1-2048x1365.jpg 2048w" sizes="(max-width: 687px) 100vw, 687px" /></div>
                                    <div>
                                        <div></div>
                                        <div class="clearfix" style="text-align: justify;"><span><span>Lễ hội Cổ phục và Cosplay diễn ra tại sân khấu Sun Wheel từ 19h00 đến 21h30 ngày mùng 5 Tết (trùng vào ngày Valentine 14/02) hứa hẹn sẽ đem đến không khí hội hè tưng bừng, sôi động và là điểm hẹn hò dịp Lễ Tình Yêu không thể bỏ qua của giới trẻ Đà thành.</span></div>
                                        <div class="w55">
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="w100"><img loading="lazy" src="https://asiapark.sunworld.vn/wp-content/uploads/2022/05/Brown-Mothers-Day-Vintage-Scrapbook-Photo-Collage-8-300x240.png" alt="" width="669" height="535" class=" wp-image-4764 aligncenter" srcset="https://asiapark.sunworld.vn/wp-content/uploads/2024/01/6.jpg" sizes="(max-width: 669px) 100vw, 669px" /></div>
                                    <div class="clearfix"></div>
                                    <div class="w80">
                                        <p class="f-17 marginB30 texj">Bên cạnh những hoạt động của Chợ Tết Vui Phết, 20 trò chơi cảm giác mạnh cực đã cùng thế giới game trong nhà vẫn sẽ mở cửa phục vụ du khách xuyên dịp Tết. Hãy cùng gia đình, bè bạn tới du xuân và lưu giữ những kỹ niệm đáng nhớ tại công viên Châu Á – Asia Park vào dịp Tết Giáp Thìn năm nay</p>
                                    </div>
                                    
                                    <div class="clearfix"></div>
                                    <div class="w55">
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="clearfix"></div>
                                    <div class="clearfix">
                                        </ul>
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
