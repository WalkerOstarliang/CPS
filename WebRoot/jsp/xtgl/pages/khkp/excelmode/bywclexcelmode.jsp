<%@ page language="java" pageEncoding="UTF-8" contentType="application/msexcel" %>
<%@page import="java.net.URLEncoder" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%   
  //独立打开excel软件   
  //response.setHeader("Content-disposition","attachment; filename=ldrkzzxxb.doc");   
  //嵌套在ie里打开excel   
  String fileName = URLEncoder.encode("本月待处理统计", "UTF-8");
  response.setHeader("Content-disposition","inline; filename=" + fileName + ".xls"); 
  //Word只需要把contentType="application/msexcel"改为contentType="application/msword"  
%> 
<html>
	<head></head>
	<body>
		<table border="1" cellpadding="0" cellspacing="0">
			<tr>
				<th>序号</th>
				<th>单位名称</th>
				<th>流动人口延期</th>
				<th>从业人员反馈或登记</th>
				<th>从业人员派发</th>
				<th>重点人员接管</th>
				<th>重点人员在控登记</th>
				<th>出租屋巡查</th>
				<th>出租房登记</th>
				<th>实体未标注</th>
			</tr>
			<c:forEach items="${bywclList}" var="data" varStatus="s">
				<tr>
					<td>${s.index + 1 }</td>
					<td>${data.orgname}&nbsp;</td>
					<td>${data.ldrkyq}&nbsp;</td>
					<td>${data.cyryhs}&nbsp;</td>
					<td>${data.cyrypf}&nbsp;</td>
					<td>${data.zdrytg}&nbsp;</td>
					<td>${data.zdryzkdj}&nbsp;</td>
					<td>${data.czwxc}&nbsp;</td>
					<td>${data.czfdj}&nbsp;</td>
					<td>${data.stxxbz}&nbsp;</td>
				</tr>
			</c:forEach>
		</table>
	</body>
</html>