<%@ page language="java" pageEncoding="UTF-8" contentType="application/msexcel" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%   
  //独立打开excel软件   
  //response.setHeader("Content-disposition","attachment; filename=ldrkzzxxb.doc");   
  //嵌套在ie里打开excel   
  response.setHeader("Content-disposition","inline; filename=wtsjdetailxls.xls");   
  //Word只需要把contentType="application/msexcel"改为contentType="application/msword"  
%> 
<html>
<body>
	<table class="cps-tablegrid" border="1">
		<tr>
			<th>序号</th>
			<c:forEach items="${tableContentMap.fieldnames}" var="fieldname">
				<th>${fieldname}</th>
			</c:forEach>
		</tr>
		<c:forEach items="${tableContentMap.rows}" var="row" varStatus="st">
			<tr>
				<td>${st.index+1 }</td>
				<c:forEach items="${tableContentMap.fields}" var="field">
					<td>&nbsp;${row[field]}</td>
				</c:forEach>
			</tr>
		</c:forEach>
	</table>
</body>
</html>