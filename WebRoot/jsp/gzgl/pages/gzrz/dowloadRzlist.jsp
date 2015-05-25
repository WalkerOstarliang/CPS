<%@page language="java" pageEncoding="UTF-8" contentType="application/msexcel" %>
<%@page import="java.net.URLEncoder" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%   
  //独立打开excel软件   
  //response.setHeader("Content-disposition","attachment; filename=ldrkzzxxb.doc");   
  //嵌套在ie里打开excel   
  String fileName = URLEncoder.encode("民警日志列表", "UTF-8");
  response.setHeader("Content-disposition","inline; filename=" + fileName + ".xls");   
  //Word只需要把contentType="application/msexcel"改为contentType="application/msword"  
%> 
<html>
<head></head>
<body>
	<table class="cps-tablegrid" border="1">
		<div id="biaoti" class="text" style="text-align:center">
				<h1 style="font-size:150%">民警日志列表</h1> 
		</div>
		<thead>
			<tr>
				<th style="text-align: center;">
					序号
				</th>
				<th style="text-align: center;">
					日志标题
				</th>
				<th style="text-align: center;">
					日志内容
				</th>
				<th style="text-align: center;">
					民警姓名
				</th>
				<th style="text-align: center;">
					所属单位
				</th>
				<th style="text-align: center;">
					填写日期
				</th>
			</tr>
		</thead>
		<c:forEach items="${rizhiList}" var="dataList" varStatus="s">
			<tr>
				<td align="left">
					${s.index + 1}
				</td>
				<td align="center">
					${dataList.rzbt}&nbsp;
				</td>
				<td align="center">
					${dataList.gznrms}&nbsp;
				</td>
				<td align="center">
					${dataList.gzmjxm}&nbsp;
				</td>
				<td align="center">
					${dataList.gzmjdwmc}&nbsp;
				</td>
				<td align="center">
					${dataList.gzrq}&nbsp;
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>