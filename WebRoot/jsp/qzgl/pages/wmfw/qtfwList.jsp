<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript" src="${contextPath}/jsp/qzgl/js/wmfw.js"></script>
<creator:view>
	<creator:box>
		<creator:tbar id="wmfwgl">
			<cps:button value="查&nbsp;询" onclick="qtfwquery()"></cps:button>&nbsp;
			<cps:button value="重&nbsp;置" onclick="qtfwclearQuery()"></cps:button>
			<cps:button value="新&nbsp;增" onclick="addQtfw()" display="${displayAddBtn}"></cps:button>
			<cps:button value="修&nbsp;改" onclick="xgQtfw()" display="${displayAddBtn}"></cps:button>
			<cps:button value="删&nbsp;除" onclick="deleteQtfw()" display="${displayAddBtn}"></cps:button>
		</creator:tbar>
		<creator:panel id="wmfwgl" title="为民服务>其他服务" tbarId="wmfwgl" width="99.8%">
			<form id="qtfwqueryform">
					<cps:table>
					<cps:row>
						<cps:tdLabel width="10%">录入市州：</cps:tdLabel>
						<cps:tdContent width="24%">
							<c:choose>
								<c:when test="${empty loginInfo.citydm}">
									<s:select list="cityXzqhList" id="citydm"
										name="qtfwquery.citydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" cssClass="cps-select"
										onchange="doubleSelectCountry(this.value,'countrydmselect',qtfwquery)"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden id="citydm" name="qtfwquery.citydm"></s:hidden>
									<s:select list="cityXzqhList" id="citydmselect"
										name="qtfwquery.citydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" disabled="true"
										cssClass="cps-select"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%">录入县区：</cps:tdLabel>
						<cps:tdContent width="24%">
							<c:choose>
								<c:when test="${empty loginInfo.countrydm}">
									<s:select list="countryXzqhList" id="countrydmselect"
										name="qtfwquery.countrydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" cssClass="cps-select"
										onchange="doubleSelectPcs(this.value,'pcsdm',qtfwquery)"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden name="qtfwquery.countrydm"></s:hidden>
									<s:select list="countryXzqhList" id="countrydmselect"
										name="qtfwquery.countrydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" disabled="true"
										cssClass="cps-select"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%">录入派出所：</cps:tdLabel>
						<cps:tdContent width="28%">
							<c:choose>
								<c:when test="${empty loginInfo.pcsdm}">
									<s:select list="pcsOrgList" id="pcsdm" name="qtfwquery.pcsdm"
										listKey="orgcode" listValue="orgjc" headerKey=""
										headerValue="--请选择--" cssClass="cps-select"
										onchange="doubleSelectJWS(this.value,'jwsselect',qtfwquery)"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden id="pcsdm" name="qtfwquery.pcsdm"></s:hidden>
									<s:select list="pcsOrgList" id="pcsdm" name="qtfwquery.pcsdm"
										listKey="orgcode" listValue="orgjc" headerKey=""
										headerValue="--请选择--" disabled="true" cssClass="cps-select"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%">录入警务区：</cps:tdLabel>
						<cps:tdContent width="24%">
							<c:choose>
								<c:when test="${empty loginInfo.jwsqdm}">
									<s:select list="jwsqOrgList" id="jwsselect"
										name="qtfwquery.jwsqdm" listKey="orgcode" listValue="orgjc"
										headerKey="" headerValue="--选择--" cssClass="cps-select"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden id="jwsqdm" name="qtfwquery.jwsqdm"></s:hidden>
									<s:select list="jwsqOrgList" id="jwsselect"
										name="qtfwquery.jwsqdm" listKey="orgcode" listValue="orgjc"
										disabled="true" cssClass="cps-select"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%">经办人：</cps:tdLabel>
						<cps:tdContent width="24%">
							<cps:textfield id="jbrxm" name="qtfwquery.jbrxm"
								cssClass="cps-select"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="10%">服务时间：</cps:tdLabel>
						<cps:tdContent width="28%">
							<cps:date id="startfwsj" name="qtfwquery.startfwsj"
								dateFmt="yyyy-MM-dd" cssStyle="width:45%;">
							</cps:date>
							-
							<cps:date id="endfwsj" name="qtfwquery.endfwsj"
								dateFmt="yyyy-MM-dd" cssStyle="width:45%;">
							</cps:date>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%">服务内容：</cps:tdLabel>
						<cps:tdContent width="100%" colspan="3">
							<cps:textfield id="fwnr" name="qtfwquery.fwnr"
								cssClass="cps-select"></cps:textfield>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
		<cps:tableGrid id="qtfwquerylist" 
				mutilSelect="true"
				url="/qzgl/wmfwgl/queryQtfwListAction.action" >
			<cps:column isCheckbox="true" title="选择" ></cps:column>	
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column field="djdwmc" title="录入单位" maxlength="10"></cps:column>
			<cps:column field="fwsj" title="服务时间" rowcallback="fwsjrowcallback" maxlength="20"></cps:column>
			<cps:column field="fwnr" title="服务内容" maxlength="20"></cps:column>
			<cps:column field="jbrxm" title="经办人" maxlength="10"></cps:column>
			<cps:column field="djrxm" title="录入人" maxlength="10"></cps:column>
		</cps:tableGrid>
	</creator:box>
</creator:view>