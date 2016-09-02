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
	<div id="main1" style="width: 0%; height: 100% ;float:left"></div>
	<script type="text/javascript">
		setTimeout(
				function() {

					var pieMap = {
						'红灯' : {
							'名称' : [ '第五红', '第四红', '第三红', '第二红', '第一红' ],
							'数量' : [ 4, 5, 6, 7, 8 ],
							'总数' : [ 30 ],
						},
						'黄灯' : {
							'名称' : [ '第五黄', '第四黄', '第三黄', '第二黄', '第一黄' ],
							'数量' : [ 6, 7, 8, 9, 10 ],
							'总数' : [ 40 ],
						},
						'绿灯' : {
							'名称' : [ '第五绿', '第四绿第四绿第四绿第四绿第四',
									'第三绿第三绿第三绿第三绿第三', '第二绿',
									'第一绿' ],
							'数量' : [ 184, 185, 186, 187, 188 ],
							'总数' : [ 930 ],
						}
					};

					function pieSumFormatter(obj) {
						var pList = [ '红灯', '黄灯', '绿灯' ];
						var temp = new Array();
						for ( var i = 0, l = pList.length; i < l; i++) {
							temp[i] = {
								name : pList[i],
								value : obj[pList[i]]['总数']
							};
						}
						return temp;
					}

					var pieSum = pieSumFormatter(pieMap);

					function nameFormatter(obj) {
						var temp = new Array();
						for ( var i = 0, l = obj.length; i < l; i++) {
							temp[i] = obj[i].replace(/[\u4e00-\u9fa5]{7}/g,"$&\n");
						}
						return temp;
					}

					var colorMap = {
						'红灯' : '#DB2822',
						'黄灯' : '#F4D612',
						'绿灯' : '#22DB28'
					};
					
					var commentMap = {
						'红灯' : '红灯: 信用风险高危，建议不予授信',
						'黄灯' : '黄灯: 信用风险警示，建议降低授信额度并加强事中检查频率',
						'绿灯' : '绿灯: 信用风险可控，建议予以授信'
					};

					// 路径配置
					require.config({
						paths : {
							echarts : '../js/echarts',
						}
					});

					// 使用
					require([ 'echarts', 'echarts/chart/map', // 使用相关图就加载相关的模块，按需加载
					'echarts/chart/pie', 'echarts/chart/line',
							'echarts/chart/bar', ],

					function(ec) {
						// 基于准备好的dom，初始化echarts图表
						var myChart = ec.init(document.getElementById('main'));

						myChart.showLoading({
							text : '数据读取中...',
						});

						// start of line chart
						option = {
							title : {
								text : '专项资金申报主体信用标识',
								subtext : '批量统计',
								x : 'center',
								textStyle : {
									fontWeight : 'normal',
									color : '#fff',
								}
							},
							tooltip : {
								trigger : 'item',
								formatter : "{a} <br/>{b} : {c} ({d}%)"
							},
							legend : {
								orient : 'vertical',
								x : 'left',
								y :'bottom',
								data : [ '红灯', '黄灯', '绿灯' ],
								textStyle : {
									color : '#ccc'
								},
								formatter: function(s){
									return commentMap[s];
								}
							},
							toolbox : {
								show : true,
								feature : {
									mark : {
										show : true
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
							color : [ '#DB2822', '#F4D612', '#22DB28' ],
							backgroundColor : '#1b1b1b',
							series : [ {
								name : '批量识别',
								type : 'pie',
								radius : '55%',
								center : [ '50%', '60%' ],
								data : pieSum,
								itemStyle : {
									normal : {
										label : {
											formatter : "{b} : {c} ",
											postion: 'inner'
										}
									}
								}
							} ]
						};

						var ecConfig = require('echarts/config');
						myChart.on(ecConfig.EVENT.DBLCLICK, function(param) {
							seriesTitle = param.name;
							//alert(param.name);
							$("#main").width("50%");
							myChart.resize();
							$("#main1").width("50%");

							var myChart1 = ec.init(document
									.getElementById('main1'));

							option1 = {
								title : {
									text : seriesTitle + '申报主体负面记录数量排名',
									x : 'right',
									y : 'bottom'
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
									boundaryGap : [ 0, 0.01 ]
								} ],
								yAxis : [ {
									type : 'category',
									data : pieMap[seriesTitle]['名称'],
									axisLabel : {
										interval : 'auto',
										rotate : 45,
										formatter :  function(s) {
											return s.replace(/[\u4e00-\u9fa5]{7}/g,"$&\n");
							            }
									},
								} ],

								series : [ {
									name : '负面记录数',
									type : 'bar',
									data : pieMap[seriesTitle]['数量'],
									barWidth : 45,
									itemStyle : {
										normal : {
											color : colorMap[seriesTitle],
											label : {
												show: true,
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
