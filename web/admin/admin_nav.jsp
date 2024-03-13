
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">     
        <!-- Boxicons -->
	<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
	<!-- My CSS -->
	<link rel="stylesheet" href="admin_style.css">
        <title>JSP Page</title>
    </head>
    <jsp:useBean id="userDAO" class="ModelDAO.UserDAO"></jsp:useBean>
    <body>
        <!-- SIDEBAR -->
	<section id="sidebar">
		<a href="../index.jsp" class="brand">
			<i class='bx bxs-smile'></i>
			<span class="text">Tcon</span>
		</a>
		<ul class="side-menu top">
			<li class="active">
				<a href="admin.jsp">
					<i class='bx bxs-dashboard' ></i>
					<span class="text">Dashboard</span>
				</a>
			</li>
                <c:if test="${sessionScope.acc.role == 1}">
			<li>
				<a href="listuser.jsp">
					<i class='bx bxs-shopping-bag-alt' ></i>
					<span class="text">Users List</span>
				</a>
			</li>
                </c:if>
			<li>
				<a href="admin_notification.jsp">
					<i class='bx bxs-group' ></i>
					<span class="text">Notification</span>
				</a>
			</li>
		</ul>
		<ul class="side-menu">
			<li>
				<a href="../LogOutServlet" class="logout">
					<i class='bx bxs-log-out-circle' ></i>
					<span class="text">Logout</span>
				</a>
			</li>
		</ul>
	</section>
	<!-- SIDEBAR -->



	<!-- CONTENT -->
	<section id="content">
		<!-- NAVBAR -->
		<nav>
			<i class='bx bx-menu' ></i>
		</nav>
    </body>
    <script src="admin_js.js"></script>
    
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
</html>
