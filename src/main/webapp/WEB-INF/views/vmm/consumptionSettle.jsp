<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../public/header.jsp" %>
</head>
<body style="padding:5px;">
<div class="easyui-layout" fit="true" border="false">
    <div region="center" border="false">
        <table fit="true" id="dg" class="easyui-datagrid" title="消费结算" iconCls="icon-money"
               toolbar="#tb" idField="id"
               data-options="url:'${pageContext.request.contextPath}/vehicle/queryPaying.html'"
               rownumbers="true" fitColumns="true" singleSelect="true" pagination="true">
            <thead>
            <tr>
                <th field="ordersid" hidden="true" align="center" width="50">订单编号</th>
                <th field="numbering" align="center" width="50" >流水号</th>
                <th field="customerid" hidden="true" align="center" width="50" >用户的编号</th>
                <th field="customername" align="center" width="50">用户名</th>
                <th field="contactinfo" align="center" width="50">联系方式</th>
                <th field="vehicleid" hidden="true" align="center" width="50">汽车编号</th>
                <th field="vehname" align="center" width="50">汽车名称</th>
                <th field="carmodel" align="center" width="50">汽车型号</th>
                <th field="warrcontent" align="center" width="50">维修内容</th>
                <th field="bustatusid" hidden="true" align="center" width="50">业务状态编号</th>
                <th field="busstatus" align="center" width="50" formatter="statusfm">状态</th>
                <th field="paystatusid" hidden="true" align="center" width="50">支付状态编号</th>
                <th field="paystatus" align="center" width="50">支付状态</th>
                <th field="esdeliverytime" align="center" width="50">预计提车时间</th>
                <th field="ptotal" align="center" width="50" formatter="ylfm">用料费用</th>
                <th field="mtotal" align="center" width="50" formatter="fxfm">维修项目工费</th>
                <th field="totalcost" align="center" width="50" formatter="tlfm">合计费用</th>
                <th field="operation" align="center" width="50" formatter="myformatter">支付</th>
            </tr>
            </thead>
        </table>
        <div id="tb" style="padding:5px">
            <span>关键字:&nbsp;&nbsp;&nbsp;&nbsp;</span>
            <input id="keyworld" class="easyui-textbox" prompt="请输入用户名/手机号/车牌号"
                   style="width:150px;height:26px;">&nbsp;&nbsp;

            <span>入场开始时间:</span>
            <input id="starttime" type="text" value="3/4/2010 2:3" style="width:150px;height:26px;" class="easyui-datebox"  />
            &nbsp;&nbsp;<span>入场结束时间:</span>
            <input id="endtime" type="text" value="3/4/2010 2:3" style="width:150px;height:26px;" class="easyui-datebox"  />
            &nbsp;&nbsp;
            <span>支付状态:</span>
            <select id="paystatus" class="easyui-combobox" name="dept" style="width:150px;height:26px;">
                <option value="aa">已结算</option>
                <option>未结算</option>
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

	// 查询
	function doSearch(){
		$('#dg').datagrid('load',{
			keyworld:$("#keyworld").textbox("getValue"),
			starttime:$("#starttime").datebox("getValue"),
			endtime:$("#endtime").datebox("getValue"),
			paystatusid:$("#paystatus").combobox("getValue")
		});
	}
	
	// 刷新
	function refresh(){
		$('#dg').datagrid("reload");
	}

	// 用料费用
	function ylfm(value,row,index){
		return "<span style='color:orange;font-weight:800;font-size:15px;'>￥"+value+"</span>";
	}
	
	// 维修项目费用
	function fxfm(value,row,index){
		return "<span style='color:#1188CC;font-weight:800;font-size:15px;'>￥"+value+"</span>";
	}
	
	function tlfm(value,row,index){
		return "<span style='color:red;font-weight:800;font-size:15px;'>￥"+value+"</span>";
	}

	// 状态格式化
	function statusfm(value,row,index){
		if(row.paystatusid=='1'){
			return "<span style='color:red;'>"+value+"</span>";
		}else{
			return "<span style='color:green;'>"+value+"</span>";
		}
	}

	// 格式化
	function myformatter(value,row,index){
		if(row.paystatusid=='1'){
		 	return '<button style="cursor:pointer;border:none;color:white;background:#1188CC;width:80px;height:30px;border-radius:3px;margin:3px;">支付</button>';
		}else{
			return '--';
		}
	}
</script>
</body>
</html>