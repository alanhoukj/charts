<%@ page  pageEncoding="UTF-8"%>

<html>
<head>
<title>echarts</title>

<!-- ECharts单文件引入 -->

<script type="text/javascript" src="../js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="../js/echarts/echarts.js"></script>



<body>
    <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="main" style="width:100%;height:100%"></div>
    
    <script type="text/javascript">
    
        // 路径配置
        require.config({
            paths: 
            {
                echarts: '../js/echarts',
            }
        });
        
        // 使用
        require
        (
        	[
                'echarts',
                'echarts/chart/map', // 使用相关图就加载相关的模块，按需加载
                'echarts/chart/pie'
            ],
            
            function (ec) 
            {
                // 基于准备好的dom，初始化echarts图表
               	var myChart = ec.init(document.getElementById('main'));
                
               	myChart.showLoading({
               	    textStyle :
               	    {
               	        fontSize : 20,
               	    	fontFamily: '微软雅黑',
               	    }
               	});
                
                // 选中事件
                var ecConfig = require('echarts/config');
        		myChart.on(ecConfig.EVENT.MAP_SELECTED, function (param)
        		{
        		    var selected = param.selected;
        		    var mapSeries = option.series[0];
        		    var data = [];
        		    var legendData = [];
        		    var name;
        		    
        		    var sum = 0;
        		    for (var p = 0, len = mapSeries.data.length; p < len; p++)
        		    {
        		        name = mapSeries.data[p].name;
        		        sum += mapSeries.data[p].value;
        		        //mapSeries.data[p].selected = selected[name];
        		        if (selected[name])
        		        {
        		            data.push
        		            ({
        		                name: name,
        		                value: mapSeries.data[p].value
        		            });
        		            legendData.push(name);
        		        }
        		    }
        		  /*   data.push
		            ({
		                name: "总红灯数",
		                value: sum
		            }); */
        		    
        		    //option.legend.data = legendData;
        		    option.series[1].data = data;
        		    myChart.setOption(option, true);
        		});
                
      /*      	 	// 自定义扩展图表类型：mapType = SH
                require('echarts/util/mapData/params').params.SH =
                {
                      getGeoJson: function (callback) { 
		                require(['./geoJson/shang_hai_geo'], function (md){
		                    callback(decode(md));
		                });
		            }
                }; */
                
           	 	
                option =
                {
               		//color:['#39a71e','#eeba1c','red'],
                    title :
                    {
                        text : '2015年上海市政府信用实事项目信用风险高危企业区域分布情况',
                        subtext: '',
                        sublink: '',
                        x: 'center',
                        y : -2,
                    },
                    tooltip :
                    {
                        trigger: 'item',
                        //formatter: "{b}<br/>{a}:{c}%"
                         formatter : function(params)
                            {
                            	var redNum = 0;
                            	switch(params[1])
                            	{
                            		case '长宁区':
                           			{
                            			redNum = 3;
                            			break;
                            		}
                            		case '闵行区':
                            		{	
                            			redNum = 15;
                            			break;
                            		}
                            		case '宝山区':
                            		{
                            			redNum = 38;
                            			break;
                            		}
                            		case '黄浦区':
                            		{
                            			redNum = 8;
                            			break;
                            		}
                            		case '徐汇区':
                            		{
                            			redNum = 8;
                            			break;
                            		}
                            		case '浦东新区':
                            		{
                            			redNum = 25;
                            			break;
                            		}
                            		case '闸北区':
                            		{
                            			redNum = 12;
                            			break;
                            		}
                            		case '普陀区':
                            		{
                            			redNum = 15;
                            			break;
                            		}
                            		case '嘉定区':
                            		{
                            			redNum = 38;
                            			break;
                            		}
                            		case '松江区':
                            		{
                            			redNum = 5;
                            			break;
                            		}
                            		case '崇明县':
                            		{
                            			redNum = 11;
                            			break;
                            		}
                            		case '金山区':
                            		{
                            			redNum = 11;
                            			break;
                            		}
                            		case '虹口区':
                            		{
                            			redNum = 18;
                            			break;
                            		}
                            		case '青浦区':
                            		{
                            			redNum = 8;
                            			break;
                            		}
                            		case '静安区':
                            		{
                            			redNum = 24;
                            			break;
                            		}
                            		case '杨浦区':
                            		{
                            			redNum = 19;
                            			break;
                            		}
                            		case '奉贤区':
                            		{
                            			redNum = 12;
                            			break;
                            		}
                            		
                            		
                            	}
                            	var result = params[1] + "," + params[0] + (params[2]*100).toFixed(3) +"‱,其中红灯" + redNum + "家";
                            	return result;
                            }
                    },
                   /*  legend :
                    {
            	        orient: 'vertical',
            	        x:'left',
            	        itemWidth: 30,
            	        data:['红灯']
            	    }, */
                    toolbox:
                    {
                        show : true,
                        orient : 'vertical',
                        x: 'right',
                        y: 'center',
                        feature : 
                        {
                            mark : {show: false},
                            dataView : {show: false, readOnly: false},
                            restore : {show: true},
                            saveAsImage : {show: true},
                        }
                    },
                    dataRange:
                    {
                        min: 0.01326,
                        max: 0.09286,
                        text:['高','低'],
                        realtime: true,
                        calculable : true,
                        x: 'left',
                        y: 'bottom',
                        itemHeight: 22,
                        itemWidth: 25,
                        orient: 'vertical',
                       	color: ['orangered','yellow','lightskyblue']
                    },
                    roamController:
                    {
                        show: true,
                        x: 'right',
                        mapTypeControl:
                        {
                            '上海': true
                        }
                    },
                    series : [
                        {
                            name: '红灯占比',
                            type: 'map',
                            mapType: '上海', // 自定义扩展图表类型
                            showLegendSymbol: false,
                            /* selectedMode: 'multiple', */
                            itemStyle:
                            {
                                normal:
                                {
                               		borderWidth:1,
                                  	borderColor:'darkgrey',
                                	label:
                                	{
                                		show:true,
                                		textStyle:
                                        {
                                			color: 'black',
                                			fontWeight: 'bold',
                                			fontFamily: '微软雅黑',
                                			fontSize: 14
                                        }
                               		}
                        		},
                                emphasis:
                                {
                                	 borderWidth:1,
                                     borderColor:'#fff',
                                     color: '#32cd32',
                                     label:
                                     {
                                         show: true,
                                         textStyle:
                                         {
                                             color: '#fff',
                                             fontFamily: '微软雅黑',
                                             fontSize: 14,
                                             fontWeight: 'bold'
                                         }
                                     }
                        		},
                            },
                            data:
                           	[
	                           	{
	                          		value: 0.02753,
	                                name: "长宁区"
	                            },
	                            {
	                           		value: 0.02465,
	                               	name: "闵行区"
	                            },
	                        	{
	                          		value: 0.07654,
	                                name: "宝山区"
	                            },
	                            {
	                           		value: 0.08736,
	                               	name: "黄浦区"
	                            },
	                        	{
	                          		value: 0.04865,
	                                name: "徐汇区"
	                            },
	                            {
	                           		value: 0.02503,
	                               	name: "浦东新区"
	                            },	
	                            {
	                          		value: 0.07968,
	                                name: "闸北区"
	                            },
	                            {
	                           		value: 0.07434,
	                               	name: "普陀区"
	                            },
	                        	{
	                          		value: 0.03509,
	                                name: "嘉定区"
	                            },
	                            {
	                           		value: 0.01326,
	                               	name: "松江区"
	                            },
	                        	{
	                          		value: 0.03510,
	                                name: "崇明县"
	                            },
	                            {
	                           		value: 0.01549,
	                               	name: "金山区"
	                            },
	                            {
	                           		value: 0.09286,
	                               	name: "虹口区"
	                            },
	                        	{
	                          		value: 0.01801,
	                                name: "青浦区"
	                            },
	                            {
	                           		value: 0.40493,
	                               	name: "静安区"
	                            },
	                        	{
	                          		value: 0.07816,
	                                name: "杨浦区"
	                            },
	                            {
	                           		value: 0.01755,
	                               	name: "奉贤区"
	                            }
                            ],
                            // 文本位置修正
   /*                         	textFixed :
                           	{
                            	'宝山区' : [-30, 0],
                            	'浦东新区' : [80, 100],
                            	'奉贤区' : [30, 0],
                            	'金山区' : [-20, -50],
                            	'闵行区' : [20, 30],
                            	'徐汇区' : [0, 10],
                            	'杨浦区' : [0, -20],
                            	'普陀区' : [-5, -20],
                            	'虹口区' : [0, -10],
                            	'黄浦区' : [0, 10],
                            	'长宁区' : [-14, 10],
                            	'崇明县' : [80, 10],
                            	'松江区' : [0, 30],
                            	'青浦区' : [-40, 30],
                            	'嘉定区' : [-8, 15],
                           	}, */
                        },
                        
                       /*  {
                        	calculable: true,
        		            name:'负面信息',
        		            type:'pie',
        		            radius : '12%',
        		            tooltip:
        		            {
        		                trigger: 'item',
        		                formatter: "{a} <br/>{b} : {c} ({d}%)"
        		            },
        		            center: [document.getElementById('main').offsetWidth - 620, 150],
        		            itemStyle: {
        		                normal: {
        		                    label: {
        		                    	fontWeight: 'bold',
        		                        show: true,
        		                        formatter: "{b}: {c}家 ({d}%)"
        		                    }
        		                }
        		            },
        		            data:
       		            	[
        		                {name: '绿灯', value: 845697},
        		                {name: '黄灯', value: 1218},
        		                {name: '红灯', value: 425}
        		            ]
        		        } */
                    ]
                };
                
                setTimeout(function ()
               	{
                	myChart.hideLoading();
                            
                    // 为echarts对象加载数据 
                   	myChart.setOption(option);
                },1000);
            }
        );
       
    </script>
</body>

</html>
