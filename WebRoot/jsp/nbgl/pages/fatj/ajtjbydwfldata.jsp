<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<cps:panel title="统计结果">
		<cps:table>
			<cps:row>
				<cps:tdLabel rowspan="2" cssStyle="text-align:center">序号</cps:tdLabel>
				<cps:tdLabel rowspan="2" cssStyle="text-align:center">案件类别</cps:tdLabel>
				<cps:tdLabel colspan="4" cssStyle="text-align:center">盗窃</cps:tdLabel>
				<cps:tdLabel rowspan="2" cssStyle="text-align:center">抢劫</cps:tdLabel>
				<cps:tdLabel rowspan="2" cssStyle="text-align:center">抢夺</cps:tdLabel>
				<cps:tdLabel rowspan="2" cssStyle="text-align:center">电信诈骗</cps:tdLabel>
				<cps:tdLabel rowspan="2" cssStyle="text-align:center">合计</cps:tdLabel>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel cssStyle="text-align:center">扒窃</cps:tdLabel>
				<cps:tdLabel cssStyle="text-align:center">其他盗窃</cps:tdLabel>
				<cps:tdLabel cssStyle="text-align:center">其他入室盗窃</cps:tdLabel>
				<cps:tdLabel cssStyle="text-align:center">入户盗窃</cps:tdLabel>
			</cps:row>
			<c:forEach items="${ajtj_dwfl}" var="ajxx" varStatus="s">
				<cps:row>
					<cps:tdContent cssStyle="text-align:center">${s.index+1}</cps:tdContent>
					<cps:tdContent cssStyle="text-align:left">${ajxx.dwfl}</cps:tdContent>
					<cps:tdContent cssStyle="text-align:center">${ajxx.pq}</cps:tdContent>
					<cps:tdContent cssStyle="text-align:center">${ajxx.qtdq}</cps:tdContent>
					<cps:tdContent cssStyle="text-align:center">${ajxx.qtrsdq}</cps:tdContent>
					<cps:tdContent cssStyle="text-align:center">${ajxx.rhdq}</cps:tdContent>
					<cps:tdContent cssStyle="text-align:center">${ajxx.qj}</cps:tdContent>
					<cps:tdContent cssStyle="text-align:center">${ajxx.qd}</cps:tdContent>
					<cps:tdContent cssStyle="text-align:center">${ajxx.dxzp}</cps:tdContent>
					<cps:tdContent cssStyle="text-align:center">${ajxx.hj}</cps:tdContent>
				</cps:row>
			</c:forEach>
		</cps:table>
	</cps:panel>
</creator:view>