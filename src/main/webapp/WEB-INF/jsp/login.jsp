<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Header -->
<%@include file="page_jspRef/header.jsp"%>
<title>e家校通-登录</title>
<!-- RefPart:这里是引入资源如：css,js等部分,或者自定义样式,js -->
<style type="text/css">
	body{
		background-color:#1abc9c;
	}
</style>
<!-- PageTopPart -->
<%@include file="page_jspRef/pageTop.jsp" %>
<!--容器-->
<div class="container" style="padding-top: 150px;">
    <div class="col-md-6" style="text-align: right;padding-top:50px;padding-right: 100px;">
        <div>
            <img src="${pageContext.request.contextPath}/js/flat-ui/img/icons/png/Mail.png"/>
            <h6 style="margin-right:-40px;color:white;">欢迎进入e家校通管理系统</h6>
        </div>
    </div>
    <div class="col-md-4" style="background-color:#edeff1;padding:50px;border-radius: 6px;">
        <form role="form" class="form-horizontal">
            <!-- 用户名 -->
            <div class="form-group">
                <div class="input-group input-lg">
                    <span class="input-group-addon fui-user"></span>
                    <input type="text" title="请输入用户名" data-placement="top" data-toggle="tooltip" class="form-control input-lg" placeholder="输入用户名"/>
                </div>
            </div>
            <!-- 密码-->
            <div class="form-group">
                <div class="input-group input-lg">
                    <span class="input-group-addon fui-lock"></span>
                    <input type="password" title="请输入密码"  data-placement="top" data-toggle="tooltip"  class="form-control input-lg" placeholder="输入密码"/>
                </div>
            </div>
            <!-- 登录 -->
            <a href="#" class="btn btn-primary btn-lg btn-block">登录</a>
        </form>
    </div>
    <div class="col-md-2">
    </div>
    <script type="text/javascript">
        $(function(){
            $("[data-toggle=tooltip]").tooltip();
        });
    </script>
</div>
<!-- PageFooter -->
<%@include file="page_jspRef/pageFooter.jsp" %>



