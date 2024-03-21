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
                        
                            <a href="#">Dashboard</a>
                        
                        <i class='bx bx-chevron-right' ></i>
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
                                                                        <td style="width: 10%">
                                                                            <c:if test="${i.image == null}">
                                                                            <div class="widget-26-job-emp-img">
                                                                                <img style="height: 60px; width: 60px; border-radius: 50%; border: 0.2px black solid;" src="https://bootdey.com/img/Content/avatar/avatar5.png" alt="Company" />
                                                                            </div>
                                                                            </c:if>
                                                                            <c:if test="${i.image != null}">
                                                                            <div class="widget-26-job-emp-img">
                                                                                <img style="height: 60px; width: 60px; border-radius: 50%; border: 0.2px black solid;" src="../uploads/${i.image}" alt="Company" />
                                                                            </div>
                                                                            </c:if>
                                                                        </td>
                                                                        <td style="width: 30%">
                                                                            <div class="widget-26-job-title">
                                                                                <a href="#">${i.fullName}</a>

                                                                            </div>
                                                                        </td>
                                                                        <td style="width: 30%">
                                                                            <div class="widget-26-job-info">
                                                                                <p class="type m-0">${i.email}</p>
                                                                            </div>
                                                                        </td>
                                                                        <td style="width: 20%">
                                                                            <c:if test="${i.role == 1}">
                                                                                <div class="widget-26-job-salary">Admin</div>
                                                                            </c:if>
                                                                            <c:if test="${i.role == 2}">
                                                                                <div class="widget-26-job-salary">Partner</div>
                                                                            </c:if>
                                                                            <c:if test="${i.role == 3}">
                                                                                <div class="widget-26-job-salary">User</div>
                                                                            </c:if>
                                                                        </td>
                                                                        <td style="width: 10%">
                                                                            <c:if test="${i.isActive == true}">
                                                                                <div class="widget-26-job-starred" id="reportButton_${loop.index}" >
                                                                                    <a onclick="showBanPopup('${i.userID}')">
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
                                                                                        <i class="material-icons" style="color: #ff0000">report</i>
                                                                                        </svg>
                                                                                    </a>
                                                                                </div>
                                                                            </c:if>
                                                                            <c:if test="${i.isActive == false}">
                                                                                <div class="widget-26-job-starred" id="reportButton_${loop.index}">
                                                                                    <a onclick="showUnbanPopup('${i.userID}')">
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
                                                                                        <i class="material-icons" style="color: #34ce57">report</i>
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
                                                                        <td style="width: 10%">
                                                                            <c:if test="${i.image == null}">
                                                                            <div class="widget-26-job-emp-img">
                                                                                <img style="height: 60px; width: 60px; border-radius: 50%; border: 0.2px black solid;" src="https://bootdey.com/img/Content/avatar/avatar5.png" alt="Company" />
                                                                            </div>
                                                                            </c:if>
                                                                            <c:if test="${i.image != null}">
                                                                            <div class="widget-26-job-emp-img">
                                                                                <img style="height: 60px; width: 60px; border-radius: 50%; border: 0.2px black solid;" src="../uploads/${i.image}" alt="Company" />
                                                                            </div>
                                                                            </c:if>
                                                                        </td>
                                                                        <td style="width: 30%">
                                                                            <div class="widget-26-job-title">
                                                                                <a href="#">${i.fullName}</a>

                                                                            </div>
                                                                        </td>
                                                                        <td style="width: 30%">
                                                                            <div class="widget-26-job-info">
                                                                                <p class="type m-0">${i.email}</p>
                                                                            </div>
                                                                        </td>
                                                                        <td style="width: 20%">
                                                                            <c:if test="${i.role == 1}">
                                                                                <div class="widget-26-job-salary">Admin</div>
                                                                            </c:if>
                                                                            <c:if test="${i.role == 2}">
                                                                                <div class="widget-26-job-salary">Partner</div>
                                                                            </c:if>
                                                                            <c:if test="${i.role == 3}">
                                                                                <div class="widget-26-job-salary">User</div>
                                                                            </c:if>
                                                                        </td>
                                                                        <td style="width: 10%">
                                                                            <c:if test="${i.isActive == true}">
                                                                                <div class="widget-26-job-starred" id="reportButton_${loop.index}">
                                                                                    <a onclick="showBanPopup('${i.userID}')">
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
                                                                                        <i class="material-icons" style="color: #ff0000">report</i>
                                                                                        </svg>
                                                                                    </a>
                                                                                </div>
                                                                            </c:if>
                                                                            <c:if test="${i.isActive == false}">
                                                                                <div class="widget-26-job-starred" id="reportButton_${loop.index}">
                                                                                    <a onclick="showUnbanPopup('${i.userID}')">
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
                                                                                        <i class="material-icons" style="color: #34ce57">report</i>
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
                                                                        <td style="width: 10%">
                                                                            <c:if test="${i.image == null}">
                                                                            <div class="widget-26-job-emp-img">
                                                                                <img style="height: 60px; width: 60px; border-radius: 50%; border: 0.2px black solid;" src="https://bootdey.com/img/Content/avatar/avatar5.png" alt="Company" />
                                                                            </div>
                                                                            </c:if>
                                                                            <c:if test="${i.image != null}">
                                                                            <div class="widget-26-job-emp-img">
                                                                                <img style="height: 60px; width: 60px; border-radius: 50%; border: 0.2px black solid;" src="../uploads/${i.image}" alt="Company" />
                                                                            </div>
                                                                            </c:if>
                                                                        </td>
                                                                        <td style="width: 30%">
                                                                            <div class="widget-26-job-title">
                                                                                <a href="#">${i.fullName}</a>

                                                                            </div>
                                                                        </td>
                                                                        <td style="width: 30%">
                                                                            <div class="widget-26-job-info">
                                                                                <p class="type m-0">${i.email}</p>
                                                                            </div>
                                                                        </td>
                                                                        <td style="width: 20%">
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
                                                                        <td style="width: 10%">
                                                                            <c:if test="${i.isActive == true}">
                                                                                <div class="widget-26-job-starred" id="reportButton_${loop.index}">
                                                                                    <a onclick="showBanPopup('${i.userID}')">
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
                                                                                        <i class="material-icons" style="color: #ff0000">report</i>
                                                                                        </svg>
                                                                                    </a>
                                                                                </div>
                                                                            </c:if>
                                                                            <c:if test="${i.isActive == false}" >
                                                                                <div class="widget-26-job-starred" id="reportButton_${loop.index}">
                                                                                    <a onclick="showUnbanPopup('${i.userID}')">
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
                                                                                        <i class="material-icons" style="color: #34ce57">report</i>
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
                                        <div id="banConfirmationPopup" class="popup">
                                            <div class="popup-content">
                                                <p>Cấm người dùng này ?</p>
                                                <div class="combo-button">
                                                    <form id="banForm" action="../BanUserServlet" method="post" style="display: inline-block;">
                                                        <input type="hidden" name="userId" value="${i.userID}">
                                                        <input type="hidden" id="isActiveInput" name="isActive" value="false">
                                                        <button class="submit-btn" type="submit" onclick="hidePopup('banConfirmationPopup')">Đúng</button>
                                                    </form>
                                                        <button class="close-btn" style="display: inline-block; margin-left: 5px;" onclick="hidePopup('banConfirmationPopup')">Hủy</button>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Unban User Popup -->
                                        <div id="unbanConfirmationPopup" class="popup">
                                            <div class="popup-content">
                                                <p>Bỏ lệnh cấm người dùng này ?</p>
                                                <div class="combo-button">
                                                    <form id="unbanForm" action="../BanUserServlet" method="post" style="display: inline-block;">
                                                        <input type="hidden" name="userId" value="${i.userID}">
                                                        <input type="hidden" id="isActiveInput" name="isActive" value="true">
                                                        <button class="submit-btn" type="submit" onclick="hidePopup('unbanConfirmationPopup')">Đúng</button>
                                                    </form>
                                                        <button class="close-btn" style="display: inline-block; margin-left: 5px;" onclick="hidePopup('unbanConfirmationPopup')">Hủy</button>
                                                </div>
                                            </div>
                                        </div>
                                        <script>
                                            function showBanPopup(userId) {
                                                // Hiển thị popup
                                                document.getElementById("banConfirmationPopup").style.display = "block";

                                                // Truyền userId vào input hidden trong form ban
                                                document.getElementById("banForm").querySelector('input[name="userId"]').value = userId;
                                            }
                                            
                                            function showUnbanPopup(userId) {
                                                // Hiển thị popup
                                                document.getElementById("unbanConfirmationPopup").style.display = "block";

                                                // Truyền userId vào input hidden trong form unban
                                                document.getElementById("unbanForm").querySelector('input[name="userId"]').value = userId;
                                            }
                                            
                                            function hidePopup(popupId) {
                                                // Ẩn popup
                                                document.getElementById(popupId).style.display = "none";
                                            }
                                            
                                        </script>
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
                                            
                                            .widget-26-job-starred a {
                                                cursor: pointer;
                                            }
                                            
                                            .close-btn {
                                                border-radius: 5px;
                                                 
                                            }
                                            .submit-btn {
                                                border-radius: 5px;
                                                background-color: #34ce57;
                                                
                                            }
                                            
                                        </style>
                                        
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
<!--                            <nav class="d-flex justify-content-center">

                                <ul class="pagination pagination-base pagination-boxed pagination-square mb-0">
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
                                </ul>

                            </nav>-->
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </body>
</html>