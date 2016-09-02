<%@ page pageEncoding="UTF-8"%>

<html>
<head>

<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>  
<base href="<%=basePath%>"/>
<title></title>
</head>
<body>
<!-- ECharts单文件引入 -->

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/echarts.min.js"></script>
<script type="text/javascript" src="js/echarts/theme/purple.js"></script>


<script type="text/javascript" src="js/component/dataMap.js"></script>
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
	

	<script type="text/javascript">
	
	setTimeout(function()
	{
		// 基于准备好的dom，初始化echarts图表
		var myChart = echarts.init(document.getElementById('main'),'dark');

		myChart.showLoading({
			text : '数据读取中...',
		});

		// start of line chart
		option = {
			baseOption : {
					timeline : {
						axisType: 'category',
						data : [ '2011年','2012年','2013年','2014年','2015年','总数' ],
						autoPlay : true,
						playInterval : 2000,
						//loop:false
	
					},tooltip : {
						'trigger' : 'axis'
					},
					legend : {
						x : 'right',
						'data' : [ '小型企业红灯', '中型企业红灯', '大型企业红灯', '小型企业黄灯',
								'中型企业黄灯', '大型企业黄灯' ],
						'selected' : {
							'小型企业红灯' : true,
							'中型企业红灯' : false,
							'大型企业红灯' : false,
							'小型企业黄灯' : true,
							'中型企业黄灯' : false,
							'大型企业黄灯' : false
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
								'type' : [ 'line', 'bar', 'stack', 'tiled' ]
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
				 	color: [
							'#fc6147','#ff893e','#ff9e6e','#fff867','#e3f500','#bfcd00','#73a373','#73b9bc','#7289ab', '#91ca8c','#f49f42'
					    ], 
					backgroundColor: '#2a2f6d',
					/*     color: [
							'#dd6b66','#ea7e53','#e69d87','#eedd78','#E9E20C','#C0BA0D','#73a373','#73b9bc','#7289ab', '#91ca8c','#f49f42'
					    ],  */
					xAxis : [ {
						'type' : 'category',
						'axisLabel' : {
							'interval' : 0
						},
						'data' : [ '长宁', '闵行', '宝山', '黄浦', '徐汇',
									'浦东', '普陀', '嘉定', '松江',
									'崇明', '金山', '虹口', '青浦', '静安',
									'杨浦', '奉贤']
					} ],
					yAxis : [ {
						'type' : 'value',
						'name' : '红灯数量（家）',
					/*  'max':103 */
					}, {
						'type' : 'value',
						'name' : '黄灯数量（家）',
						//'max' : 1000
					} ],
					series : [ {
						'name' : '小型企业红灯',
						'type' : 'bar',
					}, {
						'name' : '中型企业红灯',
						'type' : 'bar',
					}, {
						'name' : '大型企业红灯',
						// 'yAxisIndex':1,
						'type' : 'bar',
					}, {
						'name' : '小型企业黄灯',
						'yAxisIndex' : 1,
						'type' : 'bar',
					}, {
						'name' : '中型企业黄灯',
						'yAxisIndex' : 1,
						'type' : 'bar',
					}, {
						'name' : '大型企业黄灯',
						'yAxisIndex' : 1,
						'type' : 'bar',
					} ]
				},
			options : [
					{
						title : {
							'text' : '2011企业法人主体分布区域统计(80万企业)',
						},
						series : [ {
							'data' : dataMap.dataSize1Red['2011']
						}, {
							'data' : dataMap.dataSize2Red['2011']
						}, {
							'data' : dataMap.dataSize3Red['2011']
						}, {
							'data' : dataMap.dataSize1Yellow['2011']
						}, {
							'data' : dataMap.dataSize2Yellow['2011']
						}, {
							'data' : dataMap.dataSize3Yellow['2011']
						} ]
						
					}, {
						title : {
							'text' : '2012企业法人主体分布区域统计'
						},
						series : [ {
							'data' : dataMap.dataSize1Red['2012']
						}, {
							'data' : dataMap.dataSize2Red['2012']
						}, {
							'data' : dataMap.dataSize3Red['2012']
						}, {
							'data' : dataMap.dataSize1Yellow['2012']
						}, {
							'data' : dataMap.dataSize2Yellow['2012']
						}, {
							'data' : dataMap.dataSize3Yellow['2012']
						} ]
					}, {
						title : {
							'text' : '2013企业法人主体分布区域统计'
						},
						series : [ {
							'data' : dataMap.dataSize1Red['2013']
						}, {
							'data' : dataMap.dataSize2Red['2013']
						}, {
							'data' : dataMap.dataSize3Red['2013']
						}, {
							'data' : dataMap.dataSize1Yellow['2013']
						}, {
							'data' : dataMap.dataSize2Yellow['2013']
						}, {
							'data' : dataMap.dataSize3Yellow['2013']
						} ]
					}, {
						title : {
							'text' : '2014企业法人主体分布区域统计'
						},
						series : [ {
							'data' : dataMap.dataSize1Red['2014']
						}, {
							'data' : dataMap.dataSize2Red['2014']
						}, {
							'data' : dataMap.dataSize3Red['2014']
						}, {
							'data' : dataMap.dataSize1Yellow['2014']
						}, {
							'data' : dataMap.dataSize2Yellow['2014']
						}, {
							'data' : dataMap.dataSize3Yellow['2014']
						} ]
					}, {
						title : {
							'text' : '2015企业法人主体分布区域统计'
						},
						series : [ {
							'data' : dataMap.dataSize1Red['2015']
						}, {
							'data' : dataMap.dataSize2Red['2015']
						}, {
							'data' : dataMap.dataSize3Red['2015']
						}, {
							'data' : dataMap.dataSize1Yellow['2015']
						}, {
							'data' : dataMap.dataSize2Yellow['2015']
						}, {
							'data' : dataMap.dataSize3Yellow['2015']
						} ]
					} ,{
						title : {
							'text' : '2011-2015企业法人主体分布区域统计'
						},
						series : [ {
							'data' : dataMap.dataSize1Red['all']
						}, {
							'data' : dataMap.dataSize2Red['all']
						}, {
							'data' : dataMap.dataSize3Red['all']
						}, {
							'data' : dataMap.dataSize1Yellow['all']
						}, {
							'data' : dataMap.dataSize2Yellow['all']
						}, {
							'data' : dataMap.dataSize3Yellow['all']
						} ]
					} 
			]
		};

		setTimeout(function()
		{
			myChart.hideLoading();
			myChart.setOption(option);
		}, 1000);
		
	}, 100);
	</script>
	<div id="main" style="width: 100%; height: 100%"></div>
</body>

</html>
