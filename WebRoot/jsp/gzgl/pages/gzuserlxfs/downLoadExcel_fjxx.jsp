<%@ page language="java" pageEncoding="UTF-8" contentType="application/msexcel" %>
<%@page import="java.net.URLEncoder" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%   
  //独立打开excel软件   
  //response.setHeader("Content-disposition","attachment; filename=ldrkzzxxb.doc");   
  //嵌套在ie里打开excel   
  String fileName = URLEncoder.encode("流口协管员信息", "UTF-8");
  response.setHeader("Content-disposition","inline; filename=" + fileName + ".xls"); 
  //Word只需要把contentType="application/msexcel"改为contentType="application/msword"  
%> 
<html>
<head></head>
<body>
	<table class="cps-tablegrid" border="1">
		<tr>
			<th>序号</th>
      		<th>姓名</th>
      		<th>编号</th>
			<th>身份证号</th>
			<th>性别</th>
     		<th>岗位</th>
      		<th>学历</th> 
			<th>联系电话</th>
			<th>是否专职</th>
			<th>所属单位</th>
		</tr>
		<c:forEach items="${fjBeans}" var="fjBean" varStatus="s">
			<tr>
				<td>${s.index + 1}</td>
				<td>${fjBean.fjxm }&nbsp;</td>
				<td>${fjBean.fjjh }&nbsp;</td>
				<td>${fjBean.sfzh }&nbsp;</td>
				<td>${fjBean.xbms }&nbsp;</td>
				<td>${fjBean.gzgwms }&nbsp;</td>
				<td>${fjBean.whcdms }&nbsp;</td>
				<td>${fjBean.lxfs }&nbsp;</td>
				<td>${fjBean.sfzzms }&nbsp;</td>
				<td>${fjBean.ssdwmc }&nbsp;</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>