<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../public/header.jsp" %>  
</head>
<body style="padding:5px;">
<div class="easyui-layout" fit="true" border="false">
    <div region="center" border="false">
        <table fit="true" id="dg" class="easyui-datagrid" title="客户资料管理" iconCls="icon-shield"
               toolbar="#tb" idField="id"
               url="${pageContext.request.contextPath}/baseData/queryallPermisson.html"
               rownumbers="true" singleSelect="true" 
               pageSize="20"
               fitColumns="true">
            <thead>
            <tr>
                <th  field="id" align="center" width="80" hidden="true">编号</th>
                <th  field="_myicon" align="center" width="20" formatter="iconfm">图标</th>
                <th  field="pername" align="center" width="100">权限名称</th>
                <th  field="authcategory" align="center" width="100">权限类别</th>
                <th  field="_myurl" align="center" width="200" formatter="urlfm">系统内部地址</th>
                <th field="perflag" align="center" width="80" formatter="myfm">权限状态</th> 
                <th  field="op" align="center" width="110">操作</th>
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
    </script>
</div>
</body>
</html>