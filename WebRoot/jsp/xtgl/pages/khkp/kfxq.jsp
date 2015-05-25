<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"prefix="fn" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<creator:view>
	<creator:panel id="paenl" title="分数：${fs}">
		<c:forEach items="${map.table}" var="tableList">
			<cps:table>
				<cps:tableTitle colspan="${fn:length(tableList.pageTable.tableHeadList) + 1}">
					${tableList.pageTable.title}
				</cps:tableTitle>
				<cps:row>
					<cps:tdLabel cssStyle="text-align:center; width:40px">序号</cps:tdLabel>
					<c:forEach items="${tableList.pageTable.tableHeadList}" var="tableHead">
						<cps:tdLabel cssStyle="text-align:center;" width="${tableHead.width}" align="${tableHead.align}">
							${tableHead.title}
						</cps:tdLabel>
					</c:forEach>
				</cps:row>
				<c:forEach items="${tableList.pageData}" var="trData" varStatus="s">
					<cps:row>
						<cps:tdContent cssStyle="text-align:center;">
							${s.index + 1}
						</cps:tdContent>
						<c:forEach items="${trData}" var="tdData">
							<cps:tdContent align="center">
							<c:choose>
								<c:when test="${tdData == null || tdData eq ''}">
									&nbsp;									
								</c:when>
								<c:otherwise>
									${tdData}
								</c:otherwise>
							</c:choose>
							</cps:tdContent>
						</c:forEach>
					</cps:row>
				</c:forEach>
			</cps:table>
			<div style="height:10px"></div>
		</c:forEach>
	
		<cps:table>
			<cps:tableTitle>考核规则：</cps:tableTitle>
			<cps:row>
				<cps:tdContent>
					${map.khpz.kfgz}
				</cps:tdContent>
			</cps:row>
		</cps:table>
	</creator:panel>
</creator:view>	

