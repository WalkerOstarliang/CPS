<%@ page language="java" pageEncoding="UTF-8" contentType="application/msexcel" %>
<%@page import="java.net.URLEncoder" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%   
  //独立打开excel软件   
  //response.setHeader("Content-disposition","attachment; filename=ldrkzzxxb.doc");   
  //嵌套在ie里打开excel   
  String fileName = URLEncoder.encode("考核考评排名（细类）", "UTF-8");
  response.setHeader("Content-disposition","inline; filename=" + fileName + ".xls"); 
  //Word只需要把contentType="application/msexcel"改为contentType="application/msword"  
%> 
<html>
	<head></head>
	<body>
		<table border="1" cellpadding="0" cellspacing="0">
			<tr>
				<td colspan="26">
					<h1 style="text-align:center;">考核考评排名（细类）</h1>
				</td>
			</tr>
			<tr>
				<td colspan="26" align="center">
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
				<th rowspan="2">序号</th>
				<th rowspan="2">单位名称</th>
				<th rowspan="2">总分</th>
				<th rowspan="2">排名</th>
				<th colspan="4">两实信息采集维护<br/>25分</th>
				<th colspan="7">重点人员动态管控<br/>20分</th>
				<th colspan="5">八进社区工作<br/>20分</th>
				<th colspan="2">群众工作入户走访<br/>20分</th>
				<th colspan="2">情报信息收集报送<br/>5分</th>
				<th rowspan="2">安全防范<br/>日常管理<br/>5分</th>
				<th rowspan="2" >防控刑事<br/>治安案件<br/>5分</th>
			</tr>
			<tr>
				<th >基础信息<br/>采集数量<br/>3分</th>
				<th >信息维护<br/>11分</th>
				<th >信息质量<br/>10分</th>
				<th >境外人员<br/>管理1分</th>
				<th >下发数据<br/>维护6分</th>
				<th >委托签收<br/>管理2分</th>
				<th >在控登记<br/>质量5分</th>
				<th >重点人员<br/>重新违法<br/>犯罪2分</th>
				<th >取保候审<br/>监视居住<br/>管理2分</th>
				<th >社区矫正<br/>对象管理<br/>2分</th>
				<th >稳控对象<br/>管理<br/>1分<br/></th>
				<th >消防基础<br/>工作<br/>5分</th>
				<th >治安基础<br/>工作<br/>7分</th>
				<th >网技基础<br/>工作<br/>3分</th>
				<th >内保基础<br/>工作<br/>2分</th>
				<th >禁毒基础<br/>工作<br/>3分</th>
				<th >一般性<br/>走访<br/>16分</th>
				<th >入室盗窃<br/>回访<br/>4分</th>
				<th >情报<br/>收集<br/>2分</th>
				<th >情报<br/>运用<br/>3分</th>
			</tr>
			<c:forEach items="${khkpDataList}" var="xl" varStatus="s">
			<tr>
				<td>${s.index + 1}</td>
				<td>${xl.orgname}</td>
				<td>${xl.zfz}</td>
				<td>${xl.pm}</td>
				<td>${xl.jcxxcjslfz}</td>
				<td>${xl.xxwffz}</td>
				<td>${xl.xxzlfz}</td>
				<td>${xl.jwrygl}</td>
				<td>${xl.xfsjwffz}</td>
				<td>${xl.wtqsglfz}</td>
				<td>${xl.zkdjzlfz}</td>
				<td>${xl.zdrycxwffz}</td>
				<td>${xl.qbhsjsjzgl}</td>
				<td>${xl.sqjzdxgl}</td>
				<td>${xl.wkdxgl}</td>
				<td>${xl.xfjcgzfz}</td>
				<td>${xl.zajcgzfz}</td>
				<td>${xl.wjjcgzfz}</td>
				<td>${xl.nbjcgzfz}</td>
				<td>${xl.jdjcgzfz}</td>
				<td>${xl.ybxzf}</td>
				<td>${xl.rsdqhf}</td>
				<td>${xl.qbsjfz}</td>
				<td>${xl.qbyyfz}</td>
				<td>${xl.aqffzf}</td>
				<td>${xl.fkxszaajzf}</td>
			</tr>
			</c:forEach>
		</table>
	</body>
</html>