<%-- 
    Document   : listuser
    Created on : Mar 3, 2024, 10:56:32 AM
    Author     : tbinh
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="../css/listuser.css">
        <link rel="stylesheet" href="admin_style.css">
        <title>JSP Page</title>
    </head>
    <body>       
        <jsp:include page="admin_nav.jsp"></jsp:include>
        <div class="head-title">
                <div class="left">
                    <h1>Dashboard</h1>
                    <ul class="breadcrumb">
                        <li>
                            <a href="#">Dashboard</a>
                        </li>
                        <li><i class='bx bx-chevron-right' ></i></li>
                        <li>
                            <a class="active" href="../index.jsp">User Manager</a>
                        </li>
                    </ul>
                </div>
            </div>
        <jsp:useBean id="uDAO" class="ModelDAO.UserDAO"></jsp:useBean>
        <c:set var="listUser" value="${uDAO.allUser}"/>
        <c:set var="ul" value="listUser"/>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 card-margin">
                        <div class="card search-form">
                            <div class="card-body p-0">
                                <form id="search-form" action="../SearchUserServlet" method="post" onsubmit="checkSearchForm()">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="row no-gutters">
                                                <div class="col-lg-8 col-md-6 col-sm-12 p-0">
                                                    <input type="text" placeholder="Search..." class="form-control" id="search" name="txtSearch">
                                                </div>
                                                <div class="col-lg-1 col-md-3 col-sm-12 p-0">
                                                    <button type="submit" class="btn btn-base">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12">
                        <div class="card card-margin">
                            <div class="card-body">
                                <div class="row search-body">
                                    <div class="col-lg-12">
                                        <div class="search-result">
                                            <div class="result-header">
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <div class="records">Showing: <b>1-20</b> of <b>200</b> result</div>
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <div class="result-actions">
                                                            <form action="../SortUserServlet" method="post" id="sortForm">
                                                                <input type="hidden" name="sortPerformed" id="sortPerformed" value="false"> <!-- Input ẩn để lưu trữ trạng thái sắp xếp -->
                                                                <div class="result-sorting">
                                                                    <span>Sort By:</span>
                                                                    <select class="form-control border-0" id="exampleOption" name="sortBy" onchange="checkSortForm()">
                                                                        <option value="1">Relevance</option>
                                                                        <option value="2">Names (A-Z)</option>
                                                                        <option value="3">Names (Z-A)</option>
                                                                    </select>
                                                                </div>
                                                            </form>
                                                            <!--                                                <div class="result-views">
                                                                                                                <button type="button" class="btn btn-soft-base btn-icon">
                                                                                                                    <svg
                                                                                                                        xmlns="http://www.w3.org/2000/svg"
                                                                                                                        width="24"
                                                                                                                        height="24"
                                                                                                                        viewBox="0 0 24 24"
                                                                                                                        fill="none"
                                                                                                                        stroke="currentColor"
                                                                                                                        stroke-width="2"
                                                                                                                        stroke-linecap="round"
                                                                                                                        stroke-linejoin="round"
                                                                                                                        class="feather feather-list"
                                                                                                                    >
                                                                                                                        <line x1="8" y1="6" x2="21" y2="6"></line>
                                                                                                                        <line x1="8" y1="12" x2="21" y2="12"></line>
                                                                                                                        <line x1="8" y1="18" x2="21" y2="18"></line>
                                                                                                                        <line x1="3" y1="6" x2="3" y2="6"></line>
                                                                                                                        <line x1="3" y1="12" x2="3" y2="12"></line>
                                                                                                                        <line x1="3" y1="18" x2="3" y2="18"></line>
                                                                                                                    </svg>
                                                                                                                </button>
                                                                                                                <button type="button" class="btn btn-soft-base btn-icon">
                                                                                                                    <svg
                                                                                                                        xmlns="http://www.w3.org/2000/svg"
                                                                                                                        width="24"
                                                                                                                        height="24"
                                                                                                                        viewBox="0 0 24 24"
                                                                                                                        fill="none"
                                                                                                                        stroke="currentColor"
                                                                                                                        stroke-width="2"
                                                                                                                        stroke-linecap="round"
                                                                                                                        stroke-linejoin="round"
                                                                                                                        class="feather feather-grid"
                                                                                                                    >
                                                                                                                        <rect x="3" y="3" width="7" height="7"></rect>
                                                                                                                        <rect x="14" y="3" width="7" height="7"></rect>
                                                                                                                        <rect x="14" y="14" width="7" height="7"></rect>
                                                                                                                        <rect x="3" y="14" width="7" height="7"></rect>
                                                                                                                    </svg>
                                                                                                                </button>
                                                                                                            </div>-->
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="result-body">
                                                <div class="table-responsive">
                                                    <c:choose>
                                                        <c:when test="${sortPerformed}">
                                                            <c:forEach items="${listafterSort}" var="i" varStatus="loop">

                                                            <table class="table widget-26">
                                                                <tbody>
                                                                    <tr>
                                                                        <td>
                                                                            <div class="widget-26-job-emp-img">
                                                                                <img src="https://bootdey.com/img/Content/avatar/avatar5.png" alt="Company" />
                                                                            </div>
                                                                        </td>
                                                                        <td>
                                                                            <div class="widget-26-job-title">
                                                                                <a href="#">${i.fullName}</a>

                                                                            </div>
                                                                        </td>
                                                                        <td>
                                                                            <div class="widget-26-job-info">
                                                                                <p class="type m-0">${i.email}</p>
                                                                            </div>
                                                                        </td>
                                                                        <td>
                                                                            <c:if test="${i.role == 1}">
                                                                                <div class="widget-26-job-salary">Admin</div>
                                                                            </c:if>
                                                                            <c:if test="${i.role == 3}">
                                                                                <div class="widget-26-job-salary">User</div>
                                                                            </c:if>
                                                                        </td>
                                                                        <td>
                                                                            <c:if test="${i.isActive == true}">
                                                                                <div class="widget-26-job-starred" id="reportButton_${loop.index}" >
                                                                                    <a onclick="toggleBanPopup()">
                                                                                        <svg
                                                                                            xmlns="http://www.w3.org/2000/svg"
                                                                                            width="24"
                                                                                            height="24"
                                                                                            viewBox="0 0 24 24"
                                                                                            fill="none"
                                                                                            stroke="currentColor"
                                                                                            stroke-width="2"
                                                                                            stroke-linecap="round"
                                                                                            stroke-linejoin="round"
                                                                                            class="feather feather-star"
                                                                                            >
                                                                                        <i class="material-icons">report</i>
                                                                                        </svg>
                                                                                    </a>
                                                                                </div>
                                                                            </c:if>
                                                                            <c:if test="${i.isActive == false}">
                                                                                <div class="widget-26-job-starred" id="reportButton_${loop.index}">
                                                                                    <a onclick="toggleUnbanPopup()">
                                                                                        <svg
                                                                                            xmlns="http://www.w3.org/2000/svg"
                                                                                            width="24"
                                                                                            height="24"
                                                                                            viewBox="0 0 24 24"
                                                                                            fill="none"
                                                                                            stroke="currentColor"
                                                                                            stroke-width="2"
                                                                                            stroke-linecap="round"
                                                                                            stroke-linejoin="round"
                                                                                            class="feather feather-star"
                                                                                            >
                                                                                        <i class="material-icons">report</i>
                                                                                        </svg>
                                                                                    </a>
                                                                                </div>
                                                                            </c:if>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>

                                                        </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>
                                                <c:choose>
                                                    <c:when test="${searchPerformed}">
                                                        <c:forEach items="${listU}" var="i" varStatus="loop">

                                                            <table class="table widget-26">
                                                                <tbody>
                                                                    <tr>
                                                                        <td>
                                                                            <div class="widget-26-job-emp-img">
                                                                                <img src="https://bootdey.com/img/Content/avatar/avatar5.png" alt="Company" />
                                                                            </div>
                                                                        </td>
                                                                        <td>
                                                                            <div class="widget-26-job-title">
                                                                                <a href="#">${i.fullName}</a>

                                                                            </div>
                                                                        </td>
                                                                        <td>
                                                                            <div class="widget-26-job-info">
                                                                                <p class="type m-0">${i.email}</p>
                                                                            </div>
                                                                        </td>
                                                                        <td>
                                                                            <c:if test="${i.role == 1}">
                                                                                <div class="widget-26-job-salary">Admin</div>
                                                                            </c:if>
                                                                            <c:if test="${i.role == 3}">
                                                                                <div class="widget-26-job-salary">User</div>
                                                                            </c:if>
                                                                        </td>
                                                                        <td>
                                                                            <c:if test="${i.isActive == true}">
                                                                                <div class="widget-26-job-starred" id="reportButton_${loop.index}">
                                                                                    <a onclick="toggleBanPopup()">
                                                                                        <svg
                                                                                            xmlns="http://www.w3.org/2000/svg"
                                                                                            width="24"
                                                                                            height="24"
                                                                                            viewBox="0 0 24 24"
                                                                                            fill="none"
                                                                                            stroke="currentColor"
                                                                                            stroke-width="2"
                                                                                            stroke-linecap="round"
                                                                                            stroke-linejoin="round"
                                                                                            class="feather feather-star"
                                                                                            >
                                                                                        <i class="material-icons">report</i>
                                                                                        </svg>
                                                                                    </a>
                                                                                </div>
                                                                            </c:if>
                                                                            <c:if test="${i.isActive == false}">
                                                                                <div class="widget-26-job-starred" id="reportButton_${loop.index}">
                                                                                    <a onclick="toggleUnbanPopup()">
                                                                                        <svg
                                                                                            xmlns="http://www.w3.org/2000/svg"
                                                                                            width="24"
                                                                                            height="24"
                                                                                            viewBox="0 0 24 24"
                                                                                            fill="none"
                                                                                            stroke="currentColor"
                                                                                            stroke-width="2"
                                                                                            stroke-linecap="round"
                                                                                            stroke-linejoin="round"
                                                                                            class="feather feather-star"
                                                                                            >
                                                                                        <i class="material-icons">report</i>
                                                                                        </svg>
                                                                                    </a>
                                                                                </div>
                                                                            </c:if>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>

                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:forEach items="${listUser}" var="i" varStatus="loop">

                                                            <table class="table widget-26">
                                                                <tbody>
                                                                    <tr>
                                                                        <td>
                                                                            <div class="widget-26-job-emp-img">
                                                                                <img src="https://bootdey.com/img/Content/avatar/avatar5.png" alt="Company" />
                                                                            </div>
                                                                        </td>
                                                                        <td>
                                                                            <div class="widget-26-job-title">
                                                                                <a href="#">${i.fullName}</a>

                                                                            </div>
                                                                        </td>
                                                                        <td>
                                                                            <div class="widget-26-job-info">
                                                                                <p class="type m-0">${i.email}</p>
                                                                            </div>
                                                                        </td>
                                                                        <td>
                                                                            <c:if test="${i.role == 1}">
                                                                                <div class="widget-26-job-salary">Admin</div>
                                                                            </c:if>
                                                                            <c:if test="${i.role == 2}">
                                                                                <div class="widget-26-job-salary">Co-Operator</div>
                                                                            </c:if>
                                                                            <c:if test="${i.role == 3}">
                                                                                <div class="widget-26-job-salary">User</div>
                                                                            </c:if>
                                                                        </td>
                                                                        <td>
                                                                            <c:if test="${i.isActive == true}">
                                                                                <div class="widget-26-job-starred" id="reportButton_${loop.index}">
                                                                                    <a onclick="showBanConfirmation()">
                                                                                        <svg
                                                                                            xmlns="http://www.w3.org/2000/svg"
                                                                                            width="24"
                                                                                            height="24"
                                                                                            viewBox="0 0 24 24"
                                                                                            fill="none"
                                                                                            stroke="currentColor"
                                                                                            stroke-width="2"
                                                                                            stroke-linecap="round"
                                                                                            stroke-linejoin="round"
                                                                                            class="feather feather-star"
                                                                                            >
                                                                                        <i class="material-icons">report</i>
                                                                                        </svg>
                                                                                    </a>
                                                                                </div>
                                                                            </c:if>
                                                                            <c:if test="${i.isActive == false}" >
                                                                                <div class="widget-26-job-starred" id="reportButton_${loop.index}">
                                                                                    <a onclick="showUnbanConfirmation()">
                                                                                        <svg
                                                                                            xmlns="http://www.w3.org/2000/svg"
                                                                                            width="24"
                                                                                            height="24"
                                                                                            viewBox="0 0 24 24"
                                                                                            fill="none"
                                                                                            stroke="currentColor"
                                                                                            stroke-width="2"
                                                                                            stroke-linecap="round"
                                                                                            stroke-linejoin="round"
                                                                                            class="feather feather-star"
                                                                                            >
                                                                                        <i class="material-icons">report</i>
                                                                                        </svg>
                                                                                    </a>
                                                                                </div>
                                                                            </c:if>
                                                                        </td>

                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                        
                                                        </c:forEach>
                                                    </c:otherwise>
                                                </c:choose>
                                                        </c:otherwise>
                                                    </c:choose>
                                            </div>
                                        </div>
                                        <!-- Ban User Confirmation Popup -->
                                        <div id="banConfirmationPopup_${loop.index}" class="popup">
                                            <div class="popup-content">
                                                <span id="closeButton_${loop.index}" class="close" onclick="hideBanConfirmation()">&times;</span>
                                                <h2>Ban User Confirmation</h2>
                                                <p>Are you sure you want to ban this user?</p>
                                                <form id="banForm_${loop.index}" action="../BanUserServlet" method="post">
                                                    <input type="hidden" name="userId" value="${i.userID}">
                                                    <input type="hidden" id="isActiveInput" name="isActive" value="false">
                                                    <button type="submit" onclick="banUser()">Yes, Ban User</button>
                                                    <button onclick="hideBanConfirmation()">Cancel</button>
                                                </form>
                                            </div>
                                        </div>

                                        <!-- Unban User Popup -->
                                        <div id="unbanConfirmationPopup_${loop.index}" class="popup">
                                            <div class="popup-content">
                                                <span id="closeButton_${loop.index}" class="close" onclick="hideUnbanConfirmation()">&times;</span>
                                                <h2>Unban User Confirmation</h2>
                                                <p>Are you sure you want to unban this user?</p>
                                                <form id="banForm_${loop.index}" action="../BanUserServlet" method="post">
                                                    <input type="hidden" name="userId" value="${i.userID}">
                                                    <input type="hidden" id="isActiveInput" name="isActive" value="true">
                                                    <button onclick="unbanUser()">Yes, Unban User</button>
                                                    <button onclick="hideUnbanConfirmation()">Cancel</button>
                                                </form>
                                            </div>
                                        </div>

                                        <style>
                                            /* Styles for the popup */
                                            .popup {
                                                display: none;
                                                position: fixed;
                                                top: 0;
                                                left: 0;
                                                width: 100%;
                                                height: 100%;
                                                background-color: rgba(0, 0, 0, 0.5);
                                                z-index: 9999;
                                            }
                                            .popup-content {
                                                position: absolute;
                                                top: 50%;
                                                left: 50%;
                                                transform: translate(-50%, -50%);
                                                background-color: #fff;
                                                padding: 20px;
                                                border-radius: 5px;
                                                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
                                            }
                                            .close {
                                                position: absolute;
                                                top: 10px;
                                                right: 10px;
                                                cursor: pointer;
                                            }
                                        </style>
                                        <script>
                                            // Function to show ban confirmation popup
                                            function showBanConfirmation() {
                                                var popup = document.getElementById('banConfirmationPopup_${loop.index}');
                                                popup.style.display = 'block';
                                            }

                                            // Function to hide ban confirmation popup
                                            function hideBanConfirmation() {
                                                var popup = document.getElementById('banConfirmationPopup_${loop.index}');
                                                popup.style.display = 'none';
                                            }

                                            // Function to show unban confirmation popup
                                            function showUnbanConfirmation() {
                                                var popup = document.getElementById('unbanConfirmationPopup_${loop.index}');
                                                popup.style.display = 'block';
                                            }

                                            // Function to hide unban confirmation popup
                                            function hideUnbanConfirmation() {
                                                var popup = document.getElementById('unbanConfirmationPopup_${loop.index}');
                                                popup.style.display = 'none';
                                            }

                                            // Function to ban user
                                            function banUser() {
                                                // Add any additional logic you need here before submitting the form
                                                document.getElementById('banForm_${loop.index}').submit();
                                            }

                                            // Function to unban user
                                            function unbanUser() {
                                                // Add any additional logic you need here before submitting the form
                                                document.getElementById('banForm_${loop.index}').submit();
                                            }
                                        </script>
                                        <script>
                                            // Hàm kiểm tra trạng thái của nút button
                                            function checkSearchForm() {

                                                var searchText = document.getElementById("search").value;

                                                // Kiểm tra xem có nhập liệu vào ô tìm kiếm hay không
                                                if (searchText.trim() !== "") {
                                                    // Nếu có, đặt thuộc tính searchPerformed thành true để hiển thị danh sách từ listU
                                                    window.location.href = "SearchUserServlet?searchPerformed=true";
                                                } else {
                                                    // Nếu không, đặt thuộc tính searchPerformed thành false để hiển thị danh sách từ uDAO.allUser
                                                    window.location.href = "SearchUserServlet?searchPerformed=false";
                                                }
                                            }
                                        </script>
                                        <script>
                                            // Hàm kiểm tra trạng thái của form sắp xếp
                                            function checkSortForm() {
                                                var selectedSortOption = document.getElementById("exampleOption").value;

                                                // Kiểm tra xem người dùng đã chọn một tùy chọn sắp xếp hay chưa
                                                if (selectedSortOption.trim() !== "") {
                                                    // Nếu đã chọn, đặt thuộc tính sortPerformed thành true và gửi form sắp xếp
                                                    document.getElementById("sortPerformed").value = "true";
                                                    document.getElementById("sortForm").submit();
                                                } else {
                                                    // Nếu không chọn, đặt thuộc tính sortPerformed thành false và không thực hiện hành động gì
                                                    document.getElementById("sortPerformed").value = "false";
                                                }
                                            }
                                        </script>
                                    </div>
                                </div>
                            </div>
                            <nav class="d-flex justify-content-center">

                                <ul class="pagination pagination-base pagination-boxed pagination-square mb-0">
                                    <c:forEach begin="1" end="${endPage}" var="i">
                                        <li class="page-item">
                                            <a class="page-link no-border" href="#">
                                                <span aria-hidden="true">«</span>
                                                <span class="sr-only">Previous</span>
                                            </a>
                                        </li>
                                        <li class="page-item active"><a class="page-link no-border" href="#">${i}</a></li>
                                        <li class="page-item">
                                            <a class="page-link no-border" href="#">
                                                <span aria-hidden="true">»</span>
                                                <span class="sr-only">Next</span>
                                            </a>
                                        </li>
                                    </c:forEach>
                                </ul>

                            </nav>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </body>
</html>