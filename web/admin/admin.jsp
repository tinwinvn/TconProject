<%-- 
    Document   : admin
    Created on : Mar 5, 2024, 9:37:20 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Boxicons -->
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <!-- My CSS -->
        <link rel="stylesheet" href="admin_style.css">

        <title>AdminHub</title>
    </head>
    <style>
        * {
            margin: 0;
            padding: 0;
            font-family: sans-serif;
        }

        .chartMenu {
            width: 100vw;
            height: 40px;
            background: #1A1A1A;
            color: rgba(54, 162, 235, 1);
        }

        .chartMenu p {
            padding: 10px;
            font-size: 20px;
        }

        .chartCard {
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            height: calc(100vh - 40px);
            background: #eee;
        }

        .chartBox {
            width: 400px; /* Gi?m chi?u r?ng c?a khung bi?u ?? */
            padding: 20px;
            border-radius: 20px;
            border: solid 3px rgba(54, 162, 235, 1);
            background: white;
            margin-bottom: 20px;
        }

        canvas {
            width: 100% !important; /* Thay ??i chi?u r?ng c?a canvas */
            height: auto !important; /* Gi? t? l? khung bi?u ?? khi thay ??i kích th??c */
        }
    </style>
    <body>



        <!-- NAVBAR -->
        <jsp:include page="admin_nav.jsp"></jsp:include>
        <jsp:useBean id="pkDAO" class="ModelDAO.ParkDAO"></jsp:useBean>
        <!-- MAIN -->
        <main>
            <div class="head-title">
                <div class="left">
                    <h1>Dashboard</h1>
                    <ul class="breadcrumb">
                        <li>
                            <a href="#">Dashboard</a>
                        </li>
                        <li><i class="bx bx-chevron-right"></i></li>
                        <li>
                            <a class="active" href="../index.jsp">Home</a>
                        </li>
                    </ul>
                </div>
            </div>

            <input type="hidden" id="parkID" value="${pkDAO.getParkIDByUserID(sessionScope.acc.userID)}" />
            <div class="table-data">               
                    <div id="chartBox" class="chartBox">               
                        <canvas id="myChart"></canvas>
                        <form id="fetchForm" action="../ChartServlet" method="GET">
                            <button id="fetchButton" type="submit">Fetch Now</button>
                        </form>
                        <label for="weekPicker">Chọn tuần:</label>
                    <input type="week" id="weekPicker" name="week" onchange="loadDataForWeek(this.value)">
                    </div>     
                
                    <div id="chartBox2" class="chartBox">               
                        <canvas id="myChart2"></canvas>
                        <form id="fetchForm2" action="../ChartServlet" method="GET">
                            <button id="fetchButton" type="submit">Fetch Now</button>
                        </form>
                        <label for="weekPicker">Chọn tuần:</label>
                    <input type="week" id="weekPicker2" name="week" onchange="loadDataForWeek(this.value)">
                    </div>  
                
                    <div id="chartBox3" class="chartBox">               
                        <canvas id="myChart3"></canvas>
                        <form id="fetchForm3" action="../ChartServlet" method="GET">
                            <button id="fetchButton" type="submit">Fetch Now</button>
                        </form>
                        <label for="weekPicker">Chọn tuần:</label>
                    <input type="week" id="weekPicker3" name="week" onchange="loadDataForWeek(this.value)">
                    </div> 
                
                    <div id="chartBox4" class="chartBox">               
                        <canvas id="myChart4"></canvas>
                        <form id="fetchForm4" action="../ChartServlet" method="GET">
                            <button id="fetchButton" type="submit">Fetch Now</button>
                        </form>
                        <label for="weekPicker">Chọn tuần:</label>
                    <input type="week" id="weekPicker4" name="week" onchange="loadDataForWeek(this.value)">
                    </div>
                    <br>
                    

                <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/chart.js/dist/chart.umd.min.js"></script>

                <script>

                    document.addEventListener('DOMContentLoaded', function() {
                            var parkID = document.getElementById('parkID').value;
                            updateBarChart();
                            if (parkID === 'PA000001') {
                                
                                // Ẩn các phần tử có ID là chartBox2, chartBox3 và chartBox4
                                document.getElementById('chartBox2').style.display = 'none';
                                document.getElementById('chartBox3').style.display = 'none';
                                document.getElementById('chartBox4').style.display = 'none';
                            }                      
                    });

                    document.addEventListener('DOMContentLoaded', function() {
                        var parkID = document.getElementById('parkID').value;  
                        updateBarChart4();
                        if(parkID === 'PA000002'){
                            updateBarChart4();
                            document.getElementById('chartBox').style.display = 'none';
                            document.getElementById('chartBox2').style.display = 'none';
                            document.getElementById('chartBox3').style.display = 'none';

                        }
                    });
                    document.addEventListener('DOMContentLoaded', function() {
                        var parkID = document.getElementById('parkID').value;  
                        updateBarChart2();
                        if(parkID === 'PA000003'){
                            updateBarChart2();
                            document.getElementById('chartBox').style.display = 'none';
                            document.getElementById('chartBox3').style.display = 'none';
                            document.getElementById('chartBox4').style.display = 'none';

                        }
                    });
                    document.addEventListener('DOMContentLoaded', function() {
                        var parkID = document.getElementById('parkID').value;   
                        updateBarChart3();
                        if(parkID === 'PA000004'){
                            updateBarChart3();
                            document.getElementById('chartBox').style.display = 'none';
                            document.getElementById('chartBox2').style.display = 'none';
                            document.getElementById('chartBox4').style.display = 'none';

                        }
                    });
                    
                    document.getElementById('fetchForm').addEventListener('submit', function(event) {
                        event.preventDefault();
                        updateBarChart();
                    }); 

                    document.getElementById('fetchForm2').addEventListener('submit', function(event) {
                        event.preventDefault();
                        updateBarChart2();
                    });  
                    
                    document.getElementById('fetchForm3').addEventListener('submit', function(event) {
                        event.preventDefault();
                        updateBarChart3();
                    }); 
                    
                    document.getElementById('fetchForm4').addEventListener('submit', function(event) {
                        event.preventDefault();
                        updateBarChart4();
                    });
                    //Fetch block
                    async function updateBarChart() {
                        const url = "http://localhost:8080/ProjectSWP/ChartServlet";     
                        try {
                            let a = document.getElementById('weekPicker').value;
                            if (a === ''){
                                a = getCurrentWeek();
                            }
                            console.log(a);
                            const currentWeek = a;
                            const [year, weekNumber] = currentWeek.split('-W');
                            console.log(weekNumber);
                            let firstDayOfWeek = getFirstDateOfWeek(parseInt(year), parseInt(weekNumber));
                            let lastDayOfWeek = new Date(firstDayOfWeek);
                            lastDayOfWeek.setDate(firstDayOfWeek.getDate() + 6);
                            var firstDay = firstDayOfWeek.toDateString();
                            var lastDay = lastDayOfWeek.toDateString();
                            console.log(firstDay);
                            console.log(lastDay);
                            const response = await fetch(url);
                            const datapoints = await response.json();
                            console.log(datapoints);

                            const financialData = datapoints.financialreport[0];
                            const quantity = financialData.Quantity;
                            const price = financialData.Price;
                            const orderDate = financialData.OrderDate;
                            const parkName = financialData.ParkName;
                            const parkId = financialData.ParkID;
                            const financials = datapoints.financialreport;
                            console.log(financials);
                            
                            financials.forEach(report => {
                                const orderDate = new Date(report.OrderDate);
                                const daysOfWeek = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
                                report.OrderDayOfWeek = daysOfWeek[orderDate.getDay()];
                            });
                            
                            labels = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
                            const label = 'Asia Park';
                            console.log(label);
                           
                            const asiaData = labels.map(label => {
                                const ordersByLabel = financials.filter(item => item.ParkID === 'PA000001' && item.OrderDayOfWeek === label);
                                
                                const orderDates = ordersByLabel.map(order => order.OrderDate);                                                              
                                let fd = new Date(firstDay);
                                let ld = new Date(lastDay);
                                let totalFinancials = 0;
                                financials.forEach(item => {
                                    let od = new Date(item.OrderDate);
                                    if (od >= fd && od <= ld && item.ParkID === 'PA000001' && item.OrderDayOfWeek === label) {
                                        totalFinancials += item.Price * item.Quantity;
                                    }
                                });
                                return totalFinancials;

                            });
                            console.log(asiaData);
                            myChart.data.labels = labels;
                            myChart.data.datasets[0].label = 'Asia Park';

                            myChart.data.datasets[0].data = asiaData;
                            myChart.update(); 
                            
                        } catch (error) {
                            console.error('Error fetching data:', error);
                        }
                    }
                                          
                    // setup
                    const data = {
                        labels: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'],
                        datasets: [{
                                label: ["Asia Park"],
                                data: [],
                                backgroundColor: [
                                    '#C60000'
                                ],
                                borderColor: [
                                    '#C60000'
                                ],
                                borderWidth: 1
                            }
                        ]
                    };

                    // config

                    const config = {
                        type: 'bar',
                        data,
                        options: {
                            scales: {
                                y: {
                                    beginAtZero: true
                                }
                            }
                        }
                    };

                    const myChart = new Chart(document.getElementById('myChart').getContext('2d'), config);
                    
                    //Chart Núi thần tài
                    async function updateBarChart2() {
                        const url = "http://localhost:8080/ProjectSWP/ChartServlet";
                        try {
                            let a = document.getElementById('weekPicker2').value;
                            if (a === ''){
                                a = getCurrentWeek();
                            }
                            console.log(a);
                            const currentWeek = a;
                            const [year, weekNumber] = currentWeek.split('-W');
                            console.log(weekNumber);
                            let firstDayOfWeek = getFirstDateOfWeek(parseInt(year), parseInt(weekNumber));
                            let lastDayOfWeek = new Date(firstDayOfWeek);
                            lastDayOfWeek.setDate(firstDayOfWeek.getDate() + 6);
                            var firstDay = firstDayOfWeek.toDateString();
                            var lastDay = lastDayOfWeek.toDateString();
                            console.log(firstDay);
                            console.log(lastDay);
                            const response = await fetch(url);
                            const datapoints = await response.json();
                            console.log(datapoints);

                            const financialData = datapoints.financialreport[0];
                            const quantity = financialData.Quantity;
                            const price = financialData.Price;
                            const orderDate = financialData.OrderDate;
                            const parkName = financialData.ParkName;
                            const financials = datapoints.financialreport;
                            console.log(financials);
                            
                            financials.forEach(report => {
                                const orderDate = new Date(report.OrderDate);
                                const daysOfWeek = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
                                report.OrderDayOfWeek = daysOfWeek[orderDate.getDay()];
                            });
                            
                            labels = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
                            const label = 'Helio Center';
                            
                            const helioData = labels.map(label => {
                                const ordersByLabel = financials.filter(item => item.ParkID === 'PA000003' && item.OrderDayOfWeek === label);
                                
                                const orderDates = ordersByLabel.map(order => order.OrderDate);                                                              
                                let fd = new Date(firstDay);
                                let ld = new Date(lastDay);
                                let totalFinancials = 0;
                                financials.forEach(item => {
                                    let od = new Date(item.OrderDate);
                                    if (od >= fd && od <= ld && item.ParkID === 'PA000003' && item.OrderDayOfWeek === label) {
                                        totalFinancials += item.Price * item.Quantity;
                                    }
                                });
                                return totalFinancials;
                            });
                            console.log(helioData);
                            myChart2.data.labels = labels;
                            myChart2.data.datasets[0].data = helioData;
                            myChart2.update();
                        } catch (error) {
                            console.error('Error fetching data:', error);
                        }
                    }



                    const data2 = {
                        labels: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'],
                        datasets: [{
                            label: ["Helio Center"], 
                            data: [],
                            backgroundColor: [
                                '#3366CC'
                            ],
                            borderColor: [
                                '#3366CC'
                            ],
                            borderWidth: 1
                        }]
                    };

                    // config
                    const config2 = {
                        type: 'bar',
                        data: data2,
                        options: {
                            scales: {
                                y: {
                                    beginAtZero: true
                                }
                            }
                        }
                    };

                    const myChart2 = new Chart(document.getElementById('myChart2').getContext('2d'), config2);
                    
                //set up chart banahills    
                    async function updateBarChart3() {
                        const url = "http://localhost:8080/ProjectSWP/ChartServlet";
                        try {
                            let a = document.getElementById('weekPicker3').value;
                            if (a === ''){
                                a = getCurrentWeek();
                            }
                            console.log(a);
                            const currentWeek = a;
                            const [year, weekNumber] = currentWeek.split('-W');
                            console.log(weekNumber);
                            let firstDayOfWeek = getFirstDateOfWeek(parseInt(year), parseInt(weekNumber));
                            let lastDayOfWeek = new Date(firstDayOfWeek);
                            lastDayOfWeek.setDate(firstDayOfWeek.getDate() + 6);
                            var firstDay = firstDayOfWeek.toDateString();
                            var lastDay = lastDayOfWeek.toDateString();
                            console.log(firstDay);
                            console.log(lastDay);
                            const response = await fetch(url);
                            const datapoints = await response.json();
                            console.log(datapoints);
                            console.log(JSON.parse(decodeURIComponent(JSON.stringify(datapoints))));
                            
                            const financialData = datapoints.financialreport[0];
                            const quantity = financialData.Quantity;
                            const price = financialData.Price;
                            const orderDate = financialData.OrderDate;
                            const parkName = financialData.ParkName;
                            const parkId = financialData.ParkID;
                            const financials = datapoints.financialreport;
                            console.log(financials);
                            
                            financials.forEach(report => {
                                const orderDate = new Date(report.OrderDate);
                                const daysOfWeek = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
                                report.OrderDayOfWeek = daysOfWeek[orderDate.getDay()];
                            });
                            
                            labels = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
                            const label = 'Bà Nà Hills';
                            
                            const banahillsData = labels.map(label => {
                                const ordersByLabel = financials.filter(item => item.ParkID === 'PA000004' && item.OrderDayOfWeek === label);
                                
                                const orderDates = ordersByLabel.map(order => order.OrderDate);                                                              
                                let fd = new Date(firstDay);
                                let ld = new Date(lastDay);
                                let totalFinancials = 0;
                                financials.forEach(item => {
                                    let od = new Date(item.OrderDate);
                                    if (od >= fd && od <= ld && item.ParkID === 'PA000004' && item.OrderDayOfWeek === label) {
                                        totalFinancials += item.Price * item.Quantity;
                                    }
                                });
                                return totalFinancials;
                            });
                            console.log(banahillsData);
                            myChart3.data.labels = labels;
                            myChart3.data.datasets[0].data = banahillsData;
                            myChart3.update();
                        } catch (error) {
                            console.error('Error fetching data:', error);
                        }
                    }



                    const data3 = {
                        labels: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'],
                        datasets: [{
                            label: ["Bà Nà Hills"], 
                            data: [],
                            backgroundColor: [
                                '#FFD700'
                            ],
                            borderColor: [
                                '#FFD700'
                            ],
                            borderWidth: 1
                        }]
                    };

                    // config
                    const config3 = {
                        type: 'bar',
                        data: data3,
                        options: {
                            scales: {
                                y: {
                                    beginAtZero: true
                                }
                            }
                        }
                    };

                    const myChart3 = new Chart(document.getElementById('myChart3').getContext('2d'), config3);
                    //set up nuithantai chart
                    async function updateBarChart4() {
                        const url = "http://localhost:8080/ProjectSWP/ChartServlet";
                        try {
                            let a = document.getElementById('weekPicker4').value;
                            if (a === ''){
                                a = getCurrentWeek();
                            }
                            console.log(a);
                            const currentWeek = a;
                            const [year, weekNumber] = currentWeek.split('-W');
                            console.log(weekNumber);
                            let firstDayOfWeek = getFirstDateOfWeek(parseInt(year), parseInt(weekNumber));
                            let lastDayOfWeek = new Date(firstDayOfWeek);
                            lastDayOfWeek.setDate(firstDayOfWeek.getDate() + 6);
                            var firstDay = firstDayOfWeek.toDateString();
                            var lastDay = lastDayOfWeek.toDateString();
                            console.log(firstDay);
                            console.log(lastDay);
                            const response = await fetch(url);
                            const datapoints = await response.json();
                            console.log(datapoints);
                            console.log(JSON.parse(decodeURIComponent(JSON.stringify(datapoints))));
                            
                            const financialData = datapoints.financialreport[0];
                            const quantity = financialData.Quantity;
                            const price = financialData.Price;
                            const orderDate = financialData.OrderDate;
                            const parkName = financialData.ParkName;
                            const parkId = financialData.ParkID;
                            const financials = datapoints.financialreport;
                            console.log(financials);
                            
                            financials.forEach(report => {
                                const orderDate = new Date(report.OrderDate);
                                const daysOfWeek = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
                                report.OrderDayOfWeek = daysOfWeek[orderDate.getDay()];
                            });
                            
                            labels = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
                            const label = 'Núi Thần Tài';
                            
                            const nuithantaiData = labels.map(label => {
                                const ordersByLabel = financials.filter(item => item.ParkID === 'PA000002' && item.OrderDayOfWeek === label);
                                
                                const orderDates = ordersByLabel.map(order => order.OrderDate);                                                              
                                let fd = new Date(firstDay);
                                let ld = new Date(lastDay);
                                let totalFinancials = 0;
                                financials.forEach(item => {
                                    let od = new Date(item.OrderDate);
                                    if (od >= fd && od <= ld && item.ParkID === 'PA000002' && item.OrderDayOfWeek === label) {
                                        totalFinancials += item.Price * item.Quantity;
                                    }
                                });
                                return totalFinancials;
                            });
                            myChart4.data.labels = labels;
                            myChart4.data.datasets[0].data = nuithantaiData;
                            myChart4.update();
                        } catch (error) {
                            console.error('Error fetching data:', error);
                        }
                    }



                    const data4 = {
                        labels: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'],
                        datasets: [{
                            label: ["Núi Thần Tài"], 
                            data: [],
                            backgroundColor: [
                                '#33CCFF'
                            ],
                            borderColor: [
                                '#33CCFF'
                            ],
                            borderWidth: 1
                        }]
                    };

                    // config
                    const config4 = {
                        type: 'bar',
                        data: data4,
                        options: {
                            scales: {
                                y: {
                                    beginAtZero: true
                                }
                            }
                        }
                    };

                    const myChart4 = new Chart(document.getElementById('myChart4').getContext('2d'), config4);
                    function loadDataForWeek(weekValue) {
                        const [year, weekNumber] = weekValue.split('-W');
                        let firstDayOfWeek = getFirstDateOfWeek(parseInt(year), parseInt(weekNumber));
                        let lastDayOfWeek = new Date(firstDayOfWeek);
                        lastDayOfWeek.setDate(firstDayOfWeek.getDate() + 6);
                        var firstDay = firstDayOfWeek.toDateString();
                        var lastDay = lastDayOfWeek.toDateString();

                    }

                    function getFirstDateOfWeek(year, weekNumber) {
                        let simple = new Date(year, 0, 1 + (weekNumber - 1) * 7);
                        let dayOfWeek = simple.getDay();
                        let ISOweekStart = simple;
                        if (dayOfWeek <= 4)
                            ISOweekStart.setDate(simple.getDate() - simple.getDay() + 1);
                        else
                            ISOweekStart.setDate(simple.getDate() + 8 - simple.getDay());
                        return ISOweekStart;
                    }

                    // Tự động tải dữ liệu cho tuần hiện tại
                    window.onload = function() {
                        const currentWeek = getCurrentWeek();
                        console.log(currentWeek);
                        document.getElementById('weekPicker').value = currentWeek;
                        loadDataForWeek(currentWeek);
                    };

                    function getCurrentWeek() {
                        let currentDate = new Date();
                        let startDate = new Date(currentDate.getFullYear(), 0, 1);
                        let days = Math.floor((currentDate - startDate) / (24 * 60 * 60 * 1000) + 1);
                        let weekNumber = Math.ceil(days / 7);
                        var year = currentDate.getFullYear().toString();
                        var week = weekNumber.toString().padStart(2, '0');
                        return year + `-W` + week;
                    }

                </script>
            </div>
        </main>
        <!-- MAIN -->
        <!-- CONTENT -->


    </body>
</html>

