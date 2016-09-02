<%@ page pageEncoding="UTF-8"%>

<html>
<head>

<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>  
<base href="<%=basePath%>"/>

<title></title>

<!-- ECharts单文件引入 -->
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/echarts.min.js"></script>

<!-- <script type="text/javascript" src="js/echarts/echarts.js"></script>  -->

<!-- <script type="text/javascript" src="js/echarts/theme/vintage.js"></script> -->

<body>
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
	<div id="main" style="width: 100%; height: 100%;"></div>
	<script type="text/javascript">
	
		setTimeout(function()
		{
			var myChart = echarts.init(document.getElementById('main'),'vintage');
			
			myChart.showLoading({
				text : '数据读取中...',
			});
			
			var txtstyle= {
			            color: '#2731b8',
			            fontFamily: "Microsoft YaHei",
			        };
			option = {
					title:{
						text:'自然人得分各区县分布情况(240万人)',
						textstyle:txtstyle
					},
					textStyle: {
			            color: '#2731b8',
			            fontFamily: "Microsoft YaHei",
			        },
				    tooltip : {
				        show: false,
				        trigger: 'axis',
				        axisPointer : {
							type : "cross",
							lineStyle : {
								type : "dashed",
								width : 1
							}
						}, formatter: function (params, ticket, callback) {
						     var int =params.length;
						     return null;
						 } 
				    },
				    legend: {
				        data:['平均值','最大值','最小值']
				    },
				    backgroundColor:'#FDFFEE',
				    color:['#FDD94B','#03E377','#FD3460'],
				    grid: {
				        left: '3%',
				        right: '4%',
				        bottom: '3%',
				        containLabel: true
				    },
				    toolbox: {
				        feature: {
				            saveAsImage: {}
				        }
				    },
				    xAxis : [
				        {
				            type : 'category',
				            boundaryGap : false,
				            data : ['长宁', '闵行', '宝山', '黄浦', '徐汇',
												'浦东',  '普陀', '嘉定', '松江',
												'崇明', '金山', '虹口', '青浦', '静安',
												'杨浦', '奉贤'],
							textstyle:txtstyle,
							name: '区域'
				        }
				    ],
				    yAxis : [
				        {
				            type : 'value',
				            min : 300,
				            textstyle:txtstyle,
				            name: '分数'
				        }
				    ],
				    series : [
				        {
				            name:'平均值',
				            type:'line',
				            data:[668.43,659.29,657.24,673.34,669.65,657.59,667.33,658.62,595.71,653.17,595.05,669.73,588.42,668.63,668.30,595.34],
				        	/* markLine:{
				        		data:[  {
				                    // 起点和终点的项会共用一个 name
				                    name: '最小值',
				                    type: 'min'
				                },
				                {
				                	name:'最大值',
				                    type: 'max'
				                }		        			
				        			]
				        	}, */
				        	markPoint: {
								symbol: 'pin',
								symbolSize: 50,
								label:{
									normal:{
										textStyle:{
											fontWeight:'bolder',
											fontSize: 16
										}
									}
								},
								data: [{ type: 'min'},{type:'max',symbolRotate:180}]
							}
				        	
				        },
				        {
				            name:'最大值',
				            type:'line',
				            data:[838.86,826.36,826.36,826.36,826.36,826.36,826.36,822.96,760.34,821.86,761.07,826.36,728.51,826.36,826.36,734.85]
				        	,/* markLine:{
				        		data:[  {
				                    // 起点和终点的项会共用一个 name
				                    name: '最小值',
				                    type: 'min'
				                },
				                {
				                	name:'最大值',
				                    type: 'max'
				                }		        			
				        			]
				        	}, */
				        	markPoint: {
								symbol: 'pin',
								symbolSize: 50,
								symbolRotate:180,
								label:{
									normal:{
										textStyle:{
											fontWeight:'bolder',
											fontSize: 16
										}
									}
								},
								data: [{ type: 'min'},{type:'max',symbolRotate:0}]
							}
				        },
				        {
				            name:'最小值',
				            type:'line',
				            data:[518.12,518.12,511.62,508.9,508.59,505.5,507.35,511.62,514.72,505.5,524.33,503.77,508.59,365.34,510.22,562.32]
				        	/* ,markLine:{
				        		data:[  {
				                    // 起点和终点的项会共用一个 name
				                    name: '最小值',
				                    type: 'min'
				                },
				                {
				                	name:'最大值',
				                    type: 'max'
				                }		        			
				        			]
				        	}*/, 
				        	markPoint: {
								symbol: 'pin',
								symbolSize: 50,
								symbolRotate:180,
								label:{
									normal:{
										textStyle:{
											fontWeight:'bolder',
											fontSize: 16,
										}
									}
								},
								data: [{ type: 'min'},{type:'max',symbolRotate:0}]
							}
				        },
				       
				    ]
				};

			setTimeout(function()
			{
				myChart.hideLoading();
				myChart.setOption(option);
			}, 1000);
		}, 500);
	
	</script>
</body>

</html>
