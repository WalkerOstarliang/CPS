<%@page language="java" pageEncoding="UTF-8" contentType="application/msexcel" %>
<%@page import="java.net.URLEncoder" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%   
  //独立打开excel软件   
  //response.setHeader("Content-disposition","attachment; filename=ldrkzzxxb.doc");   
  //嵌套在ie里打开excel   
  String fileName = URLEncoder.encode("重点人员在控登记统计", "UTF-8");
  response.setHeader("Content-disposition","inline; filename=" + fileName + ".xls");   
  //Word只需要把contentType="application/msexcel"改为contentType="application/msword"  
%> 
<html>
<head></head>
<body>
	<table class="cps-tablegrid" border="1">
		<tr>
			<th>序号</th>
			<th>责任单位名称</th>
			<th>重点人员数</th>
			<th>在控登记数</th>
			<th>在控数</th>
			<th>失控数</th>
			<th>登记率</th>
			<th>在控率</th>
		</tr>
		<c:forEach items="${zdryzkdjtjList}" var="dataList" varStatus="s">
			<tr>
				<td>${s.index + 1}</td>
				<td>${dataList.zdryzrdwmc}&nbsp;</td>
				<td>${dataList.zdrysl}&nbsp;</td>
				<td>${dataList.zkdjs}&nbsp;</td>
				<td>${dataList.zkdjzks}&nbsp;</td>
				<td>${dataList.zkdjsks}&nbsp;</td>
				<td>${dataList.zkdjlv}&nbsp;</td>
				<td>${dataList.zkdjzklv}&nbsp;</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>