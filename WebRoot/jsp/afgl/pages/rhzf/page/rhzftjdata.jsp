<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:Script src="/jsp/afgl/pages/rhzf/js/rhzftj.js"></creator:Script>
	<cps:PanelView>
		<cps:tbar>
			<c:if test="${query.orgleve >3}">
				<cps:button value="返回" id="backButton" onclick="back()"></cps:button>
			</c:if>
		</cps:tbar>
		<cps:panel title="统计结果">
			<cps:table>
				<cps:row>
					<cps:tdLabel cssStyle="text-align:center" rowspan="2">序号</cps:tdLabel>
					<cps:tdLabel cssStyle="text-align:center" rowspan="2">单位</cps:tdLabel>
					<cps:tdLabel cssStyle="text-align:center" rowspan="2">街道/乡<br/>镇干部</cps:tdLabel>
					<cps:tdLabel cssStyle="text-align:center" colspan="3">辖区干部</cps:tdLabel>
					<cps:tdLabel cssStyle="text-align:center" colspan="4">企事业单位人员</cps:tdLabel>
					<cps:tdLabel cssStyle="text-align:center" rowspan="2">人大<br/>代表</cps:tdLabel>
					<cps:tdLabel cssStyle="text-align:center" rowspan="2">政协<br/>委员</cps:tdLabel>
					<cps:tdLabel cssStyle="text-align:center" rowspan="2">物管<br/>负责人</cps:tdLabel>
					<cps:tdLabel cssStyle="text-align:center" rowspan="2">业主委员<br/>会成员</cps:tdLabel>
					<cps:tdLabel cssStyle="text-align:center" rowspan="2">楼栋长</cps:tdLabel>
					<cps:tdLabel cssStyle="text-align:center" colspan="3">入户走访</cps:tdLabel>
					<cps:tdLabel cssStyle="text-align:center" rowspan="2">合计</cps:tdLabel>
				</cps:row>
				<cps:row>
					<cps:tdLabel cssStyle="text-align:center">社区/村<br/>干部</cps:tdLabel>
					<cps:tdLabel cssStyle="text-align:center">小区/组<br/>干部</cps:tdLabel>
					<cps:tdLabel cssStyle="text-align:center">合计</cps:tdLabel>
					
					<cps:tdLabel cssStyle="text-align:center">法人</cps:tdLabel>
					<cps:tdLabel cssStyle="text-align:center">办公</br>室主任</cps:tdLabel>
					<cps:tdLabel cssStyle="text-align:center">安保<br/>负责人</cps:tdLabel>
					<cps:tdLabel cssStyle="text-align:center">合计</cps:tdLabel>
					
					<cps:tdLabel cssStyle="text-align:center">入室盗<br/>窃回访</cps:tdLabel>
					<cps:tdLabel cssStyle="text-align:center">一般<br/>走访</cps:tdLabel>
					<cps:tdLabel cssStyle="text-align:center">合计</cps:tdLabel>
				</cps:row>
				
				<c:forEach items="${tjList}" var="tj" varStatus="s">
					<cps:row>
						<c:if test="${ query.orgleve == 6 and s.index == 0}">
							<input type="hidden" id="jwsdw" value="${tj.jwsdm}" />
						</c:if>
						<cps:tdContent cssStyle="text-align:center">${s.index + 1}</cps:tdContent>
						<cps:tdContent cssStyle="text-align:left">${tj.dwmc}</cps:tdContent>
						<cps:tdContent cssStyle="text-align:center">${tj.jdgb}</cps:tdContent>
						<cps:tdContent cssStyle="text-align:center">${tj.sqgb}</cps:tdContent>
						<cps:tdContent cssStyle="text-align:center">${tj.xqgb}</cps:tdContent>
						<cps:tdContent cssStyle="text-align:center">${tj.sqgb + tj.xqgb}</cps:tdContent>
						<cps:tdContent cssStyle="text-align:center">${tj.dwfr}</cps:tdContent>
						<cps:tdContent cssStyle="text-align:center">${tj.bgszr}</cps:tdContent>
						<cps:tdContent cssStyle="text-align:center">${tj.zbry}</cps:tdContent>
						<cps:tdContent cssStyle="text-align:center">${tj.dwfr + tj.zbry + tj.bgszr}</cps:tdContent>
						<cps:tdContent cssStyle="text-align:center">${tj.rddb}</cps:tdContent>
						<cps:tdContent cssStyle="text-align:center">${tj.zxwy}</cps:tdContent>
						<cps:tdContent cssStyle="text-align:center">${tj.wgfzr}</cps:tdContent>
						<cps:tdContent cssStyle="text-align:center">${tj.ywhcy}</cps:tdContent>
						<cps:tdContent cssStyle="text-align:center">${tj.ldz}</cps:tdContent>
						<cps:tdContent cssStyle="text-align:center">${tj.rsdqhf}</cps:tdContent>
						<cps:tdContent cssStyle="text-align:center">${tj.ybzf}</cps:tdContent>
						<cps:tdContent cssStyle="text-align:center">${tj.rsdqhf + tj.ybzf}</cps:tdContent>
						<cps:tdContent cssStyle="text-align:center">${tj.hj}</cps:tdContent>
					</cps:row>
				</c:forEach>
			</cps:table>
		</cps:panel>
	</cps:PanelView>
</creator:view>
