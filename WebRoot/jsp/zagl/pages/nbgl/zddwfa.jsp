<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<creator:view>
	<creator:Script src="/jsp/zagl/pages/nbgl/js/nbtj.js"></creator:Script>
	<cps:table>
		<cps:row>
			<cps:tdLabel cssStyle="text-align:center" rowspan="2">序号</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center" rowspan="2" width="35%">单位</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center" rowspan="2">抢劫<br/>抢夺</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center" colspan="3">盗窃</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center" rowspan="2">其他<br/>案件</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center" rowspan="2">合计</cps:tdLabel>
		</cps:row>
		<cps:row>
			<cps:tdLabel cssStyle="text-align:center">扒窃</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center">入室盗窃</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center">其他盗窃</cps:tdLabel>
		</cps:row>
		<c:forEach items="${zddwfatj}" var="zddwfa" varStatus="s">
			<cps:row>
				<cps:tdContent cssStyle="text-align:center">${s.index + 1}</cps:tdContent>
				<cps:tdContent cssStyle="text-align:left">${zddwfa.dwmc}</cps:tdContent>
				<cps:tdContent cssStyle="text-align:center">
					<c:choose>
						<c:when test="${zddwfa.qjqd >0}">
							<span class="cps_span_href" onclick="openAjxxWin('','${zddwfa.id}','','','${query.tjsj_start}','${query.tjsj_end}','4','nbdw')" style="color:green">
								${zddwfa.qjqd}
							</span>
						</c:when>
						<c:otherwise>
							${zddwfa.qjqd}
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdContent cssStyle="text-align:center">
					<c:choose>
						<c:when test="${zddwfa.pq >0}">
							<span class="cps_span_href" onclick="openAjxxWin('','${zddwfa.id}','','','${query.tjsj_start}','${query.tjsj_end}','1','nbdw')" style="color:green">
								${zddwfa.pq}
							</span>
						</c:when>
						<c:otherwise>
							${zddwfa.pq}
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdContent cssStyle="text-align:center">
					<c:choose>
						<c:when test="${zddwfa.rsdq >0}">
							<span class="cps_span_href" onclick="openAjxxWin('','${zddwfa.id}','','','${query.tjsj_start}','${query.tjsj_end}','2','nbdw')" style="color:green">
								${zddwfa.rsdq}
							</span>
						</c:when>
						<c:otherwise>
							${zddwfa.rsdq}
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdContent cssStyle="text-align:center">
					<c:choose>
						<c:when test="${zddwfa.qtdq >0}">
							<span class="cps_span_href" onclick="openAjxxWin('','${zddwfa.id}','','','${query.tjsj_start}','${query.tjsj_end}','3','nbdw')" style="color:green">
								${zddwfa.qtdq}
							</span>
						</c:when>
						<c:otherwise>
							${zddwfa.qtdq}
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdContent cssStyle="text-align:center">
					<c:choose>
						<c:when test="${zddwfa.qtaj >0}">
							<span class="cps_span_href" onclick="openAjxxWin('','${zddwfa.id}','','','${query.tjsj_start}','${query.tjsj_end}','5','nbdw')" style="color:green">
								${zddwfa.qtaj}
							</span>
						</c:when>
						<c:otherwise>
							${zddwfa.qtaj}
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				
				<cps:tdContent cssStyle="text-align:center">
					<c:choose>
						<c:when test="${zddwfa.hj >0}">
							<span class="cps_span_href" onclick="openAjxxWin('','${zddwfa.id}','','','${query.tjsj_start}','${query.tjsj_end}','','nbdw')" style="color:green">
								${zddwfa.hj}
							</span>
						</c:when>
						<c:otherwise>
							${zddwfa.hj}
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
			</cps:row>
		</c:forEach>
	</cps:table>
</creator:view>	