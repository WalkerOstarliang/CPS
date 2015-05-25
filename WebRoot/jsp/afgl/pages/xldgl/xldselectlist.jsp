<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="巡逻队选择">
<creator:Script src="/jsp/afgl/js/xldselectlist.js"></creator:Script>
<creator:tbar id="xldselectlisttbar">
	<cps:button value="查询" onclick="queryXldList()"></cps:button>
	<cps:button value="确定" onclick="resultSelectedRowData()"></cps:button>
	<cps:button value="关闭" onclick="$.closeWindow()"></cps:button>
</creator:tbar>
	<creator:panel id="xldcx" title="查询条件"  tbarId="xldselectlisttbar">
		<form id="xldqueryform">
			<s:hidden id="xldlx" name="queryBean.xldlx"></s:hidden>
			<cps:table>
				<cps:row>
					<cps:tdLabel width="10%">市/州：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.citydm}">
								<s:select list="cityXzqhList" id="citydm" name="queryBean.citydm" listKey="dm" listValue="mc" headerKey="" headerValue="--请选择--" cssClass="cps-input" onchange="doubleSelectCountry(this.value,'countrydmselect',jxQueryXldxx)"></s:select>
							</c:when>
							<c:otherwise>
								<s:hidden id="citydm" name="queryBean.citydm"></s:hidden>
								<s:select list="cityXzqhList" id="citydmselect" name="queryBean.citydm" listKey="dm" listValue="mc" headerKey="" headerValue="--请选择--" disabled="true" cssClass="cps-input"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="10%">县/区：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.countrydm}">
								<s:select  list="countryXzqhList" id="countrydmselect" name="queryBean.countrydm" listKey="dm" listValue="mc" headerKey="" headerValue="--请选择--" cssClass="cps-input" onchange="doubleSelectPcs(this.value,'pcsdmselect',jxQueryXldxx)"></s:select>
							</c:when>
							<c:otherwise>
								<s:hidden name="queryBean.countrydm"></s:hidden>
								<s:select list="countryXzqhList" id="countrydmselect" name="queryBean.countrydm" listKey="dm" listValue="mc" headerKey="" headerValue="--请选择--" disabled="true" cssClass="cps-input"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="10%">派出所：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${empty loginInfo.pcsdm}">
								<s:select list="pcsOrgList" id="pcsdmselect"  name="queryBean.pcsdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue="--请选择--" cssClass="cps-input" onchange="jxQueryXldxx()"></s:select>
							</c:when>
							<c:otherwise>
								<s:hidden name="queryBean.pcsdm"></s:hidden>
								<s:select list="pcsOrgList" id="pcsdmselect" name="queryBean.pcsdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue="--请选择--" disabled="true" cssClass="cps-input"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>巡逻队名称：</cps:tdLabel>
					<cps:tdContent colspan="3">
						<s:textfield id="xldmc" name="queryBean.xldmc" cssClass="cps-input" cssStyle="width:87%" onkeyup="queryXldList()"></s:textfield>
					</cps:tdContent>
					
				</cps:row>
			</cps:table>
		</form>
	</creator:panel>
	
	<cps:tableGrid id="xldquerylist" 
				mutilSelect="false"
				dblclick="rowClickEvent"
				url="/afgl/xldxx/queryXldxxList.action" 
				searchform="xldqueryform">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column isCheckbox="true"></cps:column>
		<cps:column field="xldmc" title="巡逻队名称"></cps:column>
		<cps:column field="zjsj" title="组建日期"></cps:column>
		<cps:column field="xldzrrxm" title="责任人"></cps:column>
		<cps:column field="ssdwmc" title="所属单位" maxlength="10"></cps:column>
		<cps:column field="ssdwfgld" title="分管单位领导"></cps:column>
		<cps:column field="djdwmc" title="登记单位" maxlength="10"></cps:column>
	</cps:tableGrid>
</creator:view>