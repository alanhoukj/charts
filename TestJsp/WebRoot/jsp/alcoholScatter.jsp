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
		
		
		function getSymbolSize(data) {
			return Math.max(5,Math.sqrt(data)*5);
		}
		
		var data = [
				[[10,3,'黄浦区',2015],[2,1,'徐汇区',2015],[21,3,'长宁区',2015],[12,3,'静安区',2015],[5,0,'普陀区',2015],[0,0,'虹口区',2015],[35,21,'杨浦区',2015],[12,0,'闵行区',2015],[0,0,'宝山区',2015],[1,0,'嘉定区',2015],[29,0,'浦东新区',2015],[3,0,'金山区',2015],[28,2,'松江区',2015],[1,0,'青浦区',2015],[2,0,'奉贤区',2015],[18,5,'崇明县',2015],[14,4,'其他',2015]]
				,
				[[10,3,'黄浦区',2016],[2,1,'徐汇区',2016],[21,3,'长宁区',2016],[12,3,'静安区',2016],[5,0,'普陀区',2016],[0,0,'虹口区',2016],[35,19,'杨浦区',2016],[12,0,'闵行区',2016],[0,0,'宝山区',2016],[1,0,'嘉定区',2016],[29,1,'浦东新区',2016],[3,0,'金山区',2016],[28,3,'松江区',2016],[1,0,'青浦区',2016],[2,0,'奉贤区',2016],[18,6,'崇明县',2016],[14,40,'其他',2014]]


		];

		option = {
			backgroundColor : new echarts.graphic.RadialGradient(0.5,0.5,1,
					[ {
						offset : 0,
						color : '#f7f8fa'
					}, {
						offset : 1,
						color : '#cdd0d5'
					} ]),
			title : {
				text : '2015 与 2016 年各区县酒类零售商数量及负面记录'
			},
			legend : {
				right : 10,
				data : [ '2015', '2016' ]
			},
			xAxis : {
				name:'零售商数量',
				splitLine : {
					lineStyle : {
						type : 'dashed'
					}
				}
			},
			yAxis : {
				name:'负面记录数量',
				splitLine : {
					lineStyle : {
						type : 'dashed'
					}
				},
				min:0,
				scale : true
			},
			animationDuration: 1000,
			animationEasing: 'quarticInOut',
			animationDelay: 0,
			tooltip:{
				show: true,
				formatter:function (object){
				
					 return '<div style="border-bottom: 1px solid rgba(255,255,255,.3); font-size: 18px;padding-bottom: 7px;margin-bottom: 7px">'
	+ object.data[2]
	+ object.data[3]
	+ '年' 
	+ '</div>'
	+ "酒类零售商数量: "
	+ object.data[0]+"家"
	+ ' <br>'
	+ '负面记录数: '
	+ object.data[1]+'条';
				}
			},
			series : [
					{
						name : '2015',
						data : data[0],
						type : 'scatter',
						symbolSize : function(data) {
							return getSymbolSize(data[1]);
						},
						symbolOffset: [0, '50%'],
						label : {
							emphasis : {
								show : true,
								formatter : function(param) {
									return param.data[2];
								},
								position : 'top'
							}
						},
						itemStyle : {
							normal : {
								shadowBlur : 10,
								shadowColor : 'rgba(120, 36, 50, 0.5)',
								shadowOffsetY : 5,
								color : new echarts.graphic.RadialGradient(0.4,
										0.3, 1, [ {
											offset : 0,
											color : 'rgb(251, 118, 123)'
										}, {
											offset : 1,
											color : 'rgb(204, 46, 72)'
										} ])
							}
						}
					},
					{
						name : '2016',
						data : data[1],
						type : 'scatter',
						symbolSize : function(data) {
							return getSymbolSize(data[1]);
						},
						label : {
							emphasis : {
								show : true,
								formatter : function(param) {
									return param.data[2];
								},
								position : 'top'
							}
						},
						itemStyle : {
							normal : {
								shadowBlur : 10,
								shadowColor : 'rgba(25, 100, 150, 0.5)',
								shadowOffsetY : 5,
								color : new echarts.graphic.RadialGradient(0.4,
										0.3, 1, [ {
											offset : 0,
											color : 'rgb(129, 227, 238)'
										}, {
											offset : 1,
											color : 'rgb(25, 183, 207)'
										} ])
							}
						}
					} ]
		};

		myChart.setOption(option);
	</script>
</body>

</html>
