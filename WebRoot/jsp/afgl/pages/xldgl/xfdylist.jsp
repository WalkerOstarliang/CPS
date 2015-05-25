<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
<creator:Script src="/jsp/afgl/js/xldrylist.js"></creator:Script>
<creator:box>
	<creator:tbar id="tbar">
		<cps:button value="查&nbsp;询" onclick="jxQueryXfryxx()"></cps:button>
		<cps:button value="新&nbsp;增" onclick="openXfryInfoWin('add')"></cps:button>
	</creator:tbar>
	<creator:panel id="xldycx" title="巡防队员管理" tbarId="tbar">
		<form id="xfryqueryform">
		<input type="hidden" id="dwdm" value="${loginInfo.orgcode}"/>
			<cps:table>
					<cps:row>
						<cps:tdLabel  width="9%">市局：</cps:tdLabel>
						<cps:tdContent  width="25%">
								<c:choose>
								<c:when test="${empty loginInfo.citygajgdm}">
									<s:select id="citygajgjgdm" list="cityGajgjgList"  name="queryBean.citygajgjgdm"  listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm')"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden name="queryBean.citygajgjgdm"></s:hidden>
									<s:select id="citygajgjgdm" list="cityGajgjgList"  name="queryBean.citygajgjgdm"  listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" disabled="true"></s:select>
								</c:otherwise>
								</c:choose>
						</cps:tdContent>
						<cps:tdLabel  width="10%">县区局：</cps:tdLabel>
						<cps:tdContent  width="25%">
							<c:choose>
								<c:when test="${empty loginInfo.countrygajgdm}">
									<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm')"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden name="queryBean.countrygajgjgdm"></s:hidden>
									<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" disabled="true"></s:select>
								</c:otherwise>
								</c:choose>
						</cps:tdContent>
						<cps:tdLabel   width="10%">派出所：</cps:tdLabel>
						<cps:tdContent>
							<c:choose>
								<c:when test="${empty loginInfo.pcsdm}">
										<s:select id="pcsdm" list="pcsGajgjgList"  name="queryBean.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleSelectJWS(this.value,'jwsselect')"></s:select>
								</c:when>
								<c:otherwise>
										<s:hidden name="queryBean.pcsdm"></s:hidden>
										<s:select id="pcsdm" list="pcsGajgjgList"  name="queryBean.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" disabled="true"></s:select>
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
						<cps:tdLabel>巡防员身份证号：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield id="xldysfzh" name="queryBean.xldysfzh"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>巡防员姓名：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield id="xldyxm" name="queryBean.xldyxm"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>上岗时间：</cps:tdLabel>
						<cps:tdContent>
							<cps:date id="sgrqstart" name="queryBean.sgrqstart"  cssStyle="width:40%;" dateFmt="yyyy-MM-dd"></cps:date>
							-
							<cps:date id="sgrqend" name="queryBean.sgrqend"  cssStyle="width:40%;" dateFmt="yyyy-MM-dd"></cps:date>
						</cps:tdContent>
						<cps:tdLabel>在岗状态：</cps:tdLabel>
						<cps:tdContent >
							<cps:select id="zgzt" name="queryBean.zgzt" zdlb="AF_ZGZT" value="1" headerKey="" headerValue=" " onchange="jxQueryXfryxx()" cssClass="cps-input" ></cps:select>
						</cps:tdContent>
						<cps:tdLabel>退出日期：</cps:tdLabel>
						<cps:tdContent>
							<cps:date id="tcrq" name="queryBean.tcrq" dateFmt="yyyy-MM-dd"></cps:date>
						</cps:tdContent>
					</cps:row>
			</cps:table>
		</form>
	</creator:panel>
	<cps:tableGrid id="xldyquerylist" 
				mutilSelect="true"
				autoload="false"
				url="/afgl/xldxx/queryXfdyxxList.action" 
				searchform="xfryqueryform"
				title="巡防队员列表"
				width="99.8%">		
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column isCheckbox="true"></cps:column>
		<cps:column field="cz" title="操作" rowcallback="rowCallback" width="10%"></cps:column>
		<cps:column field="xldyxm" title="姓名"></cps:column>
		<cps:column field="xldysfzh" title="身份证号"></cps:column>
		<cps:column field="xldyxbmc" title="性别"></cps:column>
		<cps:column field="xldyhjdxz" title="户籍地详址" align="left"></cps:column>
		<cps:column field="xldyxzdxz" title="现住地详址" align="left"></cps:column>
		<cps:column field="sgrq" title="上岗时间"></cps:column>
		<cps:column field="tcrq" title="退出时间"></cps:column>
	</cps:tableGrid>
</creator:box>
</creator:view>