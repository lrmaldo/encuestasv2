/* grafica  de egresados y empleadores */

 Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
                            Chart.defaults.global.defaultFontColor = '#292b2c';


                            // Bar Chart Example
                            var ctx = document.getElementById("myBarChart");
                            var myLineChart = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: ['Egresados','Empleadores'],
                        datasets: [{
                        label: "Encuestados",
                        backgroundColor: "rgba(2,117,216,1)",
                        borderColor: "rgba(2,117,216,1)",
                        data: {!! json_encode($array_tipos)!!},
                        }],
                    },
                    options: {
                        scales: {
                        xAxes: [{
                            time: {
                            unit: 'month'
                            },
                            gridLines: {
                            display: false
                            },
                            ticks: {
                            maxTicksLimit: 6
                            }
                        }],
                        yAxes: [{
                            ticks: {
                            min: 0,
                            max: {!! json_encode($total_respuestas) !!},
                            maxTicksLimit: 5
                            },
                            gridLines: {
                            display: true
                            }
                        }],
                        },
                        legend: {
                        display: false
                        }
                    }
                    });