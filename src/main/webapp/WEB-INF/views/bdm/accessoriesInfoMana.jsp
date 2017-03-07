<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../public/header.jsp" %>  
<script typte="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.4.5/plugins/jquery.edatagrid.js"></script>
</head>
<body style="padding:5px;">
<div class="easyui-layout" fit="true" border="false">
    <div region="center" border="false"> 
    	<table id="dg" title="配件类别管理" fit="true"
		  toolbar="#toolbar" idField="id" rownumbers="true" fitColumns="true" pagination="true"
		  singleSelect="true"
		  pageSize="20">
		  	<thead>
		  		<tr>
		  			<th align="center" field="numbering" width="50" editor="{type:'validatebox',options:{required:true}}">零件类别编号</th>
		  			<th align="center" field="partcategory" width="50" editor="{type:'validatebox',options:{required:true}}">零件类别名称</th>
		  			<th align="center" field="partcatflag" width="50" formatter="statusfm">标记</th>
		  			<th align="center" field="op" width="50" formatter="opfm">操作</th>
		  		</tr>
		  	</thead>
		  </table>
		  <div id="toolbar" style="padding:3px;">
		  	<span>项目状态: </span>
            <select id="cc" class="easyui-combobox" name="dept" style="width:150px;height:26px;">
		       <option value="1">有效</option>
		       <option value="0">已删除</option> 
		    </select> 
		    <a href="#" iconCls="icon-search" class="easyui-linkbutton" onclick="doSearch()">查询</a>
		  	<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="javascript:$('#dg').edatagrid('addRow');">新建</a> 
			<a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="javascript:$('#dg').edatagrid('saveRow')">保存</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-undo" plain="true" onclick="javascript:$('#dg').edatagrid('cancelRow')">取消</a>
		  </div>
    </div>
    <div region="south" style="height:10px;" border="false">
		
    </div>  
    <script type="text/javascript">      	
    
	   $("#dg").edatagrid({
	 		url:"${pageContext.request.contextPath}/baseData/S/partCategoryManage.html",
	 		saveUrl:"${pageContext.request.contextPath}/baseData/M/partCategoryManage.html?type=C",
	 		updateUrl:"${pageContext.request.contextPath}/baseData/M/partCategoryManage.html?type=U" 
	 	});
	   
	   function statusfm(value,row,index){
		   if(value=="1"){
		   		return "<label style='color:green;'>有效</label>";
		   }else{
			   return "<label style='color:red;'>无效</label>";
		   }
	   }
	   
	   // 格式化操作
	   function opfm(value,row,index){
		   if(row.partcatflag=="1"){
			   return "<button onclick='del("+index+")' style='cursor:pointer;border:none;border-radius:2px;background:red;color:white;'>删除</button>";
		   }else{
			   return "<button onclick='rel("+index+")' style='cursor:pointer;border:none;border-radius:2px;background:orange;color:white;'>还原</button>";
		   }
	   }	   
	   
	   // 查询
	   function doSearch(){
		   $("#dg").datagrid("load",{ 
			   status:$("#cc").combobox("getValue")
	  		});
	   }
	   
	   // del操作
	   function del(index){
		   let row = $("#dg").datagrid("getRows")[index];
		   modifystatus(row.id,"0");
	   }
	   
	   // rel操作
	   function rel(index){
		   let row = $("#dg").datagrid("getRows")[index];
		   modifystatus(row.id,"1");
	   }
	   
	   // 修改状态操作
	   function modifystatus(id,status){
		   $.ajax({
			   url:"${pageContext.request.contextPath}/baseData/M/partCategoryManage.html?type=D",
			   data:{
				   id:id,
				   partcatflag:status
			   },
			   dataType:"json",
			   type:"post"
		   }).done(function(data){
			   if(data.isError){
				   $.messager.alert("操作提示","操作失败!","info");
			   }
			   $("#dg").datagrid("reload");
		   });
	   }
    </script>
</div>
</body>
</html>