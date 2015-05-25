<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:Script src="/jsp/gzgl/js/pcsxchdtj.js"></creator:Script>
	
	<cps:PanelView>
		<cps:tbar> 
			<cps:button value="返回" onclick="xchdUp()" />
		</cps:tbar>
		<cps:panel title="宣传活动统计">
			<input type="hidden" id="orgcode" value="${query.orgcode}" />
			<input type="hidden" id="orgleve" value="${query.orgleve }" />
			<cps:table>
				<cps:row>
					<cps:tdLabel cssStyle="text-align:center;">序号</cps:tdLabel>
					<cps:tdLabel cssStyle="text-align:center;">单位</cps:tdLabel>
					<cps:tdLabel cssStyle="text-align:center;">消防安全</cps:tdLabel>
					<cps:tdLabel cssStyle="text-align:center;">防电信诈骗</cps:tdLabel>
					<cps:tdLabel cssStyle="text-align:center;">防入室盗窃</cps:tdLabel>
					<cps:tdLabel cssStyle="text-align:center;">反家庭暴力</cps:tdLabel>
					<cps:tdLabel cssStyle="text-align:center;">防扒窃</cps:tdLabel>
					<cps:tdLabel cssStyle="text-align:center;">其他</cps:tdLabel>
					<cps:tdLabel cssStyle="text-align:center;">合计</cps:tdLabel>
				</cps:row>
				<c:forEach items="${xchdTjList}" var="tj" varStatus="s">
					<cps:row>
						<cps:tdContent cssStyle="text-align:center">${s.index + 1}</cps:tdContent>
						<cps:tdContent>
							<c:choose>
								<c:when test="${tj.orgleve eq '5'}">
									${tj.orgname}
								</c:when>
								<c:otherwise>
									<span class="cps_span_href" onclick="xchdDown('${tj.orgcode}','${tj.orgleve}')" style="color:green">${tj.orgname}</span>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdContent cssStyle="text-align:center">${tj.xfaq}</cps:tdContent>
						<cps:tdContent cssStyle="text-align:center">${tj.fdxzp}</cps:tdContent>
						<cps:tdContent cssStyle="text-align:center">${tj.frsdq}</cps:tdContent>
						<cps:tdContent cssStyle="text-align:center">${tj.fjtbl}</cps:tdContent>
						<cps:tdContent cssStyle="text-align:center">${tj.fpq}</cps:tdContent>
						<cps:tdContent cssStyle="text-align:center">${tj.qt}</cps:tdContent>
						<cps:tdContent cssStyle="text-align:center">${tj.hj}</cps:tdContent>
					</cps:row>
				</c:forEach>
			</cps:table>
		</cps:panel>
	</cps:PanelView>
</creator:view>