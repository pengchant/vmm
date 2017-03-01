<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../public/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/jquery-easyui-1.4.5/jquery-easyui-texteditor/texteditor.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-easyui-1.4.5/jquery-easyui-texteditor/jquery.texteditor.js"></script>
<style type="text/css">
.form_cont td {
	padding: 5px;
	text-align: center;
}

.main_table { 
	border: solid 1px #97b1ff;
	border-right: none;
	border-bottom: none;
}

.main_table td {
	border: solid 1px #97b1ff;
	border-top: none;
	border-left: none;
}

#contTable tr {
	height: 45px;
}

.tabLeft {
	text-align: right;
	padding-right: 10px;
}

.myinput {
	width: 230px;
}

#selectedZhijian td,#selectedWeixiu td{
	border:dotted 1px #e6e6e6 !important;
}
 
</style>

<%-- 接收订单的js部分 --%>
<script type="text/javascript">
	$(function() { 
		// 定义表格下拉框的效果
		$("#cc").combogrid({panelWidth : 562,
							idField : 'platenum',
							textField : 'numbering',
							mode : 'remote',
							url : '${pageContext.request.contextPath}/vehicle/getUserVehBykey.html',
							columns : [ [ {
								field : 'customerid',
								title : '用户编号',
								width : 50,
								hidden : true
							}, {
								field : 'numbering',
								title : '用户名',
								width : 100,
								align : 'center'
							}, {
								field : 'contactinfo',
								title : '手机号',
								width : 120,
								align : 'center'
							}, {
								field : 'platenum',
								title : '车牌号',
								width : 130,
								align : 'center'
							}, {
								field : 'vehname',
								title : '品牌',
								width : 100,
								align : 'center'
							}, {
								field : 'carmodel',
								title : '车型',
								width : 100,
								align : 'center',
							}, {
								field : 'milage',
								title : '行驶里程数',
								width : 100,
								hidden : true
							}, {
								field : 'inspectiondate',
								title : '年检日期',
								width : 100,
								hidden : true
							}, {
								field : 'vehflag',
								title : '发动机号',
								width : 100,
								hidden : true
							}, {
								field : 'contactadd',
								title : '联系地址',
								width : 100,
								hidden : true
							} ] ],
							onSelect : function(index, row) {
								console.log(index, row);
								// 设置选中
								$("#cc").combogrid("setValue", row.platenum); 
							}
						});
		// 弹出添加用户的模态框
		$("#openAddUser").click(function() {
			$("#addUser").window('open');
		});

		// 弹出选择用户的模态框
		$("#openChooseUser").click(function() {
			$('#tt').datagrid('reload');
			$("#chooseUser").window('open');
		});
		
		// 清除选择的用户
		$("#clearSelectedCustomer").click(function(){
			//赋值
			$("#currentUser").textbox("setValue",'');
			$("#customerid").val('');
			$("#vehiclenum").textbox("setValue",'');
			$("#vehicleid").val('');
		});
	});
</script>
</head>
<body style="margin: 0px; padding: 0px;">
	<div class="easyui-panel" border="false" iconCls="icon-application"
		style="width: 100%; padding: 10px;">
		
		<%-- 页面的form表单部分 --%>
		<form method="post" action="${pageContext.request.contextPath}/vehicle/receptOrder.html"  id="fmOrderRecept" style="width:100%;padding:0px;">
			<!-- 表单的头部内容部分 -->
			<div style="padding-top: 5px; padding-bottom: 10px;">
				<table style="width: 100%;">
					<tr>
						<td style="text-align: left;"><a class="easyui-linkbutton"
							iconCls="icon-add" id="openAddUser">新建用户</a>&nbsp;&nbsp; <a
							class="easyui-linkbutton" iconCls="icon-search"
							id="openChooseUser">选择用户</a>  
	                    </td>
						<td style="text-align: right;">
							<span>当前选择的用户:</span>
							<input class="easyui-textbox" data-options="required:true,validateOnBlur:true,
						validateOnCreate:false" style="width:100px;height:30px;" readonly="true" prompt="当前选择的用户" id="currentUser"/>
							
							<%-- orders.customerid --%>
							<input type="hidden" id="customerid" name="orders.customerid" />
							
							<span>当前的汽车牌号</span>
							<input class="easyui-textbox" data-options="required:true,validateOnBlur:true,
						validateOnCreate:false"  style="width:100px;height:30px;" readonly="true" prompt="汽车牌号" id="vehiclenum"/>
							
							<%-- orders.vehicleid --%>
							<input type="hidden" id="vehicleid" name="orders.vehicleid"/>
							
							<%-- customername --%>
							<input type="hidden" name="customername" id="customername" value=""/>
							
							<%-- customerphone --%>
							<input type="hidden" name="customerphone" id="customerphone" value=""/>
							
							<%-- isNew --%>
							<input type="hidden" name="isNew" id="isNew" />
							
							<a href="#" class="easyui-linkbutton" style="height:30px;" 
							  iconCls="icon-tag_blue_delete" id="clearSelectedCustomer">清除用户</a>											
							 <a href="#" class="easyui-linkbutton subOrderList"
							style="height: 30px;" iconCls="icon-building_go">保存</a>
						</td>
					</tr>
				</table> 
			</div>
			<!-- 表单头部内容结束 -->
			
			<!-- 主要的表单内容部分 -->
			<div class="easyui-panel form_cont" border="false">
				<table class="main_table" style="width:100%;" cellpadding="0" cellspacing="0">
					<%-- 基础信息部分 --%>
					<tr>
						<td style="width: 80px;">行驶里程数</td>
						<td>
							<%-- orders.miles --%>
							<input id="milage" data-options="required:true,validateOnBlur:true,
						validateOnCreate:false"  name="orders.miles" prompt="用户行驶里程数"
							class="easyui-textbox" style="height: 30px;" />
							
						</td>
						<td>随车物品</td>
						<td>
							<%-- orders.caritems --%>
							<input prompt="请输入随车物品" data-options="required:true,validateOnBlur:true,
						validateOnCreate:false"  name="orders.caritems" class="easyui-textbox"
							style="height: 30px;" />
							
						</td>
						<td>贵重物品</td>
						<td>
							<%-- orders.valuableobj --%>
							<input prompt="请输入贵重物品" data-options="required:true,validateOnBlur:true,
						validateOnCreate:false"  name="orders.valuableobj" class="easyui-textbox"
							style="height: 30px;" />
							
						</td>
						<td>车主描述故障状况</td>
						<td>
							<%-- orders.ownerdescribtion --%>
						    <input prompt="请输入车主描述的故障情况" data-options="required:true,validateOnBlur:true,
						validateOnCreate:false" 
							class="easyui-textbox" name="orders.ownerdescribtion" style="height: 30px;">
						
						</td> 
					</tr> 
					<tr>
						<td style="width: 80px;">清洁车辆</td>
						<td>
							<%-- orders.ifclean --%>
							<input type="radio" name="orders.ifclean" value="1" />是&nbsp; <input
							type="radio" name="orders.ifclean" checked="checked" value="0" />否
							
						</td>
						<td style="width: 80px;">查看旧件</td>
						<td> 
							<%-- orders.ifused --%>
							<input type="radio" name="orders.ifused" value="1" />是&nbsp; <input
							type="radio" name="orders.ifused" checked="checked" value="0" />否
							
						</td> 
						<td style="width: 80px;">检查备胎</td>
						<td>
							<%-- orders.ifcheckspare --%>
							<input type="radio" name="orders.ifcheckspare" value="1" />是&nbsp; <input
							type="radio" name="orders.ifcheckspare" checked="checked" value="0"  />否
						</td>
						<td style="width: 80px;">预计交付时间</td>
						<td>
							<%-- orders.esdeliverytime--%>
							<input id="dd" value="3/4/2010 2:3" type="text"
							class="easyui-datetimebox" data-options="required:true,validateOnBlur:true,
						validateOnCreate:false"  name="orders.esdeliverytime" style="height: 30px;" /></td>
						 
					</tr>
					
					<tr>
						<td>保修内容</td>
						<td colspan="7">
						   <%-- 所有维修的类别 --%>
						   <div id="allProjCategory"> 
						   		<%-- orders.warrcontent --%>
						   </div>
						   <%-- 所有维修类别加载维修项目 --%>
						   <script type="text/javascript">
						   		$(function(){ 
						   		    // 文档加载完毕后
						   			$.getJSON("${pageContext.request.contextPath}/vehicle/getAllMainCategory.html",
						   				function(data){
						   				   let $container = $("#allProjCategory");
						   				   // 先清空
						   				   $container.empty();
						   				   let str = '';					   				 
						   				   $.each(data, function(i,item){
						   					   str +='<span>'+item.projname+'</span><input name="orders.warrcontent" type="checkbox" value="'+item.projname+'" />&nbsp;&nbsp;';
						   				   });
						   				   // 添加到容器中
						   				   $container.append(str);
						   		    }); 
						   		});
						   </script> 
						   <%-- 所有维修类别加载维修项目结束 --%>
						</td>
					</tr>
					
					<%-- 指派人员部分 --%>
					<tr>
						<td>维修人员指派</td>
						<td rowspan="2" style="width:200px;height:400px;padding:0px;">
							<div class="easyui-panel" title="选择员工" border="false" fit="true" iconCls="icon-group_add">
								<%-- 质检人员树状图 --%>
							<ul class="userselecting" id="zhijian"> 
							</ul>
							</div>
						</td>
						<td colspan="8" style="height: 200px; padding: 0px;"> 
							<div id="selectedWeixiu" style="width:100%;height:100%;padding:0px;">
								<table id="tbWeixiu" class="easyui-datagrid selectingTable"  title="已选维修人员" fit="true" 
								 iconCls="icon-comments_add" border="false"
								data-options="singleSelect:true">
									<thead>
										<tr>
											<th data-options="field:'id',width:100,formatter:function(value,row,index){
												return (index+1);
											}" >编号</th>
											<th data-options="field:'jobnumber',width:100">工号</th>
											<th data-options="field:'userid',width:100">员工编号</th>
											<th data-options="field:'username',width:100">员工姓名</th>
											<th data-options="field:'concatinfo',width:120">联系方式</th> 
											<th data-options="field:'operator',width:100,formatter:myformatter_wx">操作</th>
										</tr>
									</thead>
								</table>
							</div> 
						</td> 
					</tr> 
					<tr>
						<td>质检人员指派</td>
						<td colspan="8" style="height: 200px; padding: 0px;"> 
							<div id="selectedZhijian" style="width:100%;height:100%;padding:0px;">						
								<table id="tbZhijian" class="easyui-datagrid selectingTable" title="已选质检员工" fit="true"
									border="false" iconCls="icon-comments_add"
									data-options="singleSelect:true">
									<thead>
										<tr>
											<th data-options="field:'id',width:100,formatter:function(value,row,index){
												return (index+1);
											}" >编号</th>
											<th data-options="field:'jobnumber',width:100">工号</th>
											<th data-options="field:'userid',width:100">员工编号</th>
											<th data-options="field:'username',width:100">员工姓名</th>
											<th data-options="field:'concatinfo',width:120">联系方式</th> 
											<th data-options="field:'operator',width:100,formatter:myformatter_zj">操作</th>
										</tr>
									</thead>
								</table>  
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="10" style="background-color: #d8ecff;"><a
							class="easyui-linkbutton subOrderList" iconCls="icon-ok"
							style="width: 120px; height: 30px;">提交</a>&nbsp;&nbsp;&nbsp; <a
							class="easyui-linkbutton" iconCls="icon-building_error"
							style="width: 120px; height: 30px;" id="refresh">刷新</a></td>
					</tr>
				</table>
			</div>
		    <!-- 主要表单内容部分 -->
		    <%-- 隐藏域部分 --%>
		    <div id="hiddenpart">
		    	
		    </div>
		</form> 
	</div>
</body> 


<%-- 页面的js部分 --%>
<script type="text/javascript"> 
/**
* 选中的对象
*/
var selected;

/**
* 定义维修人员列表
*/
var weixiuArray = new Array();

/**
* 定义质检人员列表
*/
var zhijianArray = new Array();

/**
 * 定义维修人员分配对象
 */
function allocating(userinfoid,taskcategory){
	let object = new Object();
	object.userinfoid = userinfoid;
	object.taskcategory = taskcategory;
	return object;
}
	
	function myformatter_wx(value,row,index){ 
		return '<a href="#" style="color:red;" onclick="deleteSelected('+index+',1,\''+row.username+'\',\''+row.userid+'\')">删除</a>';
	}
	
	function myformatter_zj(value,row,index){ 
		return '<a href="#" style="color:red;" onclick="deleteSelected('+index+',2,\''+row.username+'\')">删除</a>';
	}
	
	 
	// 删除已经选择的 
	function deleteSelected(index,which,username,userid){
		let type = (which=='2')?'质检员':'维修员';
		let $container = (which=='2')?$('#tbZhijian'):$('#tbWeixiu');
		$.messager.confirm('操作提示', '你确定要删除已选择的'+type+'【'+username+'】这条记录吗?', function(r){
			if (r){
				 $container.datagrid('deleteRow',index);	 
				 // 删除数组中对应的数据
				 $container.datagrid('loadData', { total: 0, rows: [] }); 
				 var changedArray = deleteArray((which==2)?zhijianArray:weixiuArray,userid);
				 $container.datagrid({data:changedArray}); 
				 $.messager.show({
						title:'提示',
						msg:'删除  '+type+' 【'+username+'】成功!',
						timeout:1000,
						showType:'slide'
				});
			}
		});
	}
	
	// 删除质检和维修中数组中的人员
	function deleteArray(myarray,value){
		for(var i=0,n=myarray.length;i<n;i++){
			if(myarray[i].userid==value){
				myarray.splice(i,1); 
				return myarray;
			}
		}  
		return myarray;
	}
	 
	// 添加质检或者维修人员
	function pushUser(myarray,user){
		for(var i=0,n=myarray.length;i<n;i++){
			if(myarray[i].userid==user.userid){
				 return;
			}
		}  
		myarray.push(user);
	}
	
	/**
	* jquery的写法，等待文档所有加载完毕
	*/
	$(function() {   
		
		// 提交表单信息
		$(".subOrderList").click(function(){
			$.messager.confirm('确定','你确定要提交当前数据吗?',function(r){
				if(r){
					// 显示进度条
					$.messager.progress();
					$('#fmOrderRecept').form('submit', {
					    url:"${pageContext.request.contextPath}/vehicle/receptOrder.html",
					    onSubmit: function(){
					    	var isValid = $('#fmOrderRecept').form('validate');;
					    	var flag = (weixiuArray.length==0||zhijianArray.length==0); 
						  
							if (!isValid){
								$.messager.progress('close');	 
							}else{
								// 在这里把数组中的元素放到隐藏域中
						    	let myAllocatedArray = new Array();
						    	// 维修人员
						    	for(var i = 0,n = weixiuArray.length;i<n;i++){
						    		myAllocatedArray.push(new allocating(weixiuArray[i].userid,'wx'));
						    	}			    	
						    	// 质检人员
						    	for(var j = 0,m=zhijianArray.length;j<m;j++){
						    		myAllocatedArray.push(new allocating(zhijianArray[j].userid,'zj'));
						    	}
						    	// 添加到隐藏域
						    	let $hidden = $('#hiddenpart');
						    	$hidden.empty();
						    	let result = '';
						    	for(var k = 0,q=myAllocatedArray.length;k<q;k++){
						    		// 维修人员编号，分配任务类别
						    		result += "<input type='hidden' value='"+myAllocatedArray[k].userinfoid+"' name='personallocates["+k+"].userinfoid'/>"
						    				+"<input type='hidden' value='"+myAllocatedArray[k].taskcategory+"' name='personallocates["+k+"].taskcategory'/>";
						    	}
						    	$hidden.append(result);
							}
							if(flag){
								isValid = false;
								$.messager.progress('close');
								$.messager.alert('操作提示','请选择至少一个维修员和质检员!','info');
							}
							return isValid;	 
					    },
					    success:function(data){
					    	console.log(data);
					    	$.messager.progress('close');
					    	var obj = JSON.parse(data);
					    	if(obj.isError){
					    		$.messager.alert('操作提示','添加修理单失败，请重试!','info');
					    	}else{
					    		$.messager.alert('操作提示','添加修理单成功!','info');
					    		window.location.href="${pageContext.request.contextPath}/index/dis.html?url=/vmm/vehicleReception.jsp";
					    	} 
					    }
					});
				}
			});
		});
		 
		// 取消
		$("#refresh").click(function(){
			$.messager.confirm("确定","刷新后将不再保存当前的数据,是否刷新?",function(r){
				if(r){
					window.location.href="${pageContext.request.contextPath}/index/dis.html?url=/vmm/vehicleReception.jsp";
				}
			}) 
		});
		
		// 定义用户的对象
		function User(userid,username,jobnumber,concatinfo){
			let object = new Object();
			object.userid = userid;
			object.username = username;
			object.jobnumber = jobnumber;
			object.concatinfo = concatinfo;
			return object;
		} 
		
		
		// 获取用户的json字符串
		(function loadUser(){ 
			$.getJSON('${pageContext.request.contextPath}/vehicle/getAllUserDept.html',function(data){ 
				// 加载用户信息
				$('.userselecting').tree({
					dnd:true,
					data:data,
					lines:true,
					onStartDrag:function(node){  
						// 把值赋值给user公共变量
						selected = new User(node.id,node.text,node.attributes.jobnumber,node.attributes.concatinfo);  
					},
					onStopDrag:function(node){
						// 清空
						selected = ''; 
					}  
				});
			}); 
		})();
		
		// 设置可以被放置
		$("#selectedWeixiu").droppable({
			onDrop:function(e,source){// 放置 	 
				var f = isDragged($('#tbWeixiu'),selected.userid);
				if(f){
					$.messager.alert('操作提示','您已经添加了维修员【'+selected.username+'】不能重复添加!','info');
				}else if(selected.userid==null){
					$.messager.alert('操作提示','您选择的节点有误!','info');
				}else{
					appendDragging($('#tbWeixiu'),selected);  
					// 放到数组中去
					pushUser(weixiuArray,selected); 
				}
			}
		});
		
		// 将拖拽的内容放到datagrid中去
		$('#selectedZhijian').droppable({
			onDrop:function(e,source){// 放置  
				var f = isDragged($('#tbZhijian'),selected.userid);
				if(f){
					$.messager.alert('操作提示','您已经添加了质检人员【'+selected.username+'】不能重复添加!','info');
				}else if(selected.userid==null){
					$.messager.alert('操作提示','您选择的节点有误!','info');
				}else{
					appendDragging($('#tbZhijian'),selected); 
					// 放到数组中去
					pushUser(zhijianArray,selected); 
				}
			}
		});
		
		// 将获取到的select填充到目标容器中
		function appendDragging($container,user){
			$container.datagrid('appendRow',{					 
				userid: user.userid,
				username: user.username,
				jobnumber:user.jobnumber,
				concatinfo:user.concatinfo
			});
		}
		
		// 判断datagrid中是否存在某记录(根据实体类的id来判断用户id)
		function isDragged($container,id){
			var rows = $container.datagrid('getRows');
			for(var i=0,n=rows.length;i<n;i++){
				if(rows[i].userid==id){
					return true;
				}
			}
			return false;
		}
		 
		// 重填
		$("#resetform").click(function() {
			console.log("重置");
			// 重置
			$("#ff").form("reset");
		});

		// 提交
		$("#submitform").click(
		    function() {
		        console.log("-->提交表单");
		        $.messager.progress();
		        $('#ff').form('submit', {
		            url: "${pageContext.request.contextPath}/vehicle/addUser.html",
		            onSubmit: function() {
		                var isValid = $('#ff')
		                    .form('validate');
		                console.log(isValid);
		                if (!isValid) {
		                    $.messager
		                        .progress('close');
		                }
		                return isValid;
		            },
		            success: function(data) {
		                let  obj = JSON.parse(data);
		                // 关闭进度条
		                $.messager
		                    .progress('close');
		                // 关闭模态框
		                $("#addUser").window(
		                    'close');
		                // 重置
		                $("#ff").form("reset");
		                // 提示添加成功
		                $.messager.alert('操作提示',
		                    obj.errorMsg + "!",
		                    'info');
		                // 把数据填充到当前用户中去
		                $("#currentUser").textbox("setValue",obj.numbering);
						$("#customerid").val(obj.customerid);
						$("#vehiclenum").textbox("setValue",obj.platenum);
						$("#vehicleid").val(obj.vehicleid);
						$('#customername').val(obj.numbering);
						$('#customerphone').val(obj.contactinfo);
						$('#isNew').val('1');
		            }
		        });
		    });
	});
</script>

<%-- 添加用户模态框 --%>
<div id="addUser" class="easyui-window" title="添加新用户"
	style="width: 740px; height: 480px; display: none;"
	data-options="modal: true,closed:true,collapsible:false,minimizable:false,maximizable:false">
	<form style="padding: 10px;" id="ff" method="post">
		<table id="contTable" 
			cellpadding="0" 
			cellspacing="0" 
			style="width: 100%;">
			<tr>
				<td></td>
			</tr>
			<tr>
				<td class="tabLeft" style="width: 100px;"><label
					for="numbering">用户名:</label></td>
				<td>
					<input id="numbering" 
					class="easyui-textbox" 
					name="numbering" 
					prompt="请输入用户名" style="height: 30px; width: 230px;" 
					data-options="required:true,validateOnBlur:true, validateOnCreate:false" />
				</td>
				<td class="tabLeft" style="width: 100px;"><label for="mailbox">邮箱:</label></td>
				<td><input class="easyui-textbox easyui-validatebox myinput"
					id="mailbox" type="text"
					data-options="required:true,validateOnBlur:true,
						validateOnCreate:false,validType:['email']"
					name="mailbox" prompt="请输入邮箱" style="height: 30px;" /></td>
			</tr>
			<tr>
				<td class="tabLeft"><label for="contactinfo">联系方式:</label></td>
				<td><input class="easyui-textbox myinput easyui-validatebox"
					id="contactinfo"
					data-options="required:true,validateOnBlur:true,
						validateOnCreate:false"
					type="text" name="contactinfo" prompt="请输入联系方式"
					style="height: 30px;" /></td>
				<td class="tabLeft"><label for="contactadd">联系地址:</label></td>
				<td><input class="easyui-textbox myinput easyui-validatebox"
					id="contactadd"
					data-options="required:true,validateOnBlur:true,
						validateOnCreate:false"
					type="text" name="contactadd" prompt="请输入联系地址"
					style="height: 30px;" /></td>
			</tr>
			<tr>
				<td class="tabLeft"><label for="idcard ">身份证:</label></td>
				<td><input class="easyui-textbox myinput easyui-validatebox"
					id="idcard"
					data-options="required:true,validateOnBlur:true,
						validateOnCreate:false"
					type="text" name="idcard" prompt="请输入身份证" style="height: 30px;" /></td>
			</tr>
			<tr>
				<td class="tabLeft"><label for="vehname">汽车名称:</label></td>
				<td><input class="easyui-textbox myinput easyui-validatebox"
					data-options="required:true,validateOnBlur:true,
						validateOnCreate:false"
					type="text" name="vehname" prompt="请输入汽车名称 " style="height: 30px;" /></td>
				<td class="tabLeft"><label for="carmodel">汽车型号:</label></td>
				<td><input class="easyui-textbox myinput easyui-validatebox"
					data-options="required:true,validateOnBlur:true,
						validateOnCreate:false"
					type="text" name="carmodel" prompt="请输入汽车型号" style="height: 30px;" /></td>
			</tr>
			<tr>
				<td class="tabLeft"><label for="inspectiondate">年检时间:</label></td>
				<td><input id="inspectiondate" name="inspectiondate"
					style="height: 30px; width: 230px;" prompt="年检时间"
					class="easyui-datebox" data-options="showSeconds:false"
					value="3/4/2010 2:3" /></td>
				<td class="tabLeft"><label for="milage">行驶里程数:</label></td>
				<td><input class="easyui-textbox myinput" type="text"
					data-options="required:true,validateOnBlur:true,
						validateOnCreate:false"
					name="milage" prompt="请输入行驶里程数" style="height: 30px;" /></td>
			</tr>
			<tr>
				<td class="tabLeft"><label for="platenum">汽车牌号:</label></td>
				<td><input class="easyui-textbox myinput easyui-validatebox"
					data-options="required:true,validateOnBlur:true,
						validateOnCreate:false"
					type="text" name="platenum" prompt="请输入汽车牌号" style="height: 30px;" /></td>
				<td class="tabLeft"><label for="vehflag">发动机型号:</label></td>
				<td><input class="easyui-textbox myinput easyui-validatebox"
					data-options="required:true,validateOnBlur:true,
						validateOnCreate:false"
					type="text" name="vehflag" prompt="请输入发动机型号" style="height: 30px;" /></td>
			</tr>
			<tr></tr>
			<tr>
				<td colspan="4" style="text-align: center;"><a href="#"
					id="resetform" class="easyui-linkbutton" iconCls="icon-redo"
					style="width: 120px; height: 30px;">重填</a> &nbsp;&nbsp;&nbsp;&nbsp;
					<a href="#" id="submitform" class="easyui-linkbutton"
					iconCls="icon-accept" style="width: 120px; height: 30px;">提交</a></td>
			</tr>
		</table>
	</form>
</div>

<%--选择用户模态框 --%>
<div id="chooseUser" class="easyui-window" title="选择用户"
	style="width: 1000px; height: 420px; display: none;"
	data-options="modal: true,closed:true,collapsible:false,minimizable:false,maximizable:false">
	<%--分页展示用户的信息 --%>
	 <table id="tt" class="easyui-datagrid" fit="true" border="false"
	        data-options="singleSelect:true"
			url="${pageContext.request.contextPath}/vehicle/getUserAndVehBykeyPg.html"
		    iconCls="icon-save"
			toolbar="#tb" pagination="true">
		<thead>
			<tr> 
				<th field="customerid" align="center" width="100">用户编号</th>
				<th field="numbering" align="center" width="120" >用户名</th>
				<th field="contactinfo" align="center" width="130" >联系方式</th>
	  			<th field="platenum" align="center" width="130"  >汽车牌号</th>
	  			<th field="vehname" align="center" width="130" >汽车品牌</th>
	  			<th field="carmodel" align="center" width="130" >汽车型号</th>	  			 
	  			<th field="contactadd" width="180" align="center">联系地址</th> 	  	
	  			<th field="vehicleid" width="80" align="center" hidden="true">汽车编号</th> 		 
			</tr>
		</thead> 
	</table> 
	<%-- 工具栏 --%>
	<div id="tb" style="padding:3px"> 
		<span>输入关键字查询</span>
		<input id="keyworld" class="easyui-textbox" prompt="请输入用户名/手机号/车牌号" style="width:200px;height:30px;"/>
		<a href="#" class="easyui-linkbutton" onclick="doSearch()" iconCls="icon-search">查询</a>
	</div>
	<%-- 工具栏搜索js部分 --%>
	<script type="text/javascript">
		// 模糊查询
		function doSearch(){
			// 获取带查询关键字
			let key = $("#keyworld").val();
			// 开始查询
			$('#tt').datagrid('load',{
				keyWorld:key
			});
		}
	</script>
	<%-- 双击用户信息 --%>
	<script type="text/javascript">
		$(function(){
			// 绑定双击事件
			$("#tt").datagrid({
				'onDblClickRow':function(index,row){
					console.log(row);
				 	//赋值
					$("#currentUser").textbox("setValue",row.numbering);
					$("#customerid").val(row.customerid);
					$("#vehiclenum").textbox("setValue",row.platenum);
					$("#vehicleid").val(row.vehicleid);
					$('#customername').val(row.numbering);
					$('#customerphone').val(row.contactinfo);
					$('#isNew').val('0');
					// 隐藏掉模态框
					$('#chooseUser').window('close');
				}
			});
		});
	</script>
</div>

 
</html>