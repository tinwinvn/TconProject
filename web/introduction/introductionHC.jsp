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
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="introduction.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="../css_god/details.css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="nav.jsp"></jsp:include>
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
                                        <p><strong>HELIO CENTER &#8211; TRUNG TÂM GIẢI TRÍ PHỨC HỢP ĐA DỊCH VỤ ĐẦU TIÊN TẠI THÀNH PHỐ ĐÀ NẴNG </strong></p>
                                        <p style="text-align: justify;">Với diện tích sử dụng hơn 35.000 m2 và nằm tại trung tâm thành phố, Helio Center mang đến cho người dân Đà Nẵng và khách du lịch một lựa chọn hoàn hảo nhất để vui chơi giải trí cùng bạn bè và gia đình mỗi ngày.<br />
                                            Helio Center bao gồm các sản phẩm chính là Helio Kids, Helio Play, và Chợ đêm Helio, cùng Metiz Cinema với hàng chục sự kiện được tổ chức hoành tráng mỗi năm.</p>
                                        <p><img src="introduction_image/helio1.jpg" alt="" width="632" height="421" class=" wp-image-4749 aligncenter" sizes="(max-width: 632px) 100vw, 632px" /></p>
                                        <p class="f-17 texj" style="text-align: justify;"><span class="dropcap">H</span>elio Kids là mô hình edutainment thực sự dành cho trẻ em. Đây là mô hình mới trên thế giới, kết hợp giữa hai thuật ngữ “education” và “entertainment”, nghĩa là một khu vui chơi kết hợp giữa tính giải trí và giáo dục trong các trò chơi.</p>
                                    </div>
                                    <div class="clearfix"><img loading="lazy" src="introduction_image/helio2.jpg" alt="" width="641" height="513" class=" wp-image-4756 aligncenter"  sizes="(max-width: 641px) 100vw, 641px" /></div>
                                    <div class="w100"></div>
                                    <div class="clearfix"></div>
                                    <div class="w55">
                                        <p class="f-17 texj" style="text-align: justify;">Đến với Helio Kids, bạn và con trẻ sẽ được trải nghiệm những mô hình vui chơi hoàn toàn mới lạ với hàng trăm trò chơi hấp dẫn. Với tổng diện tích lên đến hơn 2.700 m2, hơn 30 khu vực chơi, có sức chứa gần 1.000 người; Helio Kids thực sự là một khu vui chơi trong nhà và ngoài trời có quy mô hoành tráng nhất hiện nay dành cho trẻ em từ 1 tháng tuổi - 10 tuổi tại Đà Nẵng.
</p>
                                    </div>
                                    <div class="clearfix" style="text-align: center;"></div>
                                    <div class="clearfix" style="text-align: center;"></div>
                                    <div class="w55">
                                        <p class="f-17 texj" style="text-align: justify;"><span class="dropcap">H</span>elio Kids có khu vực chơi trong nhà với số lượng trò chơi lên hàng trăm trò, và có thể mở rộng ra đến hàng nghìn cách chơi, dựa trên sự sáng tạo của trẻ.</p>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="w100"><img loading="lazy" src="introduction_image/helio3.jpg" alt="" width="681" height="544" class=" wp-image-4754 aligncenter" sizes="(max-width: 681px) 100vw, 681px" /></div>
                                    <div class="clearfix"></div>
                                    <div class="w55">
                                        <p class="f-17 texj" style="text-align: justify;">Helio Kids còn là khu vui chơi cho trẻ em với các hạng mục lần đầu tiên xuất hiện tại Việt Nam. Ví dụ như các Khu giả lập với những đồ chơi kích thước thật, các Khu vận động chuyên biệt dành cho các bé dưới 2 tuổi, Khu khảo cổ xương khủng long, Khu trò chơi tương tác với tính sáng tạo cao... Tất cả đều được thiết kế theo tiêu chuẩn cao nhất từ các chuyên gia hàng đầu của Mỹ.</p>
                                    </div>
                                    <div class="w100"><img loading="lazy" src="introduction_image/helio4.jpg" alt="" width="682" height="511" class="wp-image-5350 aligncenter" /> <img loading="lazy" src="introduction_image/helio5.jpg" alt="" width="687" height="458" class="wp-image-4840 aligncenter"  sizes="(max-width: 687px) 100vw, 687px" /></div>
                                    <div><img loading="lazy" src="introduction_image/helio6.jpg" alt="" width="682" height="455" class=" wp-image-5733 aligncenter"  sizes="(max-width: 682px) 100vw, 682px" /></div>
                                    <div>
                                        <div></div>
                                        <div class="clearfix" style="text-align: justify;">Helio Play - tập hợp những mô hình game thú vị, hiện đại nhất trên thế giới, đảm bảo mang lại cho bạn những giây phút vui chơi đầy sôi động và hào hứng. Chưa hết, Helio Play còn có một phòng Game hoành tráng diện tích gần 1.000m2 với những máy game thùng hấp dẫn và hệ thống Wii – PlayStation. Helio Play chắc chắn là lựa chọn không thể bỏ qua cho các game thủ.</div>
                                        <div class="w55">
                                            <p class="f-17 texj" style="text-align: justify;">Điểm đặc biệt của Helio Play chính là hệ thống thanh toán tối tân: Power Card. Bạn có thể nạp tiền trước, quẹt thẻ để chi trả nhanh chóng hoặc kiểm tra quản lý số dư của mình. Tất cả các dịch vụ tại Helio đều được thanh toán thông qua thẻ. Chỉ cần quẹt thẻ, và cuộc vui bắt đầu!</p>
                                        </div>
                                    </div>
                                    <div class="clearfix"><span style="text-align: justify;" class="dropcap">C</span><span style="text-align: justify;">hợ đêm Helio được mệnh danh là thiên đường ẩm thực với hàng ngàn món ngon, từ đồ nướng, đồ ăn no, đến các món ăn vặt hấp dẫn. Thêm vào đó bạn còn được thưởng thức đại tiệc âm nhạc hằng đêm. Đến với nơi đây, bạn sẽ tìm thấy những món ăn với hương vị thơm ngon không thiếu thứ gì nhé.</span></div>
                                    <div class="clearfix"></div>
                                    <div class="w100"><img loading="lazy" src="introduction_image/heliomarket.jpg" alt="" width="669" height="535" class=" wp-image-4764 aligncenter"  /></div>
                                    <div class="clearfix"></div>
                                    <div class="w80">
                                        <div class="w100"><img loading="lazy" src="introduction_image/heliocinema.jpg" alt="" width="669" height="535" class=" wp-image-4764 aligncenter"  /></div>
                                        <p class="f-17 marginB30 texj">Metiz Cinema đem đến 5 phòng chiếu phim được trang bị những công nghệ hiện đại nhất. Thưởng thức phim tại Metiz Cinema là bạn được sống trong không gian hình ảnh chân thực với thiết kế màn hình uốn cong cực đại, phản chiếu tốt từ mọi hướng nhìn. Âm thanh cực đã đến từ công nghệ Dolby danh tiếng cho trải nghiệm thính giác vô cùng sống động. Phòng chiếu sang trọng với công nghệ ghế da cao cấp cùng các tiện nghi được đáp ứng phù hợp nhất.</p>
                                    </div>
                                    <div class="w55">
                                        <p class="f-17 texj marginB30">Helio Center cũng cung cấp một dịch vụ tiệc chuyên nghiệp, với trang thiết bị hiện đại và đội ngũ nhân viên thân thiện, đáp ứng nhu cầu của mọi khách hàng ở mọi lứa tuổi.<br>
                                                                        Cùng với hàng chục sự kiện lớn nhỏ được tổ chức thường nhật và vào các dịp lễ Tết, Helio Center hứa hẹn sẽ trở thành một địa điểm dạo chơi thú vị nhất cho giới trẻ Đà Nẵng và khách du lịch.</p>
                                    </div>
                                    
                                    <div class="w100"><img loading="lazy" src="introduction_image/helioend.png" alt="" width="657" height="525" class=" wp-image-4760 aligncenter"  /></div>
                                    <div class="clearfix"></div>
                                    <div class="clearfix">
                                        <p style="text-align: justify;"><span>Ngoài ưu đãi </span><b>MIỄN PHÍ VÀO CỬA</b><span> tham quan cho toàn bộ du khách, Đến Helio Center, bạn được trải nghiệm một hình thức thanh toán hoàn toàn mới, không cần tiền mặt, không cần xu, chỉ cần quẹt thẻ Power Card và trải nghiệm cuộc vui. Thật dễ dàng đúng không !!! Chưa hết, toàn bộ thông tin tài khoản thẻ Helio Power Card của bạn: số dư, số ticket, khuyến mãi và nhiều tiện ích khác đều có thể dễ dàng tra cứu được.</span></p>
                                        <p style="text-align: justify;"><b>✔️POWER CARD NORMAL – THẺ THƯỜNG :</b><span> Thẻ màu Xanh đậm và được phát hành miễn phí cho tất cả các khách hàng đến vui chơi ở Helio</span></p>
                                        <p style="text-align: justify;"><b>✔️POWER CARD MEMBER – THẺ HỒNG :</b><span> Thẻ màu Hồng tươi và dành cho khách hàng đã đăng ký thông tin cá nhân để trở thành thành viên của Helio Center. Với điều kiện là thẻ đã có 3 lần giao dịch (*) vào 3 ngày khác nhau tại Helio Center. (*) Lần giao dịch = Lần nạp tiền hoặc quẹt thẻ chơi game. Đặc biệt còn giảm 20% cho tất cả các dịch vụ tại Helio Center (ngoại trừ dịch vụ ăn uống).</span></p>
                                        <p style="text-align: justify;"><b>✔️POWER CARD GOLD - THẺ VÀNG :</b><span> Thẻ màu Vàng tươi và dành cho các khách hàng đặc biệt thân thiết của Helio Center, có chi tiêu tích lũy bằng thẻ Thành viên trên 3.000.000 đ/năm. Đặc biệt giảm 25% cho tất cả các dịch vụ tại Helio Center (ngoại trừ dịch vụ ăn uống) và giảm tối thiểu 5% khi đặt tiệc tại Helio Center (ngoại trừ dịch vụ ăn uống). Ngoài ra, quý khách còn nhận ưu đãi cho các chương trình đặc biệt tại Helio Center và nhận quà từ Helio Center trong ngày sinh nhật. Để duy trì Thẻ Vàng, khách hàng phải có chi tiêu tích lũy bằng thẻ trong 01 năm kể từ ngày nâng hạng thẻ là 3.000.000 đồng. Nếu trong khoảng thời gian 01 năm, khách hàng không đáp ứng được điều kiện trên, Helio Center có quyền thu hồi lại Thẻ Vàng kèm các ưu đãi khác từ thẻ. Mỗi năm có 2 đợt nâng cấp lên Thẻ Vàng vào tháng 6 và tháng 12.</span></p>
                                     </div>
                                    <div class="clearfix"><em style="text-align: justify;">Cũng như các bạn, chúng tôi có 365 ngày một năm; nhưng Helio không chọn mặt trời làm trục quay mà tất cả mọi hoạt động đều lấy tiếng cười làm tâm điểm. Chúng tôi mong muốn tất cả mọi người khi đến đây đều vui vẻ, thoải mái, và chúng tôi cũng lấy đó làm tiêu chí để tồn tại và phát triển. Helio mang đến một không khí vui vẻ của những trò chơi, những sự kiện, những nhân viên với nụ cười rạng rỡ… để tạo động lực cho mọi người đến đây tìm thấy niềm vui của riêng mình và tận hưởng niềm vui ấy.
Helio mang trong mình niềm vui, và mong muốn lan tỏa đến tất cả mọi người.</em></div>
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
