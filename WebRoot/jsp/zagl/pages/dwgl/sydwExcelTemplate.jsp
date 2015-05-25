<%@ page language="java" pageEncoding="UTF-8" contentType="application/msexcel" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%   
  //独立打开excel软件   
  //response.setHeader("Content-disposition","attachment; filename=ldrkzzxxb.doc");   
  //嵌套在ie里打开excel   
  response.setHeader("Content-disposition","inline; filename=sydwexcel.xls");   
  //Word只需要把contentType="application/msexcel"改为contentType="application/msword"  
%> 
<html>
<head></head>
<body>
	<table class="cps-tablegrid" border="1">
		<tr>
			<th>序号</th>
			<th>单位名称</th>
			<th>组织机构代码</th>
			<th>单位属性</th>
			<th>法人代表</th>
			<th>法人身份证</th>
			<th>单位电话</th>
			<th>管理部门</th>
			<th>营业执照号</th>
			<th>单位地址</th>
			<th>登记人</th>
		</tr>
		<c:forEach items="${sydwBeans}" var="sydwBean" varStatus="st">
			<tr>
				<td>${st.index + 1}</td>
				<td>${sydwBean.dwmc}&nbsp;</td>
				<td>${sydwBean.dwdm}&nbsp;</td>
				<td>${sydwBean.hylbmc}&nbsp;</td>
				<td>${sydwBean.frdb}&nbsp;</td>
				<td>${sydwBean.frsfzhm}&nbsp;</td>
				<td>${sydwBean.dwdh}&nbsp;</td>
				<td>${sydwBean.glbmmc}&nbsp;</td>
				<td>${sydwBean.yyzzbh}&nbsp;</td>
				<td>${sydwBean.dwdz}&nbsp;</td>
				<td>${sydwBean.djrxm}&nbsp;</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>