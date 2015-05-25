<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<creator:Script src="/jsp/xtgl/js/sjhc.js"></creator:Script>
<creator:view>
	<creator:tbar id="op">
		<cps:button value="查询" onclick="ajaxLoadDataPage()"></cps:button>
	</creator:tbar>
	<creator:panel id="panel" title="查询条件" tbarId="op" width="99.8%">
		<form id="queryForm">
			<cps:table>
				<cps:row>
					<cps:tdLabel width="10%">市局：</cps:tdLabel>
					<cps:tdContent width="22%">
						<c:choose>
							<c:when test="${empty loginInfo.citygajgdm}">
								<s:select id="citygajgjgdm" list="cityGajgjgList"
									name="query.citygajgjgdm" listKey="dm" listValue="jc"
									headerKey="" headerValue="--请选择--" cssClass="cps-select"
									onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm')">
								</s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="query.citygajgjgdm" value="${query.citygajgjgdm}" />
								<s:select id="citygajgjgdm" list="cityGajgjgList"
									disabled="true" name="query.citygajgjgdm" listKey="dm"
									listValue="jc" headerKey="" headerValue="--请选择--"
									cssClass="cps-select"
									onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm')">
								</s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					
					<cps:tdLabel width="11%">县区局：</cps:tdLabel>
					<cps:tdContent width="22%">
						<c:choose>
							<c:when test="${empty loginInfo.countrygajgdm}">
								<s:select id="countrygajgjgdm" list="countryGajgjgList"
									name="query.countrygajgjgdm" listKey="dm" listValue="jc"
									headerKey="" headerValue="--请选择--" cssClass="cps-select"
									onchange="doublePcsGajgjg(this.value,'pcsdm')"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="query.countrygajgjgdm" value="${query.countrygajgjgdm}" />
								<s:select id="countrygajgjgdm" list="countryGajgjgList"
									disabled="true" name="query.countrygajgjgdm" listKey="dm"
									listValue="jc" headerKey="" headerValue="--请选择--"
									cssClass="cps-select"
									onchange="doublePcsGajgjg(this.value,'pcsdm')"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					
					<cps:tdLabel width="11%">派出所：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${empty loginInfo.pcsdm}">
								<s:select id="pcsdm" list="pcsGajgjgList" name="query.pcsdm" onchange="doubleSelectJWS(this.value,'jwsselect')"
									listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" 
									cssClass="cps-select"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="query.pcsdm" value="${query.pcsdm}" />
								<s:select id="pcsdm" list="pcsGajgjgList" name="query.pcsdm"
									disabled="true" listKey="dm" listValue="jc" headerKey=""
									headerValue="--请选择--" cssClass="cps-select"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
					
				<cps:row>
					<cps:tdLabel>警务区：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${empty loginInfo.jwsqdm}">
								<s:select list="jwsqOrgList" id="jwsselect" name="query.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue="--请选择--"  cssClass="cps-select" ></s:select>
							</c:when>
							<c:otherwise>
								<s:hidden id="jwsqdm" name="query.jwsqdm"></s:hidden>
								<s:select list="jwsqOrgList" id="jwsselect" name="query.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select"  disabled="true"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					
					<cps:tdLabel>考核项目：</cps:tdLabel>
					<cps:tdContent>
						<cps:select id="khlx" optgroup="true" zdlb="ZDY_KHLX" name="query.khlx" listKey="dm" listValue="mc"></cps:select>
					</cps:tdContent>
					
					<cps:tdLabel>&nbsp;</cps:tdLabel>
					<cps:tdContent>&nbsp;</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>时间：</cps:tdLabel>
					<cps:tdContent colspan="5">
						<cps:date name="query.startTime" dateFmt="yyyy-MM-dd" maxDate="sysdate" value="${query.startTime}" cssStyle="width:180px;"></cps:date> 至
						<cps:date name="query.endTime" dateFmt="yyyy-MM-dd" maxDate="sysdate" value="${query.endTime}" cssStyle="width:180px;"></cps:date> 
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</form>	
	</creator:panel>
	<div id="datamain"></div>
</creator:view>
