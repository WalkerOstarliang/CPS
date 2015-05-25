<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%-- 物业小区发案 --%>
<creator:view>
<creator:Script src="/jsp/zagl/pages/nbgl/js/nbtj.js"></creator:Script>
	<cps:table>
		<cps:row>
			<cps:tdLabel cssStyle="text-align:center" rowspan="3">单位</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center" colspan="7">刑事案件种类</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center" rowspan="3">本月发案总数</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center" rowspan="3">上月发案总数</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center" rowspan="3">环比上月%</cps:tdLabel>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel cssStyle="text-align:center" rowspan="2">抢劫抢夺</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center" colspan="6">盗窃</cps:tdLabel>
		</cps:row>
		<cps:row>
			<cps:tdLabel cssStyle="text-align:center">入室盗窃</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center">盗窃机动车</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center">盗窃摩托车</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center">盗窃电动车</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center">盗窃车内财物</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center">其他盗窃</cps:tdLabel>
		</cps:row>
		
		<c:forEach items="${wyxqfatj}" var="xqfa">
			<cps:row>
				<cps:tdContent cssStyle="text-align:center">
					<c:choose>
					<c:when test="${xqfa.orgCode != null && xqfa.orgCode != '' && xqfa.orgLeve < 5}">
						<span class="cps_span_href" onclick="wyxqfatjDown('${xqfa.orgCode}')" style="color:green">${xqfa.orgName}</span>
					</c:when>
					<c:otherwise>
						${xqfa.orgName}
					</c:otherwise>
				</c:choose>
				</cps:tdContent>
				<cps:tdContent cssStyle="text-align:center">
					<c:choose>
						<c:when test="${(xqfa.qjqd >0) and (not empty xqfa.orgCode)}">
							<span class="cps_span_href" onclick="openAjxxWin('${xqfa.orgCode}','','','${query.tjrq}','','','4','wyxq')" style="color:green">
								${xqfa.qjqd}
							</span>
						</c:when>
						<c:otherwise>
							${xqfa.qjqd}
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdContent cssStyle="text-align:center">
					<c:choose>
						<c:when test="${(xqfa.rsdq >0) and (not empty xqfa.orgCode)}">
							<span class="cps_span_href" onclick="openAjxxWin('${xqfa.orgCode}','','','${query.tjrq}','','','2','wyxq')" style="color:green">
								${xqfa.rsdq}
							</span>
						</c:when>
						<c:otherwise>
							${xqfa.rsdq}
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdContent cssStyle="text-align:center">
					<c:choose>
						<c:when test="${(xqfa.dqjdc >0) and (not empty xqfa.orgCode)}">
							<span class="cps_span_href" onclick="openAjxxWin('${xqfa.orgCode}','','','${query.tjrq}','','','6','wyxq')" style="color:green">
								${xqfa.dqjdc}
							</span>
						</c:when>
						<c:otherwise>
							${xqfa.dqjdc}
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdContent cssStyle="text-align:center">
					<c:choose>
						<c:when test="${(xqfa.dqmtc >0) and (not empty xqfa.orgCode)}">
							<span class="cps_span_href" onclick="openAjxxWin('${xqfa.orgCode}','','','${query.tjrq}','','','7','wyxq')" style="color:green">
								${xqfa.dqmtc}
							</span>
						</c:when>
						<c:otherwise>
							${xqfa.dqmtc}
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdContent cssStyle="text-align:center">
					<c:choose>
						<c:when test="${(xqfa.dqddc >0) and (not empty xqfa.orgCode)}">
							<span class="cps_span_href" onclick="openAjxxWin('${xqfa.orgCode}','','','${query.tjrq}','','','8','wyxq')" style="color:green">
								${xqfa.dqddc}
							</span>
						</c:when>
						<c:otherwise>
							${xqfa.dqddc}
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdContent cssStyle="text-align:center">
					<c:choose>
						<c:when test="${(xqfa.dqcncw >0) and (not empty xqfa.orgCode)}">
							<span class="cps_span_href" onclick="openAjxxWin('${xqfa.orgCode}','','','${query.tjrq}','','','9','wyxq')" style="color:green">
								${xqfa.dqcncw}
							</span>
						</c:when>
						<c:otherwise>
							${xqfa.dqcncw}
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdContent cssStyle="text-align:center">
					<c:choose>
						<c:when test="${(xqfa.qtdq >0) and (not empty xqfa.orgCode)}">
							<span class="cps_span_href" onclick="openAjxxWin('${xqfa.orgCode}','','','${query.tjrq}','','','10','wyxq')" style="color:green">
								${xqfa.qtdq}
							</span>
						</c:when>
						<c:otherwise>
							${xqfa.qtdq}
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdContent cssStyle="text-align:center">${xqfa.byzs}</cps:tdContent>
				<cps:tdContent cssStyle="text-align:center">${xqfa.syzs}</cps:tdContent>
				<cps:tdContent cssStyle="text-align:center">${xqfa.hb}</cps:tdContent>
			</cps:row>
		</c:forEach>
	</cps:table>
</creator:view>