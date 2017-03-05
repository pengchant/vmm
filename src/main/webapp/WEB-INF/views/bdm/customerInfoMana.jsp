<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../public/header.jsp" %> 
<style>
	.mytb{
		width:100%;
		height:100%;
		margin-top:20px;
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
               url="${pageContext.request.contextPath}/baseData/queryPagedCustomerView.html"
               rownumbers="true" singleSelect="true" pagination="true"
               
               pageSize="20"
               fitColumns="true">
            <thead>
            <tr>
                <th sortable="true" field="customerid" align="center" width="80" hidden="true">用户的编号</th>
                <th sortable="true" field="customername" align="center" width="100">用户名</th>
                <th sortable="true" field="contactinfo" align="center" width="100">联系方式</th>
                <th sortable="true" field="contactadd" align="center" width="200">联系地址</th>
                <th sortable="true" field="vehicleid" align="center" width="80" hidden="true" >汽车编号</th>
                <th sortable="true" field="platenum" align="center" width="80" >汽车牌号</th> 
                <th sortable="true" field="inspectiondate" align="center" width="180">年检日期</th>
                <th sortable="true" field="milage" align="center" width="80">里程数</th>
                <th sortable="true" field="vehflag" align="center" width="80">发动机号</th> 
                <th  field="op" align="center" width="110" formatter="modifyfm">操作</th>
            </tr>
            </thead>
        </table>
        <div id="tb" style="padding:5px">
            <span>关键字:&nbsp;&nbsp;&nbsp;&nbsp;</span>
            <input id="key" class="easyui-textbox" prompt="请输入客户名/联系方式/汽车牌号"
                   style="width:260px;height:26px;">&nbsp;&nbsp;&nbsp;&nbsp; 
            <a href="#" iconCls="icon-search" class="easyui-linkbutton" onclick="doSearch()">条件查询</a>
            &nbsp;&nbsp;
            <a href="#" iconCls="icon-arrow_refresh" class="easyui-linkbutton" onclick="refresh()">刷新所有</a>
			&nbsp;&nbsp;
		    <a href="#" iconCls="icon-page_excel" class="easyui-linkbutton" onclick="toExcel()">导出为excel</a>
        </div>

    </div>
    <div region="south" style="height:10px;" border="false">

    </div> 
     <%-- 客户信息模态框 --%>
    <div id="customer">
    	<form id="customerfm">
    		<table class="mytb">  
    			 <tr>
    			 	<td>用户名</td>
    			 	<td>
    			 		<input type="hidden" id="customerid" name="customerid"/>
    			 		<input type="text" id="customername" name="customername"  class="easyui-textbox" required="required"/>
    			 	</td>
    			 </tr>
    			 <tr>
    			 	<td>联系方式</td>
    			 	<td><input type="text" id="contactinfo" name="contactinfo" class="easyui-textbox" required="required"/></td>
    			 </tr> 
    			  <tr>
    			 	<td>联系地址</td>
    			 	<td><input type="text" id="contactadd" name="contactadd" class="easyui-textbox" required="required"/></td>
    			 </tr> 
    			  <tr>
    			 	<td>汽车牌号</td>
    			 	<td>
    			 		<input id="vehicleid" name="vehicleid" type="hidden" name=""/>
    			 		<input id="platenum" name="platenum" type="text" class="easyui-textbox" required="required"/>
    			 	</td>
    			 </tr> 
    			  <tr>
    			 	<td>年检日期</td>
    			 	<td><input id="inspectiondate" name="inspectiondate"   type="text" class="easyui-datebox" required="required"></td>
    			 </tr>
    			  <tr>
    			 	<td>里程数</td>
    			 	<td><input id="milage" name="milage" type="text" class="easyui-textbox" required="required"/></td>
    			 </tr>
    			  <tr>
    			 	<td>发动机号</td>
    			 	<td><input id="vehflag" name="vehflag" type="text" class="easyui-textbox" required="required"/></td>
    			 </tr>
    		</table>
    	</form>
    </div>
    <div id="tbcg">
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="suresubmit()">确定修改</a>
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="$('#customer').dialog('close')">取消</a>
	</div>
    <script type="text/javascript"> 
    	$(function(){
    		$('#customer').dialog({
    		    title: '修改用户信息',
    		    width: 450,
    		    height: 340,
    		    closed: true,
    		    cache: false, 
    		    modal: true,
    		    buttons:'#tbcg'
    		});
    	});
    
    	// 导出excel
    	function toExcel(){
    		window.location.href="${pageContext.request.contextPath}/baseData/toCusttomerExcel.html";    		
    	}
    	
    	// 条件查询
    	function doSearch(){
    		$("#dg").datagrid("load",{
    			key:$("#key").textbox("getValue")
    		});
    	}
    	
    	// 刷新
    	function refresh(){
    		$("#dg").datagrid("reload");
    	}
    	
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
    	
    	// 提交信息
    	function suresubmit(){ 
    		$.messager.progress(); 
    		$('#customerfm').form('submit', {
    			url:"${pageContext.request.contextPath}/baseData/modifyCustomer.html",
    			onSubmit: function(){
    				var isValid = $(this).form('validate');
    				if (!isValid){
    					$.messager.progress('close');	 
    				}
    				return isValid;	 
    			},
    			success: function(data){
    				if(!data.isError){
    					$.messager.alert("操作提示","修改用户信息成功!","info");
    				}else{
    					$.messager.alert("操作提示","修改用户信息失败","info");
    				}
    				$("#customer").dialog('close');    			 
    				$.messager.progress('close'); 
    				$("#dg").datagrid("reload");
    			}
    		});
    	}
    </script>
</div>
</body>
</html>