<%-- 
    Document   : news4
    Created on : Mar 12, 2024, 4:20:39 PM
    Author     : Nguyen Nhu Loc
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
                                        <p><strong>ASIA PARK &#8211; SỐNG TRONG CƠN ÁC MỘNG CÙNG SỰ KIỆN HALLOWEEN QUY MÔ LỚN NHẤT VIỆT NAM </strong></p>
                                        <p style="text-align: justify;">Tiếp nối thành công tại chuỗi sự kiện Halloween đã diễn ra những ngày cuối tháng 10, Asia Park chào đón tháng 11 cùng diện mạo hoàn toàn mới mẻ, ấn tượng với chuỗi các hoạt động tương tác chưa từng có tại sự kiện quy mô nhất trong năm – Asia Park Nightmares. Điểm nhấn là ba mê cung chủ đề khác biệt – Bí Ẩn Rừng Sâu, Lăng mộ quỷ ám và Trại Giam Tâm Thần, cùng dàn diễn viên tài năng kết hợp với hàng loạt hiệu ứng tương tác sống động, sẽ mang tới cho du khách những trải nghiệm còn hơn cả sự “rùng rợn” khi tới thử thách sự dũng cảm tại Asia Park trong dịp này.<br />
                                        </p>
                                        <p><img src="https://asiapark.sunworld.vn/wp-content/uploads/2022/05/DJI_0198-300x200.jpg" alt="" width="632" height="421" class=" wp-image-4749 aligncenter" srcset="https://asiapark.sunworld.vn/wp-content/uploads/2023/10/1920x1080-1-1024x576.jpg" sizes="(max-width: 632px) 100vw, 632px" /></p>
                                        <p class="f-17 texj" style="text-align: justify;"><span class="dropcap"></span>Hãy sẵn sàng để bước vào không gian mê cung và đắm chìm trong nỗi khiếp sợ với những màn hù dọa tương tác đáng kinh ngạc. Với các hiệu ứng đặc biệt và dàn diễn viên sinh động, trái tim của bạn sẽ tưởng chừng như sắp sửa nhảy ra khỏi lồng ngực và khiến tâm hồn bạn sục sôi vì sợ hãi. NIGHTMARES còn bao gồm trải nghiệm không giới hạn thế giới trò chơi đỉnh cao cùng các điểm tham quan hấp dẫn của Công viên Châu Á. Tất cả sẽ được bao gồm trong giá vé vào cửa – nhưng điểm khác biệt ở đây cơ hội có một không hai để trải nghiệm những trò chơi này trong bóng tối của những cơn ác mộng!</p>
                                    </div>

                                    <div class="w100"></div>
                                    <div class="clearfix"></div>
                                    <div class="w55">
                                        <p class="f-17 texj" style="text-align: justify;"> Đừng quên rủ những người bạn thích cảm giác mạnh và lên lịch ngay để tham gia sự hoành tráng ma quái nhất Việt Nam từ trước đến nay này. Cho dù bạn đang muốn trải nghiệm cảm giác sợ hãi đến thấu xương hay chỉ muốn đắm chìm trong những màn hù dọa cực kỳ thú vị, sự kiện Halloween NIGHTMARES của Asia Park hứa hẹn sẽ mang đến một khoảng thời gian vui vẻ khủng khiếp cho tất cả mọi người. Thông tin chi tiết về những sự kiện đặc biệt này sẽ được chúng tôi tiếp tục cập nhật trên trang Fanpage của công viên châu Á trong những tuần tới. Vì vậy, hãy chú ý theo dõi trang fanpage Asia Park – Công viên châu Á để không bỏ lỡ thông tin và chuẩn bị tinh thần cho những bất ngờ và hồi hộp thót tim sẽ thực sự thách thức lòng can đảm của bạn.</p>
                                    </div>

                                    <div class="clearfix" style="text-align: center;"></div>
                                    <div class="clearfix" style="text-align: center;"></div>


                                    <div class="clearfix"></div>
                                    <div class="clearfix"></div>
                                    <div class="clearfix">

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
                            </section> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
