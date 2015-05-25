<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
<creator:Script src="/jsp/afgl/js/sqldzinfo.js"></creator:Script>
<script type="text/javascript" >
	
</script >
<creator:box>
	<creator:tbar id="tbar">
		<cps:button value="查&nbsp;询" onclick="stxxQuery()"></cps:button>
	</creator:tbar>
	<creator:panel id="xldcx" title="实体信息列表" tbarId="tbar">
		<form id="xldqueryform" >
			<cps:table>
				<cps:row>
					<cps:tdLabel width="10%">市局：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.citygajgdm}">
								<s:select id="citygajgjgdm" list="cityGajgjgList"  name="queryBeanSt.citygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm',stxxQuery)"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden"  name="queryBeanSt.citygajgjgdm" value="${queryBeanSt.citygajgjgdm}"/>
								<s:select id="citygajgjgdm" list="cityGajgjgList"  name="queryBeanSt.citygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm',stxxQuery)" disabled="true"></s:select>
							</c:otherwise>
						</c:choose>
						
					</cps:tdContent>
					<cps:tdLabel width="10%">县区局：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.countrygajgdm}">
								<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBeanSt.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm',stxxQuery)"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden"  name="queryBeanSt.countrygajgjgdm" value="${queryBeanSt.countrygajgjgdm}"/>
								<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBeanSt.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm',stxxQuery)" disabled="true"></s:select>
							</c:otherwise>
							</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="12%">派出所：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.pcsdm}">
								<s:select id="pcsdm" list="pcsGajgjgList"  name="queryBeanSt.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" onchange="doubleSelectJWS(this.value,'jwsselect')" cssClass="cps-select" ></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden"  name="queryBeanSt.pcsdm" value="${queryBeanSt.pcsdm}"/>
								<s:select id="pcsdm" list="pcsGajgjgList"  name="queryBeanSt.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="stxxQuery()" disabled="true"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>警务区：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${empty loginInfo.jwsqdm}">
								<s:select list="jwsqOrgList" id="jwsselect" name="queryBeanSt.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select" onchange="doubleSelectSqxxByJwsdm(this.value,'sqdm')" ></s:select>
							</c:when>
							<c:otherwise>
								<s:hidden id="jwsqdm" name="queryBeanSt.jwsqdm"></s:hidden>
								<s:select list="jwsqOrgList" id="jwsselect" name="queryBeanSt.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select"  disabled="true"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel>社区：</cps:tdLabel>
					<cps:tdContent>
						<s:select id="sqdm" list="sqJbxxList"  name="queryBeanSt.sqdm" listKey="sqbh" listValue="jc" headerKey="" headerValue=" " cssClass="cps-select"></s:select>
					</cps:tdContent>
					<cps:tdLabel>实体名称：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="stmc" name="queryBeanSt.stmc" ></cps:textfield>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</form>
	</creator:panel>
	
	
	<cps:tableGrid id="xldquerylist" title="实体列表"
				mutilSelect="false"
				url="/afgl/sqldzgl/queryStxxPageResult.action" 
				autoload="true"
				searchform="xldqueryform">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column isCheckbox="true"></cps:column>
		<cps:column field="cz" title="操作" rowcallback="czStselectRowCallback"></cps:column>
		<cps:column field="stmc" title="实体名称"></cps:column>
		<cps:column field="stdz" title="实体地址"></cps:column>
	</cps:tableGrid>
</creator:box>
</creator:view>