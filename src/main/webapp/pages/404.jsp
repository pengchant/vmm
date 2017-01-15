<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>访问的页面不存在</title>
<style>
body {
	margin: 0px auto;
	width: 950px;
	margin: 0 auto;
	font: 11px "lucida grande", arial, verdana, sans-serif;
	background: url(${pageContext.request.contextPath}/img/body_bg.jpg) #d4d4d4 repeat-x;
	padding-top: 80px;
}

div.error404_main {
	position: relative;
	margin: 31px 21px 0px;
	width: 100%;
	background: url(${pageContext.request.contextPath}/img/error404.jpg) no-repeat;
	height: 500px;
}

span.main_txt {
	position: absolute;
	text-align: center;
	padding-bottom: 0px;
	padding-left: 0px;
	width: 150px;
	padding-right: 0px;
	display: block;
	height: 63px;
	color: #1d1d1d;
	top: 223px;
	padding-top: 2px;
	left: 745px;
}

span.main_txt span {
	margin: 0px 0px 2px;
	display: block;
}

span.main_txt a {
	color: #1d1d1d;
}

div.error404_guide {
	position: relative;
	background-color: #b4b4b4;
	margin: 0px 21px;
	width: 950px;
	height: 84px;
}
</style>
</head>
<body>
	<div class="error404_main"> 
		<span class="main_txt"><span>您访问的网页</span> <span>不存在或者已删除</span>
			<span> :(请刷新</span> <span>或者 <a class="gray_un"
				href="javascript:void(0);">返回首页</a>.
		</span> </span>
	</div>
</body>
</html>