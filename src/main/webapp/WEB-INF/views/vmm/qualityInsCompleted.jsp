<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="../public/header.jsp" %>
</head>
<body style="padding:5px;">
<div class="easyui-layout" fit="true" border="false">
    <div region="center" border="false">
        <table fit="true" id="dg" class="easyui-datagrid" title="质检完工" iconCls="icon-comment_edit"
               toolbar="#tb" idField="id"
               rownumbers="true" fitColumns="true" singleSelect="true" pagination="true"
                url="validate.json">
            <thead>
            <tr>
                <th field="number" align="center" width="50" sortable="true">单据号</th>
                <th field="owner" align="center" width="50" sortable="true">车主</th>
                <th field="carnumber" align="center" width="50" sortable="true">汽车牌号</th>
                <th field="entrytime" align="center" width="50" sortable="true">进场时间</th>
                <th field="progress" align="center" width="50" sortable="true">施工进度</th>
                <th field="operation" align="center" width="50"  formatter="myFormatter">质检操作</th>
            </tr>
            </thead>
        </table>
        <div id="tb" style="padding:5px">
            <span>关键字:</span>
            <input id="id" class="easyui-textbox" prompt="请输入用户名/手机号/车牌号"
                   style="width:150px;height:26px;">&nbsp;&nbsp;
            &nbsp;&nbsp;
            <span>进场开始时间:</span>
            <input id="ds" type="text" value="3/4/2010 2:3" style="width:150px;height:26px;" class="easyui-datebox"  />
            &nbsp;&nbsp;<span>进场结束时间:</span>
            <input id="de" type="text" value="3/4/2010 2:3" style="width:150px;height:26px;" class="easyui-datebox"  />
            &nbsp;&nbsp;<span>质检状态:</span>
            <select id="cc" class="easyui-combobox" name="dept" style="width:150px;height:26px;">
                <option value="aa">已质检</option>
                <option>未质检</option>
            </select>
            &nbsp;&nbsp;
            <a href="#" iconCls="icon-search" class="easyui-linkbutton" onclick="doSearch()">条件查询</a>
            &nbsp;&nbsp;
            <a href="#" iconCls="icon-arrow_refresh" class="easyui-linkbutton">刷新所有</a>
        </div>

    </div>
    <div region="south" style="height:10px;" border="false">

    </div>
</div>
<script type="text/javascript">
    $("#dg").datagrid({
        "url":"validate.json",
        "method":"get"
    });

    function myFormatter(val,row){
        return '<a class="easyui-linkbutton" href="'+row.operation.url+'">质检</a>';
    }
</script>
</body>
</html>