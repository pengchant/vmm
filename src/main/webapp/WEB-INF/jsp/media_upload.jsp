<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>视频上传</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/media/dofunction.cphtml" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td>选择视频：</td>
				<td>
					<input type="file" name="myvideo" />
				</td>
			</tr>
			<tr>
				<td>视频标题</td>
				<td>
					<input type="text" name="title"/>
				</td>
			</tr>
			<tr>
				<td>视频描述</td>
				<td>
					<textarea name="descript"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="提交"/>
				</td>			 
			</tr>
			<tr>
				<td colspan="2">
					<a href="${pageContext.request.contextPath}/media/searchAll.cphtml">进入视频列表</a>
				</td>			 
			</tr>
		</table>
	</form>
</body>
</html>