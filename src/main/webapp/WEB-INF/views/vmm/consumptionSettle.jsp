<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../public/header.jsp" %>
</head>
<body style="padding:5px;">
<div class="easyui-layout" fit="true" border="false">
    <div region="center" border="false">
        <table fit="true" id="dg" class="easyui-datagrid" title="消费结算" iconCls="icon-money"
               toolbar="#tb" idField="id"
               rownumbers="true" fitColumns="true" singleSelect="true" pagination="true">
            <thead>
            <tr>
                <th field="firstname" align="center" width="50">编号</th>
                <th field="lastname" align="center" width="50" >车主</th>
                <th field="phone" align="center" width="50" >汽车牌号</th>
                <th field="email" align="center" width="50">车型</th>
                <th field="email2" align="center" width="50">发动机号</th>
                <th field="email3" align="center" width="50">入场时间</th>
                <th field="email5" align="center" width="50">预计提车时间</th>
                <th field="email1" align="center" width="50">维修单任务状态</th>
                <th field="email4" align="center" width="50">结算状态</th>
                <th field="operation" align="center" width="50">操作</th>
            </tr>
            </thead>
        </table>
        <div id="tb" style="padding:5px">
            <span>关键字:&nbsp;&nbsp;&nbsp;&nbsp;</span>
            <input id="id" class="easyui-textbox" prompt="请输入用户名/手机号/车牌号"
                   style="width:170px;height:26px;">&nbsp;&nbsp;

            <span>入场开始时间:</span>
            <input id="ds" type="text" value="3/4/2010 2:3" style="width:170px;height:26px;" class="easyui-datebox"  />
            &nbsp;&nbsp;<span>入场结束时间:</span>
            <input id="de" type="text" value="3/4/2010 2:3" style="width:170px;height:26px;" class="easyui-datebox"  />
            &nbsp;&nbsp;
            <span>支付状态:</span>
            <select class="easyui-combobox" name="dept" style="width:170px;height:26px;">
                <option value="aa">已结算</option>
                <option>未结算</option>
            </select>&nbsp;&nbsp;
            <a href="#" iconCls="icon-search" class="easyui-linkbutton" onclick="doSearch()">条件查询</a>
            &nbsp;&nbsp;
            <a href="#" iconCls="icon-arrow_refresh" class="easyui-linkbutton">刷新所有</a>
        </div>

    </div>
    <div region="south" style="height:10px;" border="false">

    </div>
</div>
</body>
</html>