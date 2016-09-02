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
	<div id="main" style="width: 100%; height: 100%;float:left"></div>
	<div id="up" style="width: 0%; height: 45%;float:left"></div>

	<div id="down" style="width: 0%; height: 55%;float:left"></div>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/echarts.min.js"></script>
	<script type="text/javascript" src="js/component/dataMap.js"></script>
	<script type="text/javascript" src="js/echarts/theme/dark.js"></script>
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->


	<script type="text/javascript">
		var dataMap = {};
	
		var districts=[ '黄浦','徐汇','长宁','普陀','虹口','嘉定','金山','崇明' ];
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
			var pList = districts;
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
			2015 : [ 4,3,3,2,21,0,2,5],
			2016 : [ 4,3,3,2,19,1,3,6],
			
		});
		
		pieSchema=['司法记录','行政记录','公用负面记录','酒类监管负面记录'];
		
	/* 	pieSum2015 = {
			'黄浦':[2,2,0,0],
			'徐汇':[0,3,0,0],
			'长宁':[0,3,0,0],
			'普陀':[0,2,0,0],
			'虹口':[0,21,0,0],
			'嘉定':[0,0,0,0],
			'金山':[1,1,0,0],
			'崇明':[0,5,0,0]
		};
		
		pieSum2016 = {
			'黄浦':[0,4,0,0],
			'徐汇':[0,3,0,0],
			'长宁':[0,1,0,0],
			'普陀':[0,2,0,0],
			'虹口':[0,19,0,0],
			'嘉定':[0,1,0,0],
			'金山':[1,2,0,0],
			'崇明':[0,6,0,0]
		}; */
		
		pieSum2015 = {
			'黄浦':[1,1,2,3],
			'徐汇':[1,2,0,2],
			'长宁':[2,1,0,4],
			'普陀':[1,1,0,3],
			'虹口':[3,9,9,1],
			'嘉定':[0,0,0,2],
			'金山':[1,1,0,1],
			'崇明':[3,2,0,2]
		};
		
		pieSum2016 = {
			'黄浦':[1,2,1,0],
			'徐汇':[1,1,1,2],
			'长宁':[0,1,0,1],
			'普陀':[0,1,1,0],
			'虹口':[9,3,7,2],
			'嘉定':[0,1,0,0],
			'金山':[1,2,0,0],
			'崇明':[2,2,2,3]
		};
		
		function pieFormatter(map,district) {
		    
		    var temp;
		    var obj=new Array();
		    //var max = 0;
	        temp = map[district];
	        for (var i = 0, l = temp.length; i < l; i++) {
	            //max = Math.max(max, temp[i]);
	            obj[i] = {
	                name : pieSchema[i],
	                value : temp[i]
	            }
	        }
	        //obj[year+'max'] = Math.floor(max/100) * 100;
		    return obj;
		}
		
		countSum ={
			'黄浦':[1,0,2,0,0,0,9 ],
			'徐汇':[0,0,6,1,0,0,14 ],
			'长宁':[0,0,0,0,0,0,1 ],
			'普陀':[0,0,6,0,0,1,4 ],
			'虹口':[2,1,0,5,1,0,26 ],
			'嘉定':[1,0,0,2,0,0,26 ],
			'金山':[1,0,12,0,0,0,15 ],
			'崇明':[1,0,3,5,0,0,9 ]
		
		};
		
		countSchema=['非公司企业法人','非公司企业法人分支机构','分公司','个人独资企业','个人独资企业分支机构','个体工商户','公司'];
		
		function countFormatter(map,district) {
		    
		    var temp;
		    var obj=new Array();
		    //var max = 0;
	        temp = map[district];
	        for (var i = 0, l = temp.length; i < l; i++) {
	            //max = Math.max(max, temp[i]);
	            obj[i] = {
	                name : countSchema[i],
	                value : temp[i]
	            }
	        }
	        //obj[year+'max'] = Math.floor(max/100) * 100;
		    return obj;
		}
		

		var radius = [ 50, 75 ];
		var labelTop = {
			normal : {
				label : {
					show : true,
					position : 'center',
					formatter : function (data){
						var label="";
						//alert(data.seriesName +  "   " +data.seriesIndex);
						if(data.name=="行政记录"){
							label=data.seriesName;
						}
						return label;
					},
					textStyle : {
						baseline : 'bottom',
						color: '#000'
					},
					
				},
				labelLine : {
					show : false
				}
			}
		};
		setTimeout(
				function() {
					// 基于准备好的dom，初始化echarts图表
					var myChart = echarts.init(document.getElementById('main'),'dark');

					// start of line chart
					option = {
							title : {
								'text' : '2015、2016年酒类零售商信用负面记录对比',
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
								//y: 'bottom',
								'selected' : {
									'2015' : true,
									'2016' : true,
								}
							},
							toolbox : {
								'show' : true,
								orient : 'vertical',
								x : 'left',
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
							/* grid : {
								'y' : 80,
								'y2' : 100
							}, */
							/* color : [ '#fc6147', '#ff893e', '#ff9e6e',
									'#fff867', '#e3f500', '#bfcd00', '#73a373',
									'#73b9bc', '#7289ab', '#91ca8c', '#f49f42' ], */
							/* backgroundColor : '#2a516b',
							    color: [
									'#dd6a66','#efdd78','#E9E20C','#C0BA0D','#73a373','#73b9bc','#7289ab', '#91ca8c','#f49f42'
							    ],  */
							    backgroundColor : '#3d3f43',
							    color: [
									'#db7f56','#cf4515','#E9E20C','#C0BA0D','#73a373','#73b9bc','#7289ab', '#91ca8c','#f49f42'
							    ],
							xAxis : [ {
								'type' : 'category',
								'axisLabel' : {
									'interval' : 0
								},
								'data' : districts
							} ],
							yAxis : [ {
								'type' : 'value',
								'name' : '负面记录数量（条）',
							} ]
						};
						

					setTimeout(function() {
						myChart.hideLoading();
						myChart.setOption(option);
						
					}, 0);
					
					
					// on click event
					myChart.on('click', function (params) {
					    $("#main").width("50%");
					    myChart.resize();
					    $("#up").width("50%");
					    $("#down").width("50%");
					    
					    var seriousName=params.name;
					  //  alert(seriousName);
					    var myChart2 = echarts.init(document.getElementById('up'));
					   	var myChart3 = echarts.init(document.getElementById('down'));
					option2 = {
							title : {
								'text' : seriousName+'区负面记录详细分布情况',
								textStyle: {
						            fontFamily: 'Microsoft YaHei', 
						        },
						        right:'center'
						        
							},
							tooltip : {
						        trigger: 'item',
						        formatter: "{a} <br/>{b} : {c} ({d}%)"
						    },
						    legend:{
						    	data :pieSchema,
						    	
						    	right: 'center',
						    	top:'bottom'
						    },
							series : [ {
								type : 'pie',
								center : [ '25%', '50%' ],
								radius : radius,
								name: '2015年详细记录',
								data :   pieFormatter(pieSum2015,seriousName),
								minAngle:5,
								itemStyle : labelTop
							},
							
							{
								type : 'pie',
								center : [ '75%', '50%' ],
								radius : radius,
								name: '2016年详细记录',
								data :   pieFormatter(pieSum2016,seriousName),
								minAngle:5,
								itemStyle : labelTop
							}

							]

						};
						
						option3 = {
								    title: {
								        text: seriousName+'区酒类零售商企业类型分布',
								    },
								    tooltip: {
								        trigger: 'axis',
								        axisPointer: {
								            type: 'shadow'
								        }
								    },
								    grid: {
								        left: '3%',
								        right: '4%',
								        bottom: '3%',
								        containLabel: true
								    },
								    yAxis: {
								        type: 'value',
								    },
								    xAxis: {
								        type: 'category',
								        data: ['非公司\n企业法人','非公司\n企业法人\n分支机构','分公司','个人独资\n企业','个人独资\n企业分支\n机构','个体工商户','公司']
								    },
								    series: [
								        {
								            name: seriousName,
								            type: 'line',
								            data: countFormatter(countSum,seriousName)
								        }
								    ]
								};
						myChart2.setOption(option2);
						myChart3.setOption(option3);
						

					});

				}, 100);
	</script>
	
</body>

</html>
