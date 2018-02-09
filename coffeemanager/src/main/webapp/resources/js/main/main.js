/*Main Chart
$(function () {	
	x축 데이터
	var categoriesData = ['9:00', '10:00', '11:00', '12:00', '13:00', '14:00', '15:00', '16:00', '17:00', '18:00', '19:00', '20:00','21:00'];
	
	Highcharts.chart('container', {

	    chart: {
	        type: 'column'
	    },

	    title: {
	        text: '일일 매출 현황'
	    },

	    xAxis: {
	        categories: categoriesData
	    },

	    yAxis: {
	        allowDecimals: false,
	        min: 0,
	        title: {
	            text: '판매량'
	        }
	    },

	    tooltip: {
	        formatter: function () {
	            return '<b>' + this.x + '</b><br/>' +
	                this.series.name + ': ' + this.y + '<br/>' +
	                'Total: ' + this.point.stackTotal;
	        }
	    },

	    plotOptions: {
	        column: {
	            stacking: 'normal'
	        }
	    },

	    series: [{
	        name: 'John',
	        data: [5, 3, 4, 7, 2, 5, 3, 4, 7, 2, 1, 1, 1],
	        stack: 'male'
	    }, {
	        name: 'Joe',
	        data: [3, 4, 4, 2, 5, 5, 3, 4, 7, 2, 1, 1, 1],
	        stack: 'male'
	    }, {
	        name: 'Jane',
	        data: [2, 5, 6, 2, 1, 5, 3, 4, 7, 2, 1, 1, 1],
	        stack: 'female'
	    }, {
	        name: 'Jane',
	        data: [2, 5, 6, 2, 1, 5, 3, 4, 7, 2, 1, 1, 1],
	        stack: 'female'
	    }, {
	        name: 'Jane',
	        data: [2, 5, 6, 2, 1, 5, 3, 4, 7, 2, 1, 1, 1],
	        stack: 'female'
	    }, {
	        name: 'Jane',
	        data: [2, 5, 6, 2, 1, 5, 3, 4, 7, 2, 1, 1, 1],
	        stack: 'female'
	    },  {
	        name: 'Janet',
	        data: [3, 0, 4, 4, 3, 5, 3, 4, 7, 2, 1, 1, 1],
	        stack: 'female'
	    }]
	});
}); */
/*
$(function () {		
	Highcharts.chart('container2', {
	    chart: {
	        type: 'line'
	    },
	    title: {
	        text: '월 매출 현황'
	    },
	    subtitle: {
	        text: ''
	    },
	    xAxis: {
	        categories: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
	    },
	    yAxis: {
	        title: {
	            text: '판매 수량'
	        }
	    },
	    plotOptions: {
	        line: {
	            dataLabels: {
	                enabled: true
	            },
	            enableMouseTracking: false
	        }
	    },
	    series: [{
	        name: '아메리카노',
	        data: [10.0, 6.0, 9.0, 19.0, 21.0, 14.0, 5.0, 4.0, 4.0, 18.0, 21.0, 15.0]
	    }, {
	        name: '카페라떼',
	        data: [12.0, 3.0, 5.0, 15.0, 17.0, 12.0, 2.0, 3.0, 4.0, 13.0, 18.0, 16.0]
	    }]
	});
}); 
*/
/*$(function () {		
	Highcharts.chart('container3', {
	    chart: {
	        plotBackgroundColor: null,
	        plotBorderWidth: null,
	        plotShadow: false,
	        type: 'pie'
	    },
	    title: {
	        text: '메뉴별 매출 현황'
	    },
	    tooltip: {
	        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
	    },
	    plotOptions: {
	        pie: {
	            allowPointSelect: true,
	            cursor: 'pointer',
	            dataLabels: {
	                enabled: true,
	                format: '<b>{point.name}</b>: {point.percentage:.1f} %',
	                style: {
	                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
	                }
	            }
	        }
	    },
	    series: [{
	        name: 'Brands',
	        colorByPoint: true,
	        data: [{
	            name: 'IE',
	            y: 56.33
	        }, {
	            name: 'Chrome',
	            y: 24.03,
	            sliced: true,
	            selected: true
	        }, {
	            name: 'Firefox',
	            y: 10.38
	        }, {
	            name: 'Safari',
	            y: 4.77
	        }, {
	            name: 'Opera',
	            y: 0.91
	        }, {
	            name: 'Other',
	            y: 0.2
	        }]
	    }]
	});
}); */

/*원재료 재고*/
/*$(function () {	
	
	var categoriesData = [
        ['Shanghai', 23.7],
        ['Lagos', 16.1],
        ['Istanbul', 14.2],
        ['Karachi', 14.0],
        ['Mumbai', 12.5],
        ['Moscow', 12.1],
        ['São Paulo', 11.8],
        ['Beijing', 11.7],
        ['Guangzhou', 11.1],
        ['Delhi', 11.1],
        ['Shenzhen', 10.5],
        ['Seoul', 10.4],
        ['Jakarta', 10.0],
        ['Kinshasa', 9.3],
        ['Tianjin', 9.3],
        ['Tokyo', 9.0],
        ['Cairo', 8.9],
        ['Dhaka', 8.9],
        ['Mexico City', 8.9],
        ['Lima', 8.9]
	
		
    ];
	Highcharts.chart('container4', {
	    chart: {
	        type: 'column'
	    },
	    title: {
	        text: '원재료 재고 현황'
	    },
	    subtitle: {
	        text: 'Source: <a href="http://en.wikipedia.org/wiki/List_of_cities_proper_by_population">Wikipedia</a>'
	    },
	    xAxis: {
	        type: 'category',
	        labels: {
	            rotation: -45,
	            style: {
	                fontSize: '13px',
	                fontFamily: 'Verdana, sans-serif'
	            }
	        }
	    },
	    yAxis: {
	        min: 0,
	        title: {
	            text: 'Population (millions)'
	        }
	    },
	    legend: {
	        enabled: false
	    },
	    tooltip: {
	        pointFormat: 'Population in 2008: <b>{point.y:.1f} millions</b>'
	    },
	    series: [{
	        name: 'Population',
	        data: categoriesData,
	        dataLabels: {
	            enabled: true,
	            rotation: -90,
	            color: '#FFFFFF',
	            align: 'right',
	            format: '{point.y:.1f}', // one decimal
	            y: 10, // 10 pixels down from the top
	            style: {
	                fontSize: '13px',
	                fontFamily: 'Verdana, sans-serif'
	            }
	        }
	    }]
	});
}); */