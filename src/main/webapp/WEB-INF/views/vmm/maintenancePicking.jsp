<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../public/header.jsp" %>
<style>
	.picktb{
		width:80%;
		margin:0 auto; 
		margin-top:20px;
	}
	
	.picktb tr{
		line-height:30px;
	}
	
	.picktb tr td:nth-child(2n+1){
		width:100px;
		text-align:right;
	}
	
	.picktb tr td:nth-child(2n){
		text-align:left;
	}
</style>
</head>
<body style="padding:5px;">
    <div class="easyui-layout" fit="true" border="false">
        <div region="center" border="false">
            <table fit="true" id="dg" class="easyui-datagrid" title="维修领料" iconCls="icon-comment_edit"
                   toolbar="#tb" idField="id"
                   data-options="pageSize:20,url:'${pageContext.request.contextPath}/vehicle/queryAllPickingRows.html'"
                   rownumbers="true" fitColumns="true" singleSelect="true" pagination="true">
                <thead>
                <tr> 
                	<th field="ordernumbering" align="center" width="50">接单流水号</th>
                	<th field="partname" align="center" width="50">零件</th>
                	<th field="purchaseprice" align="center" width="30">单价</th>
                	<th field="supplierName" align="center" width="80">供应商</th>
                	<th field="warehouseName" align="center" width="50" >仓库名</th> 
                	<th field="detaillocation" align="center" width="50">存放位置</th>
                	<th field="applicant" align="center" width="50">申请人</th>
                	<th field="jobnumber" align="center" width="50">申请人工号</th>
                	<th field="inventory" align="center" width="20">库存</th>
                	<th field="registedspecnum" align="center" width="20" >登记</th>
                    <th field="receivednum" align="center" width="20" >领取</th> 
                    <th field="applicattime" align="center" width="80">申请时间</th>
                    <th field="receivestatus" align="center" width="50">领取状态</th>
                    <th field="operation_action" 
                    	data-options="formatter:myformatter" 
                        align="center" width="40">操作</th> 
                        
                    <%-- 隐藏域 --%>
                    <th field="warehouseAdd" align="center" width="50" hidden="true">仓库地址</th>
                	<th field="warehouseid" align="center" width="50" hidden="true">仓库</th>
                    <th field="partusedid" align="center" width="50" hidden="true">零件使用登记表编号</th> 
                    <th field="concatinfo" align="center" width="50" hidden="true">申请人信息表编号</th> 
                    <th field="ordersid" align="center" width="50" hidden="true">接单表编号</th> 
                    <th field="customerid" align="center" width="50" hidden="true">客户编号</th>
                    <th field="vehicleid" align="center" width="50" hidden="true">汽车编号</th>
                    <th field="partid" align="center" width="50" hidden="true">零件编号</th>
                    <th field="partnumbering" align="center" width="50" hidden="true">零件流水号</th>  
                    <th field="categoryid" align="center" width="50" hidden="true">类别的编号</th>
                    <th field="supplierid" align="center" width="50" hidden="true">供应商编号</th>  
                    <th field="partstorageid" align="center" width="50" hidden="true">仓库存储表编号</th> 
                </tr>
                </thead>
            </table>
            <div id="tb" style="padding:10px">
                <label>维修人员:</label>
                <input type="text" id="key" class="easyui-textbox" prompt="请输入维修人员姓名/工号" style="height:26px;"/>
                 &nbsp;&nbsp;
                <span>领取状态:</span>
                <select class="easyui-combobox" id="reptStatus" style="width:150px;height:26px;">
                    <option value="W">待领取</option>
                    <option value="Y">已领取</option>
                    <option value="">全部</option>
                </select>&nbsp;&nbsp; 
                <span>开始时间:</span>
                <input id="ds" type="text" value="3/4/2010 2:3" style="height:26px;" class="easyui-datebox"  />
                &nbsp;&nbsp;<span>结束时间:</span>
                <input id="de" type="text" value="3/4/2010 2:3" style="height:26px;" class="easyui-datebox"  />
                &nbsp;&nbsp; 
                <a href="#" iconCls="icon-search" class="easyui-linkbutton" onclick="doSearch()">条件查询</a>
                &nbsp;&nbsp;
                <a href="#" iconCls="icon-arrow_refresh" class="easyui-linkbutton" onclick="doRefresh()">刷新</a>
               
            </div>

        </div>
        <div region="south" style="height:10px;" border="false">

        </div>
    </div>
    
    <%-- 查看领取历史的窗体部分 --%>
    <div id="winPickHistory">
    	<!-- 查看领取历史 -->
    	<table id="dgPKHistory"></table>
    </div>
    
    
    <%-- 领取材料 --%>
    <div id="winPickingPart">
    	<!-- 领取材料 -->
    	<table class="picktb">
    		<tr>
    			<td>领取材料名称:</td>
    			<td id="partName"></td>
    		</tr>
    		<tr>
    			<td>生产厂家:</td>
    			<td id="partSup"></td>
    		</tr>
    		<tr>
    			<td>登记数量:</td>
    			<td id="regNum"></td>
    		</tr>
    		<tr>
    			<td>已领取数量:</td>
    			<td id="hasRep"></td>
    		</tr> 
    		<tr>
    			<td>实际可领取数量:</td>
    			<td id="realRep"></td>
    		</tr> 
    	</table>
    </div>
    <div id="ttPickPart">
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" id="surePicking">确定领取</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-delete" onclick="javascript:$('#winPickingPart').dialog('close')">取消</a>
	</div>
    
    <%-- 页面的js部分 --%>
    <script type="text/javascript"> 
        // 模糊查询
    	function doSearch(){
    		let keyworld = $("#key").val();
    		$("#dg").datagrid('load',{
    			keyworld:keyworld,
    			startTime:$("#ds").datebox('getValue'),
    			endTime:$("#de").datebox('getValue'),
    			searchType_c:$("#reptStatus").combobox('getValue')
    		});
    	}
    	
        // 刷新
    	function doRefresh(){
    		$("#dg").datagrid("load");
    	}
    	
        // 格式化
    	function myformatter(value,row,index){        
    		//let a = '<a href="#" onclick="queryHistory('+row.partusedid+','+index+')" style="color:red;">查看历史</a>&nbsp;&nbsp;';// 查看配件领取历史
			// 如果已经领取不显示领取配件
			let registed = parseFloat(row.registedspecnum);
    		let tooken = parseFloat(row.receivednum);
    		let b = '';
			if(registed>tooken){
				b = '<a href="#" onclick="pickPart('+index+')" style="color:green;">领取配件</a>';// 配件领取
			}else{
				b = "<span>--</span>";
			}
    		return b;
    	}
        
        // 查询历史
        function queryHistory(partusedid,index){        	
        	$('#winPickHistory').window('open');
        	// 加载数据
        	$("#dgPKHistory").datagrid('load',{
        		partUsedId:partusedid
        	});
        }
        
        
        // 领取材料
        function pickPart(index){
        	let partPickingView = $("#dg").datagrid("getRows")[index]; 
        	 $.messager.confirm("操作提示","是否确定维修人员【"+partPickingView.applicant+"】,领取【"+partPickingView.partcategory+":"+partPickingView.partname+"】?",function(r){
        		 if(r){ 
                   	if(partPickingView!=null){ 
                       	// 登记数量
                       	let regNum = parseFloat(partPickingView.registedspecnum);
                       	// 库存数量
                       	let inventory = parseFloat(partPickingView.inventory);
                       	// 已领取数量
                           let hasPicked = parseFloat(partPickingView.receivednum);
                       	// 实际能领取的数量
                       	let num = regNum - hasPicked; 
                       	$.ajax({
                       		url:"${pageContext.request.contextPath}/vehicle/pickingPart.html",
                       		type:"post",
                       		dataType:"json",
                       		data:partPickingView
                       	}).done(function(data){
                       		if(data=="-1"){
                       			$.messager.alert("操作提示","对不起，系统暂时无法提供服务!","info"); 
                       		}else if(data=="-2"){
                       			$.messager.alert("操作提示","对不起，您已经领取!","info");              			
                       		}else if(data=="0"){
                       			$.messager.alert("操作提示","对不起，库存不足暂时无法领取，已经通知相关人员进行采购!","info");   
                       		}else{
                       			$.messager.alert("操作提示","成功领取零件 "+partPickingView.partcategory+" "+partPickingView.partname+" "+data+" 【个/件】！","info");               			
                       		}
                       		 // 刷新
                       		doRefresh(); 
                       	}); 
                   	}  
        		 }
        	 });
        }
        
        $(function(){
        	 
        	
        	// 弹出模态框，绑定数据
            $('#winPickHistory').window({
                width:620,
                height:300,
                title:'领取历史',
                collapsible:false,
                minimizable:false,
                maximizable:false,
                modal:true,
                closed:true 
            });
        	
            // 弹出模态框，显示领取材料页面
            $('#winPickingPart').dialog({
                width:420,
                height:300,
                title:'领取材料',
                collapsible:false,
                minimizable:false,
                maximizable:false,
                modal:true,
                closed:true,
                buttons:'#ttPickPart'
            });
        	
        	$("#dgPKHistory").datagrid({
                url:"${pageContext.request.contextPath}/vehicle/queryAllPicked.html",
        	    columns:[[
        	        {field:'partname',align:'center',title:'零件名',width:100},
        	        {field:'reciamount',align:'center',title:'领取数量',width:100},
        	        {field:'recipients',align:'center',title:'领取人',width:100},
        	        {field:'recijobnum',align:'center',title:'工号',width:100},
        	        {field:'contactinfo',align:'center',title:'联系方式',width:100},
        	        {field:'recitime',align:'center',title:'领取时间',width:100}
        	    ]],
        	    border:false
        	});
        	        	
        });
    </script>
</body>
</html>