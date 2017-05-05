<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../public/header.jsp" %>  
<script typte="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.4.5/plugins/jquery.edatagrid.js"></script>
</head>
<body style="padding:5px;">
<div class="easyui-layout" fit="true" border="false">
    <div region="center" border="false"> 
    	 <%--分页展示材料的信息 --%>
		 <table id="ttPart" class="easyui-datagrid" fit="true" border="true"
		        data-options="singleSelect:true,rownumbers:true"
				url="${pageContext.request.contextPath}/vehicle/queryAllParts.shtml"
			    iconCls="icon-save" 
			    pageSize="20"
				toolbar="#tbPart" pagination="true">
			<thead>
				<tr> 
					<th field="partnumbering" align="center" hidden="true" width="100">零件系统编号</th>
					<th field="partid" align="center" width="100" hidden="true">零件编号</th>
					<th field="partname" align="center" width="120" >零件名称</th>				 
					<th field="catenumbering" align="center" width="130" hidden="true" >零件类别编号</th>
					<th field="categoryid" align="center" width="130" hidden="true">类别编号</th>
					<th field="partcategory" align="center" width="130" >零件类别</th>
		  			<th field="specifications" align="center" width="50">规格</th>
		  			<th field="supplierName" align="center" width="170" >供应商名称</th>
		  			<th field="contacts" align="center" width="100" >联系人</th>	  			 
		  			<th field="contactinfo" width="120" align="center">联系方式</th> 	  	
		  			<th field="salesprice" width="80" align="center">销售价</th> 	
		  			<th field="warehouseName" width="80" align="center">仓库名称</th> 
		  			<th field="detaillocation" width="120" align="center">详细地址</th> 
		  			<th field="purchaser" width="80" align="center">采购人</th> 
		  			<th field="jobnumber" width="80" align="center">工号</th>
		  			<th field="storagetime" width="80" align="center">录入时间</th>  
		  			<th field="partflag" width="80" align="center" hidden="true">零件标记</th> 	 
		  			<th field="op" width="80" align="center" 
		  			data-options="formatter:myformatter" >操作</th> 
				</tr>
			</thead> 
		</table> 
		<%-- 工具栏 --%>
		<div id="tbPart" style="padding:3px"> 
			<span>输入关键字查询</span>
			<input id="partname" class="easyui-textbox" prompt="请输入零件名称" style="width:200px;height:30px;"/>
			<a href="#" class="easyui-linkbutton" onclick="doSearch()" iconCls="icon-search">查询</a>
			<a href="#" class="easyui-linkbutton" onclick="doCreate()" iconCls="icon-add">添加</a>
			<a href="#" class="easyui-linkbutton" onclick="javascript:$('#ttPart').datagrid('reload');" iconCls="icon-reload">刷新</a>			
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
		
		 <%-- 维修项目模态框 --%> 
		<div id="dlgmainitem" class="easyui-dialog"
			style="width: 400px; height: 370px; padding: 10px 40px" closed="true"
			buttons="#dlg-buttons" modal="true">  
			<form id="fmmainitem" method="post"> 
				<table class="mytb"> 
					<tr>
						<td>零件类别</td>
						<td> 
							<input id="part.partcategoryid" class="easyui-combobox" prompt="请选择零件类别" name="part.partcategoryid"
    						data-options="valueField:'id',textField:'partcategory',url:'<%=request.getContextPath() %>/baseData/searchLJCategory.shtml'" validateOnCreate="false" required="true"  style="width:200px;height:30px;"/>							　
						</td>
					</tr>
					<tr>
						<td>零件名称</td>
						<td> 
							<input id="part.partname" name="part.partname"  class="easyui-textbox" validateOnCreate="false" required="true"  style="width:200px;height:30px;" />
						</td>
					</tr>
					<tr>
						<td>零件规格</td>
						<td> 
							<input id="part.specifications" name="part.specifications"  class="easyui-textbox" validateOnCreate="false" required="true"  style="width:200px;height:30px;" />
						</td>
					</tr>
					<tr>
						<td>零件价格</td>
						<td> 
							<input id="part.purchaseprice" name="part.purchaseprice" type="text" class="easyui-numberbox" validateOnCreate="false" required="true"  style="width:200px;height:30px;" value="0" data-options="min:0,precision:2">
						</td>
					</tr>
					<tr>
						<td>销售价格</td>
						<td> 
							<input id="part.salesprice" name="part.salesprice" type="text" class="easyui-numberbox" validateOnCreate="false" required="true"  style="width:200px;height:30px;" value="0" data-options="min:0,precision:2">
						</td>
					</tr>
					<tr>
						<td>零件备注</td>
						<td> 
							<input id="part.remarks" name="part.remarks"  class="easyui-textbox" validateOnCreate="false" required="true"  style="width:200px;height:30px;" />
						</td>
					</tr>
					<tr>
						<td>供应商</td>
						<td> 
							<input id="part.supplierid" class="easyui-combobox" name="part.supplierid" prompt="请选择供应商"
    						data-options="valueField:'id',textField:'suppliername',url:'<%=request.getContextPath() %>/baseData/searchSuppliers.shtml'" validateOnCreate="false" required="true"  style="width:200px;height:30px;"/>							　
						</td>
					</tr>
					<tr>
						<td>仓库</td>
						<td> 
						   <input id="storage.warehouseid" class="easyui-combobox" name="storage.warehouseid" prompt="请选择仓库"
    						data-options="valueField:'id',textField:'warehousename',url:'<%=request.getContextPath() %>/baseData/searchWareHouse.shtml'" validateOnCreate="false" required="true"  style="width:200px;height:30px;"/>							　
						</td>
					</tr>
					<tr>
						<td>详细位置</td>
						<td> 
							<input id="storage.detaillocation" name="storage.detaillocation"  class="easyui-textbox" validateOnCreate="false" required="true"  style="width:200px;height:30px;" />
						</td>
					</tr>	
					<tr>
						<td>库存量</td>
						<td> 
							<input id="storage.inventory" name="storage.inventory" type="text" class="easyui-numberbox" validateOnCreate="false" required="true"  style="width:200px;height:30px;" value="0" data-options="min:0,precision:0">						 
						</td>
					</tr>				 		
				</table>
			</form>
		</div>
		<div id="dlg-buttons">
			<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
				onclick="saveMainitem()">保存</a> <a href="#" class="easyui-linkbutton"
				iconCls="icon-cancel" onclick="javascript:$('#dlgmainitem').dialog('close')">取消</a>
		</div>
		<%-- 配件添加结束 --%>
    </div>
    <div region="south" style="height:10px;" border="false">		
    </div>  
    <script type="text/javascript">      	
     	// 打开添加零件的模态框
     	function doCreate(){
     		$("#dlgmainitem").dialog("open").dialog("setTitle","添加零件信息");
     	}
     	
     	// 保存
     	function saveMainitem(){
     		$.messager.progress();  
	  		$('#fmmainitem').form('submit', {
	  			url:"<%=request.getContextPath()%>/baseData/storagePart.shtml",
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
	  				$("#dlgmainitem").dialog('close');    			 
	  				$.messager.progress('close'); 
	  				$("#ttPart").datagrid("reload");
	  				// 充值form
	  				$("#fmmainitem").form("reset");
	  			}
	  		})
     	}
     	
     	// 格式化
     	function myformatter(value,row,index){
     		return '<a href="javascript:void(0);" style="color:blue;" onclick="del('+row.partid+')">删除</a>';
     	}
     	
     	// 删除
     	function del(partid){     		 
     		 $.messager.confirm("操作提示","是否确认删除?",function(r){
        		 if(r){ 
                    $.ajax({
                    	url:"<%=request.getContextPath()%>/baseData/delPart.shtml",
                    	type:"post",
                    	data:{
                    		partid:partid
                    	},
                    	dataType:"json"
                    }).done(function(data){
                    	// 判断
                    	if(!data.isError){
    	  					$.messager.alert("操作提示","操作成功!","info");
    	  					// 重新加载
    	  					$("#ttPart").datagrid("reload");
    	  				}else{
    	  					$.messager.alert("操作提示","操作失败!","info");
    	  				}
                    });
        		 }
        	 });
     	}
    </script>
</div>
</body>
</html>