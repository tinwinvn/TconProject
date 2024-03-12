<%-- 
    Document   : admin
    Created on : Mar 5, 2024, 9:37:20 AM
    Author     : Admin
--%>

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
        <!-- MAIN -->
        <main>
            <div class="head-title">
                <div class="left">
                    <h1>Dashboard</h1>
                    <ul class="breadcrumb">
                        <li>
                            <a href="#">Dashboard</a>
                        </li>
                        <li><i class='bx bx-chevron-right' ></i></li>
                        <li>
                            <a class="active" href="../index.jsp">Home</a>
                        </li>
                    </ul>
                </div>
            </div>

            <ul class="box-info">
                <li>
                    <i class='bx bxs-calendar-check' ></i>
                    <span class="text">
                        <h3>1020</h3>
                        <p>New Order</p>
                    </span>
                </li>
                <li>
                    <i class='bx bxs-group' ></i>
                    <span class="text">
                        <h3>2834</h3>
                        <p>Visitors</p>
                    </span>
                </li>
                <li>
                    <i class='bx bxs-dollar-circle' ></i>
                    <span class="text">
                        <h3>$2543</h3>
                        <p>Total Sales</p>
                    </span>
                </li>
            </ul>


            <div class="table-data">
                    
                    <div class="chartBox">               
                        <canvas id="myChart"></canvas>
                        <form id="fetchForm" action="../ChartServlet" method="GET">
                            <button id="fetchButton" type="submit">Fetch Now</button>
                        </form>
                    </div>   
                
                <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/chart.js/dist/chart.umd.min.js"></script>

                <script>
                    document.getElementById('fetchForm').addEventListener('submit', function (event) {
                        event.preventDefault();
                        updateBarChart();

                    });
                                      
                    //Fetch block
                    async function updateBarChart() {
                        const url = "http://localhost:8080/ProjectSWP/ChartServlet";     
                        try {
                            
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
                                console.log(orderDate);
                                const daysOfWeek = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
                                report.OrderDayOfWeek = daysOfWeek[orderDate.getDay()];
                                console.log(daysOfWeek[orderDate.getDay()]);
                            });
                            
                            labels = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
                            const label = 'Asia Park';
                            
                            //const data = financials.map(item => item.Price);
                            console.log(label);
                           
                            const asiaData = labels.map(label => {                              
                                return financials.filter(item => item.ParkName === 'Asia Park' && item.OrderDayOfWeek === label)
                                                  .reduce((total, item) => total + item.Price * item.Quantity, 0);
                            });
                            console.log(asiaData);
                            //const nuiThanTaiData = financials.filter(item => item.ParkName === 'Núi Thần Tài').map(item => item.Price);
                            //const helioCenterData = financials.filter(item => item.ParkName === 'Helio Center').map(item => item.Price);
                            //const baNaHillsData = financials.filter(item => item.ParkName === 'Bà Nà Hills').map(item => item.Price);

                            myChart.data.labels = labels;
                            myChart.data.datasets[0].label = 'Asia Park';
                            //myChart.data.datasets[1].label = 'Núi Thần Tài';
                            //myChart.data.datasets[2].label = 'Helio Center';
                            //myChart.data.datasets[3].label = 'Bà Nà Hills';

                            myChart.data.datasets[0].data = asiaData;
                            //myChart.data.datasets[1].data = nuiThanTaiData;
                            //myChart.data.datasets[2].data = helioCenterData;
                            //myChart.data.datasets[3].data = baNaHillsData;
                            myChart.update(); 
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

                </script>
            </div>
        </main>
        <!-- MAIN -->
        <!-- CONTENT -->


        <script src="admin_js.js"></script>
    </body>
</html>

