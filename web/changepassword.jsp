<%-- 
    Document   : changepassword
    Created on : Feb 23, 2024, 2:48:07 AM
    Author     : tbinh
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/profile.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="../css_god/details.css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="nav.jsp"></jsp:include>
        <div class="container" style="margin-top: 3%;">
        <div class="row gutters">
        <div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
        <jsp:useBean id="userAlg" class="ModelDAO.UserDAO"></jsp:useBean>
        </div>
        <div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
        <div class="card h-100">
                <div class="card-body">
                    
                    <form onsubmit="changePassword(event)" >
                        <div class="row gutters">
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                        <h6 class="mt-3 mb-2 text-primary" style="color: #EE2E24 !important">Thay đổi mật khẩu</h6>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12" style="margin-top: 3%">
                                        <div class="form-group">
                                                <label for="oldPass">Mật khẩu cũ</label>
                                                <input name="oldpassword" type="password" class="form-control" id="oldPass" placeholder="Nhập mật khẩu cũ">
                                        </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12" style="margin-top: 3%">
                                        <div class="form-group">
                                                <label for="newPass">Mật khẩu mới</label>
                                                <input name="newpassword" type="password" class="form-control" id="newPass" placeholder="Nhập mật khẩu mới">
                                        </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                                <label for="newPassagain">Nhập lại mật khẩu mới</label>
                                                <input name="confirmpassword" type="password" class="form-control" id="newPassagain" placeholder="Nhập lại mật khẩu mới">
                                        </div>
                                </div>
                                <input name="userId" type="hidden" value="${param.userId}">
                        </div>
                        <div class="row gutters">
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="text-right">
                                            <button type="submit" class="btn btn-primary" style="background-color: #EE2E24; border-color: #EE2E24">Cập nhật</button>
                                        </div>
                                </div>
                        </div>
                        
                </form>
                        
                </div>
        </div>
        </div>
        </div>
</div>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script>
        function changePassword(event) {
    event.preventDefault(); // Ngăn chặn form submit theo cách truyền thống
    var form = event.target;
    var userId = form.userId.value; // Lấy giá trị của trường userId
    var oldPassword = form.oldpassword.value;
    var newPassword = form.newpassword.value;
    var confirmPassword = form.confirmpassword.value;
    
    var xhr = new XMLHttpRequest();
    xhr.open('POST', 'ChangePasswordServlet', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            if (xhr.status === 200) {
                var a = xhr.responseText.trim();
                if (a === "success") {
                    Swal.fire({
                        title: 'Thành công',
                        text: 'Đổi mật khẩu thành công',
                        icon: 'success',
                        confirmButtonText: 'OK',
                        timer: 1500
                    }).then((result) => {
                        if (result.isConfirmed) {
                            // Redirect to profile page after successful password change
                            window.location.href = 'profile.jsp?userId=' + userId;
                        }
                    });
                } else if (a === "fail") {
                    Swal.fire({
                        title: 'Lỗi',
                        text: 'Mật khẩu mới của bạn không khớp',
                        icon: 'error',
                        confirmButtonText: 'OK'
                    });
                } else if (a === "error") {
                    Swal.fire({
                        title: 'Lỗi',
                        text: 'Đã xảy ra lỗi khi thay đổi mật khẩu',
                        icon: 'error',
                        confirmButtonText: 'OK'
                    });
                }
            }
        }
    };
    var data = 'userId=' + encodeURIComponent(userId) +
               '&oldpassword=' + encodeURIComponent(oldPassword) +
               '&newpassword=' + encodeURIComponent(newPassword) +
               '&confirmpassword=' + encodeURIComponent(confirmPassword);
    xhr.send(data);
}

</script>

   <footer style="background-color: white; height: 30%">
            <jsp:include page="footer.jsp"></jsp:include>
        </footer>
    </body>
</html>
