<%@ page pageEncoding="UTF-8"%>

<html>
<head>
<title>line chart</title>

<!-- ECharts单文件引入 -->

<script type="text/javascript" src="../js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="../js/echarts/echarts.js"></script>

<script type="text/javascript" src="../js/dataMap.js"></script>
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
                'echarts/chart/pie',
                'echarts/chart/line',
                'echarts/chart/bar',
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
                
                // start of line chart
           	 	
                option = {
			    timeline:{
			        data:[
			            '2011-01-01','2012-01-01','2013-01-01','2014-01-01','2015-01-01',
			        ],
			        label : {
			            formatter : function(s) {
			                return s.slice(0, 4);
			            }
			        },
			        autoPlay : true,
			        playInterval : 1000
			    },
			    options:[
			        {
			            title : {
			                'text':'2011法人主体分布区域统计',
			                'subtext':'数据来自国家统计局'
			            },
			            tooltip : {'trigger':'axis'},
			            legend : {
			                x:'right',
			                'data':['小型企业红灯','中型企业红灯','大型企业红灯'
			                ,'小型企业黄灯','中型企业黄灯','大型企业黄灯'],
			                'selected':{
			                    '小型企业红灯':true,
			                    '中型企业红灯':true,
			                    '大型企业红灯':true
			                    ,
			                    '小型企业黄灯':false,
			                    '中型企业黄灯':false,
			                    '大型企业黄灯':false
			                }
			            },
			            toolbox : {
			                'show':true, 
			                orient : 'vertical',
			                x: 'right', 
			                y: 'center',
			                'feature':{
			                    'mark':{'show':true},
			                    'dataView':{'show':true,'readOnly':false},
			                    'magicType':{'show':true,'type':['line','bar','stack','tiled']},
			                    'restore':{'show':true},
			                    'saveAsImage':{'show':true}
			                }
			            },
			            calculable : true,
			            grid : {'y':80,'y2':100},
			            xAxis : [{
			                'type':'category',
			                'axisLabel':{'interval':0},
			                'data':[
			                    '长宁区','\n闵行区','宝山区','\n黄浦区','徐汇区','\n浦东新区','闸北区','\n普陀区','嘉定区','\n松江区','崇明县','\n金山区','虹口区','\n青浦区','静安区','\n杨浦区','奉贤区','\n卢湾区'
			                ]
			            }],
			            yAxis : [
			                {
			                    'type':'value',
			                    'name':'家',
			                   /*  'max':103 */
			                },
			                {
			                    'type':'value',
			                    'name':'家',
			                    'max':1000
			                }
			            ],
			            series : [
			                {
			                    'name':'小型企业红灯',
			                    'type':'bar',
			                    'data': dataMap.dataSize1Red['2011']
			                },
			                {
			                    'name':'中型企业红灯',
			                     'type':'bar',
			                    'data': dataMap.dataSize2Red['2011']
			                },
			                {
			                    'name':'大型企业红灯',
			                   // 'yAxisIndex':1,
								'type':'bar',
			                    'data': dataMap.dataSize3Red['2011']
			                } ,
			                {
			                    'name':'小型企业黄灯','yAxisIndex':1,'type':'bar',
			                    'data': dataMap.dataSize1Yellow['2011']
			                },
			                {
			                    'name':'中型企业黄灯','yAxisIndex':1,'type':'bar',
			                    'data': dataMap.dataSize2Yellow['2011']
			                },
			                {
			                    'name':'大型企业黄灯','yAxisIndex':1,'type':'bar',
			                    'data': dataMap.dataSize3Yellow['2011']
			                } 
			            ]
			        },
			        {
			            title : {'text':'2012法人主体分布区域统计'},
			            series : [
			                {'data': dataMap.dataSize1Red['2012']},
			                {'data': dataMap.dataSize2Red['2012']},
			                {'data': dataMap.dataSize3Red['2012']},
			                {'data': dataMap.dataSize1Yellow['2012']},
			                {'data': dataMap.dataSize2Yellow['2012']},
			                {'data': dataMap.dataSize3Yellow['2012']}
			            ]
			        },
			        {
			            title : {'text':'2013法人主体分布区域统计'},
			            series : [
			                {'data': dataMap.dataSize1Red['2013']},
			                {'data': dataMap.dataSize2Red['2013']},
			                {'data': dataMap.dataSize3Red['2013']},
			                {'data': dataMap.dataSize1Yellow['2013']},
			                {'data': dataMap.dataSize2Yellow['2013']},
			                {'data': dataMap.dataSize3Yellow['2013']}
			            ]
			        },
			        {
			            title : {'text':'2014法人主体分布区域统计'},
			            series : [
			                {'data': dataMap.dataSize1Red['2014']},
			                {'data': dataMap.dataSize2Red['2014']},
			                {'data': dataMap.dataSize3Red['2014']},
			                {'data': dataMap.dataSize1Yellow['2014']},
			                {'data': dataMap.dataSize2Yellow['2014']},
			                {'data': dataMap.dataSize3Yellow['2014']}
			            ]
			        },
			        {
			            title : {'text':'2015法人主体分布区域统计'},
			            series : [
			                {'data': dataMap.dataSize1Red['2015']},
			                {'data': dataMap.dataSize2Red['2015']},
			                {'data': dataMap.dataSize3Red['2015']},
			                {'data': dataMap.dataSize1Yellow['2015']},
			                {'data': dataMap.dataSize2Yellow['2015']},
			                {'data': dataMap.dataSize3Yellow['2015']}
			            ]
			        }/*,
			        {
			            title : {'text':'2015法人主体分布区域统计'},
			            series : [
			                {'data': dataMap.dataSize1Red['2007']},
			                {'data': dataMap.dataSize2Red['2007']},
			                {'data': dataMap.dataSize3Red['2007']},
			                {'data': dataMap.dataSize1Yellow['2007']},
			                {'data': dataMap.dataSize2Yellow['2007']},
			                {'data': dataMap.dataSize3Yellow['2007']}
			            ]
			        } ,
			        {
			            title : {'text':'2008法人主体分布区域统计'},
			            series : [
			                {'data': dataMap.dataSize1Red['2008']},
			                {'data': dataMap.dataSize2Red['2008']},
			                {'data': dataMap.dataSize3Red['2008']},
			                {'data': dataMap.dataSize1Yellow['2008']},
			                {'data': dataMap.dataSize2Yellow['2008']},
			                {'data': dataMap.dataSize3Yellow['2008']}
			            ]
			        },
			        {
			            title : {'text':'2009法人主体分布区域统计'},
			            series : [
			                {'data': dataMap.dataSize1Red['2009']},
			                {'data': dataMap.dataSize2Red['2009']},
			                {'data': dataMap.dataSize3Red['2009']},
			                {'data': dataMap.dataSize1Yellow['2009']},
			                {'data': dataMap.dataSize2Yellow['2009']},
			                {'data': dataMap.dataSize3Yellow['2009']}
			            ]
			        },
			        {
			            title : {'text':'2010法人主体分布区域统计'},
			            series : [
			                {'data': dataMap.dataSize1Red['2010']},
			                {'data': dataMap.dataSize2Red['2010']},
			                {'data': dataMap.dataSize3Red['2010']},
			                {'data': dataMap.dataSize1Yellow['2010']},
			                {'data': dataMap.dataSize2Yellow['2010']},
			                {'data': dataMap.dataSize3Yellow['2010']}
			            ]
			        },
			        {
			            title : {'text':'2011法人主体分布区域统计'},
			            series : [
			                {'data': dataMap.dataSize1Red['2011']},
			                {'data': dataMap.dataSize2Red['2011']},
			                {'data': dataMap.dataSize3Red['2011']},
			                {'data': dataMap.dataSize1Yellow['2011']},
			                {'data': dataMap.dataSize2Yellow['2011']},
			                {'data': dataMap.dataSize3Yellow['2011']}
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
