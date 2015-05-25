<%@ page language="java" pageEncoding="UTF-8" contentType="application/msexcel" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%   
  //独立打开excel软件   
  //response.setHeader("Content-disposition","attachment; filename=ldrkzzxxb.doc");   
  //嵌套在ie里打开excel   
  response.setHeader("Content-disposition","inline; filename=jzrkexcel.xls");   
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
			<th>户籍地区划</th>
			<th>户籍地详址</th>
			<th>现住地区划</th>
			<th>现住地详址</th>
			<th>寄住时间</th>
			<th>寄住原因</th>
			<th>与户主关系</th>
			<th>核实时间</th>
		</tr>
		<c:forEach items="${jzrkBeans}" var="jzrkBean" varStatus="st">
			<tr>
				<td>${st.index + 1}</td>
				<td>${jzrkBean.xm}</td>
				<td>${jzrkBean.sfzh}&nbsp;</td>
				<td>${jzrkBean.xbms}</td>
				<td>${jzrkBean.csrq}</td>
				<td>${jzrkBean.lxdh}</td>
				<td>${jzrkBean.hjdqhmc}</td>
				<td>${jzrkBean.hjdxz}</td>
				<td>${jzrkBean.xzzqhmc}</td>
				<td>${jzrkBean.xzzxz}</td>
				<td>${jzrkBean.jzsj}</td>
				<td>${jzrkBean.jzyyms}</td>
				<td>${jzrkBean.yhzgyms}</td>
				<td>${jzrkBean.czsj}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>