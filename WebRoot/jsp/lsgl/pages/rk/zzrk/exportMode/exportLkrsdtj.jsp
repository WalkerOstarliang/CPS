<%@ page language="java" pageEncoding="UTF-8" contentType="application/msexcel" %>
<%@page import="java.net.URLEncoder" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%   
  //独立打开excel软件   
  //response.setHeader("Content-disposition","attachment; filename=ldrkzzxxb.doc");   
  //嵌套在ie里打开excel   
  String fileName = URLEncoder.encode("高危地区流动人口登记情况统计分析表", "UTF-8");
  response.setHeader("Content-disposition","inline; filename=" + fileName + ".xls"); 
  //Word只需要把contentType="application/msexcel"改为contentType="application/msword"  
%> 
<html>
<head></head>
<body>
	<table class="cps-tablegrid" border="0">
		<tr>
			<td>
				<h2 style="text-align:center">高危地区流动人口登记情况统计分析表</h2>
			</td>
		</tr>
		<tr>
			<td align="right">
				统计时间：${queryBean.djsj_start}&nbsp;
				<c:if test="${!(queryBean.djsj_end eq '')}">
					至&nbsp;${queryBean.djsj_end}&nbsp;
				</c:if>
			</td>
		</tr>
		<tr>
			<td>
				<table class="cps-tablegrid" border="1">
					<tr>
						<th>单位</th>
						<th>总数</th>
						<th>安徽枞阳</th>
						<th>江西宜春</th>
						<th>湖北监利</th>
						<th>湖北石首</th>
						<th>衡阳耒阳</th>
						<th>张家界桑植</th>
						<th>益阳安化</th>
						<th>怀化麻阳</th>
						<th>湘西保靖</th>
						<th>湘西永顺</th>
						<th>贵州沿河</th>
					</tr>
					<c:forEach items="${rsdfxList}" var="rsdfx" varStatus="s">
						<tr>
							<td>${rsdfx.orgname}&nbsp;</td>
							<td align="center">${rsdfx.zs}&nbsp;</td>
							<td align="center">${rsdfx.s340823}&nbsp;</td>
							<td align="center">${rsdfx.s360900}&nbsp;</td>
							<td align="center">${rsdfx.s421023}&nbsp;</td>
							<td align="center">${rsdfx.s421081}&nbsp;</td>
							<td align="center">${rsdfx.s430481}&nbsp;</td>
							<td align="center">${rsdfx.s430822}&nbsp;</td>
							<td align="center">${rsdfx.s430923}&nbsp;</td>
							<td align="center">${rsdfx.s431226}&nbsp;</td>
							<td align="center">${rsdfx.s433125}&nbsp;</td>
							<td align="center">${rsdfx.s433127}&nbsp;</td>
							<td align="center">${rsdfx.s522228}&nbsp;</td>
						</tr>
					</c:forEach>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>