<%@ page language="java" pageEncoding="UTF-8" contentType="application/msexcel" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%   
  //独立打开excel软件   
  //response.setHeader("Content-disposition","attachment; filename=ldrkzzxxb.doc");   
  //嵌套在ie里打开excel   
  response.setHeader("Content-disposition","inline; filename=ldrkTjExcel.xls");   
  //Word只需要把contentType="application/msexcel"改为contentType="application/msword"  
%> 
<html>
<head></head>
<body>
	<table class="cps-tablegrid" border="1">
		<tr>
			<th>序号</th>
			<th>单位名称</th>
			<th>数量</th>
		</tr>
		<c:forEach items="${ldrktjBeans}" var="ldrktjBean" varStatus="st">
			<tr>
				<td>${st.index + 1}</td>
				<td>${ldrktjBean.orgname}</td>
				<td>${ldrktjBean.count}&nbsp;</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>