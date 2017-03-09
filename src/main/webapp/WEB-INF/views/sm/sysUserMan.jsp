<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../public/header.jsp" %>
<style>
	 
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
            <a href="#" id="refresh" iconCls="icon-arrow_refresh" onclick="addUser()" class="easyui-linkbutton">添加用户</a>
        </div> 
    </div>
    <div region="south" style="height:10px;" border="false">

    </div>
</div>

<div id="userdialog">
    	<form id="userdialogfm">
    		<table class="mytb">  
    			 <tr>
    			 	<td>供应商名称</td>
    			 	<td> 
    			 		<input type="hidden" id="id" name="id"/>
    			 		<input type="hidden" id="type" name="type"/>
    			 		<input type="text" id="suppliername" name="suppliername"  class="easyui-textbox" required="required"/>
    			 	</td>
    			 </tr>
    			 <tr>
    			 	<td>联系人</td>
    			 	<td><input type="text" id="contacts" name="contacts" class="easyui-textbox" required="required"/></td>
    			 </tr> 
    			  <tr>
    			 	<td>手机</td>
    			 	<td><input type="text" id="phone" name="phone" class="easyui-textbox" required="required"/></td>
    			 </tr> 
    			  <tr>
    			 	<td>联系方式</td>
    			 	<td> 
    			 		<input id="contactinfo" name="contactinfo" type="text" class="easyui-textbox" required="required"/>
    			 	</td>
    			 </tr> 
    			  <tr>
    			 	<td>传真</td>
    			 	<td><input id="fax" name="fax" type="text" class="easyui-textbox" required="required"/></td>
    			 </tr>
    			  <tr>
    			 	<td>邮箱</td>
    			 	<td><input id="mailbox" name="mailbox" type="text" class="easyui-textbox" required="required"/></td>
    			 </tr>
    			  <tr>
    			 	<td>地址</td>
    			 	<td><input id="address" name="address" type="text" class="easyui-textbox" required="required"/></td>
    			 </tr>
    			  <tr>
    			 	<td>邮政编码</td>
    			 	<td><input id="postcode" name="postcode" type="text" class="easyui-textbox" required="required"/></td>
    			 </tr>
    			 <tr>
    			 	<td>银行卡号</td>
    			 	<td><input id="bankaccount" name="bankaccount" type="text" class="easyui-textbox" required="required"/></td>
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
		    width: 450,
		    height: 400,
		    closed: true,
		    cache: false, 
		    modal: true,
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
		// 弹出模态框
		$("#userdialog").dialog('open');
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