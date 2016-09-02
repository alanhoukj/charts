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

	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/echarts.min.js"></script>
	<script type="text/javascript" src="js/component/dataMap.js"></script>
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->


	<script type="text/javascript">
		var dataMap = {};

		function dataMix(list) {
			var mixData = {};
			for ( var i = 0, l = list.length; i < l; i++) {
				for ( var key in list[i]) {
					if (list[i][key] instanceof Array) {
						mixData[key] = mixData[key] || [];
						for ( var j = 0, k = list[i][key].length; j < k; j++) {
							mixData[key][j] = mixData[key][j] || {
								name : list[i][key][j].name,
								value : []
							};
							mixData[key][j].value.push(list[i][key][j].value);
						}
					}
				}
			}
			return mixData;
		}

		function dataFormatter1(obj) {
			var pList = [ '长宁区', '闵行区', '宝山区', '黄浦区', '徐汇区', '浦东新区', '普陀区',
					'嘉定区', '松江区', '崇明县', '金山区', '虹口区', '青浦区', '静安区', '杨浦区',
					'奉贤区','其他' ];
			var temp;
			var max = 0;
			for ( var year = 2015; year <= 2016; year++) {
				temp = obj[year];
				for ( var i = 0, l = temp.length; i < l; i++) {
					max = Math.max(max, temp[i]);
					obj[year][i] = {
						name : pList[i],
						value : temp[i]
					}
				}
				obj[year + 'max'] = Math.floor(max / 100) * 100;
			}
			return obj;
		}

		dataMap.negativeSum = dataFormatter1({
			2015 : [ 3,1,3,3,0,0,21,0,0,0,0,0,2,0,5,0,4 ],
			2016 : [ 3,1,3,3,0,0,19,0,0,0,1,0,3,0,0,6,40 ],
			
		});


		setTimeout(
				function() {
					// 基于准备好的dom，初始化echarts图表
					var myChart = echarts.init(document.getElementById('main'),
							'purple');

					// start of line chart
					option = {
							title : {
								'text' : '2015&2016年酒类零售商负面记录统计',
							},
							series : [ {
							 	name: '2015',
            					type: 'bar',
								'data' : dataMap.negativeSum['2015']
							}, {
								name: '2016',
            					type: 'bar',
								'data' : dataMap.negativeSum['2016']
							} ],
							tooltip : {
								'trigger' : 'axis'
							},
							legend : {
								x : 'right',
								'data' : [ '2015','2016' ],
								'selected' : {
									'2015' : true,
									'2016' : true,
								}
							},
							toolbox : {
								'show' : true,
								orient : 'vertical',
								x : 'right',
								y : 'center',
								'feature' : {
									'mark' : {
										'show' : true
									},
									'dataView' : {
										'show' : true,
										'readOnly' : false
									},
									'magicType' : {
										'show' : true,
										'type' : [ 'line', 'bar', 'stack',
												'tiled' ]
									},
									'restore' : {
										'show' : true
									},
									'saveAsImage' : {
										'show' : true
									}
								}
							},
							calculable : true,
							grid : {
								'y' : 80,
								'y2' : 100
							},
							/* color : [ '#fc6147', '#ff893e', '#ff9e6e',
									'#fff867', '#e3f500', '#bfcd00', '#73a373',
									'#73b9bc', '#7289ab', '#91ca8c', '#f49f42' ], */
							//backgroundColor : '#2a2f6d',
							    color: [
									'#dd6b66','#eedd78','#E9E20C','#C0BA0D','#73a373','#73b9bc','#7289ab', '#91ca8c','#f49f42'
							    ], 
							xAxis : [ {
								'type' : 'category',
								'axisLabel' : {
									'interval' : 0
								},
								'data' : [ '长宁', '闵行', '宝山', '黄浦', '徐汇', '浦东',
										'普陀', '嘉定', '松江', '崇明', '金山', '虹口',
										'青浦', '静安', '杨浦', '奉贤','其他' ]
							} ],
							yAxis : [ {
								'type' : 'value',
								'name' : '负面记录数量（家）',
							} ]
						};
						

					setTimeout(function() {
						myChart.hideLoading();
						myChart.setOption(option);
						
					}, 0);
					myChart.on('click', function (params) {
					    
					});
					
				}, 100);
	</script>
	<div id="main" style="width: 100%; height: 100%"></div>
</body>

</html>
