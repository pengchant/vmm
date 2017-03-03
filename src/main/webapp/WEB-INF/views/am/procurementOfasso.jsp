<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../public/header.jsp" %>
<style>
	.cgtb{ 
		margin-top:30px;
	}
	
	.cgtb tr{
		height:30px;
		padding:5px;
	}
	
	.cgtb tr td:nth-child(2n-1){
		text-align:right;
		width:140px;
	}
</style>
</head>
<body style="padding:5px;">
<div class="easyui-layout" fit="true" border="false">
    <div region="center" border="false">
        <table fit="true" id="dg" class="easyui-datagrid" title="采购配件查询" iconCls="icon-cart_add"
               toolbar="#tb" idField="id"
               fitColumns="true"
               data-options="url:'${pageContext.request.contextPath}/inventory/queryPagedPartProc.html'"
               rownumbers="true" singleSelect="true" pagination="true">
            <thead>
            <tr>
                <th field="procid" align="center" hidden="true" width="50">编号</th>
                <th field="partcode" align="center" hidden="true"  width="180" >零件的编号</th>
                <th field="partname" align="center"  width="80" >零件名称</th>
                <th field="partcategorycode" hidden="true"  align="center" width="100">零件类别编号</th>
                <th field="partcategory"  align="center" width="150">零件类别</th>
                <th field="suppliercode" hidden="true"  align="center" width="150">供应商编号</th>
                <th field="suppliername" align="center" width="180">供应商名称</th>
                <th field="pruchdemand" align="center" width="100">需求量</th>
                <th field="createtime" align="center" width="100">创建时间</th>
                <th field="purchstatus" align="center" width="100" formatter="myfm">采购状态</th> 
                <th field="op" align="center" width="100" formatter="opfm">操作</th> 
            </tr>
            </thead>
        </table>
        <div id="tb" style="padding:5px">
            <span>关键字:&nbsp;&nbsp;&nbsp;&nbsp;</span>
            <input id="keyworld" class="easyui-textbox" prompt="请输入零件名称/大类名称"
                   style="width:170px;height:26px;">&nbsp;&nbsp;&nbsp;&nbsp;
            <span>采购状态:</span>
            <select id="status" class="easyui-combobox" name="dept" style="width:170px;height:26px;">
            	<option value="">全部</option>
                <option value="0">待采购</option>
                <option value="1">已采购</option>
            </select>&nbsp;&nbsp;
            <br/>
            <br/>
            <span>开始时间:</span>
            <input id="ds" type="text" value="3/4/2010 2:3" style="width:170px;height:26px;" class="easyui-datebox"  />
            &nbsp;&nbsp;
            <span>结束时间:</span>
            <input id="de" type="text" value="3/4/2010 2:3" style="width:170px;height:26px;" class="easyui-datebox"  />
            &nbsp;&nbsp;
            <a href="#" iconCls="icon-search" class="easyui-linkbutton" onclick="doSearch()">条件查询</a>
            &nbsp;&nbsp;
            <a href="#" iconCls="icon-arrow_refresh" class="easyui-linkbutton" onclick="refresh()">刷新所有</a>
            &nbsp;&nbsp;
            <a href="#" iconCls="icon-page_excel" class="easyui-linkbutton" onclick="toexcel()">导出 excel</a>
        </div>

    </div>
    <div region="south" style="height:10px;" border="false">

    </div>
</div>
<%-- 采购模态框 --%>
<div id="caigou">
	<form id="fmcaigou" method="post">
		<table style="width:100%;" class="cgtb">
		 	<tr>
		 		<td>零件名称：</td>
		 		<td>
		 			<%-- 隐藏域 --%>
		 			<%-- 零件信息标的编号 --%>
		 			<input type="hidden" id="partid" name="partid"/>
		 			<%-- 零件存储表的编号 --%>
		 			<input type="hidden" id="partprocid" name="partprocid" />
		 			<span id="cg_partname"></span>
		 		</td>
		 	</tr>
		 	<tr>
		 		<td>生产厂家：</td>
		 		<td>
		 			<span id="cg_supplier"></span>
		 		</td>
		 	</tr>
		 	<tr>
		 		<td>采购单价：</td>
		 		<td>
		 			<input style="width:200px;height:28px;" type="text" id="price" name="price" class="easyui-numberbox" value="0" data-options="required:true,min:0,precision:2">
		 		</td>
		 	</tr>
		 	<tr>
		 		<td>采购数量：</td>
		 		<td>
		 			 <input style="width:200px;height:28px;" type="text" id="num" name="num" class="easyui-numberbox" value="0" data-options="required:true,min:0,precision:2">
		 		</td>
		 	</tr>
 		</table>
	</form> 
</div>
<div id="tbcg">
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="surecaigou()">确定采购</a>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="$('#caigou').dialog('close')">取消</a>
</div>

<%-- 与页面交互的js部分 --%>
<script>
	// 格式化状态
	function myfm(value,row,index){ 
		if(value=="0"){
			return '<span style="color:red;font-size:14px;font-weight:700;">待采购</span>';
		}else{
			return '<span style="color:green;font-size:14px;font-weight:700;">已采购</span>';
		}
	}
	
	// fmop
	function opfm(value,row,index){
		if(row.purchstatus=="0"){
			return '<button onclick="caigou('+index+')" style="cursor:pointer;border:none;border-radius:3px;width:100px;height:26px;color:white;background:green;margin:2px;">立即采购</button>';
		}else{
			return '--';
		}
	}
	
	// 采购
	function caigou(index){
		let row = $("#dg").datagrid("getRows")[index];  
		// 设置值
		$("#cg_partname").html(row.partname);
		$("#cg_supplier").html(row.suppliername);
		// 设置零件信息表
		$("#partid").val(row.partcode);
		// 设置零件存储表
		$("#partprocid").val(row.procid);
		// 设置参数
		$("#num").numberbox("setValue",row.pruchdemand); 
		$("#num").numberbox({
		    min:row.pruchdemand 
		});
		$("#caigou").dialog({
		    title: '采购',
		    width: 420,
		    height: 300,
		    closed: false,
		    cache: false,  
		    modal: true,
		    buttons:"#tbcg"
		});	
	}
	
	// 条件查询
	function doSearch(){
		let keyworld = $("#keyworld").textbox("getValue");
		let status = $("#status").combobox("getValue");
		let starttime = $("#ds").datebox("getValue");
		let endtime = $("#de").datebox("getValue");
		$("#dg").datagrid("load",{
			keyworld:keyworld,
			purchstatus:status,
			starttime:starttime,
			endtime:endtime
		});
	}
	
	// 重新刷新
	function refresh(){
		$("#dg").datagrid('reload');   
	}
	
	// 导出为excel
	function toexcel(){
		let status = $("#status").combobox("getValue");
		let starttime = $("#ds").datebox("getValue");
		let endtime = $("#de").datebox("getValue");
		window.location.href="${pageContext.request.contextPath}/inventory/toPartProcExcel.html?purchstatus="+status+"&starttime="+starttime+"&endtime="+endtime;
	}
	
	// 确定采购
	function surecaigou(){
		$("#fmcaigou").form('submit', {
			url:"${pageContext.request.contextPath}/inventory/procpart.html",
			onSubmit: function(){
				var isValid = $(this).form('validate');
				if (!isValid){
					$.messager.progress('close');	 
				}
				return isValid; 
			},
			success: function(data){
				console.log(data);
				refresh();
				$.messager.progress('close');	
				$('#caigou').dialog('close');
			}
		});
	}
</script>
</body>
</html>