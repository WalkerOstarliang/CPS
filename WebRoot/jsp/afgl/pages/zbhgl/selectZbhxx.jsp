<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="选择治保会">
						<creator:tbar id="selectZbhxxtbar">
							<cps:button value="新增" onclick="openAddZbhxx()"></cps:button>
							<cps:button value="查询" onclick="queryZbhxx()"></cps:button>
							<cps:button value="确定" onclick="returnZbhxx()"></cps:button>
							<cps:button value="关闭" onclick="$.closeWindow()"></cps:button>
						</creator:tbar>
	
		<creator:panel id="afglzbhglselect" title="选择治保会" tbarId="selectZbhxxtbar">
			<form id="searchform">
				<cps:table>
					<cps:row>
						<cps:tdLabel width="13%">市/州：</cps:tdLabel>
						<cps:tdContent width="20%">
							<c:choose>
								<c:when test="${empty loginInfo.citydm}">
									<s:select list="cityXzqhList" id="citydm" cssStyle="width:80%"
										name="zbhxxQuery.citydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" cssClass="cps-input"
										onchange="doubleSelectCountry(this.value,'countrydmselect',queryZbhxx)"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden id="citydm" name="zbhxxQuery.citydm"></s:hidden>
									<s:select list="cityXzqhList" id="citydmselect" cssStyle="width:80%"
										name="zbhxxQuery.citydm" listKey="dm" listValue="mc"
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
										name="zbhxxQuery.countrydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" cssClass="cps-input"
										onchange="doubleSelectPcs(this.value,'pcsdmselect',queryZbhxx)"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden name="zbhxxQuery.countrydm"></s:hidden>
									<s:select list="countryXzqhList" id="countrydmselect" cssStyle="width:80%"
										name="zbhxxQuery.countrydm" listKey="dm" listValue="mc"
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
										name="zbhxxQuery.pcsdm" listKey="orgcode" listValue="orgjc"
										headerKey="" headerValue="--请选择--" cssClass="cps-input"
										onchange="queryZbhxx()"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden name="zbhxxQuery.pcsdm"></s:hidden>
									<s:select list="pcsOrgList" id="pcsdmselect" cssStyle="width:80%"
										name="zbhxxQuery.pcsdm" listKey="orgcode" listValue="orgjc"
										headerKey="" headerValue="--请选择--" disabled="true"
										cssClass="cps-input"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%">治保会名称：</cps:tdLabel>
						<cps:tdContent width="20%">
							<s:textfield id="zbhmc" name="zbhxxQuery.zbhmc"
								cssStyle="width:80%" onkeyup="queryZbhxx()"></s:textfield>
						</cps:tdContent>

					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
		<cps:tableGrid id="zbhxxList" pageSize="15" usepager="true"
			searchform="searchform" autothead="true" url="/zbhxx/zbhxxList.action"
			mutilSelect="false" autoload="true" dblclick="rowClickEvent">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column isCheckbox="true"></cps:column>
			<cps:column title="治保会名称" field="zbhmc"></cps:column>
			<cps:column title="所在社区" field="sssqjwmc"></cps:column>
			<cps:column title="建立日期" field="cjsj"></cps:column>
			<cps:column title="责任人" field="zbhfzrxm"></cps:column>
			<cps:column title="联系电话" field="zbhfzrlxdh"></cps:column>
			<cps:column title="注消标识" field="zxbsmc"></cps:column>
		</cps:tableGrid>
		<script type="text/javascript" src="${contextPath}/jsp/afgl/js/af.js"></script>
		<script type="text/javascript"
			src="${contextPath}/jsp/afgl/js/zbhxx.js"></script>
</creator:view>