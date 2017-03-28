<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../public/header.jsp" %>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/echarts-2.2.7/build/dist/echarts.js"></script>
<style>
	.cgtb{ 
		margin-top:30px;
	}
	
	.cgtb tr{
		height:30px;
		padding:5px;
	}
	
	.cgtb tr td:nth-child(2n-1){
		text-align:right;
		width:140px;
	}
</style>
</head>
<body style="padding:5px;">
<div class="easyui-layout" fit="true" border="false">
    <div region="center" border="false">
        <!-- 主要的内容显示 -->
        <div class="easyui-layout" fit="true">
        	<div region="west" style="width:50%" border="false">
        	    <div class="easyui-layout" fit="true">
        	    	<div region="north" style="height:50%;">
        	    		<div id="chart1" style="width:100%;height:100%;">
        	    		</div>
        	    	</div>
        	    	<div region="center" style="height:50%;">
        	    		<div id="chart2" style="width:100%;height:100%;">
        	    		</div>
        	    	</div>
        	    </div>
        	</div>
        	<div region="center" style="width:50%" border="false">
        		 <div class="easyui-layout" fit="true">
        	    	<div region="north" style="height:50%;">
        	    		<div id="chart3" style="width:100%;height:100%;">
        	    		</div>
        	    	</div>
        	    	<div region="center" style="height:50%;">
        	    		<div id="chart4" style="width:100%;height:100%;">
        	    		</div>
        	    	</div>
        	    </div>
        	</div>
        </div>
    </div>
    <div region="south" style="height:10px;" border="false">
    </div>
</div>
 
 

<%-- 与页面交互的js部分 --%>
<script> 
	require.config({
	    paths: {
	        echarts: "<%=request.getContextPath()%>/js/echarts-2.2.7/build/dist"
	    }
	}); 
	
	// 开始使用echarts
    require(
            [
                'echarts',
                'echarts/chart/bar' ,
                'echarts/chart/chord',
                'echarts/chart/line',
                'echarts/chart/eventRiver',
                'echarts/chart/force',
                'echarts/chart/funnel',
                'echarts/chart/gauge',
                'echarts/chart/heatmap',
                'echarts/chart/pie'
            ],
            function (ec) {
        
                var myChart = ec.init(document.getElementById('chart1')); 
                
                var myChart2 = ec.init(document.getElementById("chart2"));
                
                var myChart3 = ec.init(document.getElementById("chart3"));
                
                var myChart4 = ec.init(document.getElementById("chart4"));
                
                option = {
                	    title : {
                	        text: '某地区蒸发量和降水量',
                	        subtext: '纯属虚构'
                	    },
                	    tooltip : {
                	        trigger: 'axis'
                	    },
                	    legend: {
                	        data:['蒸发量','降水量']
                	    },
                	    toolbox: {
                	        show : true,
                	        feature : {
                	            mark : {show: true},
                	            dataView : {show: true, readOnly: false},
                	            magicType : {show: true, type: ['line', 'bar']},
                	            restore : {show: true},
                	            saveAsImage : {show: true}
                	        }
                	    },
                	    calculable : true,
                	    xAxis : [
                	        {
                	            type : 'category',
                	            data : ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']
                	        }
                	    ],
                	    yAxis : [
                	        {
                	            type : 'value'
                	        }
                	    ],
                	    series : [
                	        {
                	            name:'蒸发量',
                	            type:'bar',
                	            data:[2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3],
                	            markPoint : {
                	                data : [
                	                    {type : 'max', name: '最大值'},
                	                    {type : 'min', name: '最小值'}
                	                ]
                	            },
                	            markLine : {
                	                data : [
                	                    {type : 'average', name: '平均值'}
                	                ]
                	            }
                	        },
                	        {
                	            name:'降水量',
                	            type:'bar',
                	            data:[2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3],
                	            markPoint : {
                	                data : [
                	                    {name : '年最高', value : 182.2, xAxis: 7, yAxis: 183, symbolSize:18},
                	                    {name : '年最低', value : 2.3, xAxis: 11, yAxis: 3}
                	                ]
                	            },
                	            markLine : {
                	                data : [
                	                    {type : 'average', name : '平均值'}
                	                ]
                	            }
                	        }
                	    ]
                	};
                
                // 图标二
                option2 = {
                	    title : {
                	        text: '某楼盘销售情况',
                	        subtext: '纯属虚构'
                	    },
                	    tooltip : {
                	        trigger: 'axis'
                	    },
                	    legend: {
                	        data:['意向','预购','成交']
                	    },
                	    toolbox: {
                	        show : true,
                	        feature : {
                	            mark : {show: true},
                	            dataView : {show: true, readOnly: false},
                	            magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                	            restore : {show: true},
                	            saveAsImage : {show: true}
                	        }
                	    },
                	    calculable : true,
                	    xAxis : [
                	        {
                	            type : 'category',
                	            boundaryGap : false,
                	            data : ['周一','周二','周三','周四','周五','周六','周日']
                	        }
                	    ],
                	    yAxis : [
                	        {
                	            type : 'value'
                	        }
                	    ],
                	    series : [
                	        {
                	            name:'成交',
                	            type:'line',
                	            smooth:true,
                	            itemStyle: {normal: {areaStyle: {type: 'default'}}},
                	            data:[10, 12, 21, 54, 260, 830, 710]
                	        },
                	        {
                	            name:'预购',
                	            type:'line',
                	            smooth:true,
                	            itemStyle: {normal: {areaStyle: {type: 'default'}}},
                	            data:[30, 182, 434, 791, 390, 30, 10]
                	        },
                	        {
                	            name:'意向',
                	            type:'line',
                	            smooth:true,
                	            itemStyle: {normal: {areaStyle: {type: 'default'}}},
                	            data:[1320, 1132, 601, 234, 120, 90, 20]
                	        }
                	    ]
                	};
                	                    
               // 图标三
               var options3 =  {
            		    title : {
            		        text: '世界人口总量',
            		        subtext: '数据来自网络'
            		    },
            		    tooltip : {
            		        trigger: 'axis'
            		    },
            		    legend: {
            		        data:['2011年', '2012年']
            		    },
            		    toolbox: {
            		        show : true,
            		        feature : {
            		            mark : {show: true},
            		            dataView : {show: true, readOnly: false},
            		            magicType: {show: true, type: ['line', 'bar']},
            		            restore : {show: true},
            		            saveAsImage : {show: true}
            		        }
            		    },
            		    calculable : true,
            		    xAxis : [
            		        {
            		            type : 'value',
            		            boundaryGap : [0, 0.01]
            		        }
            		    ],
            		    yAxis : [
            		        {
            		            type : 'category',
            		            data : ['巴西','印尼','美国','印度','中国','世界人口(万)']
            		        }
            		    ],
            		    series : [
            		        {
            		            name:'2011年',
            		            type:'bar',
            		            data:[18203, 23489, 29034, 104970, 131744, 630230]
            		        },
            		        {
            		            name:'2012年',
            		            type:'bar',
            		            data:[19325, 23438, 31000, 121594, 134141, 681807]
            		        }
            		    ]
            		};
                	         
                // 图标四
                var option4 = {
                	    title : {
                	        text: '某站点用户访问来源',
                	        subtext: '纯属虚构',
                	        x:'center'
                	    },
                	    tooltip : {
                	        trigger: 'item',
                	        formatter: "{a} <br/>{b} : {c} ({d}%)"
                	    },
                	    legend: {
                	        orient : 'vertical',
                	        x : 'left',
                	        data:['直接访问','邮件营销','联盟广告','视频广告','搜索引擎']
                	    },
                	    toolbox: {
                	        show : true,
                	        feature : {
                	            mark : {show: true},
                	            dataView : {show: true, readOnly: false},
                	            magicType : {
                	                show: true, 
                	                type: ['pie', 'funnel'],
                	                option: {
                	                    funnel: {
                	                        x: '25%',
                	                        width: '50%',
                	                        funnelAlign: 'left',
                	                        max: 1548
                	                    }
                	                }
                	            },
                	            restore : {show: true},
                	            saveAsImage : {show: true}
                	        }
                	    },
                	    calculable : true,
                	    series : [
                	        {
                	            name:'访问来源',
                	            type:'pie',
                	            radius : '55%',
                	            center: ['50%', '60%'],
                	            data:[
                	                {value:335, name:'直接访问'},
                	                {value:310, name:'邮件营销'},
                	                {value:234, name:'联盟广告'},
                	                {value:135, name:'视频广告'},
                	                {value:1548, name:'搜索引擎'}
                	            ]
                	        }
                	    ]
                	};
                	                    
             
                myChart.setOption(option); 
                myChart2.setOption(option2);
                myChart3.setOption(options3);
                myChart4.setOption(option4);
            }
        ); 
	
	
	// 重新刷新
	function refresh(){
		$("#dg").datagrid('reload');   
	} 
	
</script>
</body>
</html>