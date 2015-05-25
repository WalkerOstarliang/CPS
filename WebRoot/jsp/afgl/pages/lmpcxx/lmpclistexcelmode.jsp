<%@ page language="java" pageEncoding="UTF-8"  contentType="application/msexcel" %>
<%@page import="java.net.URLEncoder" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%   
  //独立打开excel软件   
  //response.setHeader("Content-disposition","attachment; filename=ldrkzzxxb.doc");   
  //嵌套在ie里打开excel   
  //String fileName = URLEncoder.encode("ddc", "UTF-8");
  String fileName = URLEncoder.encode("路面盘查结果导出", "UTF-8");
  response.setHeader("Content-disposition","inline; filename=" + fileName + ".xls"); 
  // response.setHeader("Content-disposition","inline; filename=交警电动车查询结果导出.xls");   
  //Word只需要把contentType="application/msexcel" 改为contentType="application/msword"  
%> 
<html>
	<head>
		
	</head>
	<body>
		<table  class="cps-tablegrid" border="1">
			<tr>
				<th>序号</th>
				<th>被盘查人</th>
				<th>被盘查人身份证号</th>
				<th>盘查地点</th>
				<th>盘查原因</th>
				<th>盘查结果</th>
				<th>登记人姓名</th>
				<th>盘查时间</th>
				<th>登记单位</th>
			</tr>
			<c:forEach items="${lmpcxxList}" var="ddc" varStatus="s">
				<tr>
					<td>${s.index + 1}</td>
					<td>${ddc.pcdxxm}</td>
					<td>${ddc.pcdxsfzh}&nbsp;</td>
					<td>${ddc.pcdd}</td>
					<td>${ddc.pcyyms}</td>
					<td>${ddc.cljgms}</td>
					<td>${ddc.djrxm}</td>
					<td>${ddc.pcsj}</td>
					<td>${ddc.djrdwmc}</td>
				</tr>
			</c:forEach>
		</table>
	</body>
</html>