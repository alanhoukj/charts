<%@ page pageEncoding="UTF-8"%>

<html>
<head>
<title>pie</title>

<!-- ECharts单文件引入 -->

<script type="text/javascript" src="../js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="../js/echarts/echarts.min.js"></script>
<!-- <script type="text/javascript" src="../js/echarts/echarts.min.js"></script> -->
<script type="text/javascript" src="../js/dataMap2.js"></script>
<body>
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
	<div id="main" style="width: 100%; height: 100%"></div>
	<script type="text/javascript">
	
		var myChart = echarts.init(document.getElementById('main'));

		option = {
				baseOption : {
					timeline : {
						axisType: 'category',
						data : [ '2011','2012','2013','2014','2015'],
						autoPlay : true,
						playInterval : 5000,
						loop:true
					}
				},
				
				options:[
					{
					title: {
				        text: '2011年法人失信记录构成',
				        left: 'center',
				        top: 20,
				        textStyle: {
				            color: '#000'
				        }
				    },
				    tooltip: {
				        trigger: 'item',
				        formatter: "{a} <br/>{b}: {c} ({d}%)"
				    },
				    legend: {
				        orient: 'vertical',
				        x: 'left',
				        data:['司法极严重','司法较严重','司法一般严重','行为罚极严重','行为罚较严重','行为罚一般严重','财产极严重','财产较严重','财产一般严重']
				    },
				   
				    series: [
				        {
				            name:'构成分类',
				            type:'pie',
				            selectedMode: 'single',
				            radius: [0, '30%'],

				            label: {
				                normal: {
				                    position: 'inner'
				                }
				            },
				            labelLine: {
				                normal: {
				                    show: false
				                }
				            },
				            data:dataMap.data1RedSum['2011'],
				            sort:false,
				            color: [
			                    	 '#473792',
			                    	'#4CBCB8',
			                    	 '#1F74BC']
				        },
				        {
				            name:'构成分类',
				            type:'pie',
				            radius: ['40%', '55%'],
				            sort:false,
				            minAngle:1,
				            data: dataMap.data1Red['2011'],
				            label: {
				                normal: {
				                    formatter: '{b}: {d} %'
				                }
				            },
				            color: [
						            '#473792','#8861A7','#BBA2CC',
						            '#4CBCB8','#76C7CB','#C1E5E1',
						            '#1F74BC','#5E90CB','#BBD3EE'],
				        }
				    ]
					
				},{
					title : {
						'text' : '2012法人失信记录构成'
					},
					series : [ {
						data : dataMap.data1RedSum['2012']
					}, {
						data : dataMap.data1Red['2012']
					}]
				},{
					title : {
						'text' : '2013法人失信记录构成'
					},
					series : [ {
						data : dataMap.data1RedSum['2013']
					}, {
						data : dataMap.data1Red['2013']
					}]
				},{
					title : {
						'text' : '2014法人失信记录构成'
					},
					series : [ {
						data : dataMap.data1RedSum['2014']
					}, {
						data : dataMap.data1Red['2014']
					}]
				},{
					title : {
						'text' : '2015法人失信记录构成'
					},
					series : [ {
						data : dataMap.data1RedSum['2015']
					}, {
						data : dataMap.data1Red['2015']
					}]
				}
			]
		};
				
			myChart.setOption(option);
	</script>
</body>

</html>
