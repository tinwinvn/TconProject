<!doctype html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Getting Started with Chart JS with www.chartjs3.com</title>
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <!-- My CSS -->
        <link rel="stylesheet" href="../admin/admin_style.css">
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


    </head>

    <body>
        <jsp:include page="../admin/admin_nav.jsp"></jsp:include>
        <nav class="d-flex justify-content-evenly align-items-center bg-white">
            <ul class="d-flex align-items-center mb-0" >
                <li><a href="../admin/admin.jsp" class="text-red p-2">Dash Board</a></li>
            </ul>
            <div class="logo text-black p-2"></div>
        </nav>

        <div class="chartCard">
            <div class="chartBox">
                <canvas id="lineChart" width="400" height="400"></canvas>
            </div>
            <div class="chartBox">               
                <canvas id="myChart" width="400" height="400"></canvas>
                <form id="fetchForm" action="../ChartServlet" method="GET">
                <button id="fetchButton">Fetch Now</button>
                </form>
            </div>           
        </div>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/chart.js/dist/chart.umd.min.js"></script>

        <script>
            document.getElementById('fetchForm').addEventListener('submit', function (event) {
            event.preventDefault(); // Ngăn chặn hành động mặc định của form

            // Gọi hàm updateBarChart() khi form được submit
            updateBarChart();
        });

            //Fetch block
             async function updateBarChart() {              
                const url = "http://localhost:8080/ProjectSWP/statistic/ChartServlet.json";
                try {
                    const response = await fetch(url);
                    const datapoints = await response.json();
                    console.log(datapoints);

                    const financialData = datapoints.financialreport[0];
                    const quantity = financialData.Quantity;
                    const price = financialData.Price;
                    const orderDate = financialData.OrderDate;
                    const parkName = financialData.ParkName;
                                       
                    console.log("Quantity:", quantity);
                    console.log("Price:", price);
                    console.log("OrderDate:", orderDate);
                    console.log("ParkName:", parkName);
                    const financials = datapoints.financialreport;
                    console.log(financials);
                    labels = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
                    const label = financials.map(item => item.ParkName);
                    //const data = financials.map(item => item.Price);
                    console.log(label);
                    const asiaData = financials.filter(item => item.ParkName === 'Asia Park').map(item => item.Price);
                    const nuiThanTaiData = financials.filter(item => item.ParkName === 'Núi Thần Tài').map(item => item.Price);
                    const helioCenterData = financials.filter(item => item.ParkName === 'Helio Center').map(item => item.Price);
                    const baNaHillsData = financials.filter(item => item.ParkName === 'Bà Nà Hills').map(item => item.Price);

                    myChart.data.labels = labels;
                    myChart.data.datasets[0].label = 'Asia Park';
                    myChart.data.datasets[1].label = 'Núi Thần Tài';
                    myChart.data.datasets[2].label = 'Helio Center';
                    myChart.data.datasets[3].label = 'Bà Nà Hills';
                    
                    myChart.data.datasets[0].data = asiaData;
                    myChart.data.datasets[1].data = nuiThanTaiData;
                    myChart.data.datasets[2].data = helioCenterData;
                    myChart.data.datasets[3].data = baNaHillsData;
                    myChart.update(); // Call update() method to update the chart
                } catch (error) {
                    console.error('Error fetching data:', error);
                }  
        }

            // setup
            const data = {
                labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
                datasets: [{
                        label: [],
                        data: [],
                        backgroundColor: [
                            'rgba(255, 26, 104, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(255, 206, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(153, 102, 255, 0.2)',
                            'rgba(255, 159, 64, 0.2)',
                            'rgba(0, 0, 0, 0.2)'
                        ],
                        borderColor: [
                            'rgba(255, 26, 104, 1)',
                            'rgba   (54, 162, 235, 1)',
                            'rgba(255, 206, 86, 1)',
                            'rgba(75, 192, 192, 1)',
                            'rgba(153, 102, 255, 1)',
                            'rgba(255, 159, 64, 1)',
                            'rgba(0, 0, 0, 1)'
                        ],
                        borderWidth: 1
                    }, {
                        label: 'Weekly Sales',
                        data: [],
                        backgroundColor: [
                            'rgba(102, 204, 255, 0.2)',
                            'rgba(51, 153, 255, 0.2)',
                            'rgba(0, 102, 204, 0.2)',
                            'rgba(0, 51, 102, 0.2)',
                            'rgba(0, 0, 153, 0.2)',
                            'rgba(51, 102, 204, 0.2)',
                            'rgba(0, 0, 255, 0.2)'
                        ],
                        borderColor: [
                            'rgba(102, 204, 255, 1)',
                            'rgba(51, 153, 255, 1)',
                            'rgba(0, 102, 204, 1)',
                            'rgba(0, 51, 102, 1)',
                            'rgba(0, 0, 153, 1)',
                            'rgba(51, 102, 204, 1)',
                            'rgba(0, 0, 255, 1)'
                        ],

                        borderWidth: 1
                    }, {
                        label: 'Weekly Sales',
                        data: [],
                        backgroundColor: [
                            'rgba(102, 204, 0, 0.2)',
                            'rgba(51, 153, 0, 0.2)',
                            'rgba(0, 102, 0, 0.2)',
                            'rgba(0, 51, 0, 0.2)',
                            'rgba(0, 153, 51, 0.2)',
                            'rgba(51, 204, 51, 0.2)',
                            'rgba(0, 255, 0, 0.2)'
                        ],
                        borderColor: [
                            'rgba(102, 204, 0, 1)',
                            'rgba(51, 153, 0, 1)',
                            'rgba(0, 102, 0, 1)',
                            'rgba(0, 51, 0, 1)',
                            'rgba(0, 153, 51, 1)',
                            'rgba(51, 204, 51, 1)',
                            'rgba(0, 255, 0, 1)'
                        ],

                        borderWidth: 1
                    }, {
                        label: 'Weekly Sales',
                        data: [],
                        backgroundColor: [
                            'rgba(255, 255, 102, 0.2)',
                            'rgba(255, 255, 0, 0.2)',
                            'rgba(255, 255, 102, 0.2)',
                            'rgba(255, 255, 0, 0.2)',
                            'rgba(255, 255, 102, 0.2)',
                            'rgba(255, 255, 0, 0.2)',
                            'rgba(255, 255, 102, 0.2)'
                        ],
                        borderColor: [
                            'rgba(255, 255, 102, 1)',
                            'rgba(255, 255, 0, 1)',
                            'rgba(255, 255, 102, 1)',
                            'rgba(255, 255, 0, 1)',
                            'rgba(255, 255, 102, 1)',
                            'rgba(255, 255, 0, 1)',
                            'rgba(255, 255, 102, 1)'
                        ],

                        borderWidth: 1
                    }
                ]
            };

            // config


            // render init block


            // Line chart
            const lineData = {
                labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
                datasets: [{
                        label: 'Year Sales',
                        data: [65, 59, 80, 81, 56, 55, 40],
                        fill: false,
                        borderColor: 'rgb(75, 192, 192)',
                        tension: 0.1
                    }]
            };

            const lineConfig = {
                type: 'line',
                data: lineData
            };

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

        </script>
    </body>
</html>
