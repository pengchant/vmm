<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../public/header.jsp"%>
<style>
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
</head>
<body style="padding: 5px;">
	<div class="easyui-layout" fit="true" border="false">
		<div region="center" border="true"
			title="当前位置:&nbsp;<a onclick='javascript:goBack();' style='cursor:pointer'><span>车辆接待</span></a>&nbsp;/&nbsp;添加用户信息"
			iconCls="icon-tag_blue" style="position: relative;">
			<form id="ff" method="post"
				style="width: 800px; height: 412px; position: absolute; top: 50%; left: 50%; margin-left: -400px; margin-top: -206px; border: solid 1px lightgray; padding: 5px;">
				<table id="contTable" cellpadding="0" cellspacing="0"
					style="width: 100%;">
					<tr>
						<td></td>
					</tr>
					<tr>
						<td class="tabLeft" style="width: 100px;"><label
							for="numbering">用户名:</label></td>
						<td>
						<%-- 用户编号的隐藏域 --%>
						<input type="hidden" id="customerid" name="customerid" value=""/>
						<input id="numbering" class="easyui-combobox"
						 name="numbering" prompt="请输入用户名" 
						style="height: 30px; width: 230px;"	
						data-options="
						required:true,
						validateOnBlur:true,
						validateOnCreate:false,
						valueField : 'id',
						textField : 'numbering',
						url : '${pageContext.request.contextPath}/vehicle/getCustomerBykey.html',
						onBeforeLoad : function(param) {
								param.q = $('#numbering').combobox('getValue');
						},
						onSelect : function(record) {
							console.log(record);
							$('#customerid').val(record.id);
							// 设置值
							$('#mailbox').textbox('setValue',
								record.mailbox);
							$('#contactinfo').textbox('setValue',
								record.contactinfo);
							$('#contactadd').textbox('setValue',
								record.contactadd);
							$('#idcard').textbox('setValue',
								record.idcard);
						},
						onChange : function(newValue, oldValue) {
						    $('#numbering').combobox('setValue',$('#numbering').combobox('getText'));
						    $('#customerid').val('');
							$('#mailbox').textbox('setValue', '');
							$('#contactinfo').textbox('setValue', '');
							$('#contactadd').textbox('setValue', '');
							$('#idcard').textbox('setValue', '');
						}" /></td>
						<td class="tabLeft" style="width: 100px;"><label
							for="mailbox">邮箱:</label></td>
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
							type="text" name="vehname" prompt="请输入汽车名称 "
							style="height: 30px;" /></td>
						<td class="tabLeft"><label for="carmodel">汽车型号:</label></td>
						<td><input class="easyui-textbox myinput easyui-validatebox"
							data-options="required:true,validateOnBlur:true,
						validateOnCreate:false"
							type="text" name="carmodel" prompt="请输入汽车型号"
							style="height: 30px;" /></td>
					</tr>
					<tr>
						<td class="tabLeft"><label for="inspectiondate">年检时间:</label></td>
						<td><input id="inspectiondate" name="inspectiondate"
							style="height: 30px; width: 230px;" prompt="年检时间"
							class="easyui-datebox"  
							data-options="showSeconds:false"
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
							type="text" name="platenum" prompt="请输入汽车牌号"
							style="height: 30px;" /></td>
						<td class="tabLeft"><label for="vehflag">发动机型号:</label></td>
						<td><input class="easyui-textbox myinput easyui-validatebox"
							data-options="required:true,validateOnBlur:true,
						validateOnCreate:false"
							type="text" name="vehflag" prompt="请输入发动机型号"
							style="height: 30px;" /></td>
					</tr>
					<tr></tr>
					<tr>
						<td colspan="4" style="text-align: center;"><a href="#"
							id="resetform" class="easyui-linkbutton" iconCls="icon-redo"
							style="width: 120px; height: 30px;">重填</a>
							&nbsp;&nbsp;&nbsp;&nbsp; <a href="#" id="submitform"
							class="easyui-linkbutton" iconCls="icon-accept" style="width: 120px; height: 30px;">提交</a>
						</td>
					</tr>
				</table>
			</form>
		</div>
		<div region="south" style="height: 10px;" border="false"></div>
	</div>
	<script type="text/javascript">
		// 返回到上一页
		function goBack() {
			window.location.href = "${pageContext.request.contextPath}/index/dis.html?url=/vmm/vehicleReception.jsp";
		}

		$(function() {			 
			 
			// 重填
			$("#resetform").click(function() {
				console.log("重置");
				// 重置
				$("#ff").form("reset");
			});
			 
			
			// 提交
			$("#submitform").click(function() {
				console.log("-->提交表单");
				$.messager.progress();	 
				$('#ff').form('submit', {
					url:"${pageContext.request.contextPath}/vehicle/addUser.html",
					onSubmit: function(){
						var isValid = $('#ff').form('validate');
						console.log(isValid);
						if (!isValid){
							$.messager.progress('close');	 
						}
						return isValid;	 
					},
					success: function(data){
						console.log(data);
						$.messager.progress('close');	 
					}
				});
			});
		});
	</script>
</body>
</html>