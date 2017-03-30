<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../public/header.jsp" %> 
</head>
<body style="padding:5px;">
<div class="easyui-layout" fit="true" border="false">
    <div region="center" border="false">
        <table fit="true" id="dg" class="easyui-datagrid" title="库存管理" iconCls="icon-shield"
               toolbar="#tb" idField="id"
               url="${pageContext.request.contextPath}/inventory/queryStorage.shtml"
               rownumbers="true" singleSelect="true" pagination="true"
               fitColumn="true">
            <thead>
            <tr>
                <th field="partid" align="center" width="80" hidden="true">零件的编号</th>
                <th field="partname" align="center" width="100">零件的名称</th>
                <th field="partcategoryid" align="center" width="200" hidden="true">零件类别的编号</th>
                <th field="partcategory" align="center" width="80">零件的类别</th>
                <th field="purchaseprice" align="center" width="80" formatter="fmcg">采购价格</th>
                <th field="salesprice" align="center" width="80" formatter="fmsal">销售价格</th>
                <th field="supplierid" align="center" width="100" hidden="true">供应商编号</th>
                <th field="supplierName" align="center" width="180">供应商名称</th>
                <th field="phone" align="center" width="80">联系电话</th>
                <th field="address" align="center" width="80">地址</th>
                <th field="inventory" align="center" width="80" formatter="fmkc">库存量</th>
                <th field="detaillocation" align="center" width="100" hidden="true">详细的地址</th>
                <th field="warehouseName" align="center" width="100">仓库的名称</th>
                <th field="warehouseAdd" align="center" width="100">仓库的地址</th>
                <th field="op" align="center" width="110" formatter="opfm">操作</th>
            </tr>
            </thead>
        </table>
        <div id="tb" style="padding:5px">
            <span>关键字:&nbsp;&nbsp;&nbsp;&nbsp;</span>
            <input id="key" class="easyui-textbox" prompt="请输入零件名称/大类名称"
                   style="width:170px;height:26px;">&nbsp;&nbsp;&nbsp;&nbsp; 
            <a href="#" iconCls="icon-search" class="easyui-linkbutton" onclick="doSearch()">条件查询</a>
            &nbsp;&nbsp;
            <a href="#" iconCls="icon-arrow_refresh" class="easyui-linkbutton" onclick="refresh()">刷新所有</a>

        </div>

    </div>
    <div region="south" style="height:10px;" border="false">

    </div>
    <script type="text/javascript">
       // 格式化采购价格
       function fmcg(value,row,index){
    	   let a='<span style="color:orange;font-size:14px;fong-weight:600;">￥'+value+'</span>';
    	   return a;
       }
       
       // 格式化销售价格
       function fmsal(value,row,index){
    	   let b='<span style="color:#118CCF;font-size:14px;font-weight:600;">￥'+value+'</span>';
    	   return b;
       }
       
       // 格式化库存
       function fmkc(value,row,index){
    	  let c = '<span style="color:red;font-size:14px;font-weight:600;">'+value+'</span>';
    	  return c;
       }
       
       // 查询
       function doSearch(){
    	   let key = $("#key").textbox("getValue");
    	   $("#dg").datagrid("load",{
    		   keyword:key
    	   });
       }
       
       // 重新刷新
       function refresh(){
    	   $("#dg").datagrid('reload'); 
       }
       
       // 操作
       function opfm(value,row,index){
    	   let a="<button onclick='changeprice("+index+")' style='cursor:pointer;border:none;width:100px;height:26px;border-radius:3px;background:#118CCF;color:white;margin:2px;'>修改销售价格</button>";
    	   return a;
       }
       
       // 修改操作
       function changeprice(index){
    	   let row = $("#dg").datagrid("getRows")[index];
    	   let partid = row.partid;
    	   $.messager.prompt('修改销售价格', '请输入销售的价格:', function(r){
    			if (r){ 
    				// 修改的操作
    				$.ajax({
    					url:"${pageContext.request.contextPath}/inventory/updatePrice.shtml",
    					type:"POST",
    					dataType:"json",
    					data:{
    						partid:partid,
    						price:r
    					}
    				}).done(function(data){
    					console.log(data);
    					if(!data.isError){
    						$.messager.alert("操作提示","修改成功!","info");
    						refresh();
    					}else{
    						$.messager.alert("操作提示","修改失败!","info");
    					}
    				});
    			}
    		});
       }
       
       
    </script>
</div>
</body>
</html>