<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../public/header.jsp" %> 
<style>
	.mytb{
		width:100%;
		height:100%;
		margin-top:20px;
	}
	
	.mytb input{
		height:30px;
	}
	
	.mytb tr{
		height:26px;
		line-height:26px;
	}
	
	.mytb tr td:nth-child(2n-1){
		text-align:right;
		width:170px;
	}
</style>
</head>
<body style="padding:5px;">
<div class="easyui-layout" fit="true" border="false">
    <div region="center" border="false">
        <table fit="true" id="dg" class="easyui-datagrid" title="客户资料管理" iconCls="icon-shield"
               toolbar="#tb" idField="id"
               url="${pageContext.request.contextPath}/baseData/querySupplier.html"
               rownumbers="true" singleSelect="true" pagination="true"
               
               pageSize="20"
               fitColumns="true">
            <thead>
            <tr>
                <th sortable="true" field="id" align="center" width="80" hidden="true">编号</th>
                <th sortable="true" field="suppliername" align="center" width="200">供应商名称</th>
                <th sortable="true" field="contacts" align="center" width="100">联系人</th>
                <th sortable="true" field="phone" align="center" width="100">手机</th>
                <th sortable="true" field="contactinfo" align="center" width="100" >联系方式</th>
                <th sortable="true" field="fax" align="center" width="100" >传真</th> 
                <th sortable="true" field="mailbox" align="center" width="180">邮箱</th>
                <th sortable="true" field="address" align="center" width="180">地址</th>
                <th sortable="true" field="postcode" align="center" width="80">邮政编码</th> 
                <th sortable="true" field="bankaccount" align="center" width="120">银行卡号</th> 
                <th sortable="true" field="suppflag" align="center" width="80" formatter="statusfm" >标记</th>
                <th  field="op" align="center" width="200" formatter="opfm">操作</th>
            </tr>
            </thead>
        </table>
        <div id="tb" style="padding:5px">
            <span>关键字:&nbsp;&nbsp;</span>
            <input id="key" class="easyui-textbox" prompt="请输入供应商名/联系人/地址"
                   style="width:180px;height:26px;">&nbsp;&nbsp;&nbsp;&nbsp;
             <span>供应商的状态:&nbsp;&nbsp;</span>
                <select id="cc" class="easyui-combobox" name="dept" style="width:150px;height:26px;">
			       <option value="1">有效供应商</option>
			       <option value="0">无效供应商</option> 
			   </select> 
   			 &nbsp;&nbsp;
            <a href="#" iconCls="icon-search" class="easyui-linkbutton" onclick="doSearch()">条件查询</a>
            &nbsp;&nbsp;
            <a href="#" iconCls="icon-arrow_refresh" class="easyui-linkbutton" onclick="refresh()">刷新所有</a>
             &nbsp;&nbsp;
		    <a href="#" iconCls="icon-add" class="easyui-linkbutton" onclick="add()">添加供应商</a>
			&nbsp;&nbsp;
		    <a href="#" iconCls="icon-page_excel" class="easyui-linkbutton" onclick="toExcel()">导出为excel</a> 
        </div>

    </div>
    <div region="south" style="height:10px;" border="false">

    </div> 
     <%-- 客户信息模态框 --%>
    <div id="supplier">
    	<form id="supplierfm">
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
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="$('#supplier').dialog('close')">取消</a>
	</div>
    <script type="text/javascript">  
    	$(function(){
    		$("#supplier").dialog({ 
    		    width: 450,
    		    height: 400,
    		    closed: true,
    		    cache: false, 
    		    modal: true,
    		    buttons:'#tbcg'
    		});
    	});
    	
    	// 导出excel
    	function toExcel(){
    		window.location.href="${pageContext.request.contextPath}/baseData/toSupplierExcel.html";    		
    	}
    	
    	// 定义全局变量
    	var url = '';
 
    	
    	// 条件查询
    	function doSearch(){
    		$("#dg").datagrid("load",{
    			key:$("#key").textbox("getValue"),
    			flag:$("#cc").combobox("getValue")
    		});
    	}
    	
    	// 刷新
    	function refresh(){
    		$("#dg").datagrid("reload");
    	}
    	
    	// 状态格式化
    	function statusfm(value,row,index){
    		if(value=="1"){
    			return "<span style='color:green;font-size:14px;font-weight:800;'>有效</span>";
    		}else{
    			return "<span style='color:red;font-size:14px;font-weight:800;'>无效</span>";
    		}
    	}
    	
    	// 操作格式化
    	function opfm(value,row,index){
    		let a = "<button style='cursor:pointer;border:none;background:#2993D1;border-radius:3px;color:white;' onclick='modifysupplier("+index+")'>修改资料</button>";
    		let b = '';
    		if(row.suppflag=="1"){
    			 b = "&nbsp;<button onclick='stop("+index+")' style='cursor:pointer;border:none;background:red;border-radius:3px;color:white;'>删除</button>";
    		}else{
    			b = "&nbsp;<button onclick='start("+index+")'  style='cursor:pointer;border:none;background:orange;border-radius:3px;color:white;'>还原</button>";
    		}
    		return a+b;
    	}
    	
    	// 开启
    	function start(index){
    		let row = $("#dg").datagrid("getRows")[index];
    		sub({id:row.id,suppflag:"1",type:"D"});
    	}
    	
    	// 关闭
    	function stop(index){
    		let row = $("#dg").datagrid("getRows")[index];
    		sub({id:row.id,suppflag:"0",type:"D"});
    	}
    	
    	function sub(data){
    		$.ajax({
    			url:"${pageContext.request.contextPath}/baseData/modifySupplier.html",
   				type:"post",
   				data:data,
   				dataType:"json"
    		}).done(function(data){
    			if(data.isError){
    				$.messager.alert("操作提示","操作失败!","info"); 
  				}else{
  					$("#supplier").dialog('close');     
  	  				$("#dg").datagrid("reload");
  				} 
    		});
    	}
    	
    	// 添加弹出模态框
    	function add(){
    		$("#supplier").dialog("setTitle","添加供应商").dialog("open");
    		url = "${pageContext.request.contextPath}/baseData/modifySupplier.html";
    		$("#type").val("C"); 
    		$("#id").val("");
    		// 重置form
    		$("#supplierfm").form("reset");
    	}
    	
    	// 添加修改的模态框
    	function modifysupplier(index){
    		let row = $("#dg").datagrid("getRows")[index];
    		// 赋值
    		url = "${pageContext.request.contextPath}/baseData/modifySupplier.html";
    		$("#type").val("U"); 
    		$("#id").val(row.id);
    		$("#suppliername").textbox("setValue",row.suppliername);
    		$("#suppliername").textbox("setValue",row.suppliername);
    		$("#contacts").textbox("setValue",row.contacts);
    		$("#phone").textbox("setValue",row.phone);
    		$("#contactinfo").textbox("setValue",row.contactinfo);
    		$("#fax").textbox("setValue",row.fax);
    		$("#mailbox").textbox("setValue",row.mailbox);
    		$("#address").textbox("setValue",row.address);
    		$("#postcode").textbox("setValue",row.postcode);
    		$("#bankaccount").textbox("setValue",row.bankaccount);  
    		$("#supplier").dialog("setTitle","修改供应商").dialog("open");
    	}
    	
    	// 提交信息
    	function suresubmit(){ 
    		$.messager.progress();  
	  		$('#supplierfm').form('submit', {
	  			url:url,
	  			onSubmit: function(){
	  				var isValid = $(this).form('validate');
	  				if (!isValid){
	  					$.messager.progress('close');	 
	  				}
	  				return isValid;	 
	  			},
	  			success: function(data){
	  				if(!data.isError){
	  					$.messager.alert("操作提示","操作成功!","info");
	  				}else{
	  					$.messager.alert("操作提示","操作失败!","info");
	  				}
	  				$("#supplier").dialog('close');    			 
	  				$.messager.progress('close'); 
	  				$("#dg").datagrid("reload");
	  			}
	  		})
   		};
    	
    	
    	/*
    	// 操作格式化
    	function modifyfm(value,row,index){
    		return '<button onclick="modifyfrom('+index+')" style="border:none;margin:2px;cursor:pointer;background:#2A94D0;border:none;color:white;border-radius:3px;width:100px;height:28px;">修改用户信息</button>';
    	}
    	
    	// 弹出模态框
    	function modifyfrom(index){
    		let obj = $("#dg").datagrid("getRows")[index]; 
    		// 设置值
    		$("#customerid").val(obj.customerid);
    		$("#customername").textbox("setValue",obj.customername);
    		$("#contactinfo").textbox("setValue",obj.contactinfo);
    		$("#contactadd").textbox("setValue",obj.contactadd);
    		$("#vehicleid").val(obj.vehicleid);
    		$("#platenum").textbox("setValue",obj.platenum);
    		$("#inspectiondate").datebox("setValue",obj.inspectiondate);
    		$("#milage").textbox("setValue",obj.milage);
    		$("#vehflag").textbox("setValue",obj.vehflag);
    		$('#customer').dialog('open');
    	}
    	
    	
    	}*/
    </script>
</div>
</body>
</html>