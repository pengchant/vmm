<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../public/header.jsp" %> 
</head>
<body style="padding:5px;">
<div class="easyui-layout" fit="true" border="false">
    <div region="center" border="false">
        <table fit="true" id="dg" class="easyui-datagrid" title="库存管理" iconCls="icon-shield"
               toolbar="#tb" idField="id"
               rownumbers="true" singleSelect="true" pagination="true">
            <thead>
            <tr>
                <th field="number" align="center" width="80">编号</th>
                <th field="category" align="center" width="200">零件大类</th>
                <th field="name" align="center" width="200" >零件名称</th>
                <th field="price" align="center" width="100">采购价格</th>
                <th field="shellprice" align="center" width="100">销售价格</th>
                <th field="number" align="center" width="100">数量</th>
                <th field="location" align="center" width="200">仓库位置</th>
                <th field="operation" align="center" width="100">操作</th>
            </tr>
            </thead>
        </table>
        <div id="tb" style="padding:5px">
            <span>关键字:&nbsp;&nbsp;&nbsp;&nbsp;</span>
            <input id="id" class="easyui-textbox" prompt="请输入零件名称/大类名称"
                   style="width:170px;height:26px;">&nbsp;&nbsp;&nbsp;&nbsp;
            <span>入库开始时间:</span>
            <input id="ds" type="text" value="3/4/2010 2:3" style="width:170px;height:26px;" class="easyui-datebox"  />
            &nbsp;&nbsp;
            <span>入库结束时间:</span>
            <input id="de" type="text" value="3/4/2010 2:3" style="width:170px;height:26px;" class="easyui-datebox"  />
            &nbsp;&nbsp;
            <a href="#" iconCls="icon-search" class="easyui-linkbutton" onclick="doSearch()">条件查询</a>
            &nbsp;&nbsp;
            <a href="#" iconCls="icon-arrow_refresh" class="easyui-linkbutton">刷新所有</a>

        </div>

    </div>
    <div region="south" style="height:10px;" border="false">

    </div>
    <script type="text/javascript">
        $("#dg").datagrid({
            "url":"data.json",
            "method":"get"
        });
    </script>
</div>
</body>
</html>