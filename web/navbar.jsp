<%-- 
    Document   : navbar
    Created on : Jan 14, 2024, 7:14:25 PM
    Author     : admin
--%>

<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    </head>
    <body>
        <nav>
            <div class="nav__logo"><a href="#">TCON</a></div>
            <ul class="nav__links">
                <li class="link">Home</li>
                <li class="link">Blog</li>
                <li class="link">Offers</li>
                <li class="link">Services</li>
                <li class="link">Contacts</li>
                    <c:if test="${sessionScope.acc != null}">
                    <li>
                        <div class="dropdown">
                            <button onclick="myFunction()" class="dropbtn">HELLO<span class="caret"></span></button>
                            <div id="myDropdown" class="dropdown-content">
                                <a href="LogOutServlet">LOG OUT</a>
                                <a href="profile.jsp?userId=${sessionScope.acc.userID}">PROFILE</a>
                                <c:if test="${sessionScope.acc.role == 1}">
                                    <a href="admin/admin.jsp?userId=${sessionScope.acc.userID}">USERS MANAGER</a>
                                </c:if>
                                    <a href="payment/payment_history.jsp?userID=${sessionScope.acc.userID}">Lịch sử giao dịch</a>
                                    <a href="favourite_list/favourite_list.jsp?userID=${sessionScope.acc.userID}">Danh sách yêu thích</a>
                                    <a href="booking/notification_list.jsp">Thông báo</a>
                            </div>
                        </div>
                    </li>


                </c:if>
                <c:if test="${sessionScope.acc == null}">
                    <li> 

                        <form action="LoginServlet" method="get">
                            <button class="dropbtn" type="submit">Đăng nhập</button> 
                        </form>
                    </li>
                </c:if>
            </ul>
        </nav>  
        <script>
            /* When the user clicks on the button, 
             toggle between hiding and showing the dropdown content */
            function myFunction() {
                document.getElementById("myDropdown").classList.toggle("show");
            }

            // Close the dropdown if the user clicks outside of it
            window.onclick = function (event) {
                if (!event.target.matches('.dropbtn')) {
                    var dropdowns = document.getElementsByClassName("dropdown-content");
                    var i;
                    for (i = 0; i < dropdowns.length; i++) {
                        var openDropdown = dropdowns[i];
                        if (openDropdown.classList.contains('show')) {
                            openDropdown.classList.remove('show');
                        }
                    }
                }
            }
        </script>
    </body>
</html>