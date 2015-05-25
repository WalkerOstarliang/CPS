<%@ page language="java" pageEncoding="UTF-8" contentType="application/msexcel" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%   
  //独立打开excel软件   
  //response.setHeader("Content-disposition","attachment; filename=ldrkzzxxb.doc");   
  //嵌套在ie里打开excel   
  response.setHeader("Content-disposition","inline; filename=stxxexcel.xls");   
  //Word只需要把contentType="application/msexcel"改为contentType="application/msword"  
%> 
<html>
<head></head>
<body>
	<table class="cps-tablegrid" border="1">
		<tr>
			<th>序号</th>
			<th>实体编码</th>
			<th>实体名称</th>
			<th>行政区划</th>
			<th>乡镇/街道</th>
			<th>社区</th>
			<th>街路巷</th>
			<th>门牌号</th>
			<th>小区组</th>
			<th>楼栋详址</th>
			<th>登记时间</th>
		</tr>
		<c:forEach items="${stxxBeansList}" var="stxxBean" varStatus="st">
			<tr>
				<td align="center">${st.index + 1}</td>
				<td align="left">${stxxBean.id}&nbsp;</td>
				<td align="left">${stxxBean.stmc}&nbsp;</td>
				<td align="left">${stxxBean.xzqhmc}</td>
				<td align="left">${stxxBean.jdxzmc}</td>
				<td align="left">${stxxBean.sqmc}</td>
				<td align="left">${stxxBean.jlxmc}</td>
				<td align="left">${stxxBean.mph}</td>
				<td align="left">${stxxBean.xqz}</td>
				<td align="left">${stxxBean.ldxz}</td>
				<td align="left">${stxxBean.djsj}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>