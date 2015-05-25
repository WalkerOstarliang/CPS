<%@ page language="java" pageEncoding="UTF-8" contentType="application/msexcel" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%   
  //独立打开excel软件   
  //response.setHeader("Content-disposition","attachment; filename=ldrkzzxxb.doc");   
  //嵌套在ie里打开excel   
  response.setHeader("Content-disposition","inline; filename=weekwtsjtjfxb.xls");   
  //Word只需要把contentType="application/msexcel"改为contentType="application/msword"  
%> 
<html>
<head></head>
<body>
	
	<table class="cps-tablegrid" border="1">
		<tr>
			<th>序号</th>
			<th>单位名称</th>
			<th>排名</th>
			<th>总数</th>
			<th>常口</th>
			<th>流口</th>
			<th>寄口</th>
			<th>未落户</th>
			<th>实体</th>
			<th>房屋</th>
			<th>出租屋</th>
			<th>单位</th>
			<th>从业人员</th>
		</tr>
		<c:forEach items="${wtsjBeans}" var="bean" varStatus="st">
			<tr>
				<td>${st.index + 1}</td>
				<td>${bean.orgname}</td>
				<td>${bean.pm}</td>
				<td>${bean.zwts}&nbsp;</td>
				<td>${bean.czrks}</td>
				<td>${bean.ldrks}</td>
				<td>${bean.jzrks}</td>
				<td>${bean.wlhrks}</td>
				<td>${bean.stxxs}</td>
				<td>${bean.fwxxs}</td>
				<td>${bean.czfwxxs}</td>
				<td>${bean.sydws}</td>
				<td>${bean.cyrys}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>