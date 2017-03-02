<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../public/header.jsp" %>
</head>
<body style="padding:5px;">
<div class="easyui-layout" fit="true" border="false">
    <div region="center" border="false">
        <table fit="true" id="dg" class="easyui-datagrid" title="采购配件查询" iconCls="icon-cart_add"
               toolbar="#tb" idField="id"
               rownumbers="true" singleSelect="true" pagination="true">
            <thead>
            <tr>
                <th field="firstname" align="center" width="50">编号</th>
                <th field="lastname" align="center" width="180" >零件大类</th>
                <th field="phone" align="center" width="180" >零件名称</th>
                <th field="email" align="center" width="100">所需数量</th>
                <th field="email2" align="center" width="150">最早请求日期</th>
                <th field="email2" align="center" width="150">最近请求日期</th>
                <th field="email4" align="center" width="100">采购状态</th>
                <th field="operation" align="center" width="100">操作</th>
            </tr>
            </thead>
        </table>
        <div id="tb" style="padding:5px">
            <span>关键字:&nbsp;&nbsp;&nbsp;&nbsp;</span>
            <input id="id" class="easyui-textbox" prompt="请输入零件名称/大类名称"
                   style="width:170px;height:26px;">&nbsp;&nbsp;&nbsp;&nbsp;
            <span>采购状态:</span>
            <select class="easyui-combobox" name="dept" style="width:170px;height:26px;">
                <option>待采购</option>
                <option>已入库</option>
            </select>&nbsp;&nbsp;
            <br/>
            <br/>
            <span>开始时间:</span>
            <input id="ds" type="text" value="3/4/2010 2:3" style="width:170px;height:26px;" class="easyui-datebox"  />
            &nbsp;&nbsp;
            <span>结束时间:</span>
            <input id="de" type="text" value="3/4/2010 2:3" style="width:170px;height:26px;" class="easyui-datebox"  />
            &nbsp;&nbsp;
            <a href="#" iconCls="icon-search" class="easyui-linkbutton" onclick="doSearch()">条件查询</a>
            &nbsp;&nbsp;
            <a href="#" iconCls="icon-arrow_refresh" class="easyui-linkbutton">刷新所有</a>
            &nbsp;&nbsp;
            <a href="#" iconCls="icon-page_excel" class="easyui-linkbutton">导出待采购的excel</a>
        </div>

    </div>
    <div region="south" style="height:10px;" border="false">

    </div>
</div>
</body>
</html>