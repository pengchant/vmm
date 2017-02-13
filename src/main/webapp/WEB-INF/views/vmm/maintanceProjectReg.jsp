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
            text-align: center;
        }

        .detail td:nth-child(2n-1){
            color: #3d5e7b;
        }
        
        .wxTbl{
        	margin-top:50px;
        }
        
        .wxTbl tr{
        	height:30px;
        }
        
        .wxTbl tr td{
        	height:26px;
        }
        
        .wxTbl td:nth-child(2n-1){
        	text-align:right;
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
                        <div region="north" iconCls="icon-bug" split="true" style="height:70%;" collapsible="false" title="维修任务">
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
                                <a href="#" iconCls="icon-arrow_refresh" class="easyui-linkbutton" id="refreshtask">刷新</a>
                            </div>
                        </div>
                        <!-- 汽车进场登记详情 -->
                        <div region="center" iconCls="icon-car" title="客户详情&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[当前处理的车牌号：<span class='currentplatnum' style='color:red;'>--</span>]">
		                       <table class="detail" cellpadding="0" cellspacing="0" style="width:100%;height:100%;">
		                         <tr>
		                             <td style="width:10%;">车主</td>
		                             <td style="width:10%;"><span id="customername">--</span></td>
		                             <td style="width:10%;">电话</td>
		                             <td style="width:10%;"><span id="contactinfo">--</span></td>
		                             <td style="width:10%;">行驶里程数</td>
		                             <td style="width:10%;"><span id="milage">--</span></td>
		                             <td style="width:10%;">发动机号</td>
		                             <td style="width:10%;"><span id="vehflag">--</span></td>
		                             <td style="width:10%;">保险日期</td>
		                             <td style="width:10%;"><span id="baoxiandate">--</span></td>
		                         </tr>
		                         <tr>
		                             <td>是否查看旧件</td>
		                             <td><span id="ifused">--</span></td>
		                             <td>是否清洗车辆</td>
		                             <td><span id="ifclean">--</span></td>
		                             <td>是否检查备胎</td>
		                             <td><span id="ifcheck">--</span></td>
		                             <td>随车物品</td>
		                             <td>
		                                 <span id="suiche">--</span>
		                             </td>
		                             <td>贵重物品</td>
		                             <td>
		                                 <span id="guizhong">--</span>
		                             </td>
		                         </tr>
		                         <tr>
		                             <td>车主联系地址</td>
		                             <td colspan="2">
		                                <span id="contactadd">--</span>
		                             </td>
		                             <td>保修的内容</td>
		                             <td colspan="2">
		                                 <span id="baoxiu">--</span>
		                             </td>
		                             <td>车主描述故障</td>
		                             <td colspan="3" style="">
										 <span id="guzhang">--</span>
		                             </td>
		                         </tr> 
		                   </table>
                        </div>

                    </div>
                </div>
                <div region="east" style="width:380px;" split="true" title="维修登记&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[当前处理的车牌号：<span class='currentplatnum' style='color:red;'>--</span>]" iconCls="icon-bullet_wrench">
                    <div class="easyui-layout" fit="true" border="false" >
                        <div region="north" border="false" split="true" style="height:50%;"
                             title="维修项目登记" collapsible="false" iconCls="icon-layout_edit">
                            <!-- 维修项目登记 -->
                            <table id="dgWX" fit="true" class="easyui-datagrid"
                                   style="border-top:none;
                                    border-left:none;border-right:none;" 
                                   toolbar="#toolbarWX"
                                   rownumbers="true" singleSelect="true">
                                <thead>
                                <tr> 
                               		<th field="mainproj" width="100" align="center">维修项目名称</th>
                                    <th field="mainprojcate" hidden="true" width="100" align="center">维修项目大类</th>                                   
                                    <th field="totalhours" width="50" align="center">工时</th>
                                    <th field="regdatetime" width="100" align="center">创建的时间</th> 
                                    <th field="mainstatus" width="80" align="center">维修项目的状态</th>  
                                    <th field="haspassed" hidden="true" width="80" align="center">是否通过</th>
                                    <th field="mainprojregid" hidden="true" width="80" align="center">记录的编号</th>
                                </tr>
                                </thead>
                            </table>
                            <div id="toolbarWX">
                                <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newWXProj()">添加</a>
                                <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editWXProj()">修改</a>
                                <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyWXProj()">删除</a>
                                <a href="#" class="easyui-linkbutton" iconCls="icon-arrow_refresh" plain="true" onclick="reloadWXProj()">更新</a>
                            </div>
                        </div>
                        <div region="center"style="height:50%;" title="维修使用材料登记"
                             iconCls="icon-layout_add">
                            <!-- 维修使用材料登记 -->
                            <table id="dgYL" fit="true" border="false" class="easyui-datagrid"  toolbar="#toolbar"
                                   rownumbers="true" singleSelect="true">
                                <thead>
                                <tr> 
                                	<th field="partusedid" hidden="true" width="50" align="center">登记编号</th>
                                    <th field="partname" width="100" align="center">零件</th>
                                     <th field="receivednum" width="50" align="center">已领</th>
                                    <th field="registedspecnum" width="50" align="center">登记</th> 
                                    <th field="applicattime" width="130" align="center" data-options="formatter:function(value,row,index){
                                    	return value.substring(0,19);
                                    }">登记日期</th> 
                                </tr>
                                </thead>
                            </table>
                            <div id="toolbar">
                                <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newYL()">添加</a>               
                                <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyYL()">删除</a>
                                <a href="#" class="easyui-linkbutton" iconCls="icon-arrow_refresh" plain="true" onclick="refreshYL()">刷新</a>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <div region="south" style="height:10px;" border="false">
        </div>
    </div>
    <%-- 维修项目管理模态框 --%> 
	<div id="dlgWX" class="easyui-dialog" data-options="modal:true"
		style="width: 350px; height: 300px; padding: 10px 20px;text-align:center;" closed="true"
		buttons="#dlg-buttonsWX"> 
		<form id="fmWX" method="post">
			 <table style="width:300px;" class="wxTbl">
			 	<tr>
			 		<td>维修类别</td>
			 		<td> 
			 			<input type="hidden" name="ordersid" id="ordersid"/>
			 			<input data-options="required:true,validateOnCreate:false" name="ordersid" prompt="请选择维修的类别" style="width:150px;height:30px;" id="projcategory" name="projcategory" />
			 		</td>
			 	</tr>
			 	<tr>
			 		<td>维修项目名称</td>
			 		<td>
			 			<%-- mainitemid --%>
			 			<input data-options="required:true,validateOnCreate:false" name="mainitemid" prompt="请选择维修项目的名称"  style="width:150px;height:30px;" id="projname" name="projname" />
			 		</td>
			 	</tr>
			 	<tr>
			 		<td>工时</td>
			 		<td>
			 			<%-- spenttime --%>
			 			<input data-options="required:true,validateOnCreate:false" id="spenttime" name="spenttime" prompt="请填写工时" style="width:150px;height:30px;" type="text" class="easyui-textbox"/>
			 		</td>
			 	</tr>
			 </table>
		</form>
	</div>
	<div id="dlg-buttonsWX">
		<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
			onclick="mainitemReg()">保存</a> <a href="#" class="easyui-linkbutton"
			iconCls="icon-cancel" onclick="javascript:$('#dlgWX').dialog('close')">取消</a>
	</div> 
	
    <%--选择材料模态框 --%>
	<div id="choosePart" class="easyui-window" title="选择材料"
		style="width: 800px; height: 420px; display: none;"
		data-options="modal: true,closed:true,collapsible:false,iconCls:'icon-application_edit',minimizable:false,maximizable:false">
		<%--分页展示材料的信息 --%>
		 <table id="ttPart" class="easyui-datagrid" fit="true" border="false"
		        data-options="singleSelect:true,rownumbers:true"
				url="${pageContext.request.contextPath}/vehicle/queryAllParts.html"
			    iconCls="icon-save" 
				toolbar="#tbPart" pagination="true">
			<thead>
				<tr> 
					<th field="partnumbering" align="center" hidden="true" width="100">零件系统编号</th>
					<th field="partid" align="center" width="100" hidden="true">零件编号</th>
					<th field="partname" align="center" width="120" >零件名称</th>
					<th field="catenumbering" align="center" width="130" hidden="true" >零件类别编号</th>
					<th field="categoryid" align="center" width="130" hidden="true">类别编号</th>
					<th field="partcategory" align="center" width="130" >零件类别</th>
		  			<th field="specifications" align="center" width="50" hidden="true" >规格</th>
		  			<th field="supplierName" align="center" width="170" >供应商名称</th>
		  			<th field="contacts" align="center" width="100" >联系人</th>	  			 
		  			<th field="contactinfo" width="120" align="center">联系方式</th> 	  	
		  			<th field="salesprice" width="80" align="center">销售价</th> 	
		  			<th field="partflag" width="80" align="center" hidden="true">零件标记</th> 	 
				</tr>
			</thead> 
		</table> 
		<%-- 工具栏 --%>
		<div id="tbPart" style="padding:3px"> 
			<span>输入关键字查询</span>
			<input id="partname" class="easyui-textbox" prompt="请输入零件名称" style="width:200px;height:30px;"/>
			<a href="#" class="easyui-linkbutton" onclick="doSearch()" iconCls="icon-search">查询</a>
		</div>
		<%-- 工具栏搜索js部分 --%>
		<script type="text/javascript">
			// 模糊查询
			function doSearch(){
				// 获取带查询关键字
				let key = $("#partname").textbox("getValue"); 
				// 开始查询
				$('#ttPart').datagrid('load',{
					q:key
				});
			} 		
		</script>
		<%-- 双击用户信息 --%>
		<script type="text/javascript">
			$(function(){
				// 绑定双击事件
				$("#ttPart").datagrid({
					'onDblClickRow':function(index,row){
						// 设置值
						$("#currentSelectedPart").empty().html(row.partname);
						$("#currentSelectedPartid").val(row.partid);
						$("#guige").empty().html(row.specifications);
						$("#ddYL").dialog('open');  
					}
				});							
			});
		</script>
	</div>

	<%-- 添加维修材料的模态框 --%>
    <div id="ddYL" class="easyui-dialog" title="填写用料数量" style="width:400px;height:200px;"
            data-options="iconCls:'icon-save',resizable:false,modal:true,closed:true"
            buttons="#dlg-buttonsEDITNUM">
        <table style="width:100%;margin-top:20px;" class="wxTbl">
        	<tr>
        		<td>当前选择的材料:</td>
        		<td>
        			<span id="currentSelectedPart" style="color:red;"></span>
        			<input type="hidden" name="currentSelectedPartid" id="currentSelectedPartid" />
        		</td>
        	</tr>
        	<tr> 
        		<td>选择数量:</td>
        		<td>
        			<input id="needNum" class="easyui-numberspinner" style="width:80px;"
        			  data-options="required:true,validateOnCreate:false,min:1" />     
        			<span id="guige"></span>
        		</td>
        	</tr>
        </table>     
        <%-- 填写数量脚本部分 --%>
        <script type="text/javascript">
        	 // 保存填写的数量
        	 function saveYL(){
        		 let num = $("#needNum").numberspinner('getValue');
        		 $.ajax({
        			 url:'${pageContext.request.contextPath}/vehicle/partsMana/pmAD.html',
        			 data:{
        				 ordersid:currentOrder,
        				 partid:$("#currentSelectedPartid").val(),
        				 useamount:num,
        				 registedspecnum:num,
        				 noreceivingnum:num,
        			 },
        			 type:'post',
        			 dataType:'json'
        		 }).done(function(data){ 
        			 $.messager.alert('操作提示',data.errorMsg,'info');
        			 $("#ddYL").dialog('close');   	
        			 getYLData();
        		 });
        	 }
        </script>  
    </div>
    <div id="dlg-buttonsEDITNUM">
		<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
			onclick="saveYL()">保存</a> <a href="#" class="easyui-linkbutton"
			iconCls="icon-cancel" onclick="javascript:$('#ddYL').dialog('close')">取消</a>
	</div> 

   
    <%-- 页面逻辑的js代码部分 --%>
	<script type="text/javascript">  
	  
		// 维修
	    var wxpojurl;
	 
	    /**
		*	当前的订单
		*/
		var currentOrder;
	
		// 打开选择维修用料模态框
		function newYL(){
			// 先判断是当前页面是否已经选择了order
			if(currentOrder!=null){
				$('#tt').datagrid('reload');
				$("#choosePart").window('open'); 
			}else{
				$.messager.alert('操作提示','您还未选择维修订单!','info');
			}
			
		}
		
		function refreshYL(){
			// 先判断是当前页面是否已经选择了order
			if(currentOrder!=null){
				getYLData();
				$.messager.alert('操作提示','刷新成功!','info');
			}else{
				$.messager.alert('操作提示','您还未选择维修订单!','info');
			}
		}
	    
		// 删除用料
		function destroyYL(){
			// 先判断是当前页面是否已经选择了order
			if(currentOrder!=null){
				$.messager.confirm('操作提示','你确定要删除吗?',function(r){
					if(r){
						// 先获取到选中的行
						let row = $("#dgYL").datagrid("getSelected");
						$.ajax({
							url:"${pageContext.request.contextPath}/vehicle/partsMana/pmRM.html",
							data:{
								partuseid:row.partusedid
							},
							dataType:"json"
						}).done(function(data){ 
						    $.messager.alert('操作提示',data.errorMsg,'info');
							getYLData();
							 
						});
					}
				});
			}else{
				$.messager.alert('操作提示','您还未选择维修订单!','info');
			} 
		}
		
		// 维修项目确定按钮
		function mainitemReg(){
			$.messager.progress();	 
			$('#fmWX').form('submit', {
				url: wxpojurl,
				onSubmit: function(){
					var isValid = $(this).form('validate');
					if (!isValid){
						$.messager.progress('close'); 
					}
					return isValid;	 
				},
				success: function(data){					 
					$.messager.progress('close');
					/**
		        	*	加载登记的维修项目
		        	*/ 
		        	getWXData();
					data = JSON.parse(data);
					$.messager.alert('操作提示',data.errorMsg,'info');
					$('#dlgWX').dialog('close');
				}
			});
		}
		 
	  
		// 添加维修项目
		function newWXProj(){
			// 先判断是当前页面是否已经选择了order
			if(currentOrder!=null){
				$("#spenttime").textbox('setValue','');
				// 加载所有的类别 
				loadCombox();
				$('#dlgWX').dialog('open').dialog('setTitle','添加维修项目');
				wxpojurl = "${pageContext.request.contextPath}/vehicle/mainprojrecord/addMP.html";
				// 获取ordersid
				$("#ordersid").val(currentOrder); 
			}else{
				$.messager.alert('操作提示','您还未选择维修订单!','info');
			}
		}
		
		// 修改维修项目
		function editWXProj(){
			if(currentOrder!=null){
				let row = $("#dgWX").datagrid("getSelected");
				if(row!=null){
					if(row.haspassed=='0'){
						// 加载所有的类别 
						loadCombox();
						// 设置值
						$("#projcategory").combobox('select',row.mainprojcateid);
						$("#projname").combobox('select',row.mainprojid);
						$("#spenttime").textbox('setValue',row.totalhours);
						// 重新加载数据
						$('#dlgWX').dialog('open').dialog('setTitle','修改维修项目');
						wxpojurl = "${pageContext.request.contextPath}/vehicle/mainprojrecord/modMP.html?id="+row.mainprojregid;
						// 获取ordersid
						$("#ordersid").val(currentOrder);
					}else{
						$.messager.alert('操作提示','该维修项目已经通过质检，您不能修改!','info');
					} 
				}else{
					$.messager.alert("操作提示","您还未选择要修改的维修项目!",'info');
				}
			}else{
				$.messager.alert('操作提示','您还未选择维修订单!','info');
			}
		}
		
	   // 删除维修项目
	   function destroyWXProj(){
		   if(currentOrder!=null){
			   let row = $("#dgWX").datagrid("getSelected");		   
			   if(row!=null){ 
				   $.messager.confirm('确定','你确定要删除吗?',function(r){
					   if(r){ 
						   $.messager.progress();	
						   $.ajax({
							   url:"${pageContext.request.contextPath}/vehicle/mainprojrecord/delMP.html",
							   data:{
								  id:row.mainprojregid
							   },
							   type:"POST",
							   dataType : "json"
						   }).done(function(data){ 
							   $.messager.alert('操作提示',data.errorMsg,'info');
							   $.messager.progress('close');
							   getWXData();
						   });
					   }
				   });
			   }else{
				   $.messager.alert('操作提示','您还未选择要删除的维修项目!','info');
			   }
		   }else{
			   $.messager.alert('提示信息','您还未选择维修订单!','info');
		   }
		   
	   }
	   
	   function reloadWXProj(){
		   if(currentOrder!=null){
			   $.messager.alert('操作提示','更新成功!','info');
			   getWXData();
		   }else{
			   $.messager.alert('操作提示','请先选择维修任务!','info');
		   }
	   }
	   
	   	   
		
	   /**
	   *	加载维修项目的内容
	   */
	   function loadCombox(){
		   // 清空工时
		   $("#spenttime").val("");
		   
		   // 维修项目名称
		   $("#projname").combobox({ 
			   valueField:'id',
			   readOnly:true,
			   textField:'projname' 
		   });
		   
			// 维系项目类别
		   $("#projcategory").combobox({
			    url:'${pageContext.request.contextPath}/vehicle/mainprojrecord/gtCT.html',
			    valueField:'id',
			    textField:'projname',
			    readOnly:true, 
			    onSelect:function(record){  
			    	$('#projname').combobox('clear');
			    	if(record!=null||record!=undefined){
			    		let url = '${pageContext.request.contextPath}/vehicle/mainprojrecord/getIM.html?q='+record.id;
			            $('#projname').combobox('reload', url);
			    	} 
				}  
		   });
		    
	   }
	   
	   /**
	   *  加载登记的维修项目
	   */
	   function getWXData(){ 
           $.getJSON('${pageContext.request.contextPath}/vehicle/mainprojrecord/queMP.html?ordersid='+currentOrder,function(data){
           	// 把获取到的数据放到datagrid中		          
	        	$("#dgWX").datagrid('loadData',data);					            	
           }); 
	   }
	   
	   /**
	   *  加载登记的维修用料
	   */
	   function getYLData(){
		   $.getJSON('${pageContext.request.contextPath}/vehicle/partsMana/pmQU.html?ordersid='+currentOrder,function(data){
           	// 把获取到的数据放到datagrid中		            
	        	$("#dgYL").datagrid('loadData',data);
           }); 
	   }
		
		$(function(){ 
			 
		   // 重新刷新
		   $("#refreshtask").click(function(){
			   $("#current").datagrid('load');
		   });
			
		   // 条件查询
		   $("#selecting").click(function(){
			// 获取keyworld
			   let keyworld = $("#keyworld").val();
			   // 获取任务状态
			   let orderstatus = $("#orderstatus").combobox('getValue');
			   // 开始时间
			   let startTime = $("#startTime").datebox('getValue');
			   // 结束时间
			   let endTime = $("#endTime").datebox('getValue');
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
		            {field:'allocatetime',width:150,align:'center',sortable:true,title:'入场时间',
		            	formatter:function(value,row,index){
		            		return value.substring(0,19);
		            	}
		            }, 
		            {field:'esdeliverytime',width:150,align:'center',sortable:true,title:'计划完工时间',
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
		        onDblClickRow:function(index,row){	
		        	// 获取当前选中的orderid
		        	currentOrder = row.ordersid;
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
		        	
		        	getWXData();		        	
		        	getYLData();
		        }
		   });
		});
	</script>
 
</body>
</html>