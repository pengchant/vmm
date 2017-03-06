<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../public/header.jsp" %>  
<style>
	 
</style>
</head>
<body style="padding:5px;">
<div class="easyui-layout" fit="true" border="false">
    <div region="center" border="false">
        <table fit="true" id="dg" class="easyui-datagrid" title="系统基础数据配置" iconCls="icon-shield"
               toolbar="#tb" idField="id"
               url="${pageContext.request.contextPath}/baseData/queryallPermisson.html"
               rownumbers="true" singleSelect="true" 
               pageSize="20"
               fitColumns="true">
            <thead>
            <tr>
                <th  field="id" align="center" width="80" hidden="true">编号</th>
                <th  field="_myicon" align="center" width="80" formatter="iconfm">图标</th>
                <th  field="pername" align="center" width="100">权限名称</th>
                <th  field="authcategory" align="center" width="100">权限类别</th>
                <th  field="_myurl" align="center" width="200" formatter="urlfm">系统内部地址</th>
                <th field="perflag" align="center" width="80" formatter="myfm">权限状态</th> 
                <th  field="op" align="center" width="110" formatter="opfm">操作</th>
            </tr>
            </thead>
        </table> 
    </div>
    <div region="south" style="height:10px;" border="false">

    </div>   
    <script type="text/javascript"> 
    	  function myfm(value,row,index){
    		  let a = '';
    		  if(value=="1"){
    			 a = '<span style="color:green;">已启用</span>';
    		  }else{
    			 a = '<span style="color:red;">禁用</span>';
    		  }
    		  return a;
    	  }
    	  
    	  function urlfm(value,row,index){  
    		  return row.perurl.split("#")[0];;
    	  }
    	  
    	  function iconfm(value,row,index){ 
    		  let icon = row.perurl.split("#")[1];
    		  return '<img src="${pageContext.request.contextPath}/js/jquery-easyui-1.4.5/themes/icons/'+icon.substring(5)+'.png" />';
    	  }
    	  
    	  // 权限状态操作
    	  function opfm(value,row,index){
    		  if(row.perflag=="1"){
    			  return '<button onclick="stop('+index+')" style="border:none;margin:2px;color:white;cursor:pointer;background:orange;border-radius:3px;width:85px;height:26px;">关闭</button>';
    		  }else{
    			  return '<button onclick="start('+index+')" style="border:none;margin:2px;color:white;cursor:pointer;background:#2993CF;border-radius:3px;width:85px;height:26px;">开启</button>'; 
    		  }
    	  }
    	  
    	  // 开启权限
    	  function start(index){
    		  let row = $("#dg").datagrid("getRows")[index];
    		  modifypermission("1",row.id);
    	  }
    	  
    	  // 关闭权限
    	  function stop(index){
    		  let row = $("#dg").datagrid("getRows")[index];
    		  modifypermission("0",row.id);
    	  }
    	  
    	  // 修改权限
    	  function modifypermission(flag,id){
    		  $.ajax({
    			  url:"${pageContext.request.contextPath}/baseData/modifyPermission.html",
    			  type:"post",
    			  dataType:"json",
    			  data:{
    				  id:id,
    				  perflag:flag
    			  }
    		  }).done(function(data){
    			  if(!data.isError){ 
    				  // 重新加载数据
    				  $("#dg").datagrid("reload");
    			  }else{
    				  $.messager.alert("操作提示","修改状态失败!","info");
    			  }
    		  });
    	  }
    </script>
</div>
</body>
</html>