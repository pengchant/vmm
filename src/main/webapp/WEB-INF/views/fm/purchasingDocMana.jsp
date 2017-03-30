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
        <table fit="true" id="dg" class="easyui-datagrid" title="采购单据查询查询" iconCls="icon-cart_add"
               toolbar="#tb" idField="id"
               fitColumns="true"
               data-options="url:'${pageContext.request.contextPath}/financial/getPartProc.shtml'"
               rownumbers="true" singleSelect="true" pagination="true">
            <thead>
		          <tr>
		              <th field="id" align="center" width="50">编号</th>
		              <th field="partname" align="center"   width="150" >零件的名称</th>
		              <th field="suppliername" align="center"  width="180" >供应商名称</th>
		              <th field="pruchdemand"  align="center" width="100">购买量</th>
		              <th field="pruchprice"  align="center" width="60">单价</th> 
		              <th field="prucher" align="center" width="100">采购员</th>
		              <th field="totalpurchase" align="center" width="100">总计</th> 
		              <th field="partcategoryname" align="center" width="120">采购日期</th> 
		          </tr>
            </thead>
        </table>
        <div id="tb" style="padding:5px"> 
            <span>开始时间:</span>
            <input id="ds" type="text" value="3/4/2010 2:3" style="width:170px;height:26px;" class="easyui-datebox"  />
            &nbsp;&nbsp;
            <span>结束时间:</span>
            <input id="de" type="text" value="3/4/2010 2:3" style="width:170px;height:26px;" class="easyui-datebox"  />
            &nbsp;&nbsp;
            <a href="#" iconCls="icon-search" class="easyui-linkbutton" onclick="doSearch()">条件查询</a>
            &nbsp;&nbsp;
            <a href="#" iconCls="icon-arrow_refresh" class="easyui-linkbutton" onclick="refresh()">刷新所有</a>        
        </div>

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
	
	// 查询
	function doSearch(){
		$('#dg').datagrid('load',{
			starttime:$("#ds").datebox("getValue"),
			endtime:$("#de").datebox("getValue")
		});
	}
</script>
</body>
</html>