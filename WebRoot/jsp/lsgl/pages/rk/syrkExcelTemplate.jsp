<%@ page language="java" pageEncoding="UTF-8" contentType="application/msexcel" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%   
  //独立打开excel软件   
  //response.setHeader("Content-disposition","attachment; filename=ldrkzzxxb.doc");   
  //嵌套在ie里打开excel   
  response.setHeader("Content-disposition","inline; filename=syrkexcel.xls");   
  //Word只需要把contentType="application/msexcel"改为contentType="application/msword"  
%> 
<html>
<head></head>
<body>
	<table class="cps-tablegrid" border="1">
		<tr>
			<th>序号</th>
			<th>姓名</th>
			<th>公民身份证号</th>
			<th>性别</th>
			<th>出生日期</th>
			<th>联系电话</th>
			<th>户籍地详址</th>
			<th>现住地详址</th>
		</tr>
		<c:forEach items="${jbxxBeans}" var="jbxxBean" varStatus="st">
			<tr>
				<td>${st.index + 1}</td>
				<td>${jbxxBean.xm}</td>
				<td>${jbxxBean.sfzh}&nbsp;</td>
				<td>${jbxxBean.xbms}</td>
				<td>${jbxxBean.csrq}</td>
				<td>${jbxxBean.lxdh}</td>
				<td>${jbxxBean.hjdxz}</td>
				<td>${jbxxBean.xzzxz}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>