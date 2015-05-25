<%@ page language="java" pageEncoding="UTF-8" contentType="application/msexcel" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%   
  //独立打开excel软件   
  //response.setHeader("Content-disposition","attachment; filename=ldrkzzxxb.doc");   
  //嵌套在ie里打开excel   
  response.setHeader("Content-disposition","inline; filename=wtsjmjdetal.xls");   
  //Word只需要把contentType="application/msexcel"改为contentType="application/msword"  
%> 
<html>
<head></head>
<body>
	<table class="cps-tablegrid" border="1">
		<tr>
			<th>序号</th>
			<td>机构代码</td>
			<th>单位名称</th>
			<th>总问题数</th>
			<th>常口</th>
			<th>流口</th>
			<th>寄口</th>
			<th>未落户</th>
			<th>单位</th>
			<th>从业人员</th>
			<th>录入民警</th>
		</tr>
		<c:forEach items="${wtsjBeans}" var="wtsjBean" varStatus="st">
			<tr>
				<td>${st.index + 1}</td>
				<td>${wtsjBean.orgcode}&nbsp;</td>
				<td>${wtsjBean.orgname}</td>
				<td>${wtsjBean.zwts}&nbsp;</td>
				<td>${wtsjBean.czrks}</td>
				<td>${wtsjBean.ldrks}</td>
				<td>${wtsjBean.jzrks}</td>
				<td>${wtsjBean.wlhrks}</td>
				<td>${wtsjBean.sydws}</td>
				<td>${wtsjBean.cyrys}</td>
				<td>${wtsjBean.djmjdetail}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>