<%@ page language="java" pageEncoding="UTF-8" contentType="application/msexcel" %>
<%@page import="java.net.URLEncoder" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%   
  //独立打开excel软件   
  //response.setHeader("Content-disposition","attachment; filename=ldrkzzxxb.doc");   
  //嵌套在ie里打开excel   
  String fileName = URLEncoder.encode("技防单位", "UTF-8");
  response.setHeader("Content-disposition","inline; filename=" + fileName + ".xls"); 
  //Word只需要把contentType="application/msexcel"改为contentType="application/msword"  
%> 
<html>
	<head></head>
	<body>
		<table class="cps-tablegrid" border="1">
			<tr>
				<td colspan="12" align="center">
					<h1 style="text-align:center">长沙市安防系统、施工单位备案登记表（年审）</h1>
				</td>
			</tr>
			<tr>
				<td colspan="12" align="center">
					年审时间：${dwcx.nssj_strat}
					<c:if test="${!(empty dwcx.nssj_end)}" >
						&nbsp;至&nbsp;${dwcx.nssj_end}
					</c:if>
				</td>
			</tr>
			<tr>
				<th>序号</th>
				<th>单位名称</th>
				<th>地址</th>
				<th>法人代表</th>
				<th>办公电话</th>
				<th>移动电话</th>
				<th>从业人数</th>
				<th>联系人</th>
				<th>联系电话</th>
				<th>年审时间</th>
				<th>备案等级</th>
				<th>备注</th>										
			</tr>
			<c:forEach var="nsxx" items="${nsList}" varStatus="s">
				<tr>
					<td>${s.index + 1}</td>
					<td>${nsxx.dwmc}&nbsp;</td>
					<td>${nsxx.dwdz}&nbsp;</td>
					<td>${nsxx.frdb}&nbsp;</td>
					<td>${nsxx.frlxdh}&nbsp;</td>
					<td>${nsxx.frlxdh}&nbsp;</td>
					<td>${nsxx.cyrs}&nbsp;</td>
					<td>${nsxx.frdb}&nbsp;</td>
					<td>${nsxx.dwdh}&nbsp;</td>
					<td>${nsxx.nsrj}&nbsp;</td>
					<td>${nsxx.badjmc}&nbsp;</td>
					<td>${nsxx.bz}&nbsp;</td>
				</tr>
			</c:forEach>
		</table>
	</body>
</html>