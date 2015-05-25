<%@ page language="java" pageEncoding="UTF-8" contentType="application/msexcel" %>
<%@page import="java.net.URLEncoder" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%   
  //独立打开excel软件   
  //response.setHeader("Content-disposition","attachment; filename=ldrkzzxxb.doc");   
  //嵌套在ie里打开excel   
  String fileName = URLEncoder.encode("派出所警务区情况统计表.xls", "UTF-8");
  response.setHeader("Content-disposition","inline; filename=" + fileName);   
  //Word只需要把contentType="application/msexcel"改为contentType="application/msword"  
%> 
<html>
<head></head>
<body>
	<table class="cps-tablegrid" border="1">
		<tr>
			<td colspan="12" align="center">
				<h1>${pcsqkBean.orgname}社区警务基本情况表</h1>
			</td>
			
		</tr>
		<tr>
			<td colspan="12" align="left">
				<span style="color: red;font-size: 12pt;">共有派出所${pcsqkBean.pcssl}个；警务区${pcsqkBean.jwqsl}个；社区民警${pcsqkBean.sqmjsl}名。</span>
			</td>
		</tr>
		<tr>
			<th rowspan="2"  cssStyle="text-align:center" >序号</th>
			<th rowspan="2"  cssStyle="text-align:center" >分县区局名称</th>
			<th rowspan="2"  cssStyle="text-align:center" >派出所名称</th>
			<th rowspan="2"  cssStyle="text-align:center" >警务区名称</th>
			<th colspan="5"  cssStyle="text-align:center" >社区民警</th>
			<th rowspan="2"  cssStyle="text-align:center" >包含社<br/>区（村）</th>
			<th rowspan="2"  cssStyle="text-align:center" >警务区<br/>类别</th>
			<th rowspan="2"  cssStyle="text-align:center" >配备协<br/>辅警数</th>
		</tr>
		<tr>
			<th cssStyle="text-align:center">姓名</th>
			<th cssStyle="text-align:center">警号</th>
			<th cssStyle="text-align:center">身份证号</th>
			<th cssStyle="text-align:center">年龄</th>
			<th cssStyle="text-align:center">手机号码</th>
		</tr>
		<c:if test="${not empty pcsjwqJbqkList}">
			<c:forEach items="${pcsjwqJbqkList}" var="bean" varStatus="st">
				<tr>
					<td cssStyle="text-align:center">${st.index + 1}</td>
					<td cssStyle="text-align:center" width="100">${bean.fxjmc}</td>
					<td cssStyle="text-align:center" width="200">${bean.pcsmc}</td>
					<td cssStyle="text-align:center" width="200">${bean.jwqmc}</td>
					<td cssStyle="text-align:center">${bean.realname}&nbsp;</td>
					<td cssStyle="text-align:center">${bean.username}&nbsp;</td>
					<td cssStyle="text-align:center">${bean.sfzh}&nbsp;</td>
					<td cssStyle="text-align:center">${bean.age}&nbsp;</td>
					<td cssStyle="text-align:center">${bean.lxdh}&nbsp;</td>
					<td cssStyle="text-align:center">${bean.gxsq}&nbsp;</td>
					<td cssStyle="text-align:center">${bean.jwqdjms}&nbsp;</td>
					<td cssStyle="text-align:center">${bean.pbfjs}&nbsp;</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
</body>
</html>