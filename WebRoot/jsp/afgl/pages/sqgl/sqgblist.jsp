<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
<creator:Script src="/jsp/afgl/js/sqgblist.js"></creator:Script>
<creator:box>
	<creator:tbar id="tbar">
		<input type="hidden" id="showAddBtn" value="${displayAddBtn}" />
		<cps:button value="查&nbsp;询" onclick="jxQuery()"></cps:button>
		<%--<cps:button value="重&nbsp;置" onclick="openGjQueryXldxx()"></cps:button>--%>
		<cps:button value="新&nbsp;增" onclick="openInfoWin('add')" display="${displayAddBtn}"></cps:button>
		<cps:button value="批量删除" onclick="batchDeleteGbxx()" display="${displayAddBtn}"></cps:button>
		<cps:button value="导出" onclick="exportSqgbxx()"></cps:button>
	</creator:tbar>
	
	<c:choose>
		<c:when test="${queryBean.lx eq '1'}">
			<c:set var="title"  value="社区干部"></c:set>
		</c:when>
		<c:when test="${queryBean.lx eq '2'}">
			<c:set var="title"  value="小区/组干部"></c:set>
		</c:when>
		<c:when test="${queryBean.lx eq '3'}">
			<c:set var="title"  value="街道/乡镇干部"></c:set>
		</c:when>
	</c:choose>
	
	
	<creator:panel id="xldcx" title="${title}管理" tbarId="tbar">
		<form id="xldqueryform" method="post">
			<input type="hidden" name="queryBean.lx" value="${queryBean.lx}" id="lx">
			<cps:table>
				<cps:row>
					<cps:tdLabel width="10%">市局：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.citygajgdm}">
								<s:select id="citygajgjgdm" list="cityGajgjgList"  name="queryBean.citygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm',jxQuery)"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden"  name="queryBean.citygajgjgdm" value="${queryBean.citygajgjgdm}"/>
								<s:select id="citygajgjgdm" list="cityGajgjgList"  name="queryBean.citygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm',jxQuery)" disabled="true"></s:select>
							</c:otherwise>
						</c:choose>
						
					</cps:tdContent>
					<cps:tdLabel width="10%">县区局：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.countrygajgdm}">
								<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm',jxQuery)"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden"  name="queryBean.countrygajgjgdm" value="${queryBean.countrygajgjgdm}"/>
								<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm',jxQuery)" disabled="true"></s:select>
							</c:otherwise>
							</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="12%">派出所：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.pcsdm}">
								<s:select id="pcsdm" list="pcsGajgjgList"  name="queryBean.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" onchange="doubleSelectJWS(this.value,'jwsselect')" cssClass="cps-select" ></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden"  name="queryBean.pcsdm" value="${queryBean.pcsdm}"/>
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
					<cps:tdLabel>社区：</cps:tdLabel>
					<cps:tdContent>
						<s:select id="sqdm" list="sqJbxxList"  name="queryBean.sqdm" listKey="sqbh" listValue="jc" headerKey="" headerValue=" " cssClass="cps-select"></s:select>
					</cps:tdContent>
					<cps:tdLabel>干部身份证号：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="gbsfzh" name="queryBean.gbsfzh" ></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>干部姓名：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="gbxm" name="queryBean.gbxm" ></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>&nbsp;</cps:tdLabel>
					<cps:tdContent>&nbsp;</cps:tdContent>
					<cps:tdLabel>&nbsp;</cps:tdLabel>
					<cps:tdContent>
						&nbsp;
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</form>
	</creator:panel>
	
	
	<cps:tableGrid id="xldquerylist" title="${title}列表"
				mutilSelect="false"
				url="/afgl/sqgbgl/querySqgbPageResult.action" 
				autoload="false"
				searchform="xldqueryform">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column isCheckbox="true"></cps:column>
		<cps:column field="cz" title="操作" rowcallback="czRowCallback"></cps:column>
		<cps:column field="gbxm" title="姓名"></cps:column>
		<cps:column field="gbsfzh" title="身份证号"></cps:column>
		<cps:column field="gbxbmc" title="性别"></cps:column>
		<cps:column field="gbxzdxz" title="住址" align="left" maxlength="15"></cps:column>
		<cps:column field="gbzwmc" title="职务"  maxlength="15"></cps:column>
		<cps:column field="sssqmc" title="所在社区"></cps:column>
	</cps:tableGrid>
</creator:box>
</creator:view>