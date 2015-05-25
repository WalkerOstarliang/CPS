<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:box>
		<creator:tbar id="tbar">
			<cps:button value="新&nbsp;增" onclick="openAddKywpxx()"></cps:button>
			<cps:button value="查&nbsp;询" onclick="queryKywpxx();"></cps:button>
		</creator:tbar>
		<creator:panel id="afglkywpgl" title="可疑物品管理" tbarId="tbar">
			<form id="searchform">
				<cps:table>
					<cps:row>
						<cps:tdLabel width="13%">市/州：</cps:tdLabel>
						<cps:tdContent width="20%">
							<c:choose>
								<c:when test="${empty loginInfo.citydm}">
									<s:select list="cityXzqhList" id="citydm" cssStyle="width:80%"
										name="kywpxxQuery.citydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" cssClass="cps-input"
										onchange="doubleSelectCountry(this.value,'countrydmselect',queryKywpxx)"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden id="citydm" name="kywpxxQuery.citydm"></s:hidden>
									<s:select list="cityXzqhList" id="citydmselect" cssStyle="width:80%"
										name="kywpxxQuery.citydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" disabled="true"
										cssClass="cps-input"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="12%">县/区：</cps:tdLabel>
						<cps:tdContent width="20%">
							<c:choose>
								<c:when test="${empty loginInfo.countrydm}">
									<s:select list="countryXzqhList" id="countrydmselect" cssStyle="width:80%"
										name="kywpxxQuery.countrydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" cssClass="cps-input"
										onchange="doubleSelectPcs(this.value,'pcsdmselect',queryKywpxx)"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden name="kywpxxQuery.countrydm"></s:hidden>
									<s:select list="countryXzqhList" id="countrydmselect" cssStyle="width:80%"
										name="kywpxxQuery.countrydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" disabled="true"
										cssClass="cps-input"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="12%">派出所：</cps:tdLabel>
						<cps:tdContent width="20%">
							<c:choose>
								<c:when test="${empty loginInfo.pcsdm}">
									<s:select list="pcsOrgList" id="pcsdmselect" cssStyle="width:80%"
										name="kywpxxQuery.pcsdm" listKey="orgcode" listValue="orgjc"
										headerKey="" headerValue="--请选择--" cssClass="cps-input"
										onchange="queryKywpxx()"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden name="kywpxxQuery.pcsdm"></s:hidden>
									<s:select list="pcsOrgList" id="pcsdmselect" cssStyle="width:80%"
										name="kywpxxQuery.pcsdm" listKey="orgcode" listValue="orgjc"
										headerKey="" headerValue="--请选择--" disabled="true"
										cssClass="cps-input"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%">物品名称：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="wpmc" name="kywpxxQuery.wpmc"
								cssStyle="width:80%"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="12%">物品类型：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:select id="wplx" name="kywpxxQuery.wplx"
								cssStyle="width:80%" zdlb="GB_WPLB" headerValue="--选择--"
								headerKey=""></cps:select>
						</cps:tdContent>
						<cps:tdLabel width="12%">处理状态：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:select id="clzt" name="kywpxxQuery.clzt"
								cssStyle="width:80%" zdlb="GB_WPZT" headerValue="--选择--"
								headerKey=""></cps:select>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
		
		<cps:tableGrid id="kywpxxList" pageSize="15" usepager="true"
			searchform="searchform" autothead="false"
			url="/kywpxx/kywpxxList.action" mutilSelect="true" autoload="true">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column isCheckbox="true"></cps:column>
			<cps:column title="物品名称" field="wpmc"></cps:column>
			<cps:column title="物品类型" field="wplxmc"></cps:column>
			<cps:column title="处理状态" field="clztmc"></cps:column>
			<cps:column title="登记人" field="djrxm"></cps:column>
			<cps:column title="登记日期" field="djsj"></cps:column>
			<cps:column title="操作" field="cz" rowcallback="kywpxxlistCzRowCallback"></cps:column>
		</cps:tableGrid>
		<script type="text/javascript" src="${contextPath}/jsp/afgl/js/af.js"></script>
		<script type="text/javascript"
			src="${contextPath}/jsp/afgl/js/kywpxx.js"></script>
	</creator:box>
</creator:view>