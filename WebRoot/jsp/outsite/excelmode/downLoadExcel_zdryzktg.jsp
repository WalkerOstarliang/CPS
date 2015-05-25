<%@page language="java" pageEncoding="UTF-8" contentType="application/msexcel" %>
<%@page import="java.net.URLEncoder" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%   
  //独立打开excel软件   
  //response.setHeader("Content-disposition","attachment; filename=ldrkzzxxb.doc");   
  //嵌套在ie里打开excel   
  String fileName = URLEncoder.encode("重点人员托管提醒", "UTF-8");
  response.setHeader("Content-disposition","inline; filename=" + fileName + ".xls");   
  //Word只需要把contentType="application/msexcel"改为contentType="application/msword"  
%> 
<html>
<head></head>
<body>
	<table class="cps-tablegrid" border="1">
		<tr>
			<th>序号</th>
			<th>姓名</th>
			<th>性别</th>
			<th>公民身份证号</th>
			<th>出生日期</th>
			<th>联系电话</th>
			<th>户籍地详址</th>
			<th>现住地详址</th>
			<th>托管单位</th>
			<th>托管时间</th>
			<th>处理期限</th>
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