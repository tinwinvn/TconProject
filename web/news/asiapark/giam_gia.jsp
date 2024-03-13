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
                                        <p><strong>ASIA PARK &#8211; Công viên Châu Á, Đà Nẵng giảm giá vé 40% cho học sinh, sinh viên toàn quốc mùa Giáng sinh  </strong></p>
                                        <p style="text-align: justify;">Từ 1/12 đến 31/12, du khách là học sinh, sinh viên toàn quốc có thể trải nghiệm không giới hạn “thiên đường giải trí” Công viên Châu Á- Asia Park (Đà Nẵng), với giá vé chỉ từ 100.000 đồng.<br />
                                        <p><img src="https://asiapark.sunworld.vn/wp-content/uploads/2022/05/DJI_0198-300x200.jpg" alt="" width="632" height="421" class=" wp-image-4749 aligncenter" srcset="https://asiapark.sunworld.vn/wp-content/uploads/2023/12/1920x1080-1024x576.jpg" sizes="(max-width: 632px) 100vw, 632px" /></p>
                                        <p class="f-17 texj" style="text-align: justify;"><span class="dropcap"></span>Cụ thể, từ nay đến 31/12, bên cạnh ưu đãi vào cổng miễn phí, học sinh, sinh viên toàn quốc đến Công viên Châu Á có thể mua vé vui chơi all in one với mức giá chỉ 100.000 đồng/vé trẻ em, 120.000 đồng/ vé người lớn (cao từ 1,4m trở lên). Đây là mức ưu đãi khủng khi giảm tới 40% so với giá niêm yết..</p>
                                    </div>
                                    <div class="clearfix"><img loading="lazy" src="https://asiapark.sunworld.vn/wp-content/uploads/2022/05/Brown-Mothers-Day-Vintage-Scrapbook-Photo-Collage-1-300x240.png" alt="" width="641" height="513" class=" wp-image-4756 aligncenter" srcset="https://asiapark.sunworld.vn/wp-content/uploads/2023/12/MAY01043-1024x683.jpg" sizes="(max-width: 641px) 100vw, 641px" /></div>
                                    <div class="w100"></div>
                                    <div class="clearfix"></div>
                                    <div class="w55">
                                        <p class="f-17 texj" style="text-align: justify;">Gợi ý cho du khách khi tận hưởng ưu đãi này tại công viên là trải nghiệm trò chơi biểu tượng nhất- tàu lượn Queen Cobra, được thiết kế ấn tượng với dạng treo, đưa du khách lên độ cao 34m rồi lao xuống tự do với tốc độ tới 80 km/h. Khi ra mắt, trò chơi được xác lập là tàu lượn dạng treo lớn nhất Việt Nam. Nếu muốn trải nghiệm những trò nhẹ nhàng hơn, những chiếc cốc khổng lồ tại Fairy Tea House hay “rơi tự do” với Golden Sky Tower là lựa chọn cũng vô cùng thú vị…</p>
                                    </div>
                                    <div class="clearfix" style="text-align: center;"></div>
                                    <div class="clearfix" style="text-align: center;"></div>
                                    <div class="w55">
                                        <p class="f-17 texj" style="text-align: justify;"><span class="dropcap"></span></p>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="w100"><img loading="lazy" src="https://asiapark.sunworld.vn/wp-content/uploads/2022/05/Brown-Mothers-Day-Vintage-Scrapbook-Photo-Collage-300x240.png" alt="" width="681" height="544" class=" wp-image-4754 aligncenter" srcset="https://asiapark.sunworld.vn/wp-content/uploads/2023/12/DSC05200-1024x697.jpg" sizes="(max-width: 681px) 100vw, 681px" /></div>
                                    <div class="clearfix"></div>
                                    <div class="w55">
                                        <p class="f-17 texj" style="text-align: justify;">Tại quảng trường Sun Wheel, hai cổng vòm với lung linh đèn led, lấp lánh những quả châu, lá thông… tạo nên một không gian vô cùng sống động. Không chỉ thế, du khách sẽ rất thích thú khi hóa thân thành ông bà già noel để vận hành mô hình chiếc xe cưỡi tuần lộc đi trao quà tại đài phun nước, hay những chú tuần lộc đáng yêu được làm bằng gỗ và những hộp quà khổng lồ tạo hiệu ứng thị giác ấn tượng. Cây thông Noel ở cổng công viên cũng sẽ được thắp sáng lung linh, hứa hẹn trở thành một tụ điểm chụp ảnh không thể bỏ qua trong dịp này cho người dân Đà Nẵng và du khách.</p>
                                    </div>
                                    <div class="w100"><img loading="lazy" src="https://asiapark.sunworld.vn/wp-content/uploads/2023/01/bc5bb1d36c13b54dec02-1-300x225.jpg" alt="" width="682" height="511" class="wp-image-5350 aligncenter" srcset="https://asiapark.sunworld.vn/wp-content/uploads/2023/12/Giang-sinh_Quang-truong.jpg" sizes="(max-width: 682px) 100vw, 682px" /> <img loading="lazy" src="" alt="" width="687" height="458" class="wp-image-4840 aligncenter" srcset="https://asiapark.sunworld.vn/wp-content/uploads/2024/02/trai-nghiem-tai-cho-dem-son-tra-5.jpg" sizes="(max-width: 687px) 100vw, 687px" /></div>
                                    <div>
                                        <div></div>
                                        <div class="clearfix" style="text-align: justify;"><span><span>Ngoài không khí Giáng sinh ngập tràn với nhiều tiểu cảnh và mô hình trang trí, điều hấp dẫn du khách đến với Công viên Châu Á còn là ẩm thực đường phố hấp dẫn tại các gian hàng ở quảng trường Sun Wheel. Những xiên que nóng hổi, bánh gà, tokbokki… sẽ làm “ấm bụng” bất cứ du khách nào giữa tiết trời se lạnh của Đà Nẵng vào đông.</span></div>
                                        <div class="w55">
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="clearfix"></div>
                                    <div class="w80">
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
                                 
                                </div>
                                </div>
                            </section>                </div>
                    </div>
                </div>
            </div>
        </div>    </body>
</html>
