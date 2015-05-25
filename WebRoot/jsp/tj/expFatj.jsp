<%@ page language="java" pageEncoding="GBK"  contentType="application/msexcel" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%   
  //独立打开excel软件   
  //response.setHeader("Content-disposition","attachment; filename=ldrkzzxxb.doc");   
  //嵌套在ie里打开excel   
  //String fileName = URLEncoder.encode("ddc", "UTF-8");
   response.setHeader("Content-disposition","inline; filename=rsdfaqk.xls");   
  //Word只需要把contentType="application/msexcel" 改为contentType="application/msword"  
%>
<html>
	<head></head>
	<body>
		<table border="1">
			<tr>
				<th colspan="6" cssStyle="text-align:center;height:45px;font-size:14px" >
				入室盗立破案数统计表
				</th>
			</tr>
			<tr>
				<th rowspan="2" cssStyle="text-align:center" width="50">序号</th>
				<th rowspan="2" cssStyle="text-align:center" width="300">单位名称</th>
				<th colspan="2" cssStyle="text-align:center" width="350">立案</th>
				<th colspan="2" cssStyle="text-align:center" width="350">破案</th>
			</tr>
			<tr>
				<th cssStyle="text-align:center" width="150">刑事案件总数</th>
				<th cssStyle="text-align:center" width="150">入室盗窃</th>
				<th cssStyle="text-align:center" width="150">刑事案件总数</th>
				<th cssStyle="text-align:center" width="150">入室盗窃</th>
			</tr>
			
			<c:forEach items="${faTjList}" var="faTjList" varStatus="s">
				<tr>
					<td cssStyle="text-align:center">${s.index+1}</td>	
					<td>${faTjList.orgname}</td>	
					<td cssStyle="text-align:center">${faTjList.laxsaj}</td>	
					<td cssStyle="text-align:center">${faTjList.larsdq}</td>	
					<td cssStyle="text-align:center">${faTjList.paxsaj}</td>	
					<td cssStyle="text-align:center">${faTjList.parsdq}</td>		
				</tr>
			</c:forEach>
		</table>
	</body>
</html> 
