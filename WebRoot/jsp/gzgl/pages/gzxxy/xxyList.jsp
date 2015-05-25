<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<script type="text/javascript" src="${contextPath}/jsp/gzgl/js/xxygl.js"></script>
	<creator:box>
		<creator:tbar id="xxytbar">
		<cps:button value="查&nbsp;询" onclick="queryData();"></cps:button>&nbsp;
		<cps:button value="新&nbsp;增" onclick="toAddXxyPage('add');"></cps:button>
		</creator:tbar>
		<creator:panel id="xxyPanel" title="治安耳目管理" tbarId="xxytbar">
			<form id="searchform">
				<input type="hidden" id="logininfo_orgcode" value="${loginInfo.orgcode }">
				<input type="hidden" id="logininfo_orgname" value="${loginInfo.orgname }">
				<cps:table>
					<cps:row>
					<cps:tdLabel width="10%">市局：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.citygajgdm}">
								<s:select id="citygajgjgdm" list="cityGajgjgList"  name="queryBean.citygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue=" " cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm',queryData)"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="queryBean.citygajgjgdm" value="${queryBean.citygajgjgdm }"/>
								<s:select id="citygajgjgdm" list="cityGajgjgList"  name="queryBean.citygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue=" " cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm',queryData)" disabled="true"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="10%">县区局：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.countrygajgdm}">
								<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue=" " cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm',queryData)"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="queryBean.countrygajgjgdm" value="${queryBean.countrygajgjgdm }"/>
								<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue=" " cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm',queryData)" disabled="true"></s:select>
							</c:otherwise>
							</c:choose>
						
					</cps:tdContent>
					<cps:tdLabel width="10%">派出所：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.pcsdm}">
								<s:select id="pcsdm" list="pcsGajgjgList"  name="queryBean.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue=" " cssClass="cps-select" onchange="queryData()"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="queryBean.pcsdm" value="${queryBean.pcsdm }"/>
								<s:select id="pcsdm" list="pcsGajgjgList"  name="queryBean.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue=" " cssClass="cps-select" onchange="queryData()" disabled="true"></s:select>
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
					<cps:tdLabel width="8%;">身份证号：</cps:tdLabel>
					<cps:tdContent width="25%;">
						<cps:textfield name="queryBean.sfzh" cssClass="cps-input" id="sfzh"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="8%;">姓名：</cps:tdLabel>
					<cps:tdContent width="25%;">
						<cps:textfield name="queryBean.xm" cssClass="cps-input" id="xm"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				</cps:table>
			</form>
		</creator:panel>
		
		<cps:tableGrid  id="xxyList"  title="耳目（信息员）列表"
					url="/gzgl/tzgl/queryXxyList.action"
					width="99.8%"
					searchform="searchform" 
					autoload="false" 
					mutilSelect="true" 
					autothead="true" >
			<cps:column isNumber="true" title="序号" ></cps:column>
			<cps:column field="cz" title="操作" align="left"></cps:column>
			<cps:column field="xm" title="姓名" align="left"></cps:column>
			<cps:column field="xbmc" title="性别" align="left"></cps:column>
			<cps:column field="sfzh" title="身份证号" align="left"></cps:column>
			<cps:column field="hjdxz" title="户籍地" align="left" maxlength="10"></cps:column>
		 	<cps:column field="fwcs" title="工作单位" align="left" maxlength="10"></cps:column>
		 	<cps:column field="wjrxm" title="物建人" align="left"></cps:column>
		 	<cps:column field="bz" title="备注" align="left" maxlength="10"></cps:column>
		</cps:tableGrid>
	</creator:box>
</creator:view>