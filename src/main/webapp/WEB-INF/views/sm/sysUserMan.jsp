<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../public/header.jsp" %>
<style>
	.mytb{  
		margin:0 auto;
		margin-top:15px;
	}
	
	.mytb tr{
		height:35px;
	}
	
	.mytb tr input{
		height:30px;
	}
	
	fieldset{
		border:solid 1px #A9A9A9;
	}
</style>
</head>
<body style="padding:5px;">
<div class="easyui-layout" fit="true" border="false">
    <div region="center" border="false">
        <table fit="true" id="dg" class="easyui-datagrid" title="用户 信息" 
               toolbar="#tb" idField="id"
               data-options="url:'${pageContext.request.contextPath}/base/queryUser.html'"
               rownumbers="true" fitColumns="true" singleSelect="true" pagination="true">
            <thead>
            <tr>
                <th field="userinfoid" hidden="true" align="center" width="50" formatte>用户编号</th>
                <th field="username" align="center" width="50" >用户名</th>
                <th field="concatinfo" align="center" width="50" >联系方式</th>
                <th field="jobnumber" align="center" width="50">工号</th>
                <th field="address" align="center" width="50">地址</th>
                <th field="entrytime"  align="center" width="50">入职时间</th>
                <th field="userflag" align="center" width="50" hidden="true">用户标记</th>
                <th field="sectorid" hidden="true" align="center" width="50">部门编号</th>
                <th field="deptname" align="center" width="50">部门</th>
                <th field="accountid" hidden="true" align="center" width="50">账户编号</th>
                <th field="accountnumber" align="center" width="50">账号</th>
                <th field="op" align="center" width="50" formatter="opfm">操作</th>  
            </tr>
            </thead>
        </table>
        <div id="tb" style="padding:5px">
            <span>关键字:&nbsp;&nbsp;&nbsp;&nbsp;</span>
            <input id="keyworld" class="easyui-textbox" prompt="请输入用户名/手机号/工号"
                   style="width:150px;height:26px;">&nbsp;&nbsp; 
            <span>用户状态:</span>
            <select id="paystatus" class="easyui-combobox" name="dept" style="width:150px;height:26px;"> 
                <option value="1">有效</option>
                <option value="0">被删除</option> 
            </select>&nbsp;&nbsp;
            <a href="#" iconCls="icon-search" class="easyui-linkbutton" onclick="doSearch()">条件查询</a>
            &nbsp;&nbsp;
            <a href="#" id="refresh" iconCls="icon-arrow_refresh" onclick="refresh()" class="easyui-linkbutton">刷新所有</a>
             &nbsp;&nbsp;
            <a href="#" id="refresh" iconCls="icon-add" onclick="addUser()" class="easyui-linkbutton">添加用户</a>
        </div> 
    </div>
    <div region="south" style="height:10px;" border="false">

    </div>
</div>

<div id="userdialog">
    	<form id="userdialogfm">
    		<table class="mytb">  
    			 <tr>
    			 	<td>用户名称</td>
    			 	<td>  
    			 		<input type="text" id="username" validateOnCreate="false" name="username"  class="easyui-textbox" required="required"/>
    			 	</td>
    			 	<td>工号</td>
    			 	<td><input type="text" id="jobnumber" validateOnCreate="false" name="jobnumber" class="easyui-textbox" required="required"/></td>    			 
    			 </tr>  
    			  <tr>
    			 	<td>联系方式</td>
    			 	<td><input type="text" id="concatinfo" validateOnCreate="false" name="concatinfo" class="easyui-textbox" required="required"/></td>
    			 	<td>地址</td>
    			 	<td> 
    			 		<input id="address" validateOnCreate="false" name="address" type="text" class="easyui-textbox" required="required"/>
    			 	</td>    			 
    			 </tr>   
    			  <tr>
    			 	<td>入职时间</td>
    			 	<td><input id="deptname" name="deptname"   type="text" class="easyui-datebox" required="required"></td>
    			 	<td>登录账号</td>
    			 	<td><input id="mailbox" name="mailbox" validateOnCreate="false" type="text" class="easyui-textbox" required="required"/></td>    			
    			 </tr> 
    			  <tr>
    			 	<td>部门</td>
    			 	<td>
    			 		<input id="sectorid" class="easyui-combobox" name="sectorid"
    					data-options="valueField:'id',textField:'text',url:'get_data.php'" required="required">    			  
    			 </tr>
    			  <tr> 
    			 	<td id="userpermissions" colspan="4">
    			 		
    			 	</td>
    			 </tr>  
    		</table>
    	</form>
    </div>
    <div id="tbcg">
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="suresubmit()">确定</a>
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="$('#userdialog').dialog('close')">取消</a>
	</div>
<script type="text/javascript">

	$(function(){
		$("#userdialog").dialog({ 
		    width: 560,
		    height: 500,
		    closed: true,
		    cache: false, 
		    modal: true,
		    title:"用户信息",
		    buttons:'#tbcg'
		});
	});

	// 格式化操作
	function opfm(value,row,index){
		let a = "<button onclick=delUser("+index+") style='border:none;cursor:pointer;border-radius:3px;background:red;color:white;'>删除</button>";
		let b = "<button onclick=modUser("+index+") style='border:none;cursor:pointer;border-radius:3px;background:orange;color:white;'>修改</button>";
		let c = "<button onclick=rebackUser("+index+") style='border:none;cursor:pointer;border-radius:3px;background:green;color:white;'>还原</button>";
		if(row.userflag=="1"){// 如果是有效的用户
			return a+"&nbsp;"+b; 
		}else{
			return c+"&nbsp;"+b;
		}
	}
	
	// 条件查询
	function doSearch(){ 
		$("#dg").datagrid("load",{
			key:$("#keyworld").textbox("getValue"),
			status:$("#paystatus").combobox("getValue")
		});
	}
	
	// 重新刷新
	function refresh(){ 
		$("#dg").datagrid("reload");
	}
	
	function getRow(index){
		return $("#dg").datagrid("getRows")[index];
	}	
	
	// 添加用户
	function addUser(index){
		let $row = getRow(index);
		loadAllPrivileges();
		// 弹出模态框
		$("#userdialog").dialog('open');
	}
	
	// 加载所有的权限信息
	function loadAllPrivileges(){
		$.ajax({
			url:"<%=request.getContextPath()%>/base/queryAllPrivilege.html",
			type:"post",
			dataType:"json"
		}).done(function(data){ 
			console.log(data);
			var $container = $("#userpermissions");
			var $element = $("<fieldset><legend class='legend'></legend><div class='maincont'></div></fieldset><br/>");
			var categoryArray = [];
			// 类别的数组		
			for(var i = 0;i<data.length;i++){
				 if(!checkHasContained(categoryArray,data[i].authcategory)){
					 categoryArray.push(data[i].authcategory);
				 }
			}
			// 先清空
			$container.empty();
			// 生成fieldset
			for(var j = 0;j<categoryArray.length;j++){
				var $cpy = $element.clone();
				$cpy.find(".legend").html(categoryArray[j]).attr("name",categoryArray[j]);
				$container.append($cpy);
			}
			
			// 在fieldset中添加权限
			for(var i = 0;i<data.length;i++){
				str="<span style='float:left;display:inline-block;'><input style='float:left;' type='checkbox' name='allprivileges' checked='checked' value="+data[i].id+" /><span style='margin-top:10px;display:incline-block;float:left;'>"+data[i].pername+"</span></span>";
				var category = data[i].authcategory;
				$(".legend[name="+category+"]").next().append(str);				
			}  
		});
	}
	
	// 检查数组中是否含有某项元素
	function checkHasContained(myArray,val){ 
		for(var i = 0;i<myArray.length;i++){
			if(myArray[i]==val){
				return true;
			}
		}
		return false;
	}
	
	// 确定提交
	function suresubmit(){
		
	}
	
	// 修改用户
	function modUser(index){
		let $row = getRow(index);
	}
	
	// 删除用户
	function delUser(index){
		let $row = getRow(index);
	}
	
	// 还原用户
	function rebackUser(index){
		let $row = getRow(index);
	}
</script>
</body>
</html>