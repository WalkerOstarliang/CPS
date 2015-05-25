<%@ page language="java" pageEncoding="UTF-8" contentType="application/msexcel" %>
<%@page import="java.net.URLEncoder" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%   
  //独立打开excel软件   
  //response.setHeader("Content-disposition","attachment; filename=ldrkzzxxb.doc");   
  //嵌套在ie里打开excel   
  String fileName = URLEncoder.encode("实体信息提醒", "UTF-8");
  response.setHeader("Content-disposition","inline; filename=" + fileName + ".xls"); 
  //Word只需要把contentType="application/msexcel"改为contentType="application/msword"  
%> 
<html>
<head></head>
<body>
	<table class="cps-tablegrid" border="1">
		<tr>
			<th>序号</th>
			<th>实体编码</th>
			<th>实体名称</th>
			<th>行政区划</th>
			<th>乡镇/街道</th>
			<th>社区</th>
			<th>街路巷</th>
			<th>门牌号</th>
			<th>小区组</th>
			<th>楼栋详址</th>
			<th>登记时间</th>
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