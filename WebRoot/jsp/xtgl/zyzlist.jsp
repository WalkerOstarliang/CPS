<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<script type="text/javascript"
		src="${contextPath}/jsp/qzgl/js/zyzgl.js"></script>
	<creator:box>
	<creator:tbar id="zyztbar">
		<cps:button value="查&nbsp;询" onclick="jxquery()"></cps:button>&nbsp;
		<cps:button value="重&nbsp;置" onclick="clearQuery()"></cps:button>
	</creator:tbar>
		<creator:panel id="zyzgl" title="群众服务>志愿者管理"  tbarId="zyztbar">
			<form id="zyzform">
				<cps:table>
					<cps:row>
						<cps:tdLabel width="10%">市/州：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${empty loginInfo.citydm}">
									<s:select list="cityXzqhList" id="citydm"
										name="queryBean.citydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" cssClass="cps-select"
										onchange="doubleSelectCountry(this.value,'countrydmselect',jxquery)"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden name="queryBean.citydm"></s:hidden>
									<s:select list="cityXzqhList" id="citydm"
										name="queryBean.citydm" listKey="dm" listValue="mc"
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
										name="queryBean.countrydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" cssClass="cps-select"
										onchange="doubleSelectPcs(this.value,'pcsdm',jxquery)"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden name="queryBean.countrydm"></s:hidden>
									<s:select list="countryXzqhList" id="countrydmselect"
										name="queryBean.countrydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" disabled="true"
										cssClass="cps-select"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%">派出所：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${empty loginInfo.pcsdm}">
									<s:select list="pcsOrgList" id="pcsdm" name="queryBean.pcsdm"
										listKey="orgcode" listValue="orgjc" headerKey=""
										headerValue="--请选择--" cssClass="cps-select"
										onchange="doubleSelectJWS(this.value,'jwsselect',jxquery)"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden name="queryBean.pcsdm"></s:hidden>
									<s:select list="pcsOrgList" id="pcsdm" name="queryBean.pcsdm"
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
										name="queryBean.jwsqdm" listKey="orgcode" listValue="orgjc"
										headerKey="" headerValue="--选择--" cssClass="cps-select"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden name="queryBean.jwsqdm"></s:hidden>
									<s:select list="jwsqOrgList" id="jwsselect"
										name="queryBean.jwsqdm" listKey="orgcode" listValue="orgjc"
										disabled="true" cssClass="cps-select"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%">姓名：</cps:tdLabel>
						<cps:tdContent width="25%">
							<cps:textfield id="xm" name="queryBean.xm"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="10%">身份证号：</cps:tdLabel>
						<cps:tdContent width="25%">
							<cps:textfield id="sfzh" name="queryBean.sfzh"></cps:textfield>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
		<creator:tbar id="zyztbar">
			<cps:button value="新增" onclick="add('add')"></cps:button>
			<%--<cps:button value="批量删除" onclick="bacthScZyzxx()"></cps:button>--%>
		</creator:tbar>
		<cps:tableGrid url="/qzgl/zyzgl/queryList.action" id="zyzquerylist"
			mutilSelect="true" title="志愿者信息列表" tbarId="zyztbar" width="99.8%">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column isCheckbox="true"></cps:column>
			<cps:column field="xm" title="姓名"></cps:column>
			<cps:column field="sfzh" title="身份证号码"></cps:column>
			<cps:column field="xbmc" title="性别"></cps:column>
			<cps:column field="lxdh" title="手机号码"></cps:column>
			<cps:column field="djrxm" title="登记民警"></cps:column>
			<cps:column field="sspcsmc" title="所属派出所"></cps:column>
			<cps:column field="djsj" title="登记时间"></cps:column>
			<cps:column field="cz" title="操作"></cps:column>
		</cps:tableGrid>
	</creator:box>
</creator:view>
