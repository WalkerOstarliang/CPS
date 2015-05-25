<%@ page language="java" pageEncoding="UTF-8" contentType="application/msexcel" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%   
  //独立打开excel软件   
  //response.setHeader("Content-disposition","attachment; filename=ldrkzzxxb.doc");   
  //嵌套在ie里打开excel   
  response.setHeader("Content-disposition","inline; filename=cyryexcel.xls");   
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
			<th>工作单位</th>
			<th>职务</th>
			<th>联系电话</th>
			<th>现住地详址</th>
			<th>登记人</th>
			<th>登记单位</th>
			<th>数据来源</th>
		</tr>
		<c:forEach items="${cyryBeans}" var="cyryBean" varStatus="st">
			<tr>
				<td>${st.index + 1}</td>
				<td>${cyryBean.xm}</td>
				<td>${cyryBean.sfzh}&nbsp;</td>
				<td>${cyryBean.xbms}</td>
				<td>${cyryBean.csrq}</td>
				<td>${cyryBean.dwmc}</td>
				<td>${cyryBean.zwlbmc}</td>
				<td>${cyryBean.lxdh}</td>
				<td>${cyryBean.xzzxz}</td>
				<td>${cyryBean.djrxm}</td>
				<td>${cyryBean.djdwmc}</td>
				<td>${cyryBean.sfjwtdjms}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>