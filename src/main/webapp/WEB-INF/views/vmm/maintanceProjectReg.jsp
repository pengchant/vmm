<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../public/header.jsp" %>
    <style>
        .detail{
            border:solid 1px #a8d7ff;
            border-bottom:none;
            border-right:none;
        }

        .detail td{
            border:solid 1px #a8d7ff;
            border-top:none;
            border-left:none;
            padding:4px;
            text-align: center;
        }

        .detail td:nth-child(2n-1){
            color: #3d5e7b;
        }
    </style>
</head>
<body style="padding:5px;">
    <div class="easyui-layout" fit="true"> 
        <!-- 主要的内容部分 -->
        <div region="center" border="false">
            <div class="easyui-layout" fit="true"> 
                <div region="center" split="true" border="false">
                    <div class="easyui-layout" fit="true">
                        <div region="north" iconCls="icon-bug" split="true" style="height:60%;" collapsible="false" title="维修任务">
                            <!-- 任务窗口 -->
                            <table  id="current" fit="true" border="false">
                            </table>
                            <div id="tb" style="padding:5px">
                                <span>关键字:&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                <input id="keyworld" class="easyui-textbox" prompt="请输入用户名/手机号/车牌号"
                                       style="width:170px;height:26px;">&nbsp;&nbsp;
                                <span>任务状态:</span>
                                <select id="orderstatus" class="easyui-combobox" name="dept" style="width:170px;height:26px;">
                                    <option value="1">待完成</option>
                                    <option value="2">已完成</option>
                                </select>
                                <br/>
                                <br/>
                                <span>开始时间:</span>
                                <input id="startTime" type="text" value="3/4/2010 8:0" style="width:170px;height:26px;" class="easyui-datebox"  />
                                &nbsp;&nbsp;<span>结束时间:</span>
                                <input id="endTime" type="text" value="3/4/2010 8:0" style="width:170px;height:26px;" class="easyui-datebox"  />
                                &nbsp;&nbsp;<a href="#" iconCls="icon-search" class="easyui-linkbutton" id="selecting">条件查询</a>
                                <a href="#" iconCls="icon-arrow_refresh" class="easyui-linkbutton">刷新所有</a>
                            </div>
                        </div>
                        <!-- 汽车进场登记详情 -->
                        <div region="center" iconCls="icon-car" title="客户详情&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[当前处理的车牌号：<span class='currentplatnum' style='color:red;'>--</span>]">
		                       <table class="detail" cellpadding="0" cellspacing="0" style="width:100%;height:100%;">
		                         <tr>
		                             <td style="width:10%;">车主</td>
		                             <td style="width:20%;"><span id="customername">--</span></td>
		                             <td style="width:20%;">电话</td>
		                             <td style="width:20%;"><span id="contactinfo">--</span></td>
		                             <td style="width:20%;">行驶里程数</td>
		                             <td style="width:10%;"><span id="milage">--</span></td>
		                         </tr>
		                         <tr>
		                             <td>发动机号</td>
		                             <td><span id="vehflag">--</span></td>
		                             <td>保险日期</td>
		                             <td colspan="3"><span id="baoxiandate">--</span></td>
		                         </tr>
		                         <tr>
		                             <td>车主联系地址</td>
		                             <td colspan="5">
		                                <span id="contactadd">--</span>
		                             </td>
		                         </tr>
		                         <tr>
		                             <td>是否查看旧件</td>
		                             <td><span id="ifused">--</span></td>
		                             <td>是否清洗车辆</td>
		                             <td><span id="ifclean">--</span></td>
		                             <td>是否检查备胎</td>
		                             <td><span id="ifcheck">--</span></td>
		                         </tr>
		                         <tr>
		                             <td rowspan="2" style="height:60px;">保修的内容</td>
		                             <td rowspan="2">
		                                 <span id="baoxiu">--</span>
		                             </td>
		                             <td>随车物品</td>
		                             <td colspan="3">
		                                 <span id="suiche">--</span>
		                             </td>
		                         </tr>
		                         <tr>
		                             <td>贵重物品</td>
		                             <td colspan="3">
		                                 <span id="guizhong">--</span>
		                             </td>
		                         </tr>
		                         <tr>
		                             <td>车主描述故障</td>
		                             <td colspan="5" style="">
										 <span id="guzhang">--</span>
		                             </td>
		                         </tr>
		                   </table>
                        </div>

                    </div>
                </div>
                <div region="east" style="width:38.2%" split="true" title="维修登记&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[当前处理的车牌号：<span class='currentplatnum' style='color:red;'>--</span>]" iconCls="icon-bullet_wrench">
                    <div class="easyui-layout" fit="true" border="false" >
                        <div region="north" border="false" split="true" style="height:50%;"
                             title="维修项目登记" collapsible="false" iconCls="icon-layout_edit">
                            <!-- 维修项目登记 -->
                            <table id="dg1" fit="true" class="easyui-datagrid"
                                   style="border-top:none;
                                    border-left:none;border-right:none;"
                                   url="get_users.php"
                                   toolbar="#toolbar2"
                                   rownumbers="true" singleSelect="true">
                                <thead>
                                <tr>
                                    <th field="firstname" width="50" align="center">编号</th>
                                    <th field="lastname" width="100" align="center">维修项目大类</th>
                                    <th field="phone" width="100" align="center">维修项目名称</th>
                                    <th field="time" width="50" align="center">工时</th>
                                    <th field="operation" width="80" align="center">操作</th>
                                </tr>
                                </thead>
                            </table>
                            <div id="toolbar2">
                                <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newUser()">添加维修项目</a>
                                <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">修改维修项目况</a>
                                <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyUser()">删除维修项目</a>
                            </div>
                        </div>
                        <div region="center"style="height:50%;" title="维修使用材料登记"
                             iconCls="icon-layout_add">
                            <!-- 维修使用材料登记 -->
                            <table  id="dg" fit="true" border="false" class="easyui-datagrid"
                                   url="get_users.php"
                                   toolbar="#toolbar"
                                   rownumbers="true"   singleSelect="true">
                                <thead>
                                <tr>
                                    <th field="firstname" width="50" align="center">编号</th>
                                    <th field="lastname" width="100" align="center">零件大类</th>
                                    <th field="phone" width="100" align="center">零件名称</th>
                                    <th field="email" width="50" align="center">数量</th>
                                    <th field="email" width="80" align="center">操作</th>
                                </tr>
                                </thead>
                            </table>
                            <div id="toolbar">
                                <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newUser()">添加维修用料</a>
                                <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">修改维修用料情况</a>
                                <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyUser()">删除维修用料记录</a>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <div region="south" style="height:10px;" border="false">
        </div>
    </div>
	<script type="text/javascript">  
		$(function(){
		   // 条件查询
		   $("#selecting").click(function(){
			// 获取keyworld
			   let keyworld = $("#keyworld").val();
			   // 获取任务状态
			   let orderstatus = $("#orderstatus").combobox('getValue');
			   // 开始时间
			   let startTime = $("#startTime").val();
			   // 结束时间
			   let endTime = $("#endTime").val();
			   // 重新加载数据
			   $("#current").datagrid('load',{
					keyworld: keyworld,
					orderstatus: orderstatus,
					startTime:startTime,
					endTime:endTime
				});
		   }); 
		   
		   // datagrid 赋值
		   $('#current').datagrid({
		   	url:'${pageContext.request.contextPath}/vehicle/getTasks.html?category=wx',
		   	singleSelect:true,
		   	pagination:true,
		   	method:'post',
		       toolbar:'#tb',
		       columns:[[
		            {field:'indexing',width:50,align:'center',title:'编号',
		            	formatter: function(value,row,index){ 
		 				return (index+1);
						}
		            },
		            {field:'platenum',width:100,align:'center',sortable:true,title:'车牌号'},
		            {field:'vehname',width:80,align:'center',sortable:true,title:'品牌'},
		            {field:'carmodel',width:80,align:'center',sortable:true,title:'车型'},
		            {field:'allocatetime',width:120,align:'center',sortable:true,title:'入场时间',
		            	formatter:function(value,row,index){
		            		return value.substring(0,19);
		            	}
		            }, 
		            {field:'esdeliverytime',width:120,align:'center',sortable:true,title:'计划完工时间',
		            	formatter:function(value,row,index){
		            		return value.substring(0,19);
		            	}
		            },
		            {field:'action',width:150,align:'center',title:'操作',
		                formatter:function(value,row,index){
		                    var a = '<a href="#" class="easyui-linkbutton" style="color:#519fff;">维修登记</a>&nbsp;';
		                    var b = '&nbsp;<a href="#" class="easyui-linkbutton" style="color:#b93705;">确定完工</a>';
		                    return a+b;
		                }
		            }
		        ]],
		        onClickRow:function(index,row){	        	       
		        	// 汽车牌号
		        	$(".currentplatnum").empty().append(row.platenum);
		        	// 车主
		        	$("#customername").empty().append(row.customername);
		        	// 电话
		        	$("#contactinfo").empty().append(row.contactinfo);
		        	// 行驶里程数
		        	$("#milage").empty().append(row.miles);
		        	// 发动机号
		        	$("#vehflag").empty().append(row.vehflag);
		        	// 保险日期
		        	$("#baoxiandate").empty().append(row.inspectiondate.substring(0,10));
		        	// 车主联系地址
		        	$("#contactadd").empty().append(row.contactadd);
		        	// 是否查看旧件
		        	$("#ifused").empty().append(row.ifused=='1'?'是':'否');
		        	// 是否清洗车辆
		        	$("#ifclean").empty().append(row.ifclean=='1'?'是':'否');
		        	// 是否检查备胎
		        	$("#ifcheck").empty().append(row.ifcheckspare=='1'?'是':'否');
		        	// 保修内容
		        	$("#baoxiu").empty().append(row.warrcontent);
		        	// 随车物品
		        	$("#suiche").empty().append(row.caritems);
		        	// 贵重物品
		        	$("#guizhong").empty().append(row.valuableobj);
		        	// 故障
		        	$("#guzhang").empty().append(row.ownerdescribtion);
		        }
		   });
		});
	</script>
</body>
</html>