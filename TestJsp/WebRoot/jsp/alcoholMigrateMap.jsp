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
</head>
<body>
	<!-- ECharts单文件引入 -->
	<div id="main" style="width: 100%; height: 100%"></div>

	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/echarts.min.js"></script>
	<script type="text/javascript" src="js/echarts/map/js/world.js"></script>
	<script type="text/javascript" src="js/echarts/map/js/shanghai.js"></script>
	<script type="text/javascript" src="js/component/dataMap3.js"></script>
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->

	<script type="text/javascript">
		var myChart = echarts.init(document.getElementById('main'));

		var data = {
			"districts" : [ "黄浦区", "徐汇区", "长宁区", "静安区", "普陀区", "虹口区", "杨浦区",
					"闵行区", "宝山区", "嘉定区", "浦东新区", "金山区", "松江区", "青浦区", "奉贤区",
					"崇明区" ],
			"routes" : 
					
					[[0,8,6],[0,10,9],
					[1,8,9],
					[2,8,4],
					[3,10,0],
					[4,10,4],
					[5,10,4],
					[6,8,7],
					[6,10,1],
					[7,8,3],
					[7,10,5],
					[8,10,2],
					[9,10,2],
					[10,8,2],
					[11,10,3],
					[12,10,5],
					[14,8,7],
					[15,10,9]]

		/* [ [ 0, 1, 1 ], [ 0, 2, 1 ], [ 0, 3, 1 ], [ 0, 4, 1 ],
		[ 0, 5, 1 ], [ 0, 6, 1 ], [ 0, 7, 1 ], [ 0, 8, 1 ],
		[ 0, 9, 1 ], [ 0, 10, 1 ], [ 0, 11, 1 ], [ 0, 12, 1 ],
		[ 0, 13, 1 ], [ 0, 14, 1 ], [ 0, 15, 1 ], [ 1, 0, 1 ],
		[ 1, 2, 1 ], [ 1, 3, 1 ], [ 1, 4, 1 ], [ 1, 5, 1 ],
		[ 1, 6, 1 ], [ 1, 7, 1 ], [ 1, 8, 1 ], [ 1, 9, 1 ],
		[ 1, 10, 1 ], [ 1, 11, 1 ], [ 1, 12, 1 ], [ 1, 13, 1 ],
		[ 1, 14, 1 ], [ 1, 15, 1 ], [ 2, 0, 1 ], [ 2, 1, 1 ],
		[ 2, 3, 1 ], [ 2, 4, 1 ], [ 2, 5, 1 ], [ 2, 6, 1 ],
		[ 2, 7, 1 ], [ 2, 8, 1 ], [ 2, 9, 1 ], [ 2, 10, 1 ],
		[ 2, 11, 1 ], [ 2, 12, 1 ], [ 2, 13, 1 ], [ 2, 14, 1 ],
		[ 2, 15, 1 ], [ 3, 0, 1 ], [ 3, 1, 1 ], [ 3, 2, 1 ],
		[ 3, 4, 1 ], [ 3, 5, 1 ], [ 3, 6, 1 ], [ 3, 7, 1 ],
		[ 3, 8, 1 ], [ 3, 9, 1 ], [ 3, 10, 1 ], [ 3, 11, 1 ],
		[ 3, 12, 1 ], [ 3, 13, 1 ], [ 3, 14, 1 ], [ 3, 15, 1 ],
		[ 4, 0, 1 ], [ 4, 1, 1 ], [ 4, 2, 1 ], [ 4, 3, 1 ],
		[ 4, 5, 1 ], [ 4, 6, 1 ], [ 4, 7, 1 ], [ 4, 8, 1 ],
		[ 4, 9, 1 ], [ 4, 10, 1 ], [ 4, 11, 1 ], [ 4, 12, 1 ],
		[ 4, 13, 1 ], [ 4, 14, 1 ], [ 4, 15, 1 ], [ 5, 0, 1 ],
		[ 5, 1, 1 ], [ 5, 2, 1 ], [ 5, 3, 1 ], [ 5, 4, 1 ],
		[ 5, 6, 1 ], [ 5, 7, 1 ], [ 5, 8, 1 ], [ 5, 9, 1 ],
		[ 5, 10, 1 ], [ 5, 11, 1 ], [ 5, 12, 1 ], [ 5, 13, 1 ],
		[ 5, 14, 1 ], [ 5, 15, 1 ], [ 6, 0, 1 ], [ 6, 1, 1 ],
		[ 6, 2, 1 ], [ 6, 3, 1 ], [ 6, 4, 1 ], [ 6, 5, 1 ],
		[ 6, 7, 1 ], [ 6, 8, 1 ], [ 6, 9, 1 ], [ 6, 10, 1 ],
		[ 6, 11, 1 ], [ 6, 12, 1 ], [ 6, 13, 1 ], [ 6, 14, 1 ],
		[ 6, 15, 1 ], [ 7, 0, 1 ], [ 7, 1, 1 ], [ 7, 2, 1 ],
		[ 7, 3, 1 ], [ 7, 4, 1 ], [ 7, 5, 1 ], [ 7, 6, 1 ],
		[ 7, 8, 1 ], [ 7, 9, 1 ], [ 7, 10, 1 ], [ 7, 11, 1 ],
		[ 7, 12, 1 ], [ 7, 13, 1 ], [ 7, 14, 1 ], [ 7, 15, 1 ],
		[ 8, 0, 1 ], [ 8, 1, 1 ], [ 8, 2, 1 ], [ 8, 3, 1 ],
		[ 8, 4, 1 ], [ 8, 5, 1 ], [ 8, 6, 1 ], [ 8, 7, 1 ],
		[ 8, 9, 1 ], [ 8, 10, 1 ], [ 8, 11, 1 ], [ 8, 12, 1 ],
		[ 8, 13, 1 ], [ 8, 14, 1 ], [ 8, 15, 1 ], [ 9, 0, 1 ],
		[ 9, 1, 1 ], [ 9, 2, 1 ], [ 9, 3, 1 ], [ 9, 4, 1 ],
		[ 9, 5, 1 ], [ 9, 6, 1 ], [ 9, 7, 1 ], [ 9, 8, 1 ],
		[ 9, 10, 1 ], [ 9, 11, 1 ], [ 9, 12, 1 ], [ 9, 13, 1 ],
		[ 9, 14, 1 ], [ 9, 15, 1 ], [ 10, 0, 1 ], [ 10, 1, 1 ],
		[ 10, 2, 1 ], [ 10, 3, 1 ], [ 10, 4, 1 ], [ 10, 5, 1 ],
		[ 10, 6, 1 ], [ 10, 7, 1 ], [ 10, 8, 1 ], [ 10, 9, 1 ],
		[ 10, 11, 1 ], [ 10, 12, 1 ], [ 10, 13, 1 ], [ 10, 14, 1 ],
		[ 10, 15, 1 ], [ 11, 0, 1 ], [ 11, 1, 1 ], [ 11, 2, 1 ],
		[ 11, 3, 1 ], [ 11, 4, 1 ], [ 11, 5, 1 ], [ 11, 6, 1 ],
		[ 11, 7, 1 ], [ 11, 8, 1 ], [ 11, 9, 1 ], [ 11, 10, 1 ],
		[ 11, 12, 1 ], [ 11, 13, 1 ], [ 11, 14, 1 ], [ 11, 15, 1 ],
		[ 12, 0, 1 ], [ 12, 1, 1 ], [ 12, 2, 1 ], [ 12, 3, 1 ],
		[ 12, 4, 1 ], [ 12, 5, 1 ], [ 12, 6, 1 ], [ 12, 7, 1 ],
		[ 12, 8, 1 ], [ 12, 9, 1 ], [ 12, 10, 1 ], [ 12, 11, 1 ],
		[ 12, 13, 1 ], [ 12, 14, 1 ], [ 12, 15, 1 ], [ 13, 0, 1 ],
		[ 13, 1, 1 ], [ 13, 2, 1 ], [ 13, 3, 1 ], [ 13, 4, 1 ],
		[ 13, 5, 1 ], [ 13, 6, 1 ], [ 13, 7, 1 ], [ 13, 8, 1 ],
		[ 13, 9, 1 ], [ 13, 10, 1 ], [ 13, 11, 1 ], [ 13, 12, 1 ],
		[ 13, 14, 1 ], [ 13, 15, 1 ], [ 14, 0, 1 ], [ 14, 1, 1 ],
		[ 14, 2, 1 ], [ 14, 3, 1 ], [ 14, 4, 1 ], [ 14, 5, 1 ],
		[ 14, 6, 1 ], [ 14, 7, 1 ], [ 14, 8, 1 ], [ 14, 9, 1 ],
		[ 14, 10, 1 ], [ 14, 11, 1 ], [ 14, 12, 1 ], [ 14, 13, 1 ],
		[ 14, 15, 1 ], [ 15, 0, 1 ], [ 15, 1, 1 ], [ 15, 2, 1 ],
		[ 15, 3, 1 ], [ 15, 4, 1 ], [ 15, 5, 1 ], [ 15, 6, 1 ],
		[ 15, 7, 1 ], [ 15, 8, 1 ], [ 15, 9, 1 ], [ 15, 10, 1 ],
		[ 15, 11, 1 ], [ 15, 12, 1 ], [ 15, 13, 1 ], [ 15, 14, 1 ] ] */
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
			"浦东新区" : [ 121.765395, 31.067444 ],
			"金山区" : [ 121.330736, 30.724697 ],
			"松江区" : [ 121.223543, 31.03047 ],
			"青浦区" : [ 121.113021, 31.151209 ],
			"奉贤区" : [ 121.458472, 30.912345 ],
			"崇明区" : [ 121.397516, 31.626946 ]
		};
		
		var partSum=[
			{name:"黄浦区"  ,value:0  },
			{name:"徐汇区"  ,value:0  },
			{name:"长宁区"  ,value:0 },
			{name:"静安区"  ,value:0  },
			{name:"普陀区"  ,value:0  },
			{name:"虹口区"  ,value:6  },
			{name:"杨浦区"  ,value:7  },
			{name:"闵行区"  ,value:8  },
			{name:"宝山区"  ,value:29  },
			{name:"嘉定区"  ,value:0 },
			{name:"浦东新区",value:50 },
			{name:"金山区"  ,value:0 },
			{name:"松江区"  ,value:0 },
			{name:"青浦区"  ,value:0 },
			{name:"奉贤区"  ,value:0},
			{name:"崇明区"  ,value:0 }
		];
		
		var schema = data.districts;
		var routes = data.routes.map(function(route) {
			return [ geoCoordMap[schema[route[0]]],
					geoCoordMap[schema[route[1]]] ];
		});

		option = {
			title : {
				text : '酒类零售商信用警示企业迁址图',
				left : 'center',
				textStyle : {
					color : '#eee'
				}
			},
			backgroundColor : '#404a59',
			tooltip : {
				trigger : 'item',
				formatter : function(param) {
					if (param.componentSubType == "effectScatter") {
						
						return param.name+'迁入信用警示企业数量: '+param.data.value[2];
					} else {
						var route = data.routes[param.dataIndex];
						return schema[route[0]] + ' > ' + schema[route[1]]
								+ ' 企业数量：' + route[2];
					}

				}
			},
			visualMap : {
				type : 'continuous',
				min : 0,
				max : 40,
				realtime : false,
				calculable : true,
				color : [ '#f2476b', 'yellow', '#52ff00' ],
				textStyle : {
					color : '#FFF',
				},
			},
			geo : {
				map : 'shanghai',
				left : 0,
				right : 0,
				silent : true,
				left : '30%',
				top : 20,
				bottom : '20%',
				right : '30%',
				roam : true,
				zoom : 1.5,
				label : {
					normal : {
						//show: true,
						textStyle : {
							color : '#FFFFFF'
						}
					},
					emphasis : {
						show : false
					}
				},
				itemStyle : {
					normal : {
						areaColor : '#323c48',
						borderColor : '#01BAFD'
					},
					emphasis : {
						areaColor : '#166395'
					}
				}
			},
			series : [
					{
						type : 'lines',
						coordinateSystem : 'geo',
						data : routes,
						large : true,
						largeThreshold : 100,
						effect : {
							show : true,
							period : 4,
							trailLength : 0,
							symbol : 'arrow',
							symbolSize : 11
						},
						lineStyle : {
							normal : {
								opacity : 1,
								width : 1,
								curveness : 0.3
							}
						},
						// 设置混合模式为叠加
						blendMode : 'lighter'
					},
					{
						//name: item[0] + ' Top10',
						type : 'effectScatter',
						coordinateSystem : 'geo',
						zlevel : 2,
						effectType : 'ripple',
						rippleEffect : {
							brushType : 'stroke'
						},
						label : {
							normal : {
								show : true,
								position : 'right',
								formatter : function(dataItem) {

									return dataItem.name;
								}
							}
						},
						symbolSize : function(val) {
							/* var value=val[2];
							return Math.pow((Math.log(numScoreMap[value]))/(Math.log(1.5))/3,1.5); */
							return (Math.log(val[2]+1))/ (Math.log(1.5))*2+1 ;
						},
						/* itemStyle: {
						    normal: {
						        color: color[i]
						    }
						}, */
						data : partSum.map(function(dataItem) {
							return {
								name : dataItem.name,
								value : geoCoordMap[dataItem.name]
										.concat([ dataItem.value ])
							};
						})
					}

			]
		};
		myChart.setOption(option);
	</script>

</body>

</html>
