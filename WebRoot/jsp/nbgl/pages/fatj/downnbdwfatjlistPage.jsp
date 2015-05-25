<%@ page language="java" pageEncoding="UTF-8" contentType="application/msexcel" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%   
  //独立打开excel软件   
  //response.setHeader("Content-disposition","attachment; filename=ldrkzzxxb.doc");   
  //嵌套在ie里打开excel   
  response.setHeader("Content-disposition","inline; filename=nbdwfaqktj.xls");   
  //Word只需要把contentType="application/msexcel"改为contentType="application/msword"  
%> 
<html>
<head></head>
<body>
	<table class="cps-tablegrid" border="1">
		<tr>
			<th rowspan="2">案件类别</th>
			<th colspan="4">盗窃</th>
			<th rowspan="2">抢劫</th>
			<th rowspan="2">抢夺</th>
			<th rowspan="2">电信诈骗</th>
			<th rowspan="2">合计</th>
		</tr>
		<tr>
			<th>扒窃</th>
			<th>其他盗窃</th>
			<th>其他入室盗窃</th>
			<th>入户盗窃</th>
		</tr>
		<c:forEach items="${fatjlist}" var="jgtjBean" varStatus="st">
			<tr>
				<td>${jgtjBean.djdwmc}</td>
				<td>${jgtjBean.pqsl}</td>
				<td>${jgtjBean.qtdqsl}</td>
				<td>${jgtjBean.qtrsdqsl}</td>
				<td>${jgtjBean.rhdqsl}</td>
				<td>${jgtjBean.qjsl}</td>
				<td>${jgtjBean.qdsl}</td>
				<td>${jgtjBean.dxzpsl}</td>
				<td>${jgtjBean.hjsl}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>