<%@ page pageEncoding="UTF-8"%>

<html>
<head>
<title></title>

<!-- ECharts单文件引入 -->

<script type="text/javascript" src="../js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="../js/echarts/echarts.js"></script>
<body>
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
	<div id="main" style="width: 100%; height: 100% ;float:left"></div>
	<script type="text/javascript">
		setTimeout(function() {

			var natureData = [ 5, 20, 50, 33, 2, 2, 1, 0, 0, 0, 0 ].reverse();

			// 路径配置
			require.config({
				paths : {
					echarts : '../js/echarts',
				}
			});

			// 使用
			require([ 'echarts', 'echarts/chart/map', // 使用相关图就加载相关的模块，按需加载
			'echarts/chart/pie', 'echarts/chart/line', 'echarts/chart/bar', ],

			function(ec) {
				// 基于准备好的dom，初始化echarts图表
				var myChart = ec.init(document.getElementById('main'));

				myChart.showLoading({
					text : '数据读取中...',
				});

				// start of line chart
				option = {
					title : {
						text : '专项资金申报主体主要负责人信用状况分布',
						x : 'center',
					},
					tooltip : {
						trigger : 'axis'
					},

					toolbox : {
						show : true,
						feature : {
							mark : {
								show : true
							},
							dataView : {
								show : true,
								readOnly : false
							},
							magicType : {
								show : true,
								type : [ 'line', 'bar' ]
							},
							restore : {
								show : true
							},
							saveAsImage : {
								show : true
							}
						}
					},
					calculable : true,
					xAxis : [ {
						type : 'value',
						name : '人数',
					} ],
					yAxis : [ {
						name : '分数',
						type : 'category',
						data : [ '800以上', '750-800', '700-750', '650-700',
								'600-650', '550-600', '500-550', '450-500',
								'400-450', '350-400', '300-350' ].reverse()
					} ],
					series : [ {
						name : '分数段人数',
						type : 'bar',
						data : natureData,
						itemStyle : {
							normal : {
								color : function(para) {
								
									return '#FE8463';
								},
							},
						}

					} ],
					backgroundColor : '#fef8ef',
					calculable : false,
				};
				;

				var ecConfig = require('echarts/config');
				myChart.on(ecConfig.EVENT.DBLCLICK, function(param) {
					seriesTitle = param.name;
					//alert(param.name);
					$("#main").height("60%");
					myChart.resize();
				});

				setTimeout(function() {
					myChart.hideLoading();
					// 为echarts对象加载数据 
					myChart.setOption(option);
				}, 1000);
			});

		}, 100);
	</script>
</body>

</html>
