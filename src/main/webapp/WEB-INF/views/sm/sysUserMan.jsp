<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../public/header.jsp" %>
<style>
	 
</style>
</head>
<body style="padding:5px;">
<div class="easyui-layout" fit="true" border="false">
    <div region="center" border="false">
        <table fit="true" id="dg" class="easyui-datagrid" title="用户 信息" 
               toolbar="#tb" idField="id"
               data-options="url:'${pageContext.request.contextPath}/base/queryUser.html'"
               rownumbers="true" fitColumns="true" singleSelect="true" pagination="true">
            <thead>
            <tr>
                <th field="userinfoid" hidden="true" align="center" width="50" formatte>用户编号</th>
                <th field="username" align="center" width="50" >用户名</th>
                <th field="concatinfo" align="center" width="50" >联系方式</th>
                <th field="jobnumber" align="center" width="50">工号</th>
                <th field="address" align="center" width="50">地址</th>
                <th field="entrytime"  align="center" width="50">入职时间</th>
                <th field="userflag" align="center" width="50" hidden="true">用户标记</th>
                <th field="sectorid" hidden="true" align="center" width="50">部门编号</th>
                <th field="deptname" align="center" width="50">部门</th>
                <th field="accountid" hidden="true" align="center" width="50">账户编号</th>
                <th field="accountnumber" align="center" width="50">账号</th> 
            </tr>
            </thead>
        </table>
        <div id="tb" style="padding:5px">
            <span>关键字:&nbsp;&nbsp;&nbsp;&nbsp;</span>
            <input id="keyworld" class="easyui-textbox" prompt="请输入用户名/手机号/车牌号"
                   style="width:150px;height:26px;">&nbsp;&nbsp;

            <span>开始时间:</span>
            <input id="starttime" type="text" value="3/4/2010 2:3" style="width:150px;height:26px;" class="easyui-datebox"  />
            &nbsp;&nbsp;<span>结束时间:</span>
            <input id="endtime" type="text" value="3/4/2010 2:3" style="width:150px;height:26px;" class="easyui-datebox"  />
            &nbsp;&nbsp;
            <span>支付状态:</span>
            <select id="paystatus" class="easyui-combobox" name="dept" style="width:150px;height:26px;">
                <option value="">全部</option>
                <option value="1">未结算</option>
                <option value="2">已结算</option> 
            </select>&nbsp;&nbsp;
            <a href="#" iconCls="icon-search" class="easyui-linkbutton" onclick="doSearch()">条件查询</a>
            &nbsp;&nbsp;
            <a href="#" id="refresh" iconCls="icon-arrow_refresh" onclick="refresh()" class="easyui-linkbutton">刷新所有</a>
        </div> 
    </div>
    <div region="south" style="height:10px;" border="false">

    </div>
</div>
<script type="text/javascript"> 
</script>
</body>
</html>