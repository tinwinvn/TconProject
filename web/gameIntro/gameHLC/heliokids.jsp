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
                                        <p><strong>HELIO KIDS &#8211; Thiên đường dành riêng cho bé </strong></p>
                                        <p style="text-align: justify;">
                                        Helio Kids là khu vui chơi mang tính giáo trí, dành cho bé từ 0-9 tuổi. Với diện tích hơn 2,700 m2 cùng 15 phòng chơi được thiết kế dựa trên mô hình vui chơi tiên tiến nhất trên thế giới hiện nay, kết hợp giữa hai yếu tố “giáo dục” và “giải trí” trong các trò chơi. Helio Kids thật sự là địa điểm được các bố mẹ tin tưởng dành cho các bé, nếu có dịp đến với Đà Nẵng.    
                                        </p> 
                                        <p><img src="" alt="" width="632" height="421" class=" wp-image-4749 aligncenter" srcset="https://danangfantasticity.com/wp-content/uploads/2016/11/helio-kids-thien-duong-danh-rieng-cho-be-tai-helio-center-danang-fantasticity-com.png" sizes="(max-width: 632px) 100vw, 632px" /></p>

                                        <p>Helio Kids được mệnh danh là thiên đường dành riêng cho bé với đa dạng các phòng chơi hấp dẫn: siêu thị, nhà hàng, phòng hóa trang, studio, vịnh hải dương, bàn nước, ga xe lửa, công trường, xưởng nghệ thuật, phòng mầm non, bếp nhí, nhà phao, nhà hơi, hồ cát, câu cá, tàu lửa…..</p>
                                        <P>Bé có thể rèn luyện thể chất với các trò chơi vận động tại nhà banh, nhà phao, hay khéo léo làm những chiếc bánh thơm ngon tại bếp nhí, hay thể hiện sở thích của mình qua các trò chơi: tô tượng, vẽ tranh, làm thiệp cát, hay hóa thân thành các nhân vật mình yêu thích: bác sĩ, kỹ sư, lính cứu hỏa, công chúa Elsa, bạch tuyết, lọ lem …</P>    

                                        <P>Đặc biệt, Helio Kids có một sân khấu hoạt náo với nhiều hoạt động hấp dẫn, từ biểu diễn các vở kịch cổ tích, đến các trò chơi tập thể, các chương trình ca múa nhạc… mang đến cho bé những phút giây thật sảng khoái và ý nghĩa.</P>    

                                        <p><img src="" alt="" width="632" height="421" class=" wp-image-4749 aligncenter" srcset="https://danangfantasticity.com/wp-content/uploads/2016/11/helio-kids-thien-duong-danh-rieng-cho-be-tai-helio-center-danang-fantasticity-com.png" sizes="(max-width: 632px) 100vw, 632px" /></p>
                                        
                                    </div>       
                                    
                                    <div class="w55">                                      
                                        <p><strong>&#8211; Giá vé Helio Kids  </strong></p>
                                        <p style="text-align: justify;">           
                                        Vé vào khu Helio Kids vẫn được chia thành 3 loại tương ứng với thẻ xanh, hồng, vàng. Ngoài ra, khi bé muốn đăng ký lớp học đầu bếp nhí thì thêm 35.000 vnđ.</p>                                            
                                        <p><img src="" alt="" width="632" height="421" class=" wp-image-4749 aligncenter" srcset="https://www.vietfuntravel.com.vn/image/data/Blog/chia-se/bang-gia-ve-tham-quan-khu-vui-choi-phuc-hop-helio-center-o-da-nang/bang-gia-ve-tham-quan-khu-vui-choi-phuc-hop-helio-center-o-da-nang-h6.jpg" sizes="(max-width: 632px) 100vw, 632px" /></p>
                                       
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
