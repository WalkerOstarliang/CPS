<%@ page language="java" pageEncoding="UTF-8" contentType="application/msexcel" %>
<%@page import="java.net.URLEncoder" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%   
  //独立打开excel软件   
  //response.setHeader("Content-disposition","attachment; filename=ldrkzzxxb.doc");   
  //嵌套在ie里打开excel   
  String fileName = URLEncoder.encode("出租房屋登记提醒", "UTF-8");
  response.setHeader("Content-disposition","inline; filename=" + fileName + ".xls"); 
  //Word只需要把contentType="application/msexcel"改为contentType="application/msword"  
%> 
<html>
<head></head>
<body>
	<table class="cps-tablegrid" border="1">
		<tr>
			<th>序号</th>
      		<th>地址名称</th>
			<th>房主姓名</th>
			<th>房主联系电话</th>
     		<th>房主身份证号</th>
      		<th>产权类型</th> 
			<th>登记民警姓名</th>
			<th>登记单位名称</th>
			<th>办理期限</th>
		</tr>
		<c:forEach items="${excelData}" var="dataList" varStatus="s">
			<tr>
				<td>${s.index + 1}</td>
				<c:forEach items="${dataList}" var="data" varStatus="ss">
					<td>${data}&nbsp;</td>
				</c:forEach>
			</tr>
		</c:forEach>
	</table>
</body>
</html>