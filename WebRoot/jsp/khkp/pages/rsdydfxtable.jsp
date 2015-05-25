<%@page pageEncoding="UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table width="99.8%" class="cps-tablegrid" id="table_cxjgList" border="0" cellSpacing="0" cellPadding="0">
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