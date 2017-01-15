<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>上传文件测试</title>
</head>
<body>
	<form name="file" action="${pageContext.request.contextPath}/demo/upload.cphtml" method="post" enctype="multipart/form-data">
		请选择文件:<input type="file" name="uploadFile"/><br/>	 
		<input type="submit" value="开始上传文件"/>
	</form>
	<br/>
	<a href="${pageContext.request.contextPath}/demo/download.cphtml">下载文件测试</a>
	<br/>
	导入excel：
	<form name="excel" action="${pageContext.request.contextPath}/demo/loadExcel.cphtml" method="post" enctype="multipart/form-data">
		请选择文件:<input type="file" name="uploadFile"/><br/>	 
		<input type="submit" value="开始导入"/>
	</form>
	<a href="${pageContext.request.contextPath}/demo/viewer.cphtml">预览文件</a>
</body>
</html>