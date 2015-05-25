<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<script type="text/javascript" src="${contextPath}/jsp/qzgl/js/jftj.js"></script>
	
	<creator:box>
		<creator:tbar id="jftjtbar">
			<cps:button value="查&nbsp;询" onclick="jxquery()"></cps:button>&nbsp;
			<cps:button value="新增" onclick="openInfoWin('add','')"></cps:button>
		</creator:tbar>
		<creator:panel id="jftj" title="纠纷调处查询" tbarId="jftjtbar">
			<form id="jftjform">
				<cps:table>
						<cps:row>
					<cps:tdLabel width="10%">市局：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.citygajgdm}">
								<s:select id="citygajgjgdm" list="cityGajgjgList"  name="queryBean.citygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue=" " cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm',jxquery)"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="queryBean.citygajgjgdm" value="${queryBean.citygajgjgdm }"/>
								<s:select id="citygajgjgdm" list="cityGajgjgList"  name="queryBean.citygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue=" " cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm',jxquery)" disabled="true"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="10%">县区局：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.countrygajgdm}">
									<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue=" " cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm',jxquery)"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="queryBean.countrygajgjgdm" value="${queryBean.countrygajgjgdm }"/>
								<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue=" " cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm',jxquery)" disabled="true"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="10%">派出所：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.pcsdm}">
									<s:select id="pcsdm" list="pcsGajgjgList"  name="queryBean.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue=" " cssClass="cps-select" onchange="doubleSelectJWS(this.value,'jwsselect')"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="queryBean.pcsdm" value="${queryBean.pcsdm }"/>
								<s:select id="pcsdm" list="pcsGajgjgList"  name="queryBean.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue=" " cssClass="cps-select" disabled="true"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
				<cps:row>
						<cps:tdLabel>警务区：</cps:tdLabel>
						<cps:tdContent>
							<c:choose>
								<c:when test="${empty loginInfo.jwsqdm}">
									<s:select list="jwsqOrgList" id="jwsselect" name="queryBean.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select" onchange="doubleSelectSqxxByJwsdm(this.value,'sqdm')" ></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden id="jwsqdm" name="queryBean.jwsqdm"></s:hidden>
									<s:select list="jwsqOrgList" id="jwsselect" name="queryBean.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select"  disabled="true"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%">纠纷类型：</cps:tdLabel>
						<cps:tdContent width="25%">
							<s:select list="jflxList" id="jflxlist" listKey="dm"
								listValue="mc" headerKey="" headerValue=" "
								cssClass="cps-select" name="queryBean.jflx"></s:select>
						</cps:tdContent>
						<cps:tdLabel width="10%">调解时间：</cps:tdLabel>
						<cps:tdContent width="25%">
							<cps:date id="tjsj_from" name="queryBean.tjsj_from"
								dateFmt="yyyy-MM-dd" cssClass="cps-date" cssStyle="width:39%;">
							</cps:date>
							-
							<cps:date id="tjsj_to" name="queryBean.tjsj_to"
								dateFmt="yyyy-MM-dd" cssClass="cps-date" cssStyle="width:39%;">
							</cps:date>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>调解书下载：</cps:tdLabel>
						<cps:tdContent colspan="5">
							&nbsp;&nbsp;<span class="cps_span_href" onclick="zipFieldDown('/down/zatjxys.doc','治安调解协议书.doc')">治安调解协议书.doc</span>
							&nbsp;&nbsp;<span class="cps_span_href" onclick="zipFieldDown('/down/zatjxys.doc','现场治安调解协议书.doc')">现场治安调解协议书.doc</span>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
		<cps:tableGrid  id="jftjquerylist" title="纠纷调处登记列表" width="99.8%"
						url="/qzgl/jftjgl/queryList.action"
						autoload="false"
						searchform="jftjform">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column field="cz" title="操作"></cps:column>
			<cps:column field="jflxmc" title="纠纷类型"></cps:column>
			<cps:column field="dsryxm" title="当事人一"></cps:column>
			<cps:column field="dsrexm" title="当事人二"></cps:column>
			<cps:column field="tjsj" title="调解时间"></cps:column>
			<cps:column field="zyss" title="主要事实" maxlength="7"></cps:column>
			<cps:column field="dcxynr" title="达成协议" maxlength="7"></cps:column>
			
		</cps:tableGrid>
	</creator:box>
</creator:view>
