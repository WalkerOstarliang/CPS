<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<cps:panel title="统计结果 " width="99.8%">
	<cps:table>
		<cps:row>
			<cps:tdLabel colspan="12" cssStyle="text-align:center;"><b>${queryBean.tjdwmc}居住证统计表</b></cps:tdLabel>
		</cps:row>
		<cps:row>
			<cps:tdLabel rowspan="2" cssStyle="text-align:center;">序号</cps:tdLabel>
			<cps:tdLabel rowspan="2" cssStyle="text-align:center;">单位</cps:tdLabel>
			<cps:tdLabel colspan="5" cssStyle="text-align:center;">居住证办证数（不包含废证数）</cps:tdLabel>
			<cps:tdLabel colspan="2" cssStyle="text-align:center;">废证</cps:tdLabel>
			<cps:tdLabel colspan="2" cssStyle="text-align:center;">遗失补领证</cps:tdLabel>
			<cps:tdLabel rowspan="2" cssStyle="text-align:center;">办证率</cps:tdLabel>
		</cps:row>
		<cps:row>
			<cps:tdLabel cssStyle="text-align:center;">总数</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center;">本省人数</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center;">外省人数</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center;">男</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center;">女</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center;">废证数</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center;">废证率</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center;">遗失补领数</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center;">遗失补领率</cps:tdLabel>
		</cps:row>
		<c:forEach items="${jzztjResult}" var="result" varStatus="s">
			<cps:row>
				<cps:tdContent>${s.index + 1}</cps:tdContent>
				<cps:tdContent>${result.orgname}</cps:tdContent>
				<cps:tdContent>${result.jzzdjs}</cps:tdContent>
				<cps:tdContent>${result.jzzdjbsrs}</cps:tdContent>
				<cps:tdContent>${result.jzzdjwsrs}</cps:tdContent>
				<cps:tdContent>${result.jzzdjms}</cps:tdContent>
				<cps:tdContent>${result.jzzdjws}</cps:tdContent>
				<cps:tdContent>${result.fzs}</cps:tdContent>
				<cps:tdContent>${result.fzl}</cps:tdContent>
				<cps:tdContent>${result.ysbds}</cps:tdContent>
				<cps:tdContent>${result.ysbdl}</cps:tdContent>
				<cps:tdContent>${result.bzl}</cps:tdContent>
			</cps:row>
		</c:forEach>
	</cps:table>
</cps:panel>