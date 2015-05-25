<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:box>
		<creator:panel id="afglkkxxdj" title="安防管理 > 卡口信息管理">
			<form id="searchform">
				<cps:table>
					<cps:row>
						<cps:tdLabel width="13%">市/州：</cps:tdLabel>
						<cps:tdContent width="20%">
							<c:choose>
								<c:when test="${empty loginInfo.citydm}">
									<s:select list="cityXzqhList" id="citydm" cssStyle="width:80%"
										name="kkxxQuery.citydm" listKey="dm" listValue="mc"
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
									<s:select list="countryXzqhList" id="countrydmselect" cssStyle="width:80%"
										name="kkxxQuery.countrydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" cssClass="cps-input"
										onchange="doubleSelectPcs(this.value,'pcsdmselect',queryKkxx)"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden name="kkxxQuery.countrydm"></s:hidden>
									<s:select list="countryXzqhList" id="countrydmselect" cssStyle="width:80%"
										name="kkxxQuery.countrydm" listKey="dm" listValue="mc"
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
										name="kkxxQuery.pcsdm" listKey="orgcode" listValue="orgjc"
										headerKey="" headerValue="--请选择--" cssClass="cps-input"
										onchange="queryKkxx()"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden name="kkxxQuery.pcsdm"></s:hidden>
									<s:select list="pcsOrgList" id="pcsdmselect" cssStyle="width:80%"
										name="kkxxQuery.pcsdm" listKey="orgcode" listValue="orgjc"
										headerKey="" headerValue="--请选择--" disabled="true"
										cssClass="cps-input"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%">卡口名称：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="kkmc" name="kkxxQuery.kkmc"
								cssStyle="width:80%"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="12%">卡口位置：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="kkwz" name="kkxxQuery.kkwz"
								cssStyle="width:80%"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="12%">建立日期：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:date id="kkcjsj_from" name="kkxxQuery.kkcjsj_from"
								dateFmt="yyyy-MM-dd HH:mm:ss" cssClass="cps-input" cssStyle="width:40%;">
							</cps:date>
					至
					<cps:date id="kkcjsj_to" name="kkxxQuery.kkcjsj_to"
								dateFmt="yyyy-MM-dd HH:mm:ss " cssClass="cps-input" cssStyle="width:40%;">
							</cps:date>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdContent colspan="6" align="center">
							<cps:button value="查&nbsp;询" onclick="queryKkxx()"></cps:button>
							<cps:button value="清&nbsp;空" type="reset"></cps:button>
							<!--<cps:button value="高级查询" onclick="toGjQueryKkxx()"></cps:button>-->
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
		<creator:tbar>
			<cps:button value="新&nbsp;增" onclick="openAddKkxx()"></cps:button>
			<cps:button value="批量撤销" onclick="toBatchDeleteKkxx()"></cps:button>
		</creator:tbar>
		<cps:tableGrid id="kkxxList" pageSize="15" usepager="true"
			searchform="searchform" url="/kkxx/kkxxList.action"
			mutilSelect="true" autoload="true">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column isCheckbox="true" field="isCheckbox"></cps:column>
			<cps:column title="卡口名称" field="kkmc"></cps:column>
			<cps:column title="卡口位置" field="kkwz"></cps:column>
			<cps:column title="警务责任区" field="sszrqmc"></cps:column>
			<cps:column title="建立日期" field="kkcjsj"></cps:column>
			<cps:column title="注销标识" field="zxbsmc"></cps:column>
			<cps:column title="登记人" field="djrxm"></cps:column>
			<cps:column title="登记日期" field="djsj"></cps:column>
			<cps:column title="操作" field="cz" rowcallback="kkxxlistCzRowCallback"></cps:column>
		</cps:tableGrid>
		<script type="text/javascript" src="${contextPath}/jsp/afgl/js/af.js"></script>
		<script type="text/javascript"
			src="${contextPath}/jsp/afgl/js/kkxx.js"></script>
	</creator:box>
</creator:view>