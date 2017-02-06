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
					<td colspan="3"><span>维护</span><input type="checkbox"
						checked="checked" value="1" />&nbsp;&nbsp; <span>故障修理</span><input
						type="checkbox" checked="checked" value="2" />&nbsp;&nbsp; <span>返修</span><input
						type="checkbox" checked="checked" value="3" />&nbsp;&nbsp; <span>事故维修</span><input
						type="checkbox" checked="checked" value="4" />&nbsp;&nbsp; <span>其他</span><input
						type="checkbox" checked="checked" value="5" /> <span>返修</span><input
						type="checkbox" checked="checked" value="6" />&nbsp;&nbsp; <span>事故维修</span><input
						type="checkbox" checked="checked" value="7" />&nbsp;&nbsp; <span>其他</span><input
						type="checkbox" checked="checked" value="8" /></td>
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
					<td colspan="7" style="height: 180px; padding: 0px;">
						<div class="easyui-layout" fit="true" border="false">
							<div region="west" title="维修人员指派" collapsible="false"
								iconCls="icon-calendar_edit"
								style="width: 180px; border-top: none; border-bottom: none; border-left: none;"
								split="true">
								<ul class="easyui-tree">
									<li><span>汽车修理厂</span>
										<ul>
											<li data-options="state:'closed'"><span>修理部</span>
												<ul>
													<li><span>Friend</span></li>
													<li><span>Wife</span></li>
													<li><span>Company</span></li>
												</ul></li>
											<li><span>质检部</span>
												<ul>
													<li>Intel</li>
													<li>Java</li>
													<li>Microsoft Office</li>
													<li>Games</li>
												</ul></li>

										</ul></li>
								</ul>
							</div>
							<div region="center"
								style="border-top: none; border-right: none; border-bottom: none;">
								<table class="easyui-datagrid" title="已选维修人员" fit="true"
									border="false" iconCls="icon-comments_add"
									data-options="singleSelect:true,collapsible:true,url:'datagrid_data1.json',method:'get'">
									<thead>
										<tr>
											<th data-options="field:'itemid',width:50">编号</th>
											<th data-options="field:'productid',width:100">员工工号</th>
											<th data-options="field:'listprice',width:100">员工姓名</th>
											<th data-options="field:'unitcost',width:200">联系方式</th>
											<th data-options="field:'attr1',width:100">当前任务数量</th>
											<th data-options="field:'attr1',width:50">操作</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
					</td>

				</tr>
				<tr>
					<td>质检人员指派</td>
					<td colspan="7" style="height: 180px; padding: 0px;">
						<div class="easyui-layout" fit="true" border="false">
							<div region="west" title="质检人员指派" collapsible="false"
								iconCls="icon-calendar_edit"
								style="width: 180px; border-top: none; border-bottom: none; border-left: none;"
								split="true">
								<ul class="easyui-tree">
									<li><span>汽车修理厂</span>
										<ul>
											<li data-options="state:'closed'"><span>修理部</span>
												<ul>
													<li><span>Friend</span></li>
													<li><span>Wife</span></li>
													<li><span>Company</span></li>
												</ul></li>
											<li><span>质检部</span>
												<ul>
													<li>Intel</li>
													<li>Java</li>
													<li>Microsoft Office</li>
													<li>Games</li>
												</ul></li>

										</ul></li>
								</ul>
							</div>
							<div region="center"
								style="border-top: none; border-right: none; border-bottom: none;">
								<table class="easyui-datagrid" title="已选质检员工" fit="true"
									border="false" iconCls="icon-comments_add"
									data-options="singleSelect:true,collapsible:true,url:'datagrid_data1.json',method:'get'">
									<thead>
										<tr>
											<th data-options="field:'itemid',width:50">编号</th>
											<th data-options="field:'productid',width:100">员工工号</th>
											<th data-options="field:'listprice',width:100">员工姓名</th>
											<th data-options="field:'unitcost',width:200">联系方式</th>
											<th data-options="field:'attr1',width:100">当前任务数量</th>
											<th data-options="field:'attr1',width:50">操作</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
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
		            }
		        });
		    });
	});
</script>
<%--选择用户模态框 --%>
<div id="chooseUser" class="easyui-window" title="选择用户"
	style="width: 700px; height: 600px; display: none;"
	data-options="modal: true,closed:true,collapsible:false,minimizable:false,maximizable:false">
	
</div>
</html>