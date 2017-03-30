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
        <table id="dgmainitem" title="维修项目" class="easyui-datagrid"
					fit="true"
					fitColumns="true"
					url="${pageContext.request.contextPath}/baseData/queryAllMainItem.shtml" toolbar="#toolbar2"
					rownumbers="true" singleSelect="true">
			<thead>
				<tr>
					<th field="mainitemid" align="center" hidden="true"  width="120">维修项目编号</th>
					<th field="projName" align="center"  width="190">维修项目名称</th>
					<th field="projcategoryid" align="center" hidden="true"  width="100">大类编号</th>
					<th field="categoryname" align="center"  width="150">大类名称</th>
					<th field="itemprice" align="center"  width="150">维修单价</th>
					<th field="mainflag" align="center"  width="180" formatter="statusfm">维修项目的状态</th>
					<th field="op" align="center"  width="120" formatter="fmmainitem">操作</th>
				</tr>
			</thead>
		</table>
		<div id="toolbar2">
			<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"
				onclick="newMainItem()">添加</a> <a href="#" class="easyui-linkbutton"
				iconCls="icon-edit" plain="true" onclick="editMainItem()">修改</a>  
				<a href="#" iconcls="icon-arrow_refresh" class="easyui-linkbutton" plain="true" onclick="refresh()">刷新</a>
		</div> 
    </div> 
    <div region="south" style="height:10px;" border="false">

    </div>   
    
    <%-- 维修项目模态框 --%> 
	<div id="dlgmainitem" class="easyui-dialog"
		style="width: 400px; height: 290px; padding: 10px 20px" closed="true"
		buttons="#dlg-buttons" modal="true">  
		<form id="fmmainitem" method="post"> 
			<table class="mytb"> 
				<tr>
					<td>项目编号</td>
					<td> 
						<input id="mainnumbering" name="mainnumbering" class="easyui-textbox" validateOnCreate="false" required="true"  style="width:200px;height:30px;" />
					</td>
				</tr>
				<tr>
					<td>项目名称</td>
					<td> 
						<input id="projname" name="projname"  class="easyui-textbox" validateOnCreate="false" required="true"  style="width:200px;height:30px;" />
					</td>
				</tr>
				<tr>
					<td>项目类别</td>
					<td> 
					   <input id="projcategoryid" name="projcategoryid" data-options="required:true,validateOnCreate:false" prompt="请选择维修的类别" style="width:200px;height:30px;"  />
					</td>
				</tr>
				<tr>
					<td>项目维修价格</td>
					<td>
						<input id="itemprice" name="itemprice" validateOnCreate="false" data-options="min:0,precision:2"  class="easyui-numberbox" required="true"  style="width:200px;height:30px;" />
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
	 
    <%--与页面交互的js部分 --%>
    <script type="text/javascript"> 
    	 // 定义一个全局变量
    	 var mainitemurl = '';
   
    	 // 维修项目格式化
    	 function fmmainitem(value,row,index){
    		 if(row.mainflag=="1"){
	  			  return '<button onclick="stopmainitem('+index+')" style="border:none;margin:2px;color:white;cursor:pointer;background:orange;border-radius:3px;width:85px;height:26px;">关闭</button>';
	  		  }else{
	  			  return '<button onclick="startmainitem('+index+')" style="border:none;margin:2px;color:white;cursor:pointer;background:#2993CF;border-radius:3px;width:85px;height:26px;">开启</button>'; 
	  		  }
    	 }
    	 
    	 function statusfm(value,row,index){
    		 if(value=="1"){
    			 return '<label style="color:green;">启用</label>';
    		 }else{
    			 return '<label style="color:red;">禁用</label>';
    		 }
    	 }
    	 
    	 // 开启维修项目
    	 function startmainitem(index){
    		 let row = $("#dgmainitem").datagrid("getRows")[index];
    		 if(row!=null){
    			 changemainitem(row.mainitemid,"1"); 
    		 } 
    	 }
    	 // 关闭维修项目
    	 function stopmainitem(index){
    		 let row = $("#dgmainitem").datagrid("getRows")[index];
    		 if(row!=null){
    			 changemainitem(row.mainitemid,"0"); 
    		 } 
    	 }
    	 
    	 // 维修项目状态更改
    	 function changemainitem(id,value){
	   		 $.ajax({
	  			  url:"${pageContext.request.contextPath}/baseData/modifyMainitem.shtml?type=D",
	  			  type:"post",
	  			  dataType:"json",
	  			  data:{
	  				  id:id,
	  				  mainflag:value
	  			  }
	  		  }).done(function(data){
	  			  if(!data.isError){ 
	  				  // 重新加载数据
	  				  refresh();
	  			  }else{
	  				  $.messager.alert("操作提示","修改状态失败!","info");
	  			  }
	  		  });
    	 } 
    	 
    	 /*******************************维修项目部分开始************************************/
    	 
    	    	 
    	 // 弹出维修项目的模态框
    	 function newMainItem(){
    		 // 重置form
    		 $("#fmmainitem").form("reset");
    		 combox();
    		 mainitemurl = '${pageContext.request.contextPath}/baseData/modifyMainitem.shtml?type=C' ;
    		 $('#dlgmainitem').dialog('open').dialog('setTitle','添加维修项目');
    	 }
    	 
    	 function combox(){
    		  // 维系项目类别
	   		   $("#projcategoryid").combobox({
	   			    url:'${pageContext.request.contextPath}/vehicle/mainprojrecord/gtCT.shtml',
	   			    valueField:'id',
	   			    textField:'projname',
	   			    readOnly:true
	   		   }); 
    	 }
    	 
    	 
    	 // 弹出修改维修项目的模态框
    	 function editMainItem(){
    		 // 设置值
    		 let row = $("#dgmainitem").datagrid("getSelected");
    		 if(row==null){
    			 $.messager.alert("操作提示","请先选择你要修改的记录!","info");
    		 }else{
    			 combox();
    			 // 设置路径
    			 mainitemurl = '${pageContext.request.contextPath}/baseData/modifyMainitem.shtml?type=U&id='+row.mainitemid; 
    			 $("#mainnumbering").textbox("setValue",row.mainitemid);
        		 $("#projname").textbox("setValue",row.projName);
        		 $("#projcategoryid").combobox("setValue",row.projcategoryid);
        		 $("#itemprice").textbox("setValue",row.itemprice);
        		 $('#dlgmainitem').dialog('open').dialog('setTitle','修改维修项目'); 
    		 } 
    	 }
    	 
    	 // 修改维修项目
    	 function saveMainitem(){ 
    		 $.messager.progress();	 
    		 $('#fmmainitem').form('submit', {
    			url:mainitemurl,
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
	      			refresh();
	      			
    		 	}
    		 }); 
    	 } 
    	 
    	 // 刷新
    	 function refresh(){
    		 $("#dgmainitem").datagrid("reload");
    	 }
    	  
    </script>
</div>
</body>
</html>