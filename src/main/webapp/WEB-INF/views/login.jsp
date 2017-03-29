<%@page import="org.apache.commons.lang.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="public/nocache.jsp" %>
<%@include file="public/header.jsp" %>
<!-- 引入相关的js -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<style>
	 body{
	 	margin:0px;
	 	padding:0px; 
	 }
	 
	 .wrapper{
	 	width:100%;height:100%;position:fixed;
	 }
	 
	 .content{
	 	width:100%;
	 	height:100%;
	 	position:relative;		
	 	text-align:center; 	
	 	background:url(${pageContext.request.contextPath}/img/bg.png) no-repeat bottom; 
	 }
	 
	 .login{
	 	width:1050px;
	 	height:450px;	 	 
	 	position:absolute;
	 	top:50%;
	 	left:50%;
	 	margin-top:-225px;
	 	margin-left:-525px;
	 }
</style>
<script type="text/javascript">
	window.history.forward();
	window.onbeforeunload=function (){ 
	}
</script>
<%@include file="public/headertop.jsp" %>
<!-- 进入资源文件 -->
<body>
	<%-- 读取cookie --%>
	<%
		String name = "";
		String password = "";
		try{
			Cookie[] cookies = request.getCookies();
			if(cookies!=null){
				for(int i = 0;i<cookies.length;i++){
					if(cookies[i].getName().equals("cookie_user")){
						String values = cookies[i].getValue();
						// 如果value字段不为空
						if(StringUtils.isNotBlank(values)){
							String[] elements = values.split("-");
							// 获取账户名或者密码
							if(StringUtils.isNotBlank(elements[0])){
								name = elements[0];
							}
							if(StringUtils.isNotBlank(elements[1])){
								password =  elements[1];
							}
						}
					}
				}
			}
		}catch(Exception e){
			
		}
	%>
	<div class="wrapper" style="">
		 <div class="content">
		 	<div class="login">
		 		<!-- 主要的内容部分开始 -->
		 		<div class="easyui-layout" fit="true" border="false">
                       <div region="west" style="width:550px;text-align:center;" border="false">
                           <div class="easyui-layout" fit="true" border="false">
                               <div region="west" border="false" style="width:250px;height:390px;background:url(${pageContext.request.contextPath}/img/banner-jkrzbg.png)">
                               </div>
                               <div region="center" style="font-family:'微软雅黑';" border="false">
                                    <p style="position: relative;margin-top:200px;padding-left:20px;">
                                        <span style="font-size:30px;font-weight:800;">汽车维修管理系统</span><br/>
                                        <span>Vehicle Maintenance Management System</span>
                                    </p>
                               </div>
                           </div>
                       </div>
                       <div region="center" border="false" style="width:520px;height:480px;">
                            <div class="easyui-layout" fit="true" border="false">
                                <div region="north" style="height:80px;" border="false">
                                </div>
                                <div region="west" style="width:90px;position: relative;" border="false">
                                    <img src="${pageContext.request.contextPath}/img/split.png" style="position:absolute;left:0px;top:30px;"/>
                                </div>
                                <div region="center" border="false">
                                    <div class="easyui-panel" title="用户登录" iconCls="icon-user"
                                         style="text-align: center;width:300px;height:260px;padding-top:50px;">
                                        <form id="ff" method="post">
                                            <div> 
                                                <input id="account" class="easyui-textbox" name="accountnumber"
                                                       data-options="iconCls:'icon-man',prompt:'请输入用户名'" value="<%=name %>"
                                                       style="width:240px;height:30px;">
                                               <a id="dd" href="#" title="用户的账号不能为空" class="easyui-tooltip"></a>
                                            </div>
                                            <div style="margin-top: 20px;">
                                                <input id="passwords" class="easyui-textbox" name="passwords" type="password"
                                                       data-options="iconCls:'icon-lock',prompt:'请输入密码'" value="<%=password %>"
                                                       style="width:240px;height:30px;">
                                            </div>
                                            <div style="margin-top: 10px;" style="text-align:left;" >
                                                <span style="float:left;padding-left:30px;font-size:12px;"><input id="flag" name="flag" type="checkbox" value="1" checked="checked" />记住账号</span> 
                                            </div>
                                            <div style="clear:both;"></div>
                                            <div style="margin-top: 20px;">
                                                <p>
                                                    <a href="#" id="submitbtn"  style="width:80px;height:30px;" class="easyui-linkbutton" iconCls="icon-accept">登录</a>
                                                    <a style="margin-left:30px;width:80px;height:30px;" href="#" class="easyui-linkbutton" iconCls="icon-arrow_undo">取消</a>
                                                </p>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <div region="east" style="width:90px;" border="false">
                                </div>
                                <div region="south" style="height:0px;" border="false">
                                </div>
                            </div>
                       </div>
                   </div>
		 		<!-- 主要的内容部分结束 -->		 		
		 	</div>
		 </div>
	</div>

   
  
    <script type="text/javascript">
    	$(function(){ 
    		
    		console.log("[汽车维修管理系统\n codeby：pengchan\n email:dntchenpeng@163.com \n csdn:http://blog.csdn.net/w3chhhhhh/]");
    		
    		// 提交表单
    		$("#submitbtn").click(function(){
    			// 判断是否为空
    			if($("#account").val()==""){
    				$.messager.alert('登录消息提示','用户的账号不能为空','info');
    				return;
    			}
    			if($("#passwords").val()==""){
    				$.messager.alert('登录消息提示','用户的密码不能为空','info');
    				return;
    			}
    			$("#ff").submit();
    		});
    		
    		$('#ff').form({
    		    url:"${pageContext.request.contextPath}/users/login.html", 
    		    success:function(data){   
    		       data = JSON.parse(data);    		      
    		       try{
    		    	   if(data.isError){
        		    	   $.messager.alert('登录消息提示',data.errorMsg,'info');
        		       }else{
        		    	   //$.messager.alert("登录消息提示","登录成功!",'info');
        		    	   // 如果成功，就跳转到主页面
        		    	   // 这里先判断是否有历史请求，如果有就再次访问之前的页面
        		    	   var hisurl = '${hisURL}';
        		    	   if(hisurl!=null&&hisurl.length>0){
        		    		   window.location.href="${pageContext.request.contextPath}"+hisurl;
        		    	   }else{
        		    		   window.location.href="${pageContext.request.contextPath}/index/main.html";
        		    	   }        		    	   
        		       }
    		       }catch(e){
    		      	   $.messager.alert("登录消息提示",'服务器返回异常，请稍后重试!','info');
    		       }
    		       
    		    },
    		    error:function(error){
    		    	$("#ff").form("clear");
    		    }
    		});
    	});
    </script>
</body>
</html>
 