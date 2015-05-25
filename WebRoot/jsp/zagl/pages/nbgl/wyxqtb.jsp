<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%-- 治保单位发案统计 --%>
<creator:view title="单位查询">
	<creator:box>
		<creator:Script src="/jsp/zagl/pages/nbgl/js/nbtj.js"></creator:Script>
		<script type="text/javascript">
			var now = '${sysdate}';
			$("#start").val(now.substr(0,4) + "-" + now.substr(4,2) + "-01");
			$("#end").val(now.substr(0,4) + "-" + now.substr(4,2) + "-" +now.substr(6,2));
		</script>
		<creator:tbar id="op">
			<cps:button value="查询" type="button" onclick="queryWyxqTb()"></cps:button>
			<cps:button value="导出" type="button" onclick="expWyxqTb()"></cps:button>
		</creator:tbar>
		<creator:panel id="cxtj" title="查询条件" tbarId="op">
			<form id="wyxqtbQuery" method="post" target="wyxqtbFrame">
				<cps:table>
					<cps:row>
						<cps:tdLabel>统计日期：</cps:tdLabel>
						<cps:tdContent>
							<cps:date name="query.tjsj_start" value="${query.tjsj_start}" dateFmt="yyyy-MM-dd" cssStyle="width:180px;" id="start" maxDateDepend="end" />至
							<cps:date name="query.tjsj_end" value="${query.tjsj_end}" dateFmt="yyyy-MM-dd" cssStyle="width:180px;" maxDate="sysdate" minDateDepend="start" id="end" />
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
		<cps:panel title="物业小区发案通报">
			<cps:table>
				<cps:row>
					<cps:tdLabel cssStyle="text-align:center" width="40">序号</cps:tdLabel>
					<cps:tdLabel cssStyle="text-align:center">分局</cps:tdLabel>
					<cps:tdLabel cssStyle="text-align:center">派出所</cps:tdLabel>
					<cps:tdLabel cssStyle="text-align:center">物业小区</cps:tdLabel>
					<cps:tdLabel cssStyle="text-align:center">物业公司</cps:tdLabel>
					<cps:tdLabel cssStyle="text-align:center">发案数</cps:tdLabel>
				</cps:row>
				<c:forEach items="${wyxqTb}"  var="wyxq" varStatus="s">
					<cps:row>
						<cps:tdContent cssStyle="text-align:center">${s.index + 1}</cps:tdContent>
						<cps:tdContent cssStyle="text-align:;left">${wyxq.qxj}&nbsp;</cps:tdContent>
						<cps:tdContent cssStyle="text-align:left">${wyxq.pcs}&nbsp;</cps:tdContent>
						<cps:tdContent cssStyle="text-align:left">${wyxq.wyxq}&nbsp;</cps:tdContent>
						<cps:tdContent cssStyle="text-align:left">${wyxq.wygs}&nbsp;</cps:tdContent>
						<cps:tdContent cssStyle="text-align:center">
							<c:choose>
								<c:when test="${wyxq.fas >0}">
									<span class="cps_span_href" onclick="openAjxxWin('','${wyxq.id}','','','${query.tjsj_start}','${query.tjsj_end}','','wyxq')" style="color:green">
										${wyxq.fas}
									</span>
								</c:when>
								<c:otherwise>
									${wyxq.fas}
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
				</c:forEach>
			</cps:table>
		</cps:panel>
		<iframe id="wyxqtbFrame" name="wyxqtbFrame" style="display: none" ></iframe>
	</creator:box>
</creator:view>

