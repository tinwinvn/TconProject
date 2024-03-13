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
                                        <p><strong>HELIO &#8211; NHỮNG LÝ DO NHẤT ĐỊNH PHẢI ĐẾN HELIO KHI ĐI DU LỊCH ĐÀ NẴNG</strong></p>
                                        <p style="text-align: justify;">Ở Đà Nẵng có rất nhiều điểm đến để cho du khách tham quan khám phá, với những cảnh đẹp như bờ biển xanh, các danh lam thắng cảnh, những địa điểm vui chơi. Ngoài những cảnh đẹp ở Đà Nẵng, thì những món ngon ở nơi đây cũng là một phần mà bạn không thể bỏ lỡ.<br />
                                        <p><img src="https://asiapark.sunworld.vn/wp-content/uploads/2022/05/DJI_0198-300x200.jpg" alt="" width="632" height="421" class=" wp-image-4749 aligncenter" srcset="https://helio.vn/media/uploads/2023/11/13/ly-do-den-helio-khi-di-du-lich-da-nang5.jpg" sizes="(max-width: 632px) 100vw, 632px" /></p>
                                        <p class="f-17 texj" style="text-align: justify;"><span class="dropcap"></span>Tổ hợp ẩm thực đêm Helio hội tụ đủ các món đặc sản. Đến Đà Nẵng du lịch nếu bạn không có nhiều thời gian để tìm hiểu các quán ăn địa phương, hay không đi được nhiều chỗ, thì có thể ghé chợ đêm Helio. Khu tổ hợp ẩm thực đêm hội tụ hơn 200 món ngon từ ăn vặt đến ăn no, các món đồ uống hottrend giải khát siêu ngon.</p>
                                    </div>
                                    <div class="clearfix"><img loading="lazy" src="https://asiapark.sunworld.vn/wp-content/uploads/2022/05/Brown-Mothers-Day-Vintage-Scrapbook-Photo-Collage-1-300x240.png" alt="" width="641" height="513" class=" wp-image-4756 aligncenter" srcset="https://helio.vn/media/uploads/2023/11/13/ly-do-den-helio-khi-di-du-lich-da-nang.jpg" sizes="(max-width: 641px) 100vw, 641px" /></div>
                                    <div class="w100"></div>
                                    <div class="clearfix"></div>
                                    <div class="w55">
                                        <p class="f-17 texj" style="text-align: justify;">Sân khấu âm nhạc cực chill mỗi tối. Sau một ngày dài khám phá những điểm đến của Đà Nẵng, tận hưởng những món ngon của khu tổ hợp ẩm thực đêm, thì những bản nhạc tại sân khấu của Mecutis sẽ giúp bạn thư giãn.</p>
                                    </div>
                                    <div class="clearfix" style="text-align: center;"></div>
                                    <div class="clearfix" style="text-align: center;"></div>
                                    <div class="w55">
                                        <p class="f-17 texj" style="text-align: justify;"><span class="dropcap"></span></p>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="w100"><img loading="lazy" src="https://asiapark.sunworld.vn/wp-content/uploads/2022/05/Brown-Mothers-Day-Vintage-Scrapbook-Photo-Collage-300x240.png" alt="" width="681" height="544" class=" wp-image-4754 aligncenter" srcset="https://helio.vn/media/uploads/2023/11/13/img_5003.jpg" sizes="(max-width: 681px) 100vw, 681px" /></div>
                                    <div class="clearfix"></div>
                                    <div class="w55">
                                        <p class="f-17 texj" style="text-align: justify;">Xả stress cùng Trạm Giải Trí. Đến với Trạm Giải Trí Helio bạn sẽ được thể hiện tài năng hội họa của mình qua những bức tượng, bức tranh cát, tranh số hóa. Đây được xem là một điểm hẹn được các bé con rất yêu thích mỗi khi đến với Helio.</p>
                                    </div>
                                    <div class="w100"><img loading="lazy" src="https://asiapark.sunworld.vn/wp-content/uploads/2023/01/bc5bb1d36c13b54dec02-1-300x225.jpg" alt="" width="682" height="511" class="wp-image-5350 aligncenter" srcset="https://helio.vn/media/uploads/2023/11/13/ly-do-den-helio-khi-di-du-lich-da-nang3-1.jpg" sizes="(max-width: 682px) 100vw, 682px" /> <img loading="lazy"  /></div>
                                    <div>
                                        <div></div>
                                        <div class="clearfix" style="text-align: justify;"><span> Tận hưởng không gian sự kiện náo nhiệt. Nếu bạn đến Helio vào các ngày lễ đặc biệt trong năm thì còn được vi vu với những lễ hội vô cùng náo nhiệt. Các chương trình sự kiện rộn ràng như múa lân, show diễn văn nghệ, đua xe thăng bằng, các không gian check in nổi bật, workshop đầy bổ ích cho các bé yêu.</span></div>
                                        <div class="w55">
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="w100"><img loading="lazy" src="https://asiapark.sunworld.vn/wp-content/uploads/2022/05/Brown-Mothers-Day-Vintage-Scrapbook-Photo-Collage-8-300x240.png" alt="" width="669" height="535" class=" wp-image-4764 aligncenter" srcset="https://helio.vn/media/uploads/2023/11/13/ly-do-den-helio-khi-di-du-lich-da-nang-2.jpg" sizes="(max-width: 669px) 100vw, 669px" /></div>
                                    <div class="clearfix"></div>
                                    <div class="w80">
                                        <p class="f-17 marginB30 texj">Một thiên đường ẩm thực vạn người mê với hàng trăm món ăn ngon tuyệt, một khu vui chơi náo nhiệt tưng bừng cùng những sự kiện bùng nổ. Chắc chắn sẽ khiến chuyến du lịch của bạn ấn tượng hơn bao giờ hết. Hãy đến và khám phá ngay nha!</p>
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
