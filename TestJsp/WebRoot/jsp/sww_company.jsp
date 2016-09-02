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

<script type="text/javascript" src="js/echarts/echarts.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<body>
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
	<div id="main" style="width: 100%; height: 100% ;float:left"></div>
	<div id="main1" style="width: 0%; height: 100% ;float:right;"></div>
	<script type="text/javascript">
		setTimeout(function() {
			var pieMap = {
				'红灯' : {
					'名称' : [ '', '', '', '上海吉贝克信息技术有限公司',
							'上海星谷信息科技有限公司' ],
					'数量' : [ 0, 0, 0, 2, 4 ],
					'总数' : [ 2 ],
					'描述' : [ '信用风险高危' ],
				},
				'黄灯' : {
					'名称' : [ '', '', '', '上海天天鲜果电子商务有限公司',
							'上海艾迪康医学检验所有限公司' ],
					'数量' : [ 0, 0, 0, 2, 2 ],
					'总数' : [ 2 ],
					'描述' : [ '信用风险警示' ],
				},
				'绿灯' : {
					'名称' : [ '上海意迪尔洁净系统工程有限公司', '上海邮电设计咨询研究院有限公司', '上海神开石油科技有限公司',
							'上海外高桥造船有限公司', '上海贝岭股份有限公司' ],
					'数量' : [ 1, 1, 1, 1, 1 ],
					'总数' : [ 6 ],
					'描述' : [ '信用风险可控' ],
				}
			};

			function pieSumFormatter(obj) {
				var pList = [ '红灯', '黄灯', '绿灯' ];
				var temp = new Array();
				for (var i = 0, l = pList.length; i < l; i++) {
					temp[i] = {
						name : pList[i],
						value : obj[pList[i]]['总数']
					};
				}
				return temp;
			}

			var pieSum = pieSumFormatter(pieMap);

			var colorMap = {
				'红灯' : '#FD3460',
				'黄灯' : '#FDD94B',
				'绿灯' : '#03E377'
			};

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
						formatter : function(params) {
							return Math.floor((100 - params.percent) * 100)
									/ 100 + '%';
						},
						textStyle : {
							baseline : 'top'
						}
					}
				},
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
			'echarts/chart/pie', 'echarts/chart/line', 'echarts/chart/bar' ],

			function(ec) {
				// 基于准备好的dom，初始化echarts图表
				var myChart = ec.init(document.getElementById('main'));

				var commentMap = {
					'红灯' : '红灯: 信用风险高危，建议不予授信',
					'黄灯' : '黄灯: 信用风险警示，建议降低授信额度并加强事中检查频率',
					'绿灯' : '绿灯: 信用风险可控，建议可以授信'
				};

				myChart.showLoading({
					text : '数据读取中...',
					textStyle : {
						fontSize : 16,
						fontFamily : '微软雅黑',
					}
				});

				// start of line chart
				option = {
					title : {
						text : '有负面记录的项目申报主体评估结果统计',
						subtext : '\n共计10家',
						x : 'center',
						textStyle : {
							fontWeight : 'normal',
							fontFamily : '微软雅黑',
							fontWeight: 'bolder',
							color : '#2731B8',
						},
						subtextStyle : {
							fontFamily : '微软雅黑',
							fontWeight: 'bolder',
							color : '#2731B8',
						}
					},
					legend : {
						orient : 'vertical',
						x : 'left',
						y : 'bottom',
						data : [ '红灯', '黄灯', '绿灯' ],
						textStyle : {
							color : '#2731B8',
							fontFamily : '微软雅黑'
						},
						formatter : function(s) {
							return commentMap[s];
						}

					},
					calculable : true,
					color : [ '#FD3460','#FDD94B','#03E377'],
					backgroundColor : '#D8E9FC',
					series : [ {
						name : '',
						type : 'pie',
						radius : '55%',
						center : [ '50%', '55%' ],
						data : pieSum
						/* [ {
							value : 2,
							name : '红灯'
						}, {
							value : 3,
							name : '黄灯'
						}, {
							value : 95,
							name : '绿灯'
						}, ] */
						,
						itemStyle : {
							normal : {
								label : {
									formatter : "{b}{c}家\n占{d}%",
									postion : 'inner',
									textStyle : {
										fontFamily : '微软雅黑',
										fontWeight: 'bold',
										color : '#2731B8',
									},
								}
							}
						}
					} ]
				};

				var ecConfig = require('echarts/config');
				myChart.on(ecConfig.EVENT.CLICK, function(param) {
					seriesTitle = param.name;
					//alert(param.value);
					$("#main").width("50%");
					myChart.resize();
					$("#main1").width("50%");

					var myChart1 = ec.init(document.getElementById('main1'));

					option1 = {
						title : {
							text : pieMap[seriesTitle]['描述'] + '申报主体负面记录数量排名',
							x : 'center',
							y : 'bottom',
							textStyle : {
								fontWeight : 'normal',
								fontFamily : '微软雅黑'
							}
						},
						tooltip : {
							trigger : 'axis'
						},

						calculable : true,
						xAxis : [ {
							type : 'value',
							boundaryGap : [ 0, 0.01 ]
						} ],
						yAxis : [ {
							type : 'category',
							data : pieMap[seriesTitle]['名称'],
							axisLabel : {
								interval : 'auto',
								rotate : 45,
								formatter : function(s) {
									return s.replace(/[\u4e00-\u9fa5]{7}/g,
											"$&\n");
								},
								textStyle : {
									fontWeight : 'normal',
									fontFamily : '微软雅黑'
								}
							},
						} ],

						series : [ {
							name : '负面记录数',
							type : 'bar',
							data : pieMap[seriesTitle]['数量'],
							barWidth : 30,
							itemStyle : {
								normal : {
									color : colorMap[seriesTitle],
									label : {
										show : true,
									}
								}
							}
						} ],
						backgroundColor : '#fef8ef',
						calculable : false,

					};
					myChart1.setOption(option1);
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
