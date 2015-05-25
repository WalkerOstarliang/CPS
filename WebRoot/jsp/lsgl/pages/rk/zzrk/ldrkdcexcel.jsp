<%@ page language="java" pageEncoding="UTF-8" contentType="application/msexcel" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%   
  //独立打开excel软件   
  //response.setHeader("Content-disposition","attachment; filename=ldrkzzxxb.doc");   
  //嵌套在ie里打开excel   
  response.setHeader("Content-disposition","inline; filename=ldrkexcel.xls");   
  //Word只需要把contentType="application/msexcel"改为contentType="application/msword"  
%> 
<html>
<head></head>
<body>
	<table class="cps-tablegrid" border="1">
		<tr>
			<th>序号</th>
			<th>姓名</th>
			<th>公民身份证号</th>
			<th>性别</th>
			<th>出生日期</th>
			<th>联系电话</th>
			<th>户籍地区划</th>
			<th>户籍地详址</th>
			<th>现住地区划</th>
			<th>现住地详址</th>
			<th>到达时间</th>
			<th>核签时间</th>
			<th>居住事由</th>
			<th>操作单位</th>
			<th>操作人</th>
			<th>操作时间</th>
			<th>拟居住时间</th>
		</tr>
		<c:forEach items="${ldrkBeans}" var="ldrkBean" varStatus="st">
			<tr>
				<td>${st.index + 1}</td>
				<td>${ldrkBean.xm}</td>
				<td>${ldrkBean.sfzh}&nbsp;</td>
				<td>${ldrkBean.xbms}</td>
				<td>${ldrkBean.csrq}</td>
				<td>${ldrkBean.lxdh}</td>
				<td>${ldrkBean.hjdqhmc}</td>
				<td>${ldrkBean.hjdxz}</td>
				<td>${ldrkBean.xzzqhmc}</td>
				<td>${ldrkBean.xzzxz}</td>
				<td>${ldrkBean.lbdrq}</td>
				<td>${ldrkBean.czsj}</td>
				<td>${ldrkBean.zzsyms}</td>
				<td>${ldrkBean.djdwmc}</td>
				<td>${ldrkBean.djrxm}</td>
				<td>${ldrkBean.djsj}</td>
				<td>${ldrkBean.njzrq}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>