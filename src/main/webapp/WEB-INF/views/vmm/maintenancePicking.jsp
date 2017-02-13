<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../public/header.jsp" %>
</head>
<body style="padding:5px;">
    <div class="easyui-layout" fit="true" border="false">
        <div region="center" border="false">
            <table fit="true" id="dg" class="easyui-datagrid" title="维修领料" iconCls="icon-comment_edit"
                   toolbar="#tb" idField="id"
                   rownumbers="true" fitColumns="true" singleSelect="true" pagination="true">
                <thead>
                <tr>
                    <th field="ck" checkbox="true"></th>
                    <th field="firstname" align="center" width="50">编号</th>
                    <th field="lastname" align="center" width="50" >车主</th>
                    <th field="phone" align="center" width="50" >汽车牌号</th>
                    <th field="email" align="center" width="50">零件大类</th>
                    <th field="email2" align="center" width="50">零件名称</th>
                    <th field="email1" align="center" width="50">规格</th>
                    <th field="email4" align="center" width="50">仓库位置</th>
                    <th field="email3" align="center" width="50">零件所需数量</th>
                    <th field="email5" align="center" width="50">库存剩余量</th>
                    <th field="email6" align="center" width="50">实际领取量</th>
                    <th field="entTime" align="center" width="50">进场时间</th>
                    <th field="entTime2" align="center" width="50">领料登记时间</th>
                    <th field="operator" align="center" width="50">检修员</th>
                    <th field="operation" align="center" width="50">操作</th>
                </tr>
                </thead>
            </table>
            <div id="tb" style="padding:10px">
                <label>维修人员:</label>
                <input type="text" class="easyui-textbox" prompt="请输入维修人员姓名/工号" style="height:26px;"/>
                 &nbsp;&nbsp;
                <span>领取状态:</span>
                <select class="easyui-combobox" name="dept" style="width:150px;height:26px;">
                    <option value="aa">待领取</option>
                    <option>领取</option>
                </select>&nbsp;&nbsp; 
                <span>开始时间:</span>
                <input id="ds" type="text" value="3/4/2010 2:3" style="height:26px;" class="easyui-datebox"  />
                &nbsp;&nbsp;<span>结束时间:</span>
                <input id="de" type="text" value="3/4/2010 2:3" style="height:26px;" class="easyui-datebox"  />
                &nbsp;&nbsp; 
                <a href="#" iconCls="icon-search" class="easyui-linkbutton" onclick="doSearch()">条件查询</a>
                &nbsp;&nbsp;
                <a href="#" iconCls="icon-arrow_refresh" class="easyui-linkbutton">刷新</a>
               
            </div>

        </div>
        <div region="south" style="height:10px;" border="false">

        </div>
    </div>
</body>
</html>