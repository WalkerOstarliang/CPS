<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="巡逻队选择">
<creator:Script src="/jsp/afgl/js/xldselectlist.js"></creator:Script>
<creator:Script src="/jsp/afgl/js/xldxxlist.js"></creator:Script>

<creator:tbar id="xldtbar">
		<cps:button value="新增" onclick="openXldInfoWin('add','1','');"></cps:button>
		<cps:button value="查询" onclick="queryXldList()"></cps:button>
		<cps:button value="确定" onclick="resultSelectedRowData()"></cps:button>
		<cps:button value="关闭" onclick="$.closeWindow()"></cps:button>
</creator:tbar>
	<creator:panel id="xldcx" title="查询条件" tbarId="xldtbar">
		<form id="xldqueryform">
			<s:hidden id="xldlx" name="queryBean.xldlx"></s:hidden>
			<cps:table>
				<cps:row>
					<cps:tdLabel width="10%">市局：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.citygajgdm}">
								<s:select id="citygajgjgdm" list="cityGajgjgList"  name="queryBean.citygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm',queryList)"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="queryBean.citygajgjgdm" value="${queryBean.citygajgjgdm}">
								<s:select id="citygajgjgdm" list="cityGajgjgList"  name="queryBean.citygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm',queryList)" disabled="true"></s:select>
							</c:otherwise>
							</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="10%">县区局：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.countrygajgdm}">
								<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm',queryList)"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="queryBean.countrygajgjgdm" value="${queryBean.countrygajgjgdm}">
								<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm',queryList)" disabled="true"></s:select>
							</c:otherwise>
							</c:choose>
						
					</cps:tdContent>
					<cps:tdLabel width="10%">派出所：</cps:tdLabel>
					<cps:tdContent width="25%">
							<s:select id="pcsdm" list="pcsGajgjgList"  name="queryBean.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="queryList()" disabled="true"></s:select>
							<%-- 
							<c:choose>
							<c:when test="${empty loginInfo.pcsdm}">
								<s:select id="pcsdm" list="pcsGajgjgList"  name="queryBean.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="queryList()"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="queryBean.pcsdm" value="${queryBean.pcsdm}">
								<s:select id="pcsdm" list="pcsGajgjgList"  name="queryBean.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="queryList()" disabled="true"></s:select>
							</c:otherwise>
							</c:choose>
						--%>
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
				url="/gzgl/xldrw/queryXldxxList.action" 
				searchform="xldqueryform"
				width="99.6%">
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