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
        <table fit="true" id="dg" class="easyui-datagrid" title="单据查询" 
               toolbar="#tb" idField="ordersid" 
               data-options="url:'${pageContext.request.contextPath}/financial/getOrders.html'"
               rownumbers="true" singleSelect="true" pagination="true">
            <thead>
	           <tr>
	               <th field="ordersid" align="center"  width="50">编号</th>
	               <th field="customerid" align="center" hidden="true"  width="50" >客户的编号</th>
	               <th field="numbering" align="center"  width="100" >客户名</th>
	               <th field="contactinfo"  align="center" width="150">客户联系方式</th>
	               <th field="vehicleid"  align="center" width="150">汽车编号</th>
	               <th field="platenum"  align="center" width="100">汽车牌号</th>
	               <th field="warrcontent" align="center" width="190">维修项目内容</th>
	               <th field="settlementdate" align="center" width="120">结算时间</th>
	               <th field="totalamount" align="center" width="180">总额</th> 
	           </tr>
            </thead>
        </table> 
        
        <div id="tb" style="padding:5px;">
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
	
	// 条件查询
	function doSearch(){
		$('#dg').datagrid('load',{
			starttime:$("#ds").datebox("getValue"),
			endtime:$("#de").datebox("getValue")
		});
	}
</script>
</body>
</html>