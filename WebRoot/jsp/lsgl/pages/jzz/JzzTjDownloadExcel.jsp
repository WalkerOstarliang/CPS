<%@page language="java" pageEncoding="UTF-8" contentType="application/msexcel" %>
<%@page import="java.net.URLEncoder" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%   
  //独立打开excel软件   
   
  //嵌套在ie里打开excel   
  String fileName = URLEncoder.encode("居住证统计结果", "UTF-8");
  //response.setHeader("Content-disposition","inline; filename=" + fileName + ".xls");  
  response.setHeader("Content-disposition","attachment; filename=" + fileName + ".xls"); 
  //Word只需要把contentType="application/msexcel"改为contentType="application/msword"  
%> 
<html>
<head></head>
<body>
	<table class="cps-tablegrid" border="1">
		<thead>
			<tr>
				<th colspan="12">
					<h3>${queryBean.tjdwmc}居住证统计</h3>
				</th>
			</tr>
			<tr>
				<th colspan="12">
					统计单位：${queryBean.tjdwmc}
					<c:set var ="kssj" value= "${queryBean.tjsj_start}"/>
					<c:set var ="jssj" value= "${queryBean.tjsj_end}"/>
					<c:if test="${( not empty kssj &&  not empty jssj)}">
						统计时间：${queryBean.tjsj_start}至${queryBean.tjsj_end}
					</c:if>
					<c:if test="${( not empty kssj &&  empty jssj)}">
						统计时间：${queryBean.tjsj_start}至${queryBean.zbsj}
					</c:if>
					<c:if test="${( empty kssj &&  empty jssj)}">
						统计时间：2014年8月1日至${queryBean.zbsj}
					</c:if>
					<c:if test="${( empty kssj &&  not empty jssj)}">
						统计时间：2014年8月1日至${queryBean.tjsj_end}
					</c:if>
				</th>
			</tr>
			<!--
			<tr>
				<th colspan="12" style="text-align:right;">
					制表单位：${queryBean.tjdwmc}&nbsp;&nbsp;
					制表日期：${queryBean.zbsj}
				</th>
			</tr>
			-->
			<tr>
				<th rowspan="2" >序号</th>
				<th rowspan="2" >单位</th>
				<th colspan="5" >居住证办证数（不包含废证数）</th>
				<th colspan="2" >废证</th>
				<th colspan="2" >遗失补领证</th>
				<th rowspan="2" >办证率</th>
			</tr>
			<tr>
				<th>总数</th>
				<th>本省人数</th>
				<th>外省人数</th>
				<th>男</th>
				<th>女</th>
				<th>废证数</th>
				<th>废证率</th>
				<th>遗失补领数</th>
				<th>遗失补领率</th>
			</tr>
		</thead>
		<c:forEach items="${jzztjResult}" var="result" varStatus="s">
			<tr>
				<td>${s.index + 1}</td>
				<td>${result.orgname}</td>
				<td>${result.jzzdjs}</td>
				<td>${result.jzzdjbsrs}</td>
				<td>${result.jzzdjwsrs}</td>
				<td>${result.jzzdjms}</td>
				<td>${result.jzzdjws}</td>
				<td>${result.fzs}</td>
				<td>${result.fzl}</td>
				<td>${result.ysbds}</td>
				<td>${result.ysbdl}</td>
				<td>${result.bzl}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>