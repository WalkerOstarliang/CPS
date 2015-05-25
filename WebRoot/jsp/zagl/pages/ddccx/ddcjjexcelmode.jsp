<%@ page language="java" pageEncoding="UTF-8"  contentType="application/msexcel" %>
<%@page import="java.net.URLEncoder" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%   
  //独立打开excel软件   
  //response.setHeader("Content-disposition","attachment; filename=ldrkzzxxb.doc");   
  //嵌套在ie里打开excel   
  //String fileName = URLEncoder.encode("ddc", "UTF-8");
  String fileName = URLEncoder.encode("交警电动车查询结果导出", "UTF-8");
  response.setHeader("Content-disposition","inline; filename=" + fileName + ".xls"); 
  // response.setHeader("Content-disposition","inline; filename=交警电动车查询结果导出.xls");   
  //Word只需要把contentType="application/msexcel" 改为contentType="application/msword"  
%> 
<html>
	<head></head>
	<body>
		<table  class="cps-tablegrid" border="1">
			<tr>
				<th>序号</th>
				<th>品牌型号</th>
				<th>车牌号</th>
				<th>车架号</th>
				<th>档案编号</th>
				<th>拥有人</th>
				<th>住址</th>
				<th>联系电话</th>
				<th>经办人</th>
				<th>经办日期</th>
				<th>所属区域</th>
			</tr>
			<c:forEach items="${ddjjcxList}" var="ddc" varStatus="s">
				<tr>
					<td>${s.index + 1}&nbsp;</td>
					<td>${ddc.car_brand }&nbsp;</td>
					<td>${ddc.car_num }&nbsp;</td>
					<td>${ddc.car_motor }&nbsp;</td>
					<td>${ddc. car_record}&nbsp;</td>
					<td>${ddc.car_holder }&nbsp;</td>
					<td>${ddc.car_addr }&nbsp;</td>
					<td>${ddc.car_telephone }&nbsp;</td>
					<td>${ddc.car_agent }&nbsp;</td>
					<td>${ddc.car_agentdate }&nbsp;</td>
					<td>${ddc.car_isomuxms }&nbsp;</td>
				</tr>
			</c:forEach>
		</table>
	</body>
</html>