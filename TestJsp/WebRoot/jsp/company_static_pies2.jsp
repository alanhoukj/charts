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
<script type="text/javascript" src="js/echarts/echarts.js"></script>
<script type="text/javascript" src="js/echarts/theme/purple.js"></script>

<body>
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
	<div id="main" style="width: 100%; height: 100% ;float:left"></div>
	<div id="main1" style="width: 0%; height: 100% ;float:left"></div>
	<script type="text/javascript">
	
	setTimeout(function()
	{
		var dataMap=dataFormatter({
			2011:[1701,425,2363,871],  
			2012:[33,22,11,44],
			2013:[44,22,11,44],
			2014:[55,22,11,44], 
			2015:[66,22,11,44] 
		});	
		
		
		var legendMap={
			'建筑':['房屋建筑业','土木工程建筑业','建筑安装业','建筑装饰业','其他'],
			'药品':['医药制造业','医疗器械行业','医药零售'], 
			'食品':['农副食品加工业','食品制造业','酒、饮料和精制茶制造业','餐饮'], 
			'互联网':['金融互联网行业','电子商务行业','信息技术','其他'],
		};
		
		var pieMap={
			'建筑': {'2011':[6,22,10,99,119],'2012':[21,32,16,123,133],'2013':[25,49,12,158,186],'2014':[8,47,32,201,228],'2015':[6,11,8,71,78]},
			'药品':   {'2011':[31,25,8],'2012':[51,43,9],'2013':[57,48,7],'2014':[64,41,4],'2015':[20,15,2]},
			'食品':   {'2011':[24,190,10,398],'2012':[14,156,13,561],'2013':[20,128,21,318],'2014':[14,97,28,204],'2015':[13,68,8,78]},
			'互联网': {'2011':[3,5,44,34],'2012':[5,9,57,40],'2013':[3,34,106,93],'2014':[13,50,154,102],'2015':[5,17,55,42]}
		};
		
		function pieFormatter(indust,year) {
		    var pList = legendMap[indust];
		    var temp;
		    var obj=new Array();
		    //var max = 0;
	        temp = pieMap[indust][year];
	        for (var i = 0, l = temp.length; i < l; i++) {
	            //max = Math.max(max, temp[i]);
	            obj[i] = {
	                name : pList[i],
	                value : temp[i]
	            }
	        }
	        //obj[year+'max'] = Math.floor(max/100) * 100;
		    return obj;
		}
		
		
		function dataFormatter(obj) {
		    var pList =  [ '食品','建筑','互联网','药品' ];
		    var temp;
		    //var max = 0;
		    for (var year = 2011; year <= 2015; year++) {
		        temp = obj[year];
		        var sum=0;
		        for (var i = 0, l = temp.length; i < l; i++) {
		            //max = Math.max(max, temp[i]);
		            sum +=  temp[i];
		            obj[year][i] = {
		                name : pList[i],
		                value : temp[i]
		            }
		        }
		        obj[year+'sum'] =sum;
		        //obj[year+'max'] = Math.floor(max/100) * 100;
		    }
		    return obj;
		}
		
		var labelTop = {
			normal : {
				label : {
					show : true,
					position : 'center',
					formatter : '{b}',
					textStyle : {
						baseline : 'bottom'
					}
				},
				labelLine : {
					show : false
				}
			}
		};
		
		var labelFromatter = {
			normal : {
				label : {
					position: 'outer',
					formatter :function (params){
						return Math.floor((100-params.percent)*100)/100+'%';
					},
					textStyle : {
						baseline : 'top',
						color: '#FFF'
					},
					
				}
			}
		};
		
		var labelBottom = {
			normal : {
				color : '#ccc',
				label : {
					show : true,
					position : 'center'
				},
				labelLine : {
					show : false
				}
			},
			emphasis : {
				color : 'rgba(0,0,0,0)'
			}
		};
		
		var radius = [ 60, 75 ];
			// 路径配置
			require.config({
				paths : {
					echarts : 'js/echarts',
				}
		});

		// 使用
		require([ 'echarts', 'echarts/chart/map', // 使用相关图就加载相关的模块，按需加载
		'echarts/chart/pie', 'echarts/chart/line', 'echarts/chart/bar', ],

		function(ec) {
			// 基于准备好的dom，初始化echarts图表
			var myChart = ec.init(document.getElementById('main'));
			
			// start of line chart
			option= {
						title : {
							'text' : '2011-2015年信用高危警示企业行业分布(80万企业)',
							textStyle: {
					            fontWeight: 'normal',
					            color: '#fff'     ,
					            fontFamily: 'Microsoft YaHei' 
					        }
						},
						tooltip : {
							'trigger' : 'item'
						},
						/*  backgroundColor: '#1b1b1b',

						 color: [
						        '#FE8463','#9BCA63','#FAD860','#60C0DD','#0084C6',
						        '#D7504B','#C6E579','#26C0C0','#F0805A','#F4E001',
						        '#B5C334'
						 ], */
						 	backgroundColor: '#2a2f6d',
						 	color:['#F2476B','#F8B155','#019B9D','#54BCF9'],
						legend : {
							x : 'center',
							y : '80%',
							data : ['食品','建筑','互联网','药品' ],
									textStyle: {
							            color: '#ccc'          
							        }
						},
						toolbox : {
							'show' : true,
							orient : 'vertical',
							color : ['#fff', '#fff', '#fff', '#fff'],
					        effectiveColor : '#FE8463',
					        disableColor: '#666',
							x : 'right',
							y : 'center',
							'feature' : {
								'mark' : {
									'show' : true
								},
								'restore' : {
									'show' : true
								},
								'saveAsImage' : {
									'show' : true
								}
							}
						},
						//calculable : true,
						pie: {
					        itemStyle: {
					            normal: {
					                borderWidth: 1,
					                borderColor : 'rgba(255, 255, 255, 0.5)'
					            },
					            emphasis: {
					                borderWidth: 1,
					                borderColor : 'rgba(255, 255, 255, 1)'
					            }
					        }
					    },
						series : [ {
							type : 'pie',
							center : [ '20%', '40%' ],
							radius : radius,
							x : '0%', // for funnel
							itemStyle : labelFromatter,
							data : [ {
								name : 'other',
								value : 9671-dataMap['2011'][2].value,
								itemStyle : labelBottom
							}, {
								name : '食品',
								value : dataMap['2011'][2].value,
								itemStyle : labelTop
							} 
							
							]
						}, {
							type : 'pie',
							center : [ '40%', '40%' ],
							radius : radius,
							x : '60%', // for funnel
							itemStyle : labelFromatter,
							data : [ {
								name : 'other',
								value : 9671-dataMap['2011'][0].value,
								itemStyle : labelBottom
							}, {
								name : '建筑',
								value : dataMap['2011'][0].value,
								itemStyle : labelTop
							} ]
						}, {
							type : 'pie',
							center : [ '60%', '40%' ],
							radius : radius,
							y : '55%', // for funnel
							x : '20%', // for funnel
							itemStyle : labelFromatter,
							data : [ {
								name : 'other',
								value : 9671-dataMap['2011'][3].value,
								itemStyle : labelBottom
							}, {
								name : '互联网',
								value : dataMap['2011'][3].value,
								itemStyle : labelTop
							} ]
						},{
							type : 'pie',
							center : [ '80%', '40%' ],
							radius : radius,
							y : '55%', // for funnel
							x : '60%', // for funnel
							itemStyle : labelFromatter,
							data : [ {
								name : 'other',
								value : 9671-dataMap['2011'][1].value,
								itemStyle : labelBottom
							}, {
								name : '药品',
								value : dataMap['2011'][1].value,
								itemStyle : labelTop
							} ]
						} ]
					};
					
					
					option2= {
				title : {
							'text' : '2011-2015年信用高危警示企业行业分布(80万企业)',
							textStyle: {
					            fontWeight: 'normal',
					            color: '#fff'     ,
					            fontFamily: 'Microsoft YaHei' 
					        }
						},
						tooltip : {
							'trigger' : 'item'
						},
						/*  backgroundColor: '#1b1b1b',

						 color: [
						        '#FE8463','#9BCA63','#FAD860','#60C0DD','#0084C6',
						        '#D7504B','#C6E579','#26C0C0','#F0805A','#F4E001',
						        '#B5C334'
						 ], */
						 	backgroundColor: '#2a2f6d',
						 	color:['#F2476B','#F8B155','#019B9D','#54BCF9'],
						legend : {
							x : 'center',
							y : '90%',
							data : [ '建筑','药品','食品','互联网' ],
									textStyle: {
							            color: '#ccc'          
							        }
						},
						toolbox : {
							'show' : true,
							orient : 'vertical',
							color : ['#fff', '#fff', '#fff', '#fff'],
					        effectiveColor : '#FE8463',
					        disableColor: '#666',
							x : 'right',
							y : 'center',
							'feature' : {
								'mark' : {
									'show' : true
								},
								'restore' : {
									'show' : true
								},
								'saveAsImage' : {
									'show' : true
								}
							}
						},
						//calculable : true,
						pie: {
					        itemStyle: {
					            normal: {
					                borderWidth: 1,
					                borderColor : 'rgba(255, 255, 255, 0.5)'
					            },
					            emphasis: {
					                borderWidth: 1,
					                borderColor : 'rgba(255, 255, 255, 1)'
					            }
					        }
					    },
						series : [ {
							type : 'pie',
							center : [ '30%', '30%' ],
							radius : radius,
							x : '0%', // for funnel
							itemStyle : labelFromatter,
							data : [ {
								name : 'other',
								value : 9671-dataMap['2011'][2].value,
								itemStyle : labelBottom
							}, {
								name : '食品',
								value : dataMap['2011'][2].value,
								itemStyle : labelTop
							} ]
						}, {
							type : 'pie',
							center : [ '70%', '30%' ],
							radius : radius,
							x : '60%', // for funnel
							itemStyle : labelFromatter,
							data : [ {
								name : 'other',
								value : 9671-dataMap['2011'][0].value,
								itemStyle : labelBottom
							}, {
								name : '建筑',
								value : dataMap['2011'][0].value,
								itemStyle : labelTop
							} ]
						}, {
							type : 'pie',
							center : [ '30%', '70%' ],
							radius : radius,
							y : '55%', // for funnel
							x : '20%', // for funnel
							itemStyle : labelFromatter,
							data : [ {
								name : 'other',
								value : 9671-dataMap['2011'][3].value,
								itemStyle : labelBottom
							}, {
								name : '互联网',
								value : dataMap['2011'][3].value,
								itemStyle : labelTop
							} ]
						},{
							type : 'pie',
							center : [ '70%', '70%' ],
							radius : radius,
							y : '55%', // for funnel
							x : '60%', // for funnel
							itemStyle : labelFromatter,
							data : [ {
								name : 'other',
								value : 9671-dataMap['2011'][1].value,
								itemStyle : labelBottom
							}, {
								name : '药品',
								value : dataMap['2011'][1].value,
								itemStyle : labelTop
							} ]
						} ]
						
					};
			
			var ecConfig = require('echarts/config');
    		myChart.on(ecConfig.EVENT.CLICK, function (param)
    		{	
    			seriesTitle=param.name;
    			//alert(param.name);
    			$("#main").width("50%");
    			myChart.resize();
    			myChart.setOption(option2,true);
    			$("#main1").width("50%");
    			
    			var myChart1 = ec.init(document.getElementById('main1'));
    			
    			option1 = {
    				    title : {
    				        text: seriesTitle+'行业  2011至2015年详细情况',
    				        //subtext: '纯属虚构',
    				        x:'left',
    				        y:'top'
    				    },
    				    tooltip : {
    				        trigger: 'item',
    				        formatter: "{a} <br/>{b} : {c} ({d}%)"
    				    },
    				     legend: {
    				        orient : 'vertical',
    				        x : 'right',
    				        y: 'bottom',
    				        data:legendMap[seriesTitle]
    				    }, 
    				    toolbox: {
    				        show : true,
    				        feature : {
    				            mark : {show: true},
    				            dataView : {show: true, readOnly: false},
    				            restore : {show: true},
    				            saveAsImage : {show: true}
    				        }
    				    },
    				    backgroundColor: '#fef8ef',
    				    color :['#c12e34','#e6b600','#0098d9','#2b821d',
    				            '#005eaa','#339ca8','#cda819','#32a487'],
    				    calculable : false,
    				    series : (function (){
    				        var series = [];
    				        for (var i = 0; i < 5; i++) {
    				            series.push({
    				                name: (2011+i)+'年'+seriesTitle+'行业情况',
    				                type:'pie',
    				                 itemStyle : {normal : {
    				                    label : {show : i > 3},
    				                    labelLine : {show : i > 3, length:20}
    				                }}, 
    				                radius : [i * 20+83, i * 20 + 95],
    				                data:pieFormatter(seriesTitle,2011+i)
    				            })
    				        }
    				        series[0].markPoint = {
    				            symbol:'emptyCircle',
    				            symbolSize:series[0].radius[0],
    				            effect:{show:true,scaleSize:12,color:'rgba(250,225,50,0.8)',shadowBlur:10,period:30},
    				            data:[{x:'50%',y:'50%'}]
    				        }; 
    				        return series;
    				    })()
    				};
    				myChart1.setOption(option1);
    				setTimeout(function (){
			    var _ZR = myChart1.getZrender();
			    var TextShape = require('zrender/shape/Text');
			    // 补充千层饼
			    _ZR.addShape(new TextShape({
			        style : {
			            x : _ZR.getWidth() / 2,
			            y : _ZR.getHeight() / 2,
			            color: '#000',
			            text : '2011',
			            textAlign : 'center',
			             textFont:'normal 20px 微软雅黑'
			        }
			    }));
			    _ZR.addShape(new TextShape({
			        style : {
			            x : _ZR.getWidth() / 2 + 200,
			            y : _ZR.getHeight() / 2,
			            brushType:'fill',
			            color: '#000',
			            text : '2015',
			            textAlign : 'left',
			            textFont:'normal 20px 微软雅黑'
			        }
			    }));
			    _ZR.refresh();
			}, 1000);
    		});
    		
    		setTimeout(function()
			{
	    	
				// 为echarts对象加载数据 
				myChart.setOption(option);
  			}, 0);
  			
  			
		});
		
	}, 100);
	</script>
</body>

</html>
