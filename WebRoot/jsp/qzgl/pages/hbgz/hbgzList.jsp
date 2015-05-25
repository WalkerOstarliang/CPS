<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<script type="text/javascript" src="${contextPath}/jsp/qzgl/js/hbgz.js"></script>
	<creator:box>
		<creator:tbar id="hbgzTbar">
			<cps:button value="查&nbsp;询" onclick="jxquery()"></cps:button>&nbsp;
			<cps:button value="新增" onclick="openInfoWin('add','')"></cps:button>
		</creator:tbar>
		
		<creator:panel id="hbgz" title="向群众报告工作" tbarId="hbgzTbar">
			<form id="hbgzform">
				<cps:table>
						<cps:row>
					<cps:tdLabel width="10%">市局：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.citygajgdm}">
								<s:select id="citygajgjgdm" list="cityGajgjgList"  name="querybean.citygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm')"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="querybean.citygajgjgdm" value="${querybean.citygajgjgdm }"/>
								<s:select id="citygajgjgdm" list="cityGajgjgList"  name="querybean.citygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm')" disabled="true"></s:select>
							</c:otherwise>
							</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="10%">县区局：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.countrygajgdm}">
								<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="querybean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm')"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="querybean.countrygajgjgdm" value="${querybean.countrygajgjgdm }"/>
								<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="querybean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm')" disabled="true"></s:select>
							</c:otherwise>
							</c:choose>
						
					</cps:tdContent>
					<cps:tdLabel width="10%">派出所：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.pcsdm}">
								<s:select id="pcsdm" list="pcsGajgjgList"  name="querybean.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleSelectJWS(this.value,'jwsselect')"  ></s:select>
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
						<cps:tdLabel width="10%">报告工作主题：</cps:tdLabel>
						<cps:tdContent width="25%">
							<cps:textfield id="bggzzt" name="querybean.bggzzt"></cps:textfield>
						</cps:tdContent>

						<cps:tdLabel width="12%">汇报时间：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:date id="hbsj_from" name="querybean.hbsj_from"
								dateFmt="yyyy-MM-dd" cssStyle="width:39%;">
							</cps:date>
							-
							<cps:date id="hbsj_to" name="querybean.hbsj_to"
								dateFmt="yyyy-MM-dd" cssStyle="width:39%;">
							</cps:date>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
		<cps:tableGrid id="lxdjquerylist" 
			title="工作汇报列表"
			width="99.8%"
			url="/qzgl/hbgzgl/queryHbgzList.action" 
			autoload="false"
			searchform="hbgzform">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column field="cz" title="操作" align="left"></cps:column>
			<cps:column field="bggzzt" title="报告主题" align="left" maxlength="15"></cps:column>
			<cps:column field="bggzsj" title="报告时间"></cps:column>
			<cps:column field="cjrs" title="参与人数"></cps:column>
			<cps:column field="bggzzcrxm" title="主持人姓名" maxlength="10"></cps:column>
			<cps:column field="bggznr" title="报告工作内容" maxlength="20" align="left"></cps:column>
		</cps:tableGrid>

	</creator:box>
</creator:view>