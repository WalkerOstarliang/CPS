<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript" src="${contextPath}/jsp/qzgl/js/wmfw.js"></script>
<creator:view>
	<creator:box>
		<creator:tbar id="wmfwgl">
			<cps:button value="查&nbsp;询" onclick="jxquery()"></cps:button>&nbsp;
			<cps:button value="重&nbsp;置" onclick="clearQuery()"></cps:button>
			<cps:button value="新&nbsp;增" onclick="addTgzm()" display="${displayAddBtn}"></cps:button>
			<cps:button value="修&nbsp;改" onclick="xgTgzm()" display="${displayAddBtn}"></cps:button>
			<cps:button value="删&nbsp;除" onclick="deleteTgzmxx()" display="${displayAddBtn}"></cps:button>
		</creator:tbar>
		<creator:panel id="wmfwgl" title="为民服务>提供证明" tbarId="wmfwgl" width="99.8%">
			<form id="tgzmqueryform">
					<cps:table>
					<cps:row>
						<cps:tdLabel width="10%">录入市州：</cps:tdLabel>
						<cps:tdContent width="24%">
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
						<cps:tdLabel width="10%">录入县区：</cps:tdLabel>
						<cps:tdContent width="24%">
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
						<cps:tdLabel width="10%">录入派出所：</cps:tdLabel>
						<cps:tdContent width="28%">
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
						<cps:tdLabel width="10%">录入警务区：</cps:tdLabel>
						<cps:tdContent width="24%">
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

						<cps:tdLabel width="10%">申请人姓名：</cps:tdLabel>
						<cps:tdContent width="24%">
							<cps:textfield id="sqrxm" name="querybean.sqrxm"
								cssClass="cps-select"></cps:textfield>
						</cps:tdContent>

						<cps:tdLabel width="10%">申请时间：</cps:tdLabel>
						<cps:tdContent width="28%">
							<cps:date id="startDate" name="querybean.startDate"
								dateFmt="yyyy-MM-dd" cssStyle="width:45%;">
							</cps:date>
							-
							<cps:date id="endDate" name="querybean.endDate"
								dateFmt="yyyy-MM-dd" cssStyle="width:45%;">
							</cps:date>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%">承办人姓名：</cps:tdLabel>
						<cps:tdContent width="24%">
							<cps:textfield id="cbrxm" name="querybean.cbrxm"
								cssClass="cps-select"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="10%">承办单位：</cps:tdLabel>
						<cps:tdContent width="24%">
							<cps:textfield id="cbdwmc" name="querybean.cbdwmc"
								cssClass="cps-select"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="10%">承办时间：</cps:tdLabel>
						<cps:tdContent width="28%">
							<cps:date id="startTime" name="querybean.startTime"
								dateFmt="yyyy-MM-dd" cssStyle="width:45%;">
							</cps:date>
							-
							<cps:date id="endTime" name="querybean.endTime"
								dateFmt="yyyy-MM-dd" cssStyle="width:45%;">
							</cps:date>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%">证明类型：</cps:tdLabel>
						<cps:tdContent width="24%">
							<cps:textfield id="tgzmlx" name="querybean.tgzmlx"
								cssClass="cps-select"></cps:textfield>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
		
		<cps:tableGrid id="tgzmquerylist" 
				mutilSelect="true"
				url="/qzgl/wmfwgl/queryTgzmListAction.action" >
			<cps:column isCheckbox="true" title="选择" ></cps:column>	
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column field="ssjwqmc" title="录入单位" maxlength="10"></cps:column>
			<cps:column field="sqrxm" title="申请人姓名" rowcallback="sqrxmrowcallback" maxlength="20"></cps:column>
			<cps:column field="sqsj" title="申请时间" maxlength="10"></cps:column>
			<cps:column field="tgzmlx" title="提供证明类型" maxlength="10"></cps:column>
			<cps:column field="cbrxm" title="承办人" maxlength="10"></cps:column>
			<cps:column field="cbdwmc" title="承办单位名称" maxlength="10"></cps:column>
			<cps:column field="cbsj" title="承办时间" maxlength="10"></cps:column>
		</cps:tableGrid>
	</creator:box>
</creator:view>