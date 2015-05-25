<%@ page language="java" pageEncoding="UTF-8" contentType="application/msexcel" %>
<%@page import="java.net.URLEncoder" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%   
  //独立打开excel软件   
  //response.setHeader("Content-disposition","attachment; filename=ldrkzzxxb.doc");   
  //嵌套在ie里打开excel   
  String fileName = URLEncoder.encode("居住证", "UTF-8");
  response.setHeader("Content-disposition","inline; filename=" + fileName + ".xls"); 
  //Word只需要把contentType="application/msexcel"改为contentType="application/msword"  
%> 
<html>
	<head>
	</head>
	<body>
		<table border="1">
			<tr>
				<th>序号</th>
				<th>姓名</th>
				<th>身份证号码</th>
				<th>性别</th>
				<th>现住地址</th>
				<th>户籍详址</th>
				<th>有效期(年)</th>
				<th>打印状态</th>
				<th>打印标志</th>
				<th>制证时间</th>
				<th>居住证标识</th>
				<th>流口标识</th>
			</tr>
			<c:forEach items="${ldrkJjzList}" var="jzz" varStatus="s">
				<tr>
					<td>${s.index + 1}</td>
					<td>${jzz.xm}&nbsp;</td>
					<td>${jzz.sfzh}&nbsp;</td>
					<td>${jzz.xbms}&nbsp;</td>
					<td>${jzz.xzzxz}&nbsp;</td>
					<td>${jzz.hjdxz}&nbsp;</td>
					<td>${jzz.yxqxms}&nbsp;</td>
					<td>${jzz.dyztms}&nbsp;</td>
					<td>${jzz.jzzdyztms}&nbsp;</td>
					<td>${jzz.zzsj}&nbsp;</td>
					<td>${jzz.jzzzxbsms}&nbsp;</td>
					<td>${jzz.ldrkzxbsms}&nbsp;</td>
				</tr>
			</c:forEach>
		</table>
	</body>	
</html>