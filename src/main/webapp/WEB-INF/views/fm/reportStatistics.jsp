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
        
    </div>
    <div region="south" style="height:10px;" border="false">

    </div>
</div>
 
 

<%-- 与页面交互的js部分 --%>
<script> 
	// 重新刷新
	function refresh(){
		$("#dg").datagrid('reload');   
	} 
</script>
</body>
</html>