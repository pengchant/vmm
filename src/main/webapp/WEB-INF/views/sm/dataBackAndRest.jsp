<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../public/header.jsp" %>  
<style>
	ul{
		list-style:none;
		margin:0 auto; 
		margin-top:100px;
		width:850px; 
		text-align:center;
	}
	
	li{
		display:inline-block;
		text-align:center;
		padding:30px;  
	}
	
	.databaseimg{
		width:160px;
		height:160px;
	}
	
	.wplink{
		text-decoration:none;
		font-size:15px;
		color:orange;
		display:inline-block;
		padding:3px;
		border:solid 1px white;
		border-radius:4px;
		background:#E0ECFF;
		color:#2788CC;
		border:solid 1px #2788CC;
	}
	
	.wplink:hover{
		box-shadow:0 0 10px #2788CC;
	}
	
	 
	
	.selected{ 
		background:#0F89CC;
		color:white;
		border:solid 1px #0F89CC; 
	}
	
</style>
</head>
<body style="padding:5px;">
<div class="easyui-layout" fit="true" border="false">
    <div region="center" border="false">
	   <ul>
	   		<li>
	   			<a class="wplink" href="javascript:void(0);" onclick="beifeng()">
	   				<img class="databaseimg" src="<%=request.getContextPath()%>/img/bookmark.png"/>
	   				<br/>
	   				<span>数据备份</span>
	   			</a> 
	   		</li>
	   		<li></li>
	   		<li></li>
	   		<li>	   		
	   			<form id="refm" enctype="multipart/form-data" method="post">
	   				<input type="file" id="refreshfile" style="display:none;" name="refreshfile"/>	   				
	   			</form> 
	   			<a class="wplink" href="javascript:void(0);" id="huanyaun">
	   				<img class="databaseimg" src="<%=request.getContextPath()%>/img/autoship.png"/>
	   				<br/>
	   				<span>数据还原</span>
	   			</a> 
	   		</li>
	   </ul>
    </div>
    <div region="south" style="height:10px;" border="false"> 
    </div>
</div> 
<script type="text/javascript">
 	$(function(){
 		// 点击效果
 		$(".wplink").click(function(){
 			$(".wplink").removeClass("selected");
 			$(this).addClass("selected");
 		});
 		 		
 		// 点击还原
 		$("#huanyaun").click(function(){
 			$("#refreshfile").click();
 		});
 		
 		// change事件后上传
 		$("#refreshfile").change(function(){
 			if($(this).val()!=""){
 				// 上传
 				$.messager.progress(); 
 				$('#refm').form('submit', {
 					url: "<%=request.getContextPath()%>/base/databaseHY.html",
 					onSubmit: function(){
 						var isValid = $(this).form('validate');
 						if (!isValid){
 							$.messager.progress('close');	 
 						}
 						return isValid;	
 					},
 					success: function(data){
 						data = JSON.parse(data);
 						$.messager.progress('close');	 
 					 	if(!data.isError){
 					 		$.messager.alert("操作提示","数据备份成功!","info");
 					 	}else{
 					 		$.messager.alert("操作提示","数据备份失败，请稍候重试,请检查您选择的文件是否匹配!","error");
 					 	}
 					}
 				});
 			}
 		});
 	})
 	
 	// 备份
 	function beifeng(){
 		$.messager.prompt('输入备份的目标地址', '输入地址(示例：d:\\\\vmm\\\\test.sql)：', function(r){
 			if (r){
 				$.messager.progress();	
 				$.ajax({
 					url:"<%=request.getContextPath()%>/base/databaseBF.html",
 					data:{
 						"location":r
 					},
 					type:"POST",
 					dataType:"json"
 				}).done(function(data){
 					$.messager.progress('close');
 					if(data.isError==false){
 						$.messager.alert("操作提示","备份成功!","info");
 					}else{
 						$.messager.alert("操作提示","备份失败,可能是系统设置了安全权限，请选择其他盘符后重试!","error");
 					}	
 				});
 			}
 		});
 	}
</script>
</body>
</html>