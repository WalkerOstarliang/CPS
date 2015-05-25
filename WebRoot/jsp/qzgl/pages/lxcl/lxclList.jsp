<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript" src="${contextPath}/jsp/qzgl/js/lxlfcl.js"></script>
<creator:view>
	<creator:box>
		<creator:tbar id="lxlfcl">
			<cps:button value="查&nbsp;询" onclick="jxquery()"></cps:button>&nbsp;
			<cps:button value="重&nbsp;置" onclick="clearQuery()"></cps:button>
		</creator:tbar>
		<creator:panel id="lxdjcx" title="来访来信>来信来访处理" tbarId="lxlfcl" width="99.8%">
			<form id="lxclqueryform">
					<cps:table>
					<cps:row>
						<cps:tdLabel width="10%">市/州：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${empty loginInfo.citydm}">
									<s:select list="cityXzqhList" id="citydm"
										name="querybean.citydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" cssClass="cps-select"
										onchange="doubleSelectCountry(this.value,'countrydmselect',jxquery)"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden id="citydm" name="querybean.citydm"></s:hidden>
									<s:select list="cityXzqhList" id="citydmselect"
										name="querybean.citydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" disabled="true"
										cssClass="cps-select"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%">县/区：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${empty loginInfo.countrydm}">
									<s:select list="countryXzqhList" id="countrydmselect"
										name="querybean.countrydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" cssClass="cps-select"
										onchange="doubleSelectPcs(this.value,'pcsdm',jxquery)"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden name="querybean.countrydm"></s:hidden>
									<s:select list="countryXzqhList" id="countrydmselect"
										name="querybean.countrydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" disabled="true"
										cssClass="cps-select"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%">派出所：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${empty loginInfo.pcsdm}">
									<s:select list="pcsOrgList" id="pcsdm" name="querybean.pcsdm"
										listKey="orgcode" listValue="orgjc" headerKey=""
										headerValue="--请选择--" cssClass="cps-select"
										onchange="doubleSelectJWS(this.value,'jwsselect',jxquery)"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden id="pcsdm" name="querybean.pcsdm"></s:hidden>
									<s:select list="pcsOrgList" id="pcsdm" name="querybean.pcsdm"
										listKey="orgcode" listValue="orgjc" headerKey=""
										headerValue="--请选择--" disabled="true" cssClass="cps-select"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%">警务区：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${empty loginInfo.jwsqdm}">
									<s:select list="jwsqOrgList" id="jwsselect"
										name="querybean.jwsqdm" listKey="orgcode" listValue="orgjc"
										headerKey="" headerValue="--选择--" cssClass="cps-select"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden id="jwsqdm" name="querybean.jwsqdm"></s:hidden>
									<s:select list="jwsqOrgList" id="jwsselect"
										name="querybean.jwsqdm" listKey="orgcode" listValue="orgjc"
										disabled="true" cssClass="cps-select"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>

						<cps:tdLabel width="10%">信件主题：</cps:tdLabel>
						<cps:tdContent width="25%">
							<cps:textfield id="xjzt" name="querybean.xjzt"
								cssClass="cps-select"></cps:textfield>
						</cps:tdContent>

						<cps:tdLabel width="10%">来访时间：</cps:tdLabel>
						<cps:tdContent width="25%">
							<cps:date id="lfsj_from" name="querybean.lflxsj_from"
								dateFmt="yyyy-MM-dd" cssStyle="width:31%;">
							</cps:date>
							-
							<cps:date id="lfsj_to" name="querybean.lflxsj_to"
								dateFmt="yyyy-MM-dd" cssStyle="width:31%;">
							</cps:date>
						</cps:tdContent>
					</cps:row>
					
				</cps:table>
			</form>
		</creator:panel>
		
		<cps:tableGrid id="lxclquerylist" 
				mutilSelect="true"
				url="/qzgl/lxclgl/queryLxclBeanList.action" >
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column field="nfwfs" title="属性"></cps:column>
		<cps:column field="nnrlx" title="来访类型"></cps:column>
		<cps:column field="xjzt" title="信件主题"></cps:column>
		<cps:column field="lflxrxm" title="来信来访人" maxlength="30"></cps:column>
		<cps:column field="lflxsj" title="来访时间"></cps:column>
		<cps:column field="sjjdmjxm" title="接待人"></cps:column>
		<cps:column field="sjjdmjdwmc" title="接待属派出所" maxlength="30"></cps:column>
		<cps:column field="jsdwmc" title="接件派出所" maxlength="30"></cps:column>
		<cps:column field="djsj" title="登记时间"></cps:column>
		<cps:column field="ncllx" title="处理状态"></cps:column>
		<cps:column field="clcz" title="操作"></cps:column>
		</cps:tableGrid>
	</creator:box>
</creator:view>