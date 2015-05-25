<%@ page language="java" pageEncoding="UTF-8" contentType="application/msexcel" %>
<%@page import="java.net.URLEncoder" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%   
  //独立打开excel软件   
  //response.setHeader("Content-disposition","attachment; filename=ldrkzzxxb.doc");   
  //嵌套在ie里打开excel   
  String fileName = URLEncoder.encode("考核考评排名（大类）", "UTF-8");
  response.setHeader("Content-disposition","inline; filename=" + fileName + ".xls"); 
  //Word只需要把contentType="application/msexcel"改为contentType="application/msword"  
%> 
<html>
	<head></head>
	<body>
		<table border="1" cellpadding="0" cellspacing="0">
			<tr>
				<td colspan="11">
					<h1 style="text-align:center;">考核考评排名（大类）</h1>
				</td>
			</tr>
			<tr>
				<td colspan="11" align="center">
					考核时间：${query.tjsjms}
					<c:choose>
						<c:when test="${query.tjsjfw eq '1'}">1号-10号</c:when>
						<c:when test="${query.tjsjfw eq '2'}">1号-20号</c:when>
						<c:when test="${query.tjsjfw eq '3'}">1号-月底</c:when>
					</c:choose>
					&nbsp;&nbsp;
					考核单位：${query.khdwmc}&nbsp;&nbsp;
				</td>
			</tr>
			<tr>
				<th>序号</th>
				<th>单位名称</th>
				<th>总分</th>
				<th>排名</th>
				<th>两实信息<br/>采集维护25分</th>
				<th>重点人员<br/>动态管控20分</th>
				<th>八进社区<br/>工作20分</th>
				<th>群众工作<br/>入户走访20分</th>
				<th>情报信息<br/>收集报送5分</th>
				<th>安全防范<br/>日常管理5分</th>
				<th>防控刑事<br/>治安案件5分</th>
			</tr>
			<c:forEach items="${khkpDataList}" var="dl" varStatus="s">
				<tr>
					<td align="center" >${s.index + 1}</td>
					<td >${dl.orgname}</td>
					<td align="right">${dl.zfz}&nbsp;</td>
					<td align="center">${dl.pm}&nbsp;</td>
					<td align="center">${dl.lszf}&nbsp;</td>
					<td align="center">${dl.zdryzf}&nbsp;</td>
					<td align="center">${dl.xgjzzf}&nbsp;</td>
					<td align="center">${dl.qzzfzf}&nbsp;</td>
					<td align="center">${dl.qbzf}&nbsp;</td>
					<td align="center">${dl.aqffzf}&nbsp;</td>
					<td align="center">${dl.fkxszaajzf}&nbsp;</td>
				</tr>
			</c:forEach>
		</table>
	</body>
</html>