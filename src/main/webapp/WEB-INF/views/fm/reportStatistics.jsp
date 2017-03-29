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
        	    	<div region="north" style="height:50%;border-right:none;">
        	    		<div id="chart1" style="width:100%;height:100%;">
        	    		</div>
        	    	</div>
        	    	<div region="center" style="height:50%;border-right:none;">
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
   
                
                /////////////////// 第一个图表////////////////
                $.ajax({
                	url:"<%=request.getContextPath()%>/financial/jiedanliang.html",
                	type:"post",
                	dataType:"json"
                }).done(function(mydata){
                	console.log(mydata);
                	var option = {
                    	    title : {
                    	        text: '接单量统计' 
                    	    },
                    	    tooltip : {
                    	        trigger: 'axis'
                    	    },
                    	    legend: {
                    	        data:['接单量']
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
                    	            name:'接单量',
                    	            type:'bar',
                    	            data:mydata,
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
                    	        } 
                    	    ]
                    	};
                	myChart.setOption(option); 
                });
                
                ////////////////第二个图表//////////////////
                $.ajax({
                	url:"<%=request.getContextPath()%>/financial/yinxiaoe.html",
                	type:"post",
                	dataType:"json"
                }).done(function(data){
                	var mydata = data;
                	var options3 =  {
                 		   title : {
                    	        	text: '营销额统计'
                    	    	},
                            tooltip : {
                                trigger: 'axis'
                            },
                            legend: {
                                data:['营销额']
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
                                    type : 'value',
                                    splitArea : {show : true}
                                }
                            ],
                            series : [
                                {
                                    name:'营销额',
                                    type:'bar',
                                    data:mydata
                                } 
                            ]
                        };
                	myChart3.setOption(options3);
                });
                
                ////////////////第三个图表//////////////////
                $.ajax({
                	url:"<%=request.getContextPath()%>/financial/caigoujine.html",
                	type:"post",
                	dataType:"json"
                }).done(function(data){
                	var mydata = data;
                	var option2 = {
                     	    title : {
                     	        text: '采购金额统计' 
                     	    },
                     	    tooltip : {
                     	        trigger: 'axis'
                     	    },
                     	    legend: {
                     	        data:['采购总额']
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
                     	            name:'采购总额',
                     	            type:'line',
                     	            smooth:true,
                     	            itemStyle: {normal: {areaStyle: {type: 'default'}}},
                     	            data:mydata
                     	        } 
                     	    ]
                     	};
                	myChart2.setOption(option2);
                });
                
				////////////////第四个图表//////////////////
                $.ajax({
                	url:"<%=request.getContextPath()%>/financial/zhanbi.html",
                	type:"post",
                	dataType:"json"
                }).done(function(data){
                	var mydata = data;
                	 // 图标四
                    var option4 = {
                    	    title : {
                    	        text: '收入与采购占比', 
                    	        x:'center'
                    	    },
                    	    tooltip : {
                    	        trigger: 'item',
                    	        formatter: "{a} <br/>{b} : {c} ({d}%)"
                    	    },
                    	    legend: {
                    	        orient : 'vertical',
                    	        x : 'left',
                    	        data:['营销额','采购总额']
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
                    	            name:'项目',
                    	            type:'pie',
                    	            radius : '55%',
                    	            center: ['50%', '60%'],
                    	            data:mydata
                    	        }
                    	    ]
                    	};
                    myChart4.setOption(option4);
                }); 
                
            }
        );  
	
</script>
</body>
</html>