<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<script type="text/javascript" src="${contextPath}/jsp/qzgl/js/gyhd.js"></script>
	<creator:box>
		<creator:tbar id="gyhdTbar">
			<cps:button value="查&nbsp;询" onclick="jxquery()"></cps:button>&nbsp;
			<cps:button value="新增" onclick="openInfoWin('add','')"></cps:button>
		</creator:tbar>
		<creator:panel id="jftj" title="公益活动" tbarId="gyhdTbar">
			<form id="gyhdform">
				<cps:table>
						<cps:row>
					<cps:tdLabel width="10%">市局：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.citygajgdm}">
								<s:select id="citygajgjgdm" list="cityGajgjgList"  name="querybean.citygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm',jxquery)"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="querybean.citygajgjgdm" value="${querybean.citygajgjgdm }"/>
								<s:select id="citygajgjgdm" list="cityGajgjgList"  name="querybean.citygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm',jxquery)" disabled="true"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="10%">县区局：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.countrygajgdm}">
								<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="querybean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm',jxquery)"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="querybean.countrygajgjgdm" value="${querybean.countrygajgjgdm }"/>
								<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="querybean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm',jxquery)" disabled="true"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="10%">派出所：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.pcsdm}">
								<s:select id="pcsdm" list="pcsGajgjgList"  name="querybean.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleSelectJWS(this.value,'jwsselect')"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="querybean.pcsdm" value="${querybean.pcsdm }"/>
								<s:select id="pcsdm" list="pcsGajgjgList"  name="querybean.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" disabled="true"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>警务区：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${empty loginInfo.jwsqdm}">
								<s:select list="jwsqOrgList" id="jwsselect" name="querybean.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select" onchange="doubleSelectSqxxByJwsdm(this.value,'sqdm')" ></s:select>
							</c:when>
							<c:otherwise>
								<s:hidden id="jwsqdm" name="querybean.jwsqdm"></s:hidden>
								<s:select list="jwsqOrgList" id="jwsselect" name="querybean.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select"  disabled="true"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="10%">活动地点：</cps:tdLabel>
					<cps:tdContent width="25%">
						<cps:textfield id="hddz" name="querybean.hddz"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="10%">活动时间：</cps:tdLabel>
					<cps:tdContent width="25%">
						<cps:date id="hdsj_from" name="querybean.hdsj_from"
							dateFmt="yyyy-MM-dd" cssStyle="width:39%;">
						</cps:date>
						-
						<cps:date id="hdsj_to" name="querybean.hdsj_to"
							dateFmt="yyyy-MM-dd" cssStyle="width:39%;"></cps:date>
					</cps:tdContent>
				</cps:row>
				</cps:table>
			</form>
		</creator:panel>
		
		<cps:tableGrid id="gyhdquerylist" title="公益活动列表" width="99.8%"
			url="/qzgl/gyhdgl/queryList.action" 
			autoload="false"
			searchform="gyhdform">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column field="cz" title="操作" align="left"></cps:column>
			<cps:column field="hddz" title="活动地点" maxlength="30" align="left"></cps:column>
			<cps:column field="hdsj" title="活动时间"></cps:column>
			<cps:column field="cydwjry" title="参与单位" maxlength="20"></cps:column>
			<cps:column field="cyry" title="参与人员" maxlength="20"></cps:column>
			<cps:column field="djrxm" title="登记民警"></cps:column>
			<cps:column field="djsj" title="登记时间"></cps:column>
			
		</cps:tableGrid>
	</creator:box>
</creator:view>
