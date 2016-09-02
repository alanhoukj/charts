<%@ page pageEncoding="UTF-8"%>

<html>
<head>
<title>creditMap</title>

<!-- ECharts单文件引入 -->

<script type="text/javascript" src="../js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="../js/echarts/echarts.min.js"></script>
<!-- <script type="text/javascript"	src="../js/echarts/map/js/province/shanghai.js"></script> -->
<body>
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
	<div id="main" style="width: 100%; height: 100%"></div>
	<script type="text/javascript">
	var myChart = echarts.init(document.getElementById('main'));
	myChart.showLoading();

	$.get('../js/echarts/map/json/province/shanghai.json', function (geoJson) {

	    myChart.hideLoading();

	    echarts.registerMap('SH', geoJson);

		option = {
			title : {
				text : '上海信用地图',
			},
			tooltip : {
				trigger : 'item',
				formatter :function(obj) {
					var value = obj.value;
					if(value!=undefined&&value.length!=''){
						return '<div style="border-bottom: 1px solid rgba(255,255,255,.3); font-size: 18px;padding-bottom: 7px;margin-bottom: 7px">'
						+ obj.seriesName
						+ ' '
						+ '</div>'
						+ obj.name +": " +value+ '%'
						+ ' <br>'
					} else{
						return null;
					}
					
				}
			},
			toolbox : {
				show : true,
				orient : 'vertical',
				left : 'right',
				top : 'center',
				feature : {
					mark : {
						show : true
					},
					dataView : {
						show : true,
						readOnly : false
					},
					restore : {
						show : true
					},
					saveAsImage : {
						show : true
					}
				}
			},
			visualMap : {
				type: 'continuous',
				precision:5,
				min : 0,
				max : 0.093,
				text : [ 'High', 'Low' ],
				realtime : true,
				calculable : true,
				color : ['#d94e5d','#eac736','#50a3ba']
				
			},
		
			series : [ {
				name : '上海区县红灯率',
				type : 'map',
				mapType: 'SH', // 自定义扩展图表类型
				itemStyle : {
					normal : {
						label : {
							show : true
						}
					},
					emphasis : {
						label : {
							show : true
						}
					}
				},
				roam:true,
				data : [{
					name : '长宁区',
					value : 0.02753
					
				}, {
					name : '闵行区',
					value : 0.02465
					
				}, {
					name : '宝山区',
					value : 0.07654
					
				}, {
					name : '黄浦区',
					value : 0.08736
					
				}, {
					name : '徐汇区',
					value : 0.04865
					
				}, {
					name : '浦东新区',
					value : 0.02503
					
				}, {
					name : '闸北区',
					value : 0.07968
					
				}, {
					name : '普陀区',
					value : 0.07434
					
				}, {
					name : '嘉定区',
					value : 0.03509
					
				}, {
					name : '松江区',
					value : 0.01326
					
				}, {
					name : '崇明县',
					value : 0.03510
					
				}, {
					name : '金山区',
					value : 0.01549
					
				}, {
					name : '虹口区',
					value : 0.09286
					
				}, {
					name : '青浦区',
					value : 0.01801
					
				}, {
					name : '静安区',
					value : 0.40493
					
				}, {
					name : '杨浦区',
					value : 0.07816
					
				}, {
					name : '奉贤区',
					value : 0.01755
					
				} ]
			} ]
		};

		myChart.setOption(option);
		/* myChart.events(
			{
			    type: 'mapselected',
			    // 系列 ID，可以在 option 中传入
			    seriesId: ,
			    // 数据名称
			    name: '上海区县红灯率',
			    // 所有数据的选中状态表。
			}
		}); */
		/* var ecConfig = require('echarts/config');
		myChart.on(ecConfig.EVENT.DBLCLICK, eConsole);
		function eConsole(param) {
			alert('here here');
		} */
	});	
	</script>
</body>

</html>
