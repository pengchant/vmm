<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="../public/header.jsp" %>
</head>
<body style="padding:5px;">
<div class="easyui-layout" fit="true" border="false">
    <div region="center" border="false">
    	 <table fit="true" id="dg" class="easyui-datagrid" title="维修领料" iconCls="icon-comment_edit"
                   toolbar="#tb" idField="id"
                   data-options="pageSize:20,url:'${pageContext.request.contextPath}/vehicle/queryQualiting.html'"
                   rownumbers="true" fitColumns="true" singleSelect="true" pagination="true">
                <thead>
	                <tr> 
	                   <th field="ordernumbering" hidden="true" align="center" width="80" >订单流水号</th>
		               <th field="numbering" align="center" width="50" hidden="true">客户名</th>
		                <th field="platenum" align="center" width="50">车牌号</th>
		               <th field="contactinfo" align="center" width="50">联系方式</th>
		               <th field="warrcontent" align="center" width="100" >维修内容</th>
		               <th field="allocatetime" align="center" width="80"
		               data-options="formatter: function(value,row,index){
				 			return value.substring(0,19);
						}">开单日期</th>
		               <th field="esdeliverytime" align="center" width="80" 
		               data-options="formatter: function(value,row,index){
				 			return value.substring(0,19);
						}" hidden="true">计划完成日期</th>
		               <th field="statename" align="center" width="50" >维修状态</th>
		               <th field="ordersid" align="center" width="50" hidden="true" >接单表编号</th>
		               <th field="bustatusid" align="center" width="50" hidden="true">状态编号</th>
		               <th field="operation" align="center" width="150" formatter="myformatter">质检操作</th>
	                </tr>
                </thead>
            </table>
    	 
        <div id="tb" style="padding:5px">
            <span>关键字:&nbsp;&nbsp;&nbsp;</span>
            <input id="keyworld" class="easyui-textbox" prompt="请输入用户名/手机号/车牌号"
                   style="width:150px;height:26px;">&nbsp;&nbsp;
            &nbsp;&nbsp;
            <span>质检状态:</span>
            <select id="status" class="easyui-combobox" name="dept" style="width:150px;height:26px;">
                <option value="3">已质检</option>
                <option value="2">未质检</option>
            </select>
            <br/> 
            <br/> 
            <span>开始时间:</span>
            <input id="startTime" type="text" value="3/4/2010 2:3" style="width:150px;height:26px;" class="easyui-datebox"  />
            &nbsp;&nbsp;<span>结束时间:</span>
            <input id="endTime" type="text" value="3/4/2010 2:3" style="width:150px;height:26px;" class="easyui-datebox"  />
            &nbsp;&nbsp; 
            <a href="#" iconCls="icon-search" class="easyui-linkbutton" onclick="doSearch()">条件查询</a>
            &nbsp;&nbsp;
            <a href="#" iconCls="icon-arrow_refresh" class="easyui-linkbutton">刷新所有</a>
        </div>

    </div>
    <div region="east" style="width:450px;" border="true" split="true" title="订单维修情况">
    	 <table id="tbfixing" border:none; class="easyui-datagrid" fit="true"  rownumbers="true" fitColumns="true" singleSelect="true">
	        <thead>
	            <tr>
	                <th data-options="field:'ordersid'"  align="center" hidden="true">订单的编号</th>
	                <th data-options="field:'mainprojregid'" align="center" hidden="true">订单登记表的编号</th>
	                <th data-options="field:'mainitemid'" align="center" hidden="true">维修项目编号</th>
	                <th data-options="field:'projName',width:60" align="center">维修项目</th>
	                <th data-options="field:'categoryid'" hidden="true" align="center">类别编号</th>
	                <th data-options="field:'partcategory'" hidden="true" align="center">类别名称</th>
	                <th data-options="field:'username',width:80" align="center">维修人员</th>
	                <th data-options="field:'concatinfo',width:90" align="center">联系方式</th>
	                <th data-options="field:'mainstatus',width:50" align="center">状态</th> 
	                <th data-options="field:'haspassed',width:120"  align="center" formatter="hahafm">操作</th>
	            </tr>
	        </thead> 
	    </table>
    </div>
    <div region="south" style="height:10px;" border="false" >
		
    </div>
</div>
<%-- js部分 --%>
<script type="text/javascript">
	// 模糊查询
	function doSearch(){
		let keyworld = $("#keyworld").val();
		let startTime = $("#startTime").datebox("getValue");
		let endTime = $("#endTime").datebox("getValue");
		let status = $("#status").combobox("getValue");
		// 重新加载数据
		$('#dg').datagrid('load',{
			keyworld: keyworld,
			starttime: startTime,
			endTime:endTime,
			bustatusid:status
		});
	}

	function myformatter(value,row,index){
		let a='<button onclick="jiance('+row.ordersid+')" style="cursor:pointer;font-size:13px;border:none;background:red;border-radius:3px;color:white;">维修检测</button>';
		let b = '<button style=:border:none;background:green;color:white;border:none;border-radius:3px;">通过质检</button>';		
		return a+"&nbsp;"+b;
	}
	
	function jiance(ordersid){
		// 发起ajax请求
		$.ajax({
			url:"${pageContext.request.contextPath}/vehicle/queryFixing.html",
			type:"post",
			data:{ordersid:ordersid},
			dataType:"json"
		}).done(function(data){
			console.log(data);
			 $("#tbfixing").datagrid("loadData",data); 
		});
	}
	
	 
	function hahafm(value,row,index){
       	let a = '';
       	if(value=='0'){
       		a="<button style='border:none;background:green;color:white;'>审核</button>";
       	}else{
       		a='--';
       	}
       	return a;
      }
 
</script>
</body> 
</html>