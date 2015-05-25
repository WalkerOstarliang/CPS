<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
	<cps:table>
		<cps:row>
			<cps:tdLabel rowspan="2" cssStyle="text-align:center;width:30px;">序号</cps:tdLabel>
			<cps:tdLabel rowspan="2" cssStyle="text-align:center;width:200px;">单位名称</cps:tdLabel>
			<c:if test="${query.tjjb == '5'}">
				<cps:tdLabel rowspan="2" cssStyle="text-align:center;width:80px;">民警</cps:tdLabel>
			</c:if>
			<cps:tdLabel rowspan="2" cssStyle="text-align:center;width:40px;">总分值</cps:tdLabel>
			<cps:tdLabel rowspan="2" cssStyle="text-align:center;width:40px;">排名</cps:tdLabel>
			<cps:tdLabel colspan="3" cssStyle="text-align:center;">下发数据维护8分</cps:tdLabel>
			<cps:tdLabel rowspan="2" cssStyle="text-align:center;">委托<br/>签收<br/>管理<br/>2分</cps:tdLabel>
			<cps:tdLabel colspan="3" cssStyle="text-align:center;">在控登记质量6分</cps:tdLabel>
			<cps:tdLabel rowspan="2" cssStyle="text-align:center;">重点人员<br>重新违法犯罪2分</cps:tdLabel>
			<cps:tdLabel rowspan="2" cssStyle="text-align:center;">取保候审<br>监视居住管理2分</cps:tdLabel>
		</cps:row>
		
		<cps:row>
			<cps:tdLabel cssStyle="text-align:center;">首次重点<br>人员信息2分</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center;">原有重点<br>人员信息6分</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center;">小计</cps:tdLabel>
			
			<cps:tdLabel cssStyle="text-align:center;">关系人信<br>息质量2分</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center;">重点人员<br>信息质量4分</cps:tdLabel>
			<cps:tdLabel cssStyle="text-align:center;">小计</cps:tdLabel>
		</cps:row>
		
		<c:forEach items="${sqtjDataList}" var="dtgk" varStatus="s">
			<cps:row>
				<cps:tdContent>${s.index + 1}</cps:tdContent>
				<cps:tdContent>${dtgk.orgname}</cps:tdContent>
				<c:if test="${query.tjjb == '5'}">
					<cps:tdContent>${dtgk.mjxm}</cps:tdContent>
				</c:if>
				<cps:tdContent align="center">${dtgk.b00000}</cps:tdContent>
				<cps:tdContent align="center">${dtgk.pm}</cps:tdContent>
				<cps:tdContent align="center">${dtgk.b10001}</cps:tdContent>
				<cps:tdContent align="center">${dtgk.b10002}</cps:tdContent>
				<cps:tdContent align="center">${dtgk.b10000}</cps:tdContent>
				<cps:tdContent align="center">${dtgk.b20000}</cps:tdContent>
				<cps:tdContent align="center">${dtgk.b30001}</cps:tdContent>
				<cps:tdContent align="center">${dtgk.b30002}</cps:tdContent>
				<cps:tdContent align="center">${dtgk.b30000}</cps:tdContent>
				<cps:tdContent align="center">${dtgk.b40000}</cps:tdContent>
				<cps:tdContent align="center">${dtgk.b50000}</cps:tdContent>
				
			</cps:row>
		</c:forEach>
	</cps:table>
