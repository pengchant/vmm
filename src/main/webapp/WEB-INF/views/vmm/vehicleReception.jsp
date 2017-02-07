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
	width: 100%;
	height: 100%;
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
</style>
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
	});
</script>
</head>
<body style="margin: 0px; padding: 0px;">
	<div class="easyui-panel" border="false" iconCls="icon-application"
		style="width: 100%; padding: 10px;">
		
		<!-- 表单的头部内容部分 -->
		<div style="padding-top: 5px; padding-bottom: 10px;">
			<table style="width: 100%; height: 100%;">
				<tr>
					<td style="text-align: left;"><a class="easyui-linkbutton"
						iconCls="icon-add" id="openAddUser">新建用户</a>&nbsp;&nbsp; <a
						class="easyui-linkbutton" iconCls="icon-search"
						id="openChooseUser">选择用户</a>  
                    </td>
					<td style="text-align: right;">
						<span>当前选择的用户:</span>
						<input class="easyui-textbox" style="width:100px;height:30px;" readonly="true" prompt="当前选择的用户" id="currentUser"/>
						<input type="text" id="customerid" name="customerid"/>
						<span>当前的汽车牌号</span>
						<input class="easyui-textbox" style="width:100px;height:30px;" readonly="true" prompt="汽车牌号" id="vehiclenum"/>
						<input type="text" id="vehicleid" name="vehicleid"/>
						<a href="#" class="easyui-linkbutton" onclick="" style="height:30px;" 
						  iconCls="icon-tag_blue_delete">清除用户</a>											
						 <a href="#" class="easyui-linkbutton"
						style="height: 30px;" iconCls="icon-building_go">保存</a>
					</td>
				</tr>
			</table> 
		</div>
		
		<!-- 主要的表单内容部分 -->
		<div class="easyui-panel form_cont" border="false">
			<table class="main_table" cellpadding="0" cellspacing="0">
				<tr>
					<td style="width: 100px;">行驶里程数</td>
					<td><input id="milage" name="milage" prompt="用户行驶里程数"
						class="easyui-textbox" style="height: 30px;"></td>
					<td>年检日期</td>
					<td><input id="inspectiondate" name="inspectiondate"
						style="height: 30px;" prompt="保险日期" class="easyui-datebox"
						name="birthday" data-options="required:true,showSeconds:false"
						value="3/4/2010 2:3" style="width:150px;"></td>
					<td>查看旧件</td>
					<td><input type="radio" name="jiujian" />是&nbsp; <input
						type="radio" name="jiujian" checked="checked" />否</td>
					<td>检查备胎</td>
					<td><input type="radio" name="beitai" />是&nbsp; <input
						type="radio" name="beitai" checked="checked" />否</td>

				</tr>
				<tr>
					<td>清洁车辆</td>
					<td><input type="radio" name="qingjie" />是&nbsp; <input
						type="radio" name="qingjie" checked="checked" />否</td>
					<td>预计交付时间</td>
					<td><input id="dd" value="3/4/2010 2:3" type="text"
						class="easyui-datetimebox" style="height: 30px;" /></td>
					<td>选择保修的内容</td>
					<td colspan="3">
					   <%-- 所有维修的类别 --%>
					   <div id="allProjCategory"> 
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
					   					   str +='<span>'+item.projname+'</span><input type="checkbox" value="'+item.id+'" />&nbsp;&nbsp;';
					   				   });
					   				   // 添加到容器中
					   				   $container.append(str);
					   		    }); 
					   		});
					   </script> 
					   <%-- 所有维修类别加载维修项目结束 --%>
					</td>
				</tr>
				<tr>
					<td>随车物品</td>
					<td><input prompt="请输入随车物品" class="easyui-textbox"
						style="height: 30px;"></td>
					<td>贵重物品</td>
					<td><input prompt="请输入贵重物品" class="easyui-textbox"
						style="height: 30px;"></td>
					<td>车主描述故障状况</td>
					<td colspan="3"><input prompt="请输入车主描述的故障情况"
						class="easyui-textbox" style="height: 30px; width: 90%"></td>
				</tr>
				<tr>
					<td>维修人员指派</td>
					<td rowspan="2" style="width:200px;height:400px;padding:0px;">
						<div class="easyui-panel" title="选择员工" border="false" fit="true" iconCls="icon-group_add">
							<%-- 质检人员树状图 --%>
						<ul class="userselecting" id="zhijian"> 
						</ul>
						</div>
					</td>
					<td colspan="7" style="height: 200px; padding: 0px;"> 
								<table class="easyui-datagrid" title="已选维修人员" fit="true" 
									border="false" iconCls="icon-comments_add"
									data-options="singleSelect:true,collapsible:true,url:'datagrid_data1.json',method:'get'">
									<thead>
										<tr>
											<th data-options="field:'itemid',width:100">编号</th>
											<th data-options="field:'productid',width:150">员工工号</th>
											<th data-options="field:'listprice',width:150">员工姓名</th> 
											<th data-options="field:'attr1',width:200">操作</th>
										</tr>
									</thead>
								</table> 
					</td> 
				</tr> 
				<tr>
					<td>质检人员指派</td>
					<td colspan="7" style="height: 200px; padding: 0px;"> 
								<table id="selectedZhijian" class="easyui-datagrid" title="已选质检员工" fit="true"
									border="false" iconCls="icon-comments_add"
									data-options="singleSelect:true,collapsible:true,url:'datagrid_data1.json',method:'get'">
									<thead>
										<tr>
											<th data-options="field:'itemid',width:100">编号</th>
											<th data-options="field:'productid',width:150">员工工号</th>
											<th data-options="field:'listprice',width:150">员工姓名</th> 
											<th data-options="field:'attr1',width:200">操作</th>
										</tr>
									</thead>
								</table>  
					</td>
				</tr>
				<tr>
					<td colspan="8" style="background-color: #d8ecff;"><a
						class="easyui-linkbutton" iconCls="icon-ok"
						style="width: 120px; height: 30px;">提交</a>&nbsp;&nbsp;&nbsp; <a
						class="easyui-linkbutton" iconCls="icon-building_error"
						style="width: 120px; height: 30px;">取消</a></td>
				</tr>
			</table>
		</div>
	
	</div>
</body>
<%-- 选择用户 --%>
<script type="text/javascript">
	$(function(){
		
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
<script type="text/javascript">
	$(function() {   
		
		// 定义用户的对象
		function User(userid,username){
			let object = new Object();
			object.userid = userid;
			object.username = username;
			return object;
		}
		
		/**
		* 选中的对象
		*/
		var selected;
		
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
						selected = new User(node.id,node.text); 
						console.log("开始拖动"); 
					},
					onStopDrag:function(node){
						// 清空
						selected = '';
						console.log("结束拖动");
					}
				});
			}); 
		})();
		
		// 设置可以被放置
		$("#selectedWeixiu").droppable({
			onDrop:function(e,source){// 放置
				console.log("获取到的用户的编号和姓名为:",selected.userid,selected.username);
			}
		});
		 
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
		            }
		        });
		    });
	});
</script>
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
					// 隐藏掉模态框
					$('#chooseUser').window('close');
				}
			});
		});
	</script>
</div>
</html>