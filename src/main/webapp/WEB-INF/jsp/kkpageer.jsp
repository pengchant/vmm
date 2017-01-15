<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- header -->
<%@include file="main_jspRef/b_main_Header.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>e家校通-测试</title>
<% String base = request.getContextPath(); %>
<!-- 这里可以引入自己的js和css -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/kkpager/kkpager.min.js"></script>
<!-- 引入kkpager的css样式 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/js/kkpager/kkpager_orange.css"/>
<script type="text/javascript">
//init
$(function(){
	var mypno = ${page.pageNo};
	var mytotalpage = ${page.pages};
	var mytoal = ${page.total};
	var myhrefFormer = "${pageContext.request.contextPath}/user/testPage";
	//生成分页
	//有些参数是可选的，比如lang，若不传有默认值
	kkpager.generPageHtml({
		pno : mypno,
		//总页码
		total :mytotalpage,
		//总数据条数
		totalRecords : mytoal,
		//链接前部
		hrefFormer : myhrefFormer,
		//链接尾部
		hrefLatter : '.cphtml',
		getLink : function(n){
			return this.hrefFormer + this.hrefLatter + "?pageSize=10&pageNumber="+n;
		}		 
	});
});
</script>
<!-- b_main_headertop -->
<%@include file="main_jspRef/b_main_HeaderTop.jsp"%>
<table class="table table-hover">
  <caption>用户的信息  <a href="${pageContext.request.contextPath}/demo/toExcel.cphtml">导出excel文档</a></caption>
  <thead>
    <tr>
      <th>编号</th>
      <th>姓名</th>
      <th>密码</th>
      <th>年龄</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach var="pageData" items="${page.dataList}">
    	<tr>
    		<td>${pageData.id }</td>
    		<td>${pageData.username }</td>
    		<td>${pageData.password }</td>
    		<td>${pageData.age }</td>
    	</tr>
    </c:forEach>
  </tbody>
</table>
<div id="kkpager" style="width:90%;margin:0 auto;"></div>
<%@include file="main_jspRef/b_main_Footer.jsp"%>