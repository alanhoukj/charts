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
		var myChart = echarts.init(document.getElementById('main'));

		var txtstyle = {
			color : '#2731b8',
			fontFamily : "Microsoft YaHei",
		};

		var geoCoordMap = {
			"黄浦区" : [ 121.490317, 31.222771 ],
			"徐汇区" : [ 121.43752, 31.179973 ],
			"长宁区" : [ 121.4222, 31.218123 ],
			"静安区" : [ 121.448224, 31.229003 ],
			"普陀区" : [ 121.392499, 31.241701 ],
			"虹口区" : [ 121.491832, 31.26097 ],
			"杨浦区" : [ 121.522797, 31.270755 ],
			"闵行区" : [ 121.375972, 31.111658 ],
			"宝山区" : [ 121.489934, 31.398896 ],
			"嘉定区" : [ 121.250333, 31.383524 ],
			"浦东新区" : [ 121.567706, 31.245944 ],
			"金山区" : [ 121.330736, 30.724697 ],
			"松江区" : [ 121.223543, 31.03047 ],
			"青浦区" : [ 121.113021, 31.151209 ],
			"奉贤区" : [ 121.458472, 30.912345 ],
			"崇明县" : [ 121.397516, 31.626946 ]
		};

		var data = [ {
			name : "黄浦区",
			value : "1"
		}, {
			name : "徐汇区",
			value : "2"
		}, {
			name : "长宁区",
			value : "3"
		}, {
			name : "静安区",
			value : "4"
		}, {
			name : "普陀区",
			value : "5"
		}, {
			name : "虹口区",
			value : "6"
		}, {
			name : "杨浦区",
			value : "7"
		}, {
			name : "闵行区",
			value : "8"
		}, {
			name : "宝山区",
			value : "9"
		}, {
			name : "嘉定区",
			value : "10"
		}, {
			name : "浦东新区",
			value : "11"
		}, {
			name : "金山区",
			value : "12"
		}, {
			name : "松江区",
			value : "13"
		}, {
			name : "青浦区",
			value : "14"
		}, {
			name : "奉贤区",
			value : "15"
		}, {
			name : "崇明县",
			value : "16"
		} ];

		var convertData = function(data) {
			var res = [];
			for ( var i = 0; i < data.length; i++) {
				var geoCoord = geoCoordMap[data[i].name];
				if (geoCoord) {
					res.push({
						name : data[i].name,
						value : geoCoord.concat(data[i].value)
					});
				}
			}
			return res;
		};

		var convertedData = [ convertData(data),
				convertData(data.sort(function(a, b) {
					return b.value - a.value;
				}).slice(0, 6)) ];

		option = {
			backgroundColor : '#404a59',
			animation : true,
			animationDuration : 1000,
			animationEasing : 'cubicInOut',
			animationDurationUpdate : 1000,
			animationEasingUpdate : 'cubicInOut',
			title : [ {
				text : '上海酒类零售商失信记录分布',
				left : 'center',
				textStyle : {
					color : '#fff'
				}
			}, {
				id : 'statistic',
				right : 120,
				top : 40,
				width : 100,
				textStyle : {
					color : '#fff',
					fontSize : 16
				}
			} ],
			toolbox : {
				iconStyle : {
					normal : {
						borderColor : '#fff'
					},
					emphasis : {
						borderColor : '#b1e4ff'
					}
				}
			},
			brush : {
				outOfBrush : {
					color : '#abc'
				},
				brushStyle : {
					borderWidth : 2,
					color : 'rgba(0,0,0,0.2)',
					borderColor : 'rgba(0,0,0,0.5)',
				},
				seriesIndex : [ 0, 1 ],
				throttleType : 'debounce',
				throttleDelay : 300,
				geoIndex : 0
			},
			geo : {
				map : 'shanghai',
				left : '10',
				right : '55%',
				label : {
					emphasis : {
						show : false
					}
				},
				roam : true,
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
			tooltip : {
				trigger : 'item'
			},
			grid : {
				right : 40,
				top : 100,
				bottom : 40,
				width : '30%'
			},
			xAxis : {
				type : 'value',
				scale : true,
				position : 'top',
				boundaryGap : false,
				splitLine : {
					show : false
				},
				axisLine : {
					show : false
				},
				axisTick : {
					show : false
				},
				axisLabel : {
					margin : 2,
					textStyle : {
						color : '#aaa'
					}
				},
			},
			yAxis : {
				type : 'category',
				name : 'TOP 20',
				nameGap : 16,
				axisLine : {
					show : false,
					lineStyle : {
						color : '#ddd'
					}
				},
				axisTick : {
					show : false,
					lineStyle : {
						color : '#ddd'
					}
				},
				axisLabel : {
					interval : 0,
					textStyle : {
						color : '#ddd'
					}
				},
				data : []
			},
			series : [ {
				name : 'pm2.5',
				type : 'scatter',
				coordinateSystem : 'geo',
				data : convertedData[0],
				symbolSize : function(val) {
					return Math.max(val[2] / 10, 8);
				},
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
				itemStyle : {
					normal : {
						color : '#ddb926'
					}
				}
			}, {
				name : 'Top 5',
				type : 'effectScatter',
				coordinateSystem : 'geo',
				data : convertedData[1],
				symbolSize : function(val) {
					return Math.max(val[2] / 10, 8);
				},
				showEffectOn : 'emphasis',
				rippleEffect : {
					brushType : 'stroke'
				},
				hoverAnimation : true,
				label : {
					normal : {
						formatter : '{b}',
						position : 'right',
						show : true
					}
				},
				itemStyle : {
					normal : {
						color : '#f4e925',
						shadowBlur : 10,
						shadowColor : '#333'
					}
				},
				zlevel : 1
			}, {
				id : 'bar',
				zlevel : 2,
				type : 'bar',
				symbol : 'none',
				itemStyle : {
					normal : {
						color : '#ddb926'
					}
				},
				data : []
			} ]
		};

		myChart.on('brushselected', renderBrushed);

		myChart.setOption(option);

		function renderBrushed(params) {
			var mainSeries = params.batch[0].selected[0];

			var selectedItems = [];
			var categoryData = [];
			var barData = [];
			var maxBar = 30;
			var sum = 0;
			var count = 0;

			for ( var i = 0; i < mainSeries.dataIndex.length; i++) {
				var rawIndex = mainSeries.dataIndex[i];
				var dataItem = convertedData[0][rawIndex];
				var pmValue = dataItem.value[2];

				sum += pmValue;
				count++;

				selectedItems.push(dataItem);
			}

			selectedItems.sort(function(a, b) {
				return a.value[2] - b.value[2];
			});

			for ( var i = 0; i < Math.min(selectedItems.length, maxBar); i++) {
				categoryData.push(selectedItems[i].name);
				barData.push(selectedItems[i].value[2]);
			}

			this.setOption({
				yAxis : {
					data : categoryData
				},
				xAxis : {
					axisLabel : {
						show : !!count
					}
				},
				title : {
					id : 'statistic',
					text : count ? '平均: ' + (sum / count).toFixed(4) : ''
				},
				series : {
					id : 'bar',
					data : barData
				}
			});
		};
	</script>
</body>

</html>
