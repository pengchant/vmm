<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../public/header.jsp" %> 
<style>
	.panel{
		margin:0 auto;
		margin-top:50px;
	}
	 
 
</style>
</head>
<body style="padding:5px;">
<div class="easyui-layout" fit="true" border="false">
    <div region="center" border="false">
	   <div id="p" class="easyui-panel" title="修改密码"  
	          style="width:500px;height:300px;padding:10px;"
	          data-options="iconCls:'',closable:false,
	                  collapsible:false,minimizable:false,maximizable:false">
	        <form id="passfm">
		    	<table style="margin:0 auto;margin-top:60px;" calss="mytb">
		    		<tr>
		    			<td>新密码:</td>
		    			<td>
		    				 <input id="pass" name="pass" data-options="required:true,validateOnCreate:false" class="easyui-textbox" prompt="请输入密码"  style="width:200px;height:30px;" type="password"/>
		    			</td>
		    		</tr>
		    		<tr>
		    			<td>确认密码:</td>
		    			<td>
		    				 <input id="newpass" validType="equalTo['#pass']" invalidMessage="两次输入密码不匹配" name="newpass" data-options="required:true,validateOnCreate:false"  class="easyui-textbox"  prompt="请确认密码"   style="width:200px;height:30px;" type="password"/>
		    			</td>
		    		</tr> 
		    		<tr style="height:80px;">
		    			<td colspan="2" style="text-align:center;">
		    				<a id="btn" href="#" class="easyui-linkbutton" iconCls="icon-ok" style="width:80px;height:30px;" onclick="sureComit();">确定</a>
		    				&nbsp;&nbsp;&nbsp;&nbsp;
		    				<a id="btn" href="#" class="easyui-linkbutton" iconCls="icon-cancel" style="width:80px;height:30px;" onclick="cancel();">取消</a>
		    			</td>
		    		</tr>
		    	</table>
	    	</form>
	   </div>
    </div>
    <div region="south" style="height:10px;" border="false"> 
    </div>
</div> 
<script type="text/javascript">
	 // 拓展easyui
    $.extend($.fn.validatebox.defaults.rules, {
        /*必须和某个字段相等*/
        equalTo: { 
        	validator: function (value, param) { 
        		return $(param[0]).val() == value;
        	}, 
        	message: '字段不匹配' 
        }
     });
	 
	 // 确认
	 function sureComit(){
	 	 $.messager.confirm("操作提示","是否确定修改密码?",function(r){
	 		 if(r){
	 			$('#passfm').form('submit', {
	 			 	url: "<%=request.getContextPath()%>/base/modiPass.shtml",
	 			 	onSubmit: function(){
	 			 		var isValid = $(this).form('validate'); 
	 			 		return isValid;	 
	 			 	},
	 			 	success: function(data){
	 			 		$.messager.alert("操作提示","修改密码成功!,重新登录!"); 
	 			 		window.parent.location.href="<%=request.getContextPath()%>";
	 			 	}
	 			 });
	 		 }
	 	 }); 
	 }
	 
	 
	 // 重置
	 function cancel(){
		 $("#passfm").form("reset");
	 }
</script>
</body>
</html>