<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link href="https://cdn.jsdelivr.net/npm/remixicon@3.0.0/fonts/remixicon.css" rel="stylesheet"/>
        <link rel="stylesheet" href="css/styles.css" />
        <title>TCON</title>
    </head>
    <body>
        <jsp:include page="navbar.jsp"></jsp:include>
            <header>
                <div class="section__container">
                    <div class="header__content">
                        <h1>Travel</h1>
                        <p>
                            Embark on a journey of a lifetime and explore the world's most
                            breathtaking destinations with our expert travel advice. From exotic
                            beaches to cultural wonders, we've got you covered with our
                            comprehensive travel guides and insider tips.
                        </p>
                        <button>Read more</button>
                    </div>
                </div>
            </header>

            <section class="journey__container">
                <div class="section__container">
                    <h2 class="section__title">Start Your Journey</h2>
                    <p class="section__subtitle">The most searched countries in March</p>
                    <div class="journey__grid">
                        <div class="country__card">
                            <img src="images/country-1.jpg" alt="country" />
                            <div class="country__name">
                                <i class="ri-map-pin-2-fill"></i>
                                <span>Santorini, Greece</span>
                            </div>  
                        </div>
                        <div class="country__card">
                            <img src="images/country-2.jpg" alt="country" />
                            <div class="country__name">
                                <i class="ri-map-pin-2-fill"></i>
                                <span>Vernazza, Italy</span>
                            </div>
                        </div>
                        <div class="country__card">
                            <img src="images/country-3.jpg" alt="country" />
                            <div class="country__name">
                                <i class="ri-map-pin-2-fill"></i>
                                <span>San Francisco</span>
                            </div>
                        </div>
                        <div class="country__card">
                            <img src="images/country-4.jpg" alt="country" />
                            <div class="country__name">
                                <i class="ri-map-pin-2-fill"></i>
                                <span>navagio, Greece</span>
                            </div>
                        </div>
                        <div class="country__card">
                            <img src="images/country-5.jpg" alt="country" />
                            <div class="country__name">
                                <i class="ri-map-pin-2-fill"></i>
                                <span>Ao Nang, Thailand</span>
                            </div>
                        </div>
                        <div class="country__card">
                            <img src="images/country-6.jpg" alt="country" />
                            <div class="country__name">
                                <i class="ri-map-pin-2-fill"></i>
                                <span>Phi Phi Island, Thailand</span>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <section class="banner__container">
                <div class="section__container">
                    <div class="banner__content">
                        <h2>Discount 10-30% Off</h2>
                        <p>
                            Travel the world on a budget with our unbeatable discounted travel
                            deals. Whether you're looking for a last-minute escape or planning
                            ahead, we've got you covered with incredible discounts on flights,
                            hotels, and packages. Don't wait, book now and experience the
                            adventure of a lifetime without breaking the bank.
                        </p>
                        <button>See Tours</button>
                    </div>
                </div>
            </section>

            <section class="display__container">
                <div class="section__container">
                    <h2 class="section__title">Why Choose Us</h2>
                    <p class="section__subtitle">
                        The gladdest moment in human life, is a departure into unknown lands.
                    </p>
                    <div class="display__grid">
                        <div class="display__card grid-1">
                            <img src="images/grid-1.jpg" alt="grid" />
                        </div>
                        <div class="display__card">
                            <i class="ri-earth-line"></i>
                            <h4>Passionate Travel</h4>
                            <p>Fuel your passion for adventure and discover new horizons</p>
                        </div>
                        <div class="display__card">
                            <img src="images/grid-2.jpg" alt="grid" />
                        </div>
                        <div class="display__card">
                            <img src="images/grid-3.jpg" alt="grid" />
                        </div>
                        <div class="display__card">
                            <i class="ri-road-map-line"></i>
                            <h4>Beautiful Places</h4>
                            <p>Uncover the world's most breathtakingly beautiful places</p>
                        </div>
                    </div>
                </div>
            </section>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
