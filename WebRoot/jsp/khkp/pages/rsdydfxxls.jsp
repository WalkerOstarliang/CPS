<%@ page language="java" pageEncoding="UTF-8" contentType="application/msexcel" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%   
  //独立打开excel软件   
  //response.setHeader("Content-disposition","attachment; filename=ldrkzzxxb.doc");   
  //嵌套在ie里打开excel   
  response.setHeader("Content-disposition","inline; filename=rsdyfxb.xls");   
  //Word只需要把contentType="application/msexcel"改为contentType="application/msword"  
%> 
<html>
<body>
	<table class="cps-tablegrid" border="1">
		<tr>
			<th>序号</th>
			<th>单位名称</th>
			<c:forEach items="${columns}" var="column">
				<th id="${column.key}">${column.value}</th>
			</c:forEach>
		</tr>
		<c:if test="${resultList != null}">
			<c:forEach items="${resultList}" var="rowmap" varStatus="st">
				<tr>
					<td>${st.index + 1}</td>
					<c:forEach items="${rowmap}" var="entry">
						<c:choose>
							<c:when test="${entry.key == 'dwdm'}">
								<c:set var="dwdm" value="${entry.value}"></c:set>
							</c:when>
							<c:when test="${entry.key == 'leve'}">
								<c:set var="dwleve" value="${entry.value}"></c:set>
							</c:when>
							<c:when test="${entry.key == 'dwmc'}">
								<c:choose>
									<c:when test="${dwleve eq 5}">
										<td align="left">${entry.value }</td>
									</c:when>
									<c:otherwise>
										<td align="left">&nbsp;<span class="cps_span_href" onclick="clickDwHref('${dwdm}','${entry.value}',${dwleve})">${entry.value }</span></td>
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<td>${entry.value }</td>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</tr>
			</c:forEach>
		</c:if>
	</table>
</body>
</html>