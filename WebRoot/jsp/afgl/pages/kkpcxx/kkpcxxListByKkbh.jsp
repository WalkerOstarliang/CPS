<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="卡口盘查列表">
		<creator:panel id="afglkkpcxx" title="卡口盘查列表">
			<form id="searchform">
				<cps:table>
					<cps:row>
						<cps:tdLabel width="13%">市/州：</cps:tdLabel>
						<cps:tdContent width="20%">
							<c:choose>
								<c:when test="${empty loginInfo.citydm}">
									<s:select list="cityXzqhList" id="citydm"
										name="kkpcxxQuery.citydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" cssClass="cps-input"
										onchange="doubleSelectCountry(this.value,'countrydmselect',queryKkpcxx)"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden id="citydm" name="kkpcxxQuery.citydm"></s:hidden>
									<s:select list="cityXzqhList" id="citydmselect"
										name="kkpcxxQuery.citydm" listKey="dm" listValue="mc"
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
										name="kkpcxxQuery.countrydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" cssClass="cps-input"
										onchange="doubleSelectPcs(this.value,'pcsdmselect',queryKkpcxx)"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden name="kkpcxxQuery.countrydm"></s:hidden>
									<s:select list="countryXzqhList" id="countrydmselect"
										name="kkpcxxQuery.countrydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" disabled="true"
										cssClass="cps-input"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="12%">派出所：</cps:tdLabel>
						<cps:tdContent width="20%">
							<c:choose>
								<c:when test="${empty loginInfo.pcsdm}">
									<s:select list="pcsOrgList" id="pcsdmselect"
										name="kkpcxxQuery.pcsdm" listKey="orgcode" listValue="orgjc"
										headerKey="" headerValue="--请选择--" cssClass="cps-input"
										onchange="queryKkpcxx()"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden name="kkpcxxQuery.pcsdm"></s:hidden>
									<s:select list="pcsOrgList" id="pcsdmselect"
										name="kkpcxxQuery.pcsdm" listKey="orgcode" listValue="orgjc"
										headerKey="" headerValue="--请选择--" disabled="true"
										cssClass="cps-input"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>卡口名称：</cps:tdLabel>
						<cps:tdContent>
							<input type="hidden" id="kkbh" name="kkpcxxQuery.kkbh" value="${ kkpcxxQuery.kkbh}"/>
							<cps:textfield id="kkmc" name="kkpcxxQuery.kkmc" value="${ kkpcxxQuery.kkmc}" disabled="true"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>盘查时间：</cps:tdLabel>
						<cps:tdContent>
							<cps:date id="pcsj_from" name="kkpcxxQuery.pcsj_from"
								dateFmt="yyyy-MM-dd HH:mm:ss" cssClass="cps-input"
								cssStyle="width:40%"></cps:date>
					至
					<cps:date id="pcsj_to" name="kkpcxxQuery.pcsj_to"
								dateFmt="yyyy-MM-dd HH:mm:ss" cssClass="cps-input"
								cssStyle="width:40%"></cps:date>
						</cps:tdContent>
						<cps:tdLabel>盘查民警：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield id="pcmjxm" name="kkpcxxQuery.pcmjxm"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					
					<cps:row>
						<cps:tdContent colspan="6" align="center">
							<cps:button value="查&nbsp;询" onclick="queryKkpcxx();"></cps:button>
							<cps:button value="高级查询" onclick="toGjQueryKkpcxx()"></cps:button>
							<cps:button value="清&nbsp;空" type="reset"></cps:button>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
		<cps:tableGrid id="kkpcxxList" pageSize="15" usepager="true"
			searchform="searchform" autothead="false"
			url="/kkpcxx/kkpcxxList.action" mutilSelect="true" autoload="true">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column isCheckbox="true"></cps:column>
			<cps:column title="卡口名称" field="kkmc"></cps:column>
			<cps:column title="盘查原因" field="pcyymc"></cps:column>
			<cps:column title="盘查民警" field="pcmjxm"></cps:column>
			<cps:column title="被盘查人" field="bpcrxm"></cps:column>
			<cps:column title="盘查时间" field="pcsj"></cps:column>
			<cps:column title="登记时间" field="djsj"></cps:column>
		</cps:tableGrid>
		<script type="text/javascript" src="${contextPath}/jsp/afgl/js/af.js"></script>
		<script type="text/javascript"
			src="${contextPath}/jsp/afgl/js/kkpcxx.js"></script>
</creator:view>