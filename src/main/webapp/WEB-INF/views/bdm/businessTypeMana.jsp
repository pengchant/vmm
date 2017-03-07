<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../public/header.jsp" %>  
<style>
	.mytb{ 
		width:100%;
		margin-top:20px;
		margin-bottom:20px;
	}
	
	.mytb tr{
		height:35px;
		line-height:35px;
	}
</style>
</head>
<body style="padding:5px;">
<div class="easyui-layout" fit="true" border="false">
    <div region="center" border="false">
       	<table id="dgcategory" title="维修项目大类" class="easyui-datagrid"
					fit="true"
					fitColumns="true"
					url="${pageContext.request.contextPath}/baseData/queryAllProjCategory.html" toolbar="#toolbar1"
					rownumbers="true"  singleSelect="true">
			<thead>
				<tr>
					<th field="id" align="center" width="100" hidden="true" >编号</th>
					<th field="numbering" align="center" width="100">系统编号</th>							 
					<th field="projname" align="center"  width="150">项目大类名称</th>
					<th field="catflag" align="center"  width="150" formatter="statusfm">大类的状态</th>
					<th field="op" align="center"  width="150" formatter="fmcategory">操作</th>
				</tr>
			</thead>
		</table>
		<div id="toolbar1">
			<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"
				onclick="newProjCatgory()">添加</a> <a href="#" class="easyui-linkbutton"
				iconCls="icon-edit" plain="true" onclick="editProjCatgory()">修改</a> 
				<a href="#" iconcls="icon-arrow_refresh" class="easyui-linkbutton" plain="true"  onclick="refreshCategory()">刷新</a>
		</div>
    </div> 
    <div region="south" style="height:10px;" border="false">

    </div>   
    
   
	<%-- 维修大类模态框 --%>
	<div id="dlgcategory" class="easyui-dialog"
		style="width: 400px; height: 220px; padding: 10px 20px" closed="true"
		buttons="#dlg-buttons1" modal="true">  
		<form id="fmcategory" method="post"> 
			<table class="mytb"> 
				<tr>
					<td>项目编号</td>
					<td> 
						<input id="projcategorycode" name="projcategorycode" class="easyui-textbox" validateOnCreate="false" required="true"  style="width:200px;height:30px;" />
					</td>
				</tr>
				<tr>
					<td>项目名称</td>
					<td> 
						<input id="projcategory" name="projcategory"  class="easyui-textbox" validateOnCreate="false" required="true"  style="width:200px;height:30px;" />
					</td>
				</tr> 
			</table>
		</form>
	</div>
	<div id="dlg-buttons1">
		<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
			onclick="saveCategory()">保存</a> <a href="#" class="easyui-linkbutton"
			iconCls="icon-cancel" onclick="javascript:$('#dlgcategory').dialog('close')">取消</a>
	</div>
	
	
    
    <%--与页面交互的js部分 --%>
    <script type="text/javascript">  
    	 var categoryurl = '';
    
    	 // 维修项目类别格式化
    	 function fmcategory(value,row,index){
    		  if(row.catflag=="1"){
	  			  return '<button onclick="stopcategory('+index+')" style="border:none;margin:2px;color:white;cursor:pointer;background:orange;border-radius:3px;width:85px;height:26px;">关闭</button>';
	  		  }else{
	  			  return '<button onclick="startcategory('+index+')" style="border:none;margin:2px;color:white;cursor:pointer;background:#2993CF;border-radius:3px;width:85px;height:26px;">开启</button>'; 
	  		  }
    	 }
    	  
    	 
    	 function statusfm(value,row,index){
    		 if(value=="1"){
    			 return '<label style="color:green;">启用</label>';
    		 }else{
    			 return '<label style="color:red;">禁用</label>';
    		 }
    	 }
    	 
    	  
    	  
    	 
    	 // 开启维修大类
    	 function startcategory(index){
    		 let row = $("#dgcategory").datagrid("getRows")[index];
    		 if(row!=null){
    			 changeCategory(row.id,"1"); 
    		 } 
    	 }    	 
    	 // 关闭维修大类 
    	 function stopcategory(index){
    		 let row = $("#dgcategory").datagrid("getRows")[index];
    		 if(row!=null){
    			 changeCategory(row.id,"0"); 
    		 } 
    	 }
    	 
    	 function changeCategory(id,value){
	   		 $.ajax({
	  			  url:"${pageContext.request.contextPath}/baseData/modifyPartCategory.html?type=D",
	  			  type:"post",
	  			  dataType:"json",
	  			  data:{
	  				  id:id,
	  				  categoryflag:value
	  			  }
	  		  }).done(function(data){
	  			  if(!data.isError){ 
	  				  // 重新加载数据
	  				  refreshCategory();
	  			  }else{
	  				  $.messager.alert("操作提示","修改状态失败!","info");
	  			  }
	  		  });
    	 }
    	 
     
    	 /*******************************维修项目大类部分开始************************************/
    	 // 弹出新建维修大类模态框
    	 function newProjCatgory(){
    		 $("#fmcategory").form("reset");
    		 categoryurl = '${pageContext.request.contextPath}/baseData/modifyPartCategory.html?type=C';    		 
    		 $('#dlgcategory').dialog('open').dialog('setTitle','添加维修大类'); 
    	 }
    	 
    	 // 弹出修改维修大类模态框
    	 function editProjCatgory(){
    		 let row = $("#dgcategory").datagrid("getSelected");
    		 if(row==null){
    			 $.messager.alert("操作提示","请先选择你要修改的记录!","info");
    		 }else{
    			 // 设置值 
    			 $("#projcategorycode").textbox("setValue",row.numbering);
    			 $("#projcategory").textbox("setValue",row.projname); 
    			 categoryurl = '${pageContext.request.contextPath}/baseData/modifyPartCategory.html?type=U&id='+row.id;
        		 $('#dlgcategory').dialog('open').dialog('setTitle','修改维修大类');  
    		 } 
    	 }
    	 
    	 function saveCategory(){
    		 $.messager.progress();	 
    		 $('#fmcategory').form('submit', {
    			url:categoryurl,
    		 	onSubmit: function(){
    		 		var isValid = $(this).form('validate');
    		 		if (!isValid){
    		 			$.messager.progress('close');	 
    		 		}
    		 		return isValid;	 
    		 	},
    		 	success: function(data){
    		 		$.messager.progress('close');	 
	      			 if(data.isError){
	      				 $.messager.alert("操作提示","系统暂时无法提供服务，请稍后重试!","info");
	      			 }else{
	      				 $.messager.alert("操作提示","操作成功!","info");
	      			 }
	      			 $('#dlgcategory').dialog('close');
	      			refreshCategory(); 
	      			refresh(); 
    		 	}
    		 }); 
    	 }
    	  
    	 // 刷新大类
    	 function refreshCategory(){
    		 $("#dgcategory").datagrid("reload");
    	 } 
    </script>
</div>
</body>
</html>