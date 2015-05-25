<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="选择卡口信息">
		<creator:panel id="afglkkxxdj" title="选择卡口信息">
			<form id="searchform">
				<cps:table>
					<cps:row>
						<cps:tdLabel width="13%">市/州：</cps:tdLabel>
						<cps:tdContent width="20%">
							<c:choose>
								<c:when test="${empty loginInfo.citydm}">
									<s:select list="cityXzqhList" id="citydm"
										name="kkxxQuery.citydm" listKey="dm" listValue="mc" cssStyle="width:80%"
										headerKey="" headerValue="--请选择--" cssClass="cps-input"
										onchange="doubleSelectCountry(this.value,'countrydmselect',queryKkxx)"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden id="citydm" name="kkxxQuery.citydm"></s:hidden>
									<s:select list="cityXzqhList" id="citydmselect" cssStyle="width:80%"
										name="kkxxQuery.citydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" disabled="true"
										cssClass="cps-input"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="12%">县/区：</cps:tdLabel>
						<cps:tdContent width="20%">
							<c:choose>
								<c:when test="${empty loginInfo.countrydm}">
									<s:select list="countryXzqhList" id="countrydmselect"
										name="kkxxQuery.countrydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" cssClass="cps-input" cssStyle="width:80%"
										onchange="doubleSelectPcs(this.value,'pcsdmselect',queryKkxx)"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden name="kkxxQuery.countrydm"></s:hidden>
									<s:select list="countryXzqhList" id="countrydmselect"
										name="kkxxQuery.countrydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" disabled="true" cssStyle="width:80%"
										cssClass="cps-input"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="12%">派出所：</cps:tdLabel>
						<cps:tdContent width="20%">
							<c:choose>
								<c:when test="${empty loginInfo.pcsdm}">
									<s:select list="pcsOrgList" id="pcsdmselect"
										name="kkxxQuery.pcsdm" listKey="orgcode" listValue="orgjc"
										headerKey="" headerValue="--请选择--" cssClass="cps-input" cssStyle="width:80%"
										onchange="queryKkxx()"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden name="kkxxQuery.pcsdm"></s:hidden>
									<s:select list="pcsOrgList" id="pcsdmselect"
										name="kkxxQuery.pcsdm" listKey="orgcode" listValue="orgjc"
										headerKey="" headerValue="--请选择--" disabled="true" cssStyle="width:80%"
										cssClass="cps-input"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%">卡口名称：</cps:tdLabel>
						<cps:tdContent colspan="3">
							<s:textfield id="kkmc" name="kkxxQuery.kkmc" onkeypress="queryKkxx()"
								cssStyle="width:80%"></s:textfield>
						</cps:tdContent>
						<cps:tdContent colspan="2" align="center">
							<cps:button value="查询" onclick="queryKkxx()"></cps:button>
							<cps:button value="确定" onclick="returnKkxx()"></cps:button>
							<cps:button value="关闭" onclick="$.closeWindow()"></cps:button>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
		<cps:tableGrid id="kkxxList" pageSize="15" usepager="true" dblclick="rowClickEvent"
			searchform="searchform" autothead="true" url="/kkxx/kkxxList.action"
			mutilSelect="false" autoload="true">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column isCheckbox="true"></cps:column>
			<cps:column title="卡口名称" field="kkmc"></cps:column>
			<cps:column title="卡口位置" field="kkwz"></cps:column>
			<cps:column title="警务责任区" field="sszrqmc"></cps:column>
			<cps:column title="建立日期" field="kkcjsj"></cps:column>
			<cps:column title="注销标识" field="zxbsmc"></cps:column>
			<cps:column title="登记人" field="djrxm"></cps:column>
			<cps:column title="登记日期" field="djsj"></cps:column>
		</cps:tableGrid>
		<script type="text/javascript" src="${contextPath}/jsp/afgl/js/af.js"></script>
		<script type="text/javascript"
			src="${contextPath}/jsp/afgl/js/kkxx.js"></script>
</creator:view>