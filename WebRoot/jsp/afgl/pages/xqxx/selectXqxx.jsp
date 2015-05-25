<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="选择小区">
		<creator:panel id="afglselectxqgldj" title="选择小区">
			<form id="searchform">
				<cps:table>
					<cps:row>
						<cps:tdLabel width="13%">市/州：</cps:tdLabel>
						<cps:tdContent width="20%">
							<c:choose>
								<c:when test="${empty loginInfo.citydm}">
									<s:select list="cityXzqhList" id="citydm" cssStyle="width:80%"
										name="xqxxQuery.citydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" cssClass="cps-input"
										onchange="doubleSelectCountry(this.value,'countrydmselect',queryXqxx)"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden id="citydm" name="xqxxQuery.citydm"></s:hidden>
									<s:select list="cityXzqhList" id="citydmselect" cssStyle="width:80%"
										name="xqxxQuery.citydm" listKey="dm" listValue="mc"
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
										name="xqxxQuery.countrydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" cssClass="cps-input"
										onchange="doubleSelectPcs(this.value,'pcsdmselect',queryXqxx)"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden name="xqxxQuery.countrydm"></s:hidden>
									<s:select list="countryXzqhList" id="countrydmselect" cssStyle="width:80%"
										name="xqxxQuery.countrydm" listKey="dm" listValue="mc"
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
										name="xqxxQuery.pcsdm" listKey="orgcode" listValue="orgjc"
										headerKey="" headerValue="--请选择--" cssClass="cps-input"
										onchange="queryXqxx()"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden name="xqxxQuery.pcsdm"></s:hidden>
									<s:select list="pcsOrgList" id="pcsdmselect" cssStyle="width:80%"
										name="xqxxQuery.pcsdm" listKey="orgcode" listValue="orgjc"
										headerKey="" headerValue="--请选择--" disabled="true"
										cssClass="cps-input"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%">小区名称：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="xqmc" name="xqxxQuery.xqmc"
								cssStyle="width:80%"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="12%">小区负责人：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="xqfzrxm" name="xqxxQuery.xqfzrxm"
								cssStyle="width:80%"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="12%">物业公司：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="wygsmc" name="xqxxQuery.wygsmc"
								cssStyle="width:80%"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%">所属居委会：</cps:tdLabel>
						<cps:tdContent width="20%">
							<input type="hidden" id="ssjwhbh" name="xqxxQuery.ssjwhbh"/>
							<cps:textfield id="ssjwhmc" name="xqxxQuery.ssjwhmc" cssStyle="width:50%" 
								disabled="true" ondblclick="selectJwh()">
							</cps:textfield>
							<cps:button value="选择" onclick="selectJwh()"></cps:button>
						</cps:tdContent>
						<cps:tdLabel width="12%">管理模式：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:select id="glms" name="xqxxQuery.glms" zdlb="AF_GLMS" headerKey="" 
									headerValue="--请选择--"cssStyle="width:80%"></cps:select>
						</cps:tdContent>
						<cps:tdLabel width="12%">建立日期：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:date id="jlrq_from" name="xqxxQuery.jlrq_from"
								dateFmt="yyyy-MM-dd" cssClass="cps-input" cssStyle="width:40%;">
							</cps:date>
							至
							<cps:date id="jlrq_to" name="xqxxQuery.jlrq_to"
										dateFmt="yyyy-MM-dd" cssClass="cps-input" cssStyle="width:40%;">
									</cps:date>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdContent colspan="6" align="center">
							<cps:button value="查询" onclick="queryXqxx()"></cps:button>
							<cps:button value="选择" onclick="returnXqxx()"></cps:button>
							<cps:button value="关闭" onclick="window.close()"></cps:button>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
		<cps:tableGrid id="xqxxList" pageSize="15" usepager="true"
			searchform="searchform" autothead="false" url="/xqxx/xqxxList.action"
			mutilSelect="true" autoload="true" dblclick="rowClickEvent">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column isCheckbox="true"></cps:column>
			<cps:column title="小区名称" field="xqmc"></cps:column>
			<cps:column title="所属居委会" field="ssjwhmc"></cps:column>
			<cps:column title="小区地址" field="xqdz"></cps:column>
			<cps:column title="物业公司" field="wygsmc"></cps:column>
			<cps:column title="管理模式" field="glmsmc"></cps:column>
			<cps:column title="建立日期" field="jlrq"></cps:column>
			<cps:column title="撤消标识" field="cxbsmc"></cps:column>
		</cps:tableGrid>
		<script type="text/javascript" src="${contextPath}/jsp/afgl/js/af.js"></script>
		<script type="text/javascript"
			src="${contextPath}/jsp/afgl/js/xqxx.js"></script>
</creator:view>