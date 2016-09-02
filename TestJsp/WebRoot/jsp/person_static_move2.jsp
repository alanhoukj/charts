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

<script type="text/javascript" src="js/echarts.min.js"></script>
<script type="text/javascript" src="js/echarts/map/js/china.js"></script>
<body>
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
	<div id="main" style="width: 100%; height: 100%"></div>

	<script type="text/javascript">
		// 基于准备好的dom，初始化echarts图表
		var myChart = echarts.init(document.getElementById('main'));
		
		myChart.showLoading({
			text : '数据读取中...',
		});

		var geoCoordMap = {
			    '上海': [121.4648,31.2891],
			    '东莞': [113.8953,22.901],
			    '东营': [118.7073,37.5513],
			    '中山': [113.4229,22.478],
			    '临汾': [111.4783,36.1615],
			    '临沂': [118.3118,35.2936],
			    '丹东': [124.541,40.4242],
			    '丽水': [119.5642,28.1854],
			    '新疆': [87.9236,43.5883],
			    '佛山': [112.8955,23.1097],
			    '保定': [115.0488,39.0948],
			    '兰州': [103.5901,36.3043],
			    '包头': [110.3467,41.4899],
			    '北京': [116.4551,40.2539],
			    '北海': [109.314,21.6211],
			    '江苏': [118.8062,31.9208],
			    '南宁': [108.479,23.1152],
			    '江西': [116.0046,28.6633],
			    '南通': [121.1023,32.1625],
			    '厦门': [118.1689,24.6478],
			    '台州': [121.1353,28.6688],
			    '合肥': [117.29,32.0581],
			    '内蒙古': [111.4124,40.4901],
			    '咸阳': [108.4131,34.8706],
			    '黑龙江': [127.9688,45.368],
			    '唐山': [118.4766,39.6826],
			    '嘉兴': [120.9155,30.6354],
			    '大同': [113.7854,39.8035],
			    '大连': [122.2229,39.4409],
			    '天津': [117.4219,39.4189],
			    '山西': [112.3352,37.9413],
			    '威海': [121.9482,37.1393],
			    '宁波': [121.5967,29.6466],
			    '宝鸡': [107.1826,34.3433],
			    '宿迁': [118.5535,33.7775],
			    '常州': [119.4543,31.5582],
			    '广州': [113.5107,23.2196],
			    '廊坊': [116.521,39.0509],
			    '延安': [109.1052,36.4252],
			    '张家口': [115.1477,40.8527],
			    '徐州': [117.5208,34.3268],
			    '德州': [116.6858,37.2107],
			    '惠州': [114.6204,23.1647],
			    '四川': [103.9526,30.7617],
			    '扬州': [119.4653,32.8162],
			    '承德': [117.5757,41.4075],
			    '拉萨': [91.1865,30.1465],
			    '无锡': [120.3442,31.5527],
			    '日照': [119.2786,35.5023],
			    '昆明': [102.9199,25.4663],
			    '浙江': [119.5313,29.8773],
			    '枣庄': [117.323,34.8926],
			    '柳州': [109.3799,24.9774],
			    '株洲': [113.5327,27.0319],
			    '湖北': [114.3896,30.6628],
			    '汕头': [117.1692,23.3405],
			    '江门': [112.6318,22.1484],
			    '辽宁': [123.1238,42.1216],
			    '沧州': [116.8286,38.2104],
			    '河源': [114.917,23.9722],
			    '泉州': [118.3228,25.1147],
			    '泰安': [117.0264,36.0516],
			    '泰州': [120.0586,32.5525],
			    '山东': [117.1582,36.8701],
			    '济宁': [116.8286,35.3375],
			    '海口': [110.3893,19.8516],
			    '淄博': [118.0371,36.6064],
			    '淮安': [118.927,33.4039],
			    '深圳': [114.5435,22.5439],
			    '清远': [112.9175,24.3292],
			    '温州': [120.498,27.8119],
			    '渭南': [109.7864,35.0299],
			    '湖州': [119.8608,30.7782],
			    '湘潭': [112.5439,27.7075],
			    '滨州': [117.8174,37.4963],
			    '潍坊': [119.0918,36.524],
			    '烟台': [120.7397,37.5128],
			    '玉溪': [101.9312,23.8898],
			    '珠海': [113.7305,22.1155],
			    '盐城': [120.2234,33.5577],
			    '盘锦': [121.9482,41.0449],
			    '河北': [114.4995,38.1006],
			    '福建': [119.4543,25.9222],
			    '秦皇岛': [119.2126,40.0232],
			    '绍兴': [120.564,29.7565],
			    '聊城': [115.9167,36.4032],
			    '肇庆': [112.1265,23.5822],
			    '舟山': [122.2559,30.2234],
			    '苏州': [120.6519,31.3989],
			    '莱芜': [117.6526,36.2714],
			    '菏泽': [115.6201,35.2057],
			    '营口': [122.4316,40.4297],
			    '葫芦岛': [120.1575,40.578],
			    '衡水': [115.8838,37.7161],
			    '衢州': [118.6853,28.8666],
			    '青海': [101.4038,36.8207],
			    '陕西': [109.1162,34.2004],
			    '贵阳': [106.6992,26.7682],
			    '连云港': [119.1248,34.552],
			    '邢台': [114.8071,37.2821],
			    '邯郸': [114.4775,36.535],
			    '郑州': [113.4668,34.6234],
			    '鄂尔多斯': [108.9734,39.2487],
			    '重庆': [107.7539,30.1904],
			    '金华': [120.0037,29.1028],
			    '铜川': [109.0393,35.1947],
			    '宁夏': [106.3586,38.1775],
			    '镇江': [119.4763,31.9702],
			    '吉林': [125.8154,44.2584],
			    '湖南': [113.0823,28.2568],
			    '长治': [112.8625,36.4746],
			    '阳泉': [113.4778,38.0951],
			    '青岛': [120.4651,36.3373],
			    '韶关': [113.7964,24.7028]
			};


			var SHData = [
			    [{name:'北京'},{name:'上海',value:656.49}],
				[{name:'天津'},{name:'上海',value:651.55}],
				[{name:'新疆'},{name:'上海',value:645.65}],
				[{name:'辽宁'},{name:'上海',value:640.17}],
				[{name:'宁夏'},{name:'上海',value:639.72}],
				[{name:'青海'},{name:'上海',value:638.56}],
				[{name:'吉林'},{name:'上海',value:637.68}],
				[{name:'黑龙江'},{name:'上海',value:635.54}],
				[{name:'浙江'},{name:'上海',value:635.29}],
				[{name:'河北'},{name:'上海',value:634.62}],
				[{name:'内蒙古'},{name:'上海',value:632.52}],
				[{name:'陕西'},{name:'上海',value:632.16}],
				[{name:'江苏'},{name:'上海',value:630.93}],
				[{name:'山东'},{name:'上海',value:630.92}],
				[{name:'山西'},{name:'上海',value:630.64}],
				[{name:'湖北'},{name:'上海',value:629.13}],
				[{name:'湖南'},{name:'上海',value:629.01}],
				[{name:'江西'},{name:'上海',value:628.87}],
				[{name:'福建'},{name:'上海',value:628.16}],
				[{name:'四川'},{name:'上海',value:626.87}]
			];
			
			var rankMap={
				  '北京':'1st',
				  '天津':'2nd',
				  '新疆':'3th',
				  '辽宁':'4th',
				  '宁夏':'5th',
				  '青海':'6th',
				  '吉林':'7th',
				  '黑龙江':'8th',
				  '浙江':'9th',
				  '河北':'10th',
				  '内蒙古':'11st',
				  '陕西':'12nd',
				  '江苏':'13th',
				  '山东':'14th',
				  '山西':'15th',
				  '湖北':'16th',
				  '湖南':'17th',
				  '江西':'18th',
				  '福建':'19th',
				  '四川':'20th',
			};
			
			var numMap={
				'北京':3758,
				'天津':4385,
				'新疆':12126,
				'辽宁':23389,
				'宁夏':3052,
				'青海':2056,
				'吉林':20162,
				'黑龙江':30628,
				'浙江':86298,
				'河北':22250,
				'内蒙古':9368,
				'陕西':25182,
				'江苏':207033,
				'山东':61018,
				'山西':19516,
				'湖北':72999,
				'湖南':39914,
				'江西':72159,
				'福建':42871,
				'四川':56003,
			};
			
			var numScoreMap={
				'656.49' : 3758,
				'651.55' : 4385,
				'645.65' : 12126,
				'640.17' : 23389,
				'639.72' : 3052,
				'638.56' : 2056,
				'637.68' : 20162,
				'635.54' : 30628,
				'635.29' : 86298,
				'634.62' : 22250,
				'632.52' : 9368,
				'632.16' : 25182,
				'630.93' : 207033,
				'630.92' : 61018,
				'630.64' : 19516,
				'629.13' : 72999,
				'629.01' : 39914,
				'628.87' : 72159,
				'628.16' : 42871,
				'626.87' : 56003,
			};

			//var planePath = 'path://M1705.06,1318.313v-89.254l-319.9-221.799l0.073-208.063c0.521-84.662-26.629-121.796-63.961-121.491c-37.332-0.305-64.482,36.829-63.961,121.491l0.073,208.063l-319.9,221.799v89.254l330.343-157.288l12.238,241.308l-134.449,92.931l0.531,42.034l175.125-42.917l175.125,42.917l0.531-42.034l-134.449-92.931l12.238-241.308L1705.06,1318.313z';

			var convertData = function (data) {
			    var res = [];
			    for (var i = 0; i < data.length; i++) {
			        var dataItem = data[i];
			        var fromCoord = geoCoordMap[dataItem[0].name];
			        var toCoord = geoCoordMap[dataItem[1].name];
			        if (fromCoord && toCoord) {
			            res.push([{
			            	// push the value with the fromCoord to enable the visualMap
			            	coord: fromCoord, value:dataItem[1].value
			            }, {
			            	coord: toCoord
			            }
			            ]);
			        }
			    }
			   // var Jres=JSON.stringify(res)
			    return res;
			};

			//var color = ['#a6c84c', '#ffa022', '#46bee9'];
			var series = [];
			[ ['上海', SHData]].forEach(function (item, i) {
			    series.push({
			        name: item[0] + ' Top10',
			        type: 'lines',
			        zlevel: 1,
			        smooth:true,
			        effect: {
			            show: true,
			            color: '#FFF',
			            period: 4,
			            trailLength: 0.7,
			            symbolSize: 3
			        },
			        lineStyle: {
			            normal: {
			                width: 0.8,
			                curveness: 0.2,
			                type: 'solid',
                            shadowBlur: 10
			            }
			        },
			        data: convertData(item[1])
			    },
			    {
			        name: item[0] + ' Top10',
			        type: 'lines',
			        zlevel: 2,
			        effect: {
			            show: true,
			            period: 4,
			            trailLength: 0,
			            symbol: 'arrow',
			            symbolSize: 15
			        },
			        lineStyle: {
			            normal: {
			                width: 1,
			                opacity: 0.4,
			                curveness: 0.2
			            }
			        },
			        data: convertData(item[1])
			    },
			    {
			        name: item[0] + ' Top10',
			        type: 'effectScatter',
			        coordinateSystem: 'geo',
			        zlevel: 2,
			        effectType:'ripple',
			        rippleEffect: {
			            brushType: 'stroke'
			        },
			        label: {
			            normal: {
			                show: true,
			                position: 'right',
			                formatter: function (dataItem){
			                	
			                	return dataItem.data.name;
			                }
			            }
			        },
			        symbolSize: function (val) {
			        	var value=val[2];
			            return Math.pow((Math.log(numScoreMap[value]))/(Math.log(1.5))/3,1.5);
			        },
			        /* itemStyle: {
			            normal: {
			                color: color[i]
			            }
			        }, */
			        data: item[1].map(function (dataItem) {
			            return {
			                name: dataItem[0].name,
			                value: geoCoordMap[dataItem[0].name].concat([dataItem[1].value])
			            };
			        })
			    });
			});

			option = {
			    backgroundColor: '#404a59',
			    title : {
			    	text: '来沪人员原籍分布及平均分排名情况(240万人)',
			        //subtext: '数据来自上海实事工程',
			        left: 'center',
			        textStyle : {
			            color: '#fff',
			            fontFamily: '微软雅黑'
			        }
			    },
			    visualMap: {
			        type: 'continuous',
			        text:['信用平均分',''],
			        min: 627,
			        max: 657,
			        realtime: false,
			        calculable : true,
			        color: ['#f2476b','yellow','#52ff00'].reverse(),
			        textStyle:{
			        	color :'#FFF',
			        },
			    },
			    tooltip : {
			        trigger: 'item',
			        formatter : function(obj) {
						var value = obj.data.value;
						if(value!=undefined&&value.length==3){
							return '<div style="border-bottom: 1px solid rgba(255,255,255,.3); font-size: 18px;padding-bottom: 7px;margin-bottom: 7px">'
							+ rankMap[obj.name]
							+ ' '
							+ '</div>'
							+ obj.name +": "
							+ value[2]+"分"
							+ ' <br>'
							+ '人数: '
							+ numMap[obj.name]+'人';
						} else{
							return null;
						}
						
					}
			    },
			    legend: {
			        show:false,
			        selectedMode: 'single'
			    },
			    geo: {
			        map: 'china',
			        label: {
			            emphasis: {
			                show: false
			            }
			        },
			        roam: true,
			        itemStyle: {
			            normal: {
			                areaColor: '#323c48',
			                borderColor: '#01BAFD'
			            },
			            emphasis: {
			                areaColor: '#166395'
			            }
			        }
			    },
			    series: series
			};

			setTimeout(function()
			{
				myChart.hideLoading();
				myChart.setOption(option);
			}, 1000);
	</script>
</body>

</html>
