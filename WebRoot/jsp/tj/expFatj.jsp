<%@ page language="java" pageEncoding="GBK"  contentType="application/msexcel" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%   
  //������excel���   
  //response.setHeader("Content-disposition","attachment; filename=ldrkzzxxb.doc");   
  //Ƕ����ie���excel   
  //String fileName = URLEncoder.encode("ddc", "UTF-8");
   response.setHeader("Content-disposition","inline; filename=rsdfaqk.xls");   
  //Wordֻ��Ҫ��contentType="application/msexcel" ��ΪcontentType="application/msword"  
%>
<html>
	<head></head>
	<body>
		<table border="1">
			<tr>
				<th colspan="6" cssStyle="text-align:center;height:45px;font-size:14px" >
				���ҵ����ư���ͳ�Ʊ�
				</th>
			</tr>
			<tr>
				<th rowspan="2" cssStyle="text-align:center" width="50">���</th>
				<th rowspan="2" cssStyle="text-align:center" width="300">��λ����</th>
				<th colspan="2" cssStyle="text-align:center" width="350">����</th>
				<th colspan="2" cssStyle="text-align:center" width="350">�ư�</th>
			</tr>
			<tr>
				<th cssStyle="text-align:center" width="150">���°�������</th>
				<th cssStyle="text-align:center" width="150">���ҵ���</th>
				<th cssStyle="text-align:center" width="150">���°�������</th>
				<th cssStyle="text-align:center" width="150">���ҵ���</th>
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
