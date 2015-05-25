<%@ page language="java" pageEncoding="UTF-8" contentType="application/msexcel" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%   
  //独立打开excel软件   
  //response.setHeader("Content-disposition","attachment; filename=ldrkzzxxb.doc");   
  //嵌套在ie里打开excel   
  response.setHeader("Content-disposition","inline; filename=czrkexcel.xls");   
  //Word只需要把contentType="application/msexcel"改为contentType="application/msword"  
%> 
<html>
<body>
	<table class="cps-tablegrid" border="1">
		<tr>
			<th>序号</th>
			<th>姓名</th>
			<th>公民身份证号</th>
			<th>户号</th>
			<th>与户主关系</th>
			<th>性别</th>
			<th>出生日期</th>
			<th>联系电话</th>
			<th>户籍地区划</th>
			<th>户籍地详址</th>
			<th>现住地区划</th>
			<th>现住地详址</th>
			<th>户号</th>
			<th>户口类别</th>
			<th>迁入时间</th>
			<th>其它住址省市县区</th>
			<th>其他住址详址</th>
			<th>核实时间</th>
		</tr>
		<c:forEach items="${czrkBeans}" var="czrkBean" varStatus="st">
			<tr>
				<td>${st.index + 1}</td>
				<td>${czrkBean.xm}</td>
				<td>${czrkBean.sfzh}&nbsp;</td>
				<td>${czrkBean.hh}&nbsp;</td>
				<td>${czrkBean.yhzgxms}</td>
				<td>${czrkBean.xbms}</td>
				<td>${czrkBean.csrq}</td>
				<td>${czrkBean.lxdh}</td>
				<td>${czrkBean.hjdqhmc}</td>
				<td>${czrkBean.hjdxz}</td>
				<td>${czrkBean.xzzqhmc}</td>
				<td>${czrkBean.xzzxz}</td>
				<td>${czrkBean.hh}&nbsp;</td>
				<td>${czrkBean.hklbmc}</td>
				<td>${czrkBean.qrsj}</td>
				<td>${czrkBean.qtzzssxqmc}</td>
				<td>${czrkBean.qtzzxz}</td>
				<td>${czrkBean.czsj}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>