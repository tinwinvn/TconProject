<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>QR Scanner</title>
        <link rel="stylesheet" href="webcam_style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <!-- My CSS -->
        <link rel="stylesheet" href="admin_style.css">
    </head>
    <body>
        <jsp:include page="admin_nav.jsp"></jsp:include>
        <jsp:useBean id="ticketDAO" class="ModelDAO.TicketDAO"></jsp:useBean>
        <div class="head-title">
                <div class="left">
                    <h1>Dashboard</h1>
                    <ul class="breadcrumb">
                        <li>
                            <a href="#">Dashboard</a>
                        </li>
                        <li><i class='bx bx-chevron-right' ></i></li>
                        <li>
                            <a class="active" href="../index.jsp">Quét mã QR</a>
                        </li>
                    </ul>
                </div>
            </div>
        <video id="videoElement" width="400" height="300" autoplay></video>
        <script type="text/javascript" src="https://cdn.rawgit.com/schmich/instascan-builds/master/instascan.min.js"></script>
        <script>
            var scanner = new Instascan.Scanner({video: document.getElementById('videoElement')});
            scanner.addListener('scan', function (content) {
                    var a = '${message}';
                    console.log(a);
                    var xhr = new XMLHttpRequest();
                    xhr.open("POST", "../UpdateTicketServlet", true);
                    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                    xhr.onreadystatechange = function () {
                        if (xhr.readyState === 4 && xhr.status === 200) {
                            if (xhr.responseText.trim() === "sus") {
                                a = "sus"; // Gán giá trị "sus" cho biến a nếu thành công
                                alert("Quét mã QR thành công");
                            } else {
                                a = "used"; // Gán giá trị "fail" cho biến a nếu thất bại
                                alert("Vé đã được sử dụng");    
                            }
                        }
                    };
                    xhr.send("content=" + encodeURIComponent(content));
            });

            Instascan.Camera.getCameras().then(function (cameras) {
                if (cameras.length > 0) {
                    scanner.start(cameras[0]);
                } else {
                    console.error('Không có camera.');
                }
            }).catch(function (e) {
                console.error(e);
            });
        </script>


    </body>
</html>


