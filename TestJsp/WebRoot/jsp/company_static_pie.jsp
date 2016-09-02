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
<script type="text/javascript" src="js/component/dataMap2.js"></script>

<body>
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
	<div id="main" style="width: 100%; height: 100%"></div>
	<script type="text/javascript">
	
	setTimeout(function()
	{
		var myChart = echarts.init(document.getElementById('main'));
		
		
		var contrastColor='#FFF';
		myChart.showLoading({
			text : '数据读取中...',
		});

		option = {
				baseOption : {
					timeline : {
						axisType: 'category',
						data : [ '2011年','2012年','2013年','2014年','2015年'],
						autoPlay : true,
						playInterval : 4000,
						loop:true
					}
				},
				
				options:[
					{
					title: {
				        text: '2011年企业法人主体失信记录构成(80万企业)',
				        left: 'center',
				        top: 20,
				        textStyle: {
				            color: '#fff',
				            fontFamily: "Microsoft YaHei",
				        }
				    },
				    backgroundColor: '#2a2f6d',
				    tooltip: {
				        trigger: 'item',
				        formatter: "{a} <br/>{b}: {c} ({d}%)",
				         axisPointer: {
			                lineStyle: {
			                    color: contrastColor
			                },
			                crossStyle: {
			                    color: contrastColor
			                }
			            }
				    },
				    legend: {
				        orient: 'vertical',
				        x: 'left',
				        data:['司法极严重','司法较严重','司法一般严重','行为罚极严重','行为罚较严重','行为罚一般严重','财产极严重','财产较严重','财产一般严重'],
				        textStyle: {
			                color: contrastColor,
			                fontFamily: "Microsoft YaHei"
			                
			            }
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
				            color:['#027956',
						            '#F2476B',
						            '#026FC1',],
				            /* color: [
			                    	'#000000',
			                    	'#FF0000',
			                    	'#0000FF'] */
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
						            '#027956','#01A071','#07E6A4',
						            '#F2476B','#FD7D98','#F7C6CF',
						            '#026FC1','#0187EB','#6ABCFA'], 
				            /*color: [
						            '#000000','#333333','#666666',
						            '#FF0000','#FF4D0D','#FF9A00',
						            '#0000FF','#0066FF','#00C4FF'], */
				        }
				    ],
				    backgroundColor: '#2a2f6d',
			        textStyle: {
			            color: contrastColor,
			            fontFamily: "Microsoft YaHei",
			        },
			        timeline: {
			            lineStyle: {
			                color: contrastColor
			            },
			         
			            label: {
			                normal: {
			                    textStyle: {
			                        color: contrastColor
			                    }
			                }
			            },
			            controlStyle: {
			                normal: {
			                    color: contrastColor,
			                    borderColor: contrastColor
			                }
			            }
			        },
					
				},{
					title : {
						'text' : '2012企业法人主体失信记录构成'
					},
					series : [ {
						data : dataMap.data1RedSum['2012']
					}, {
						data : dataMap.data1Red['2012']
					}]
				},{
					title : {
						'text' : '2013企业法人主体失信记录构成'
					},
					series : [ {
						data : dataMap.data1RedSum['2013']
					}, {
						data : dataMap.data1Red['2013']
					}]
				},{
					title : {
						'text' : '2014企业法人主体失信记录构成'
					},
					series : [ {
						data : dataMap.data1RedSum['2014']
					}, {
						data : dataMap.data1Red['2014']
					}]
				},{
					title : {
						'text' : '2015企业法人主体失信记录构成'
					},
					series : [ {
						data : dataMap.data1RedSum['2015']
					}, {
						data : dataMap.data1Red['2015']
					}]
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
</body>

</html>
