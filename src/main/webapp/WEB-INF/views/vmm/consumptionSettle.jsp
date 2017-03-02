<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../public/header.jsp" %>
<style>
	.p_title{  
		font-size:13px;
		padding:5px; 
		padding:0px;
		margin:0px;
		margin-top:10px; 
	}
	
	#pay{
		padding:20px;
	}
	
	.mytitle{
		width:115px;
		height:30px;
		line-height:30px;
		text-align:center;
		display:inline-block;
		border-top-left-radius:3px;
		border-top-right-radius:3px;
		background:#108ACD;
		color:white;
	}
	
	.money{
		font-weight:800;
		color:orange;
		font-size:14px;
	}
	
	 
</style>
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

		<%-- 审核的模态框 --%>
		<div id="pay">
			<input type="hidden" id="myordersid"/>
			<form id="payfm" method="post"> 
				 <div>
				 	<p class="p_title"><span class="mytitle">维修用料情况</span></p>
				    <table id="tb_yl" class="easyui-datagrid" style="width:100%;"
				            data-options="rownumbers:true,url:'${pageContext.request.contextPath}/vehicle/queryAllPartUsed.html',fitColumns:true,singleSelect:true">
				        <thead>
				            <tr>
				                <th data-options="field:'partname',width:60" align="center">用料名称</th>
				                <th data-options="field:'salesprice',width:60" align="center">用料单价</th>
				                <th data-options="field:'receivednum',width:60" align="center">用料数量</th>
				                <th data-options="field:'ptotal',width:60" align="center">小计</th>
				            </tr>
				        </thead>
				    </table>
				    <p><label style="float:right;margin-right:20px;">维修用料小计：￥<span id="totalyl" class="money">00.00</span></label></p>
				 </div>
				 <div style="clear:both;"></div>
				 <div>
				 	<p class="p_title p_fx"><span class="mytitle">维修项目情况</span></p>
				 	 <table id="tb_wx" class="easyui-datagrid" style="width:100%;"
				            data-options="rownumbers:true,url:'${pageContext.request.contextPath}/vehicle/queryMainitemUsed.html',fitColumns:true,singleSelect:true">
				        <thead>
				            <tr>
				                <th data-options="field:'projName',width:60" align="center">项目名称</th>
				                <th data-options="field:'itemprice',width:60" align="center">项目单价</th>
				                <th data-options="field:'spenttime',width:60" align="center">项目工时</th>
				                <th data-options="field:'totalcost',width:60" align="center">小计</th>
				            </tr>
				        </thead>
				    </table>
				    <p><label style="float:right;margin-right:20px;">维修项目小计：￥<span id="totalwx"  class="money">00.00</span></label></p>
				 </div>
				 <div style="clear:both;"></div>
				 <hr style="border:solid 1px #EAEAEA;"/>
				 <p style="margin:0px;padding:0px;">
				 	<span style="float:left;">费用总计：￥<span class="money" id="totalcost" style="color:red;">00.00</span></span>
				 </p>
			</form> 
		</div>
		<div id="shtb">
			<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="pay()">确定支付</a>
			<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="$('#pay').dialog('close')">取消支付</a>
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
	
	// 合计费用
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
		 	return '<button onclick="paymoney('+index+')" style="cursor:pointer;border:none;color:white;background:#1188CC;width:80px;height:30px;border-radius:3px;margin:3px;">支付</button>';
		}else{
			return '--';
		}
	}
	
	// 支付
	function paymoney(index){
		let row = $("#dg").datagrid("getRows")[index];  
		$("#totalyl").html(row.ptotal);
		$("#totalwx").html(row.mtotal);
		$("#totalcost").html(row.totalcost);
		// 初始化数据
		$("#tb_yl").datagrid("load",{
			ordersid:row.ordersid
		});
		$("#tb_wx").datagrid("load",{
			ordersid:row.ordersid
		});
		
		$("#pay").dialog({
		    title: '支付<span style="float:right;display:inline-blox;margin-right:40px;"><span>当前支付的用户：<span style="color:orange;">'+row.customername+'</span>,汽车型号:<span style="color:#108ACD;">'+row.vehname+''+row.carmodel+'</span></span></span>',
		    width: 690,
		    height: 500,
		    closed: false,
		    cache: false,  
		    modal: true,
		    buttons:"#shtb"
		});	
		// 设置隐藏域
		$("#myordersid").val(row.ordersid);
	}
	
	function pay(){
		// 获取totalmoney,ordersid
		$.messager.confirm("确定","是否确定完成支付，该操作不能撤销?",function(r){
			if(r){
				let totalmoney = $("#totalcost").text();
				let ordersid = $("#myordersid").val();
				// 发起ajax请求
				$.ajax({
					url:"${pageContext.request.contextPath}/vehicle/paymyOrders.html",
					data:{
						ordersid:ordersid,
						totalMoney:totalmoney
					},
					dataType:"json",
					type:"post"
				}).done(function(data){ 
					console.log(data);
					$.messager.alert("操作提示","支付成功!感谢您使用汽车维修管理系统","info");
					// 关闭模态框
					$('#pay').dialog('close');
					// 清空隐藏域
					$("#myordersid").val("");
					// 重新加载数据
					$("#dg").datagrid("reload");
				});
			}
		});
	}
	
</script>
</body>
</html>