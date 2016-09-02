<%@ page pageEncoding="UTF-8"%>

<html>
<head>
<title>line chart</title>

<!-- ECharts单文件引入 -->

<script type="text/javascript" src="../js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="../js/echarts/echarts.min.js"></script>



<script type="text/javascript" src="../js/dataMap.js"></script>
<body>
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
	<div id="main" style="width: 100%; height: 100%"></div>

	<script type="text/javascript">
		// 基于准备好的dom，初始化echarts图表
		var myChart = echarts.init(document.getElementById('main'));

		myChart.showLoading({
			textStyle : {
				fontSize : 20,
				fontFamily : '微软雅黑',
			}
		});

	

		// start of line chart
		option = {
			baseOption : {
					timeline : {
						axisType: 'category',
						data : [ '2011','2012','2013','2014','2015','总数' ],
						autoPlay : true,
						playInterval : 1000,
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
					xAxis : [ {
						'type' : 'category',
						'axisLabel' : {
							'interval' : 0
						},
						'data' : [ '长宁区', '\n闵行区', '宝山区', '\n黄浦区', '徐汇区',
								'\n浦东新区', '闸北区', '\n普陀区', '嘉定区', '\n松江区',
								'崇明县', '\n金山区', '虹口区', '\n青浦区', '静安区',
								'\n杨浦区', '奉贤区', '\n卢湾区' ]
					} ],
					yAxis : [ {
						'type' : 'value',
						'name' : '家',
					/*  'max':103 */
					}, {
						'type' : 'value',
						'name' : '家',
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
							'text' : '2011法人主体分布区域统计',
							'subtext' : '数据来自国家统计局'
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
							'text' : '2012法人主体分布区域统计'
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
							'text' : '2013法人主体分布区域统计'
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
							'text' : '2014法人主体分布区域统计'
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
							'text' : '2015法人主体分布区域统计'
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
							'text' : '2015法人主体分布区域统计'
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
					} /*,
								        {
								            title : {'text':'2015法人主体分布区域统计'},
								            series : [
								                {'data': dataMap.dataSize1Red['2007']},
								                {'data': dataMap.dataSize2Red['2007']},
								                {'data': dataMap.dataSize3Red['2007']},
								                {'data': dataMap.dataSize1Yellow['2007']},
								                {'data': dataMap.dataSize2Yellow['2007']},
								                {'data': dataMap.dataSize3Yellow['2007']}
								            ]
								        } ,
								        {
								            title : {'text':'2008法人主体分布区域统计'},
								            series : [
								                {'data': dataMap.dataSize1Red['2008']},
								                {'data': dataMap.dataSize2Red['2008']},
								                {'data': dataMap.dataSize3Red['2008']},
								                {'data': dataMap.dataSize1Yellow['2008']},
								                {'data': dataMap.dataSize2Yellow['2008']},
								                {'data': dataMap.dataSize3Yellow['2008']}
								            ]
								        },
								        {
								            title : {'text':'2009法人主体分布区域统计'},
								            series : [
								                {'data': dataMap.dataSize1Red['2009']},
								                {'data': dataMap.dataSize2Red['2009']},
								                {'data': dataMap.dataSize3Red['2009']},
								                {'data': dataMap.dataSize1Yellow['2009']},
								                {'data': dataMap.dataSize2Yellow['2009']},
								                {'data': dataMap.dataSize3Yellow['2009']}
								            ]
								        },
								        {
								            title : {'text':'2010法人主体分布区域统计'},
								            series : [
								                {'data': dataMap.dataSize1Red['2010']},
								                {'data': dataMap.dataSize2Red['2010']},
								                {'data': dataMap.dataSize3Red['2010']},
								                {'data': dataMap.dataSize1Yellow['2010']},
								                {'data': dataMap.dataSize2Yellow['2010']},
								                {'data': dataMap.dataSize3Yellow['2010']}
								            ]
								        },
								        {
								            title : {'text':'2011法人主体分布区域统计'},
								            series : [
								                {'data': dataMap.dataSize1Red['2011']},
								                {'data': dataMap.dataSize2Red['2011']},
								                {'data': dataMap.dataSize3Red['2011']},
								                {'data': dataMap.dataSize1Yellow['2011']},
								                {'data': dataMap.dataSize2Yellow['2011']},
								                {'data': dataMap.dataSize3Yellow['2011']}
								            ]
								        } */
			]
		};

		setTimeout(function() {
			myChart.hideLoading();

			// 为echarts对象加载数据 
			myChart.setOption(option);
		}, 1000);
	</script>
</body>

</html>
