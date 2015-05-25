<%@ page language="java" pageEncoding="UTF-8"  contentType="application/msexcel" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%   
  //独立打开excel软件   
  //response.setHeader("Content-disposition","attachment; filename=ldrkzzxxb.doc");   
  //嵌套在ie里打开excel   
  //String fileName = URLEncoder.encode("ddc", "UTF-8");
   response.setHeader("Content-disposition","inline; filename=ddcexport.xls");   
  //Word只需要把contentType="application/msexcel" 改为contentType="application/msword"  
%> 
<html>
	<head></head>
	<body>
		<table  class="cps-tablegrid" border="1">
			<tr>
				<th>序号</th>
				<th>号牌号码</th>
				<th>电机号</th>
				<th>销售单位</th>
				<th>销售时间</th>
				<th>购买人</th>
				<th>购买人身份证</th>
			</tr>
			<c:forEach items="${ddcList}" var="ddc" varStatus="s">
				<tr>
					<td>${s.index + 1}&nbsp;</td>
					<td>${ddc.hphm }&nbsp;</td>
					<td>${ddc.djh }&nbsp;</td>
					<td>${ddc.jxdmc }&nbsp;</td>
					<td>${ddc. xssj}&nbsp;</td>
					<td>${ddc.gmzxm }&nbsp;</td>
					<td>${ddc.gmzsfzh }&nbsp;</td>
				</tr>
			</c:forEach>
		</table>
	</body>
</html>