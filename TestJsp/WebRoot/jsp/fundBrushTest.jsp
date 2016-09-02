<%@ page pageEncoding="UTF-8"%>

<html>
<head>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href="<%=basePath%>" />

<title></title>

<!-- ECharts单文件引入 -->
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/echarts.min.js"></script>
<script type="text/javascript" src="js/echarts/map/js/china.js"></script>
<script type="text/javascript" src="js/echarts/map/js/shanghai.js"></script>
<script type="text/javascript" src="js/echarts/map/js/world.js"></script>

<!-- <script type="text/javascript" src="js/echarts/theme/vintage.js"></script> -->
<body>
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
	<div id="main" style="width: 100%; height: 100%;"></div>
	<script type="text/javascript">
		setTimeout(
				function() {
					var myChart = echarts.init(document.getElementById('main'),
							'vintage');

					myChart.showLoading({
						text : '数据读取中...',
					});

					var txtstyle = {
						color : '#2731b8',
						fontFamily : "Microsoft YaHei",
					};
					var geoCoordMap = {
						"黄浦区":[121.490317,31.222771],
						"徐汇区":[121.43752,31.179973],
						"长宁区":[121.4222,31.218123],
						"静安区":[121.448224,31.229003],
						"普陀区":[121.392499,31.241701],
						"虹口区":[121.491832,31.26097],
						"杨浦区":[121.522797,31.270755],
						"闵行区":[121.375972,31.111658],
						"宝山区":[121.489934,31.398896],
						"嘉定区":[121.250333,31.383524],
						"浦东新区":[121.567706,31.245944],
						"金山区":[121.330736,30.724697],
						"松江区":[121.223543,31.03047],
						"青浦区":[121.113021,31.151209],
						"奉贤区":[121.458472,30.912345],
						"崇明县":[121.397516,31.626946]
					};

					var schema = [
							"Cities",
							"Gross purchasing power",
							"Net purchasing power",
							"Prices (excl. rent)",
							"Prices (incl. rent)",
							"Gross wages",
							"Net wages",
							"Working time [hours per year]",
							"Vacation [paid working days per year]",
							"Time required for 1 Big Mac [minutes]",
							"Time required for 1 kg of bread [minutes]",
							"Time required for 1 kg of rice [minutes]",
							"Time required for 1 iPhone 4S, 16 GB [hours]",
							"City break",
							"Inflation 2006",
							"Inflation 2007",
							"Inflation 2008",
							"Inflation 2009",
							"Inflation 2010",
							"Inflation 2011",
							"Prices (incl. rent)",
							"Food basket",
							"Services",
							"Normal local rent medium [USD per month]",
							"Household appliances",
							"Bus or tram or underground",
							"Train",
							"Taxi  [USD per 5 km trip]",
							"Medium-sized cars price",
							"Medium-sized cars tax",
							"Medium-sized cars gas",
							"Restaurant [USD per dinner]",
							"Hotel *** [USD per night]",
							"Hotel ***** [USD per night]",
							"Women's medium clothing",
							"Men's medium clothing",
							"Furnished medium 4-room apartment [USD per month]",
							"Unfurnished medium 3-room apartment [USD per month]",
							"Net hourly wages [USD per hour]",
							"Gross hourly wages [USD per hour]",
							"Taxes and social security contributions",
							"Primary school teacher [USD per year]",
							"Bus driver [USD per year]",
							"Automobile mechanic [USD per year]",
							"Building labourer [USD per year]",
							"Skilled industrial worker [USD per year]",
							"Cook [USD per year]",
							"Departement head [USD per year]",
							"Product manager [USD per year]",
							"Engineer [USD per year]",
							"Bank credit clerk [USD per year]",
							"Secretary [USD per year]",
							"Saleswoman [USD per year]",
							"Female industrial worker [USD per year]",
							"Female call center worker [USD per year]",
							"Financial analyst [USD per year]",
							"Financial analyst [USD pro Jahr]" ];

					
					var rawData = [
							[ "黄浦区", 101.6, 90.1, 77.1, 69.1, 78.3, 69.4,
									1755, 24, 15, 7, 9, 44, 720, 1.651, 1.59,
									2.205, 0.974, 0.93, 2.477, 67.4, 364, 690,
									1113, 4960, 3.19, 30.05, 16.34, 24000, 689,
									1.8, 50, 200, 390, 690, 1040, 2331, 1580,
									17.5, 25.5, 30, 48400, 39200, 26300, 30200,
									55400, 39800, 104400, 58700, 64600, 49200,
									40300, 31100, 40300, 27700, 66700, 66700 ],
							[ "徐汇区", 62.6, 60.5, 66.2, 58.2, 41.4, 40, 1822,
									22, 29, 13, 25, 86, 590, 3.314, 2.991,
									4.236, 1.349, 4.701, 3.1, 56.8, 390, 580,
									880, 4620, 1.81, 13.81, 5.5, 24900, 389,
									2.02, 54, 100, 210, 630, 1110, 1489, 647,
									10.1, 13.5, 24, 26200, 23300, 18500, 17100,
									24500, 24200, 57200, 44000, 34100, 30700,
									21000, 17700, 15400, 16300, 34400, 34400 ],
							[ "长宁区", 77.9, 82.9, 76.7, 67.8, 59.8, 63.5,
									1852, 20, 15, 16, 7, 51, 580, 3.362, 2.377,
									3.959, 2.116, 2.303, 4.027, 66.1, 496, 630,
									1023, 4450, 2.57, 40.86, 13.62, 23900, 226,
									1.33, 45, 190, 280, 560, 670, 1644, 1333,
									16, 19.5, 17, 35700, 31500, 36500, 28500,
									41800, 31100, 61300, 55000, 56300, 37300,
									33400, 26900, 27200, 27500, 64900, 64900 ],
							[ "静安区", 26.4, 31.4, 55.4, 48.2, 14.6, 17.4,
									2312, 7, 36, 25, 20, 165, 550, 4.637,
									2.242, 5.468, -0.845, 3.272, 3.807, 47,
									422, 440, 414, 4370, 0.75, 3.47, 2.47,
									29600, 103, 1, 56, 90, 320, 400, 600, 1463,
									932, 4.4, 4.8, 5, 8300, 8400, 11100, 3000,
									10900, 10900, 32200, 22400, 24600, 14500,
									7800, 6000, 5800, 6500, 19400, 19400 ],
							[ "普陀区", 79.7, 78.6, 74.7, 65.6, 59.6, 58.7,
									1760, 29, 18, 11, 6, 52, 740, 3.563, 2.844,
									4.13, -0.238, 2.043, 3.052, 64, 393, 750,
									984, 5000, 2.59, 41.96, 10.36, 26900, 177,
									1.77, 51, 170, 330, 580, 1110, 1269, 1087,
									14.8, 19.4, 23, 41300, 34100, 29100, 29800,
									31500, 32100, 40800, 67000, 43100, 38900,
									28900, 25500, 25000, 28000, 58300, 58300 ],
							[ "虹口区", 28.2, 29.9, 60.3, 51.8, 17, 18, 1979,
									9, 34, 27, 16, 184, 730, 1.467, 4.767,
									5.852, -0.683, 3.325, 5.417, 50.6, 463,
									420, 310, 4370, 0.26, 14.25, 3.64, 23800,
									67, 1.24, 41, 160, 400, 660, 700, 1554,
									660, 4.5, 5.6, 17, 11400, 7000, 8500, 7600,
									6200, 11900, 13300, 11700, 10700, 18300,
									17100, 8900, 5400, 7600, 19800, 19800 ],
							[ "杨浦区", 109.7, 97.1, 72.2, 64.1, 79.2, 70.1,
									1742, 28, 16, 11, 9, 56, 720, 1.784, 2.276,
									2.754, 0.234, 1.15, 2.483, 62.5, 389, 530,
									841, 4670, 2.98, 80.3, 10.79, 35600, 246,
									2.1, 34, 120, 230, 570, 710, 2395, 1178,
									17.7, 25.8, 30, 56900, 38600, 35500, 28500,
									47400, 57600, 84200, 74500, 72100, 51700,
									38100, 28200, 32000, 28100, 81700, 81700 ],
							[ "闵行区", 41.4, 40.7, 53.1, 47, 22.3, 22, 1981,
									15, 52, 34, 17, 142, 540, 4.296, 5.544,
									6.998, 4.202, 2.27, 3.416, 45.8, 363, 410,
									634, 4170, 0.84, null, 2.81, 20200, 303,
									1.24, 25, 140, 300, 310, 440, 1554, 841,
									5.5, 7.3, 12, 11100, 7600, 8400, 7000,
									7300, 11900, 27600, 65800, 19700, 14600,
									12300, 7400, 4100, 5300, 31900, 31900 ],
							[ "宝山区", 51.3, 50.7, 53.9, 47.1, 27.7, 27.3,
									1884, 23, 31, 20, 19, 126, 490, 4.264,
									1.89, 3.935, 0.925, 0.697, 4.079, 45.9,
									344, 330, 414, 4740, 1.08, 22.97, 5.61,
									26700, 65, 1.93, 28, 120, 230, 250, 340,
									1683, 841, 6.9, 9, 22, 11300, 14100, 11300,
									10000, 16300, 18900, 20300, 43300, 22800,
									15800, 16100, 9600, 12600, 16400, 48300,
									48300 ],
							[ "嘉定区", 107.5, 78.5, 75.8, 68.8, 81.5, 59.5,
									1729, 20, 19, 10, 11, 54, 730, 2.337,
									1.814, 4.493, -0.009, 2.332, 3.469, 67.1,
									433, 690, 1243, 4580, 2.42, 26.03, 15.71,
									23200, 500, 1.91, 63, 130, 280, 630, 800,
									2538, 1839, 15, 26.5, 42, 44000, 36500,
									38200, 34200, 52100, 43600, 97000, 73700,
									67100, 56900, 42300, 35200, 33500, 36000,
									78200, 78200 ],
							[ "浦东新区", 35.5, 32, 56.7, 50.4, 20.1, 18.1,
									1912, 22, 49, 13, 26, 206, 740, 3.878,
									7.934, 6.067, 4.209, 4.85, 3.9, 49.1, 340,
									390, 556, 5270, 1.43, 15.96, 7.64, 22600,
									76, 1.95, 28, 130, 410, 580, 920, 2123,
									1165, 4.6, 6.6, 28, 8900, 11500, 9300,
									7000, 10900, 16800, 25600, 21100, 23300,
									21400, 11100, 8200, 6500, 8900, 29300,
									29300 ],
							[ "金山区", 42.9, 46.2, 55, 47.7, 23.6, 25.4,
									1830, 13, 45, 12, 16, 187, 620, 10.898,
									8.83, 8.585, 6.27, 10.461, 9.775, 46.5,
									310, 380, 401, 5170, 0.28, null, 7.97,
									20200, 307, 1.27, 25, 160, 280, 400, 660,
									1359, 738, 6.4, 7.7, 16, 8700, 16300,
									11900, 10200, 11400, 15800, 34300, 17600,
									19200, 17100, 15800, 14600, 7500, 10400,
									15400, 15400 ],
							[ "松江区", 37.1, 34, 39.8, 34.8, 14.8, 13.5,
									1836, 26, 57, 21, 26, 230, 370, 6.552,
									4.84, 7.848, 5.581, 6.101, 5.812, 33.9,
									244, 270, 388, 3830, 0.75, 9.43, 3.17,
									11700, 36, 1.9, 25, 100, 190, 180, 300,
									984, 530, 3.4, 4.8, 29, 5600, 7500, 9500,
									7900, 7400, 14900, 13900, 22000, 11400,
									8800, 6000, 8200, 5800, 5300, 13200, 13200 ],
							[ "青浦区", 21.9, 25.7, 91.1, 85.4, 20, 23.4,
									1878, 17, 80, 59, 13, 272, 830, 13.654,
									18.703, 30.37, 27.081, 28.187, 26.09, 83.3,
									689, 690, 2098, 8460, 0.35, null, 11.65,
									49000, 18, 0.01, 68, 190, 400, 520, 950,
									3820, 2784, 5.9, 6.5, 7, 10500, 5400,
									10900, 6100, 9700, 25400, 16800, 30600,
									22800, 15800, 8400, 9500, 5400, 6700,
									12400, 12400 ],
							[ "奉贤区", 105.3, 101.9, 79.1, 72.9, 83.3, 80.6,
									1853, 12, 11, 15, 9, 32, 540, 3.222, 2.86,
									3.798, -0.321, 1.641, 3.142, 71.1, 460,
									780, 1398, 4270, 2.25, 34.99, 12.5, 22100,
									95, 1.11, 38, 200, 270, 740, 1200, 3535,
									2214, 20.3, 27.1, 25, 49300, 52100, 44000,
									49000, 58500, 48300, 79300, 88500, 88200,
									40300, 42600, 23200, 33800, 38700, 103500,
									103500 ],
							[ "崇明县", 23, 25, 33.2, 29.5, 7.6, 8.3, 2264, 13,
									65, 15, 40, 370, 370, 6.177, 6.372, 8.349,
									10.882, 11.99, 8.628, 28.8, 208, 210, 466,
									4590, 0.25, 10.58, 1.95, 15300, 93, 0.77,
									18, 100, 250, 260, 410, 867, 556, 2.1, 2.5,
									11, 4500, 2500, 1900, 1300, 4800, 10200,
									13500, 11100, 9600, 6700, 5400, 3000, 1800,
									4000, 14100, 14100 ] ];

					function makeMapData(rawData) {
						var mapData = [];
						for ( var i = 0; i < rawData.length; i++) {
							var geoCoord = geoCoordMap[rawData[i][0]];
							if (geoCoord) {
								mapData.push({
									name : rawData[i][0],
									value : geoCoord
											.concat(rawData[i].slice(1))
								});
							}
						}
						return mapData;
					}

					function makeParallelAxis(schema) {
						var parallelAxis = [];
						for ( var i = 1; i < schema.length; i++) {
							parallelAxis.push({
								dim : i,
								name : schema[i]
							});
						}
						return parallelAxis;
					}

					option = {
						backgroundColor : new echarts.graphic.RadialGradient(
								0.5, 0.5, 0.4, [ {
									offset : 0,
									color : '#4b5769'
								}, {
									offset : 1,
									color : '#404a59'
								} ]),
						title : {
							text : '自然人统计',
						/* 	subtext : 'data from macrofocus',
							sublink : 'https://www.macrofocus.com/public/products/infoscope/datasets/pricesandearnings/', */
							left : 'center',
							top : 5,
							itemGap : 0,
							textStyle : {
								color : '#eee'
							}
						},
						tooltip : {
							trigger : 'item',
							formatter : function(params) {
								var value = (params.value + '').split('.');
								value = value[0]
										.replace(
												/(\d{1,3})(?=(?:\d{3})+(?!\d))/g,
												'$1,')
										+ '.' + value[1];
								return params.seriesName + '<br/>'
										+ params.name + ' : ' + value;
							}
						},
						toolbox : {
							show : true,
							left : 'right',
							iconStyle : {
								normal : {
									borderColor : '#ddd'
								}
							},
							feature : {}
						},
						brush : {
							geoIndex : 0,
							brushLink : 'all',
							inBrush : {
								opacity : 1
							},
							outOfBrush : {
								color : '#b99e2a',
								symbolSize : 4,
								opacity : 0.1
							}
						},
						geo : {
							map : 'shanghai',
							silent : true,
							label : {
								emphasis : {
									show : false,
									areaColor : '#eee'
								}
							},
							itemStyle : {
								normal : {
									borderWidth : 0.2,
									borderColor : '#404a59'
								}
							},
							left : '40%',
							top : 40,
							bottom : '54%',
							right : '40%',
							roam : false,
							itemStyle : {
								normal : {
									areaColor : '#323c48',
									borderColor : '#111'
								},
								emphasis : {
									areaColor : '#2a333d'
								}
							}
						},
						parallelAxis : makeParallelAxis(schema),
						parallel : {
							top : '50%',
							left : 60,
							right : 20,
							bottom : 80,
							// top: 10,
							// left: 10,
							// width: 300,
							// bottom: 10,
							// layout: 'vertical',
							axisExpandable : true,
							axisExpandCenter : 15,
							axisExpandCount : 10,
							axisExpandWidth : 50,
							parallelAxisDefault : {
								type : 'value',
								nameLocation : 'start',
								// nameRotate: 45,
								// nameLocation: 'end',
								nameTextStyle : {
									fontSize : 12
								},
								nameGap : 20,
								splitNumber : 3,
								tooltip : {
									show : true
								},
								axisLine : {
									// show: false,
									lineStyle : {
										width : 1,
										color : 'rgba(255,255,255,0.3)'
									}
								},
								axisTick : {
									show : false
								},
								splitLine : {
									show : false
								}
							}
						},
						series : [ {
							name : 'Prices and Earnings 2012',
							type : 'scatter',
							coordinateSystem : 'geo',
							symbolSize : 8,
							data : makeMapData(rawData),
							activeOpacity : 1,
							label : {
								normal : {
									formatter : '{b}',
									position : 'right',
									show : false
								},
								emphasis : {
									show : true
								}
							},
							symbolSize : function(data) {
								return data[2] / 5;
							},
							itemStyle : {
								normal : {
									borderColor : '#fff',
									color : '#577ceb',
								}
							}
						}, {
							name : 'parallel',
							type : 'parallel',
							smooth : true,
							lineStyle : {
								normal : {
									color : '#577ceb',
									width : 0.5,
									opacity : 0.6
								}
							},
							blendMode : 'lighter',
							data : rawData
						} ]
					};

					setTimeout(function() {
						myChart.hideLoading();
						myChart.setOption(option);
					}, 1000);
				}, 500);
	</script>
</body>

</html>
