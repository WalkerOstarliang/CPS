<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
<script type="text/javascript" src="${contextPath}/jsp/qzgl/js/bmfw.js"></script>
	<creator:box>
		<creator:tbar id="bmfwtbar">
				<cps:button value="查&nbsp;询" onclick="jxquery()"></cps:button>
				<cps:button value="新增" onclick="openInfoWin('add','')"></cps:button>
		</creator:tbar>
		<creator:panel id="bmfwgl" title="为民服务查询" tbarId="bmfwtbar">
			<form id="bmfwform">
				<cps:table>
						<cps:row>
					
					<cps:tdLabel width="10%">市局：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.citygajgdm}">
								<s:select id="citygajgjgdm" list="cityGajgjgList"  name="queryBean.citygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm',jxquery)" ></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="queryBean.citygajgjgdm" value="${queryBean.citygajgjgdm }"/>
								<s:select id="citygajgjgdm" list="cityGajgjgList"  name="queryBean.citygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm',jxquery)" disabled="true"> </s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="10%">县区局：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.countrygajgdm}">
								<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm',jxquery)"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="queryBean.countrygajgjgdm" value="${queryBean.countrygajgjgdm }"/>
								<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm',jxquery)" disabled="true"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="10%">派出所：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.pcsdm}">
								<s:select id="pcsdm" list="pcsGajgjgList"  name="queryBean.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleSelectJWS(this.value,'jwsselect')"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="queryBean.pcsdm" value="${queryBean.pcsdm }"/>
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
					<cps:tdLabel width="10%">服务民警：</cps:tdLabel>
						<cps:tdContent width="25%">
						  <cps:textfield id="fwxmlb" name="queryBean.fwdxxm"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="10%">服务对象姓名：</cps:tdLabel>
						<cps:tdContent width="25%">
						 <cps:textfield id="bfwdxxm" name="queryBean.bfwdxxm"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="12%">服务时间：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:date id="fwsj_from" name="queryBean.fwsj_from"
								dateFmt="yyyy-MM-dd" cssClass="cps-input" cssStyle="width:39%;">
							</cps:date>
							-
							<cps:date id="fwsj_to" name="queryBean.fwsj_to"
										dateFmt="yyyy-MM-dd" cssClass="cps-input" cssStyle="width:39%;">
									</cps:date>
						</cps:tdContent>
						<cps:tdLabel>&nbsp;</cps:tdLabel>
						<cps:tdContent>&nbsp;</cps:tdContent>
						<cps:tdLabel>&nbsp;</cps:tdLabel>
						<cps:tdContent>&nbsp;</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
		
		<cps:tableGrid id="bmfwquerylist" title="为民服务登记列表" 
						url="/qzgl/bmfwgl/queryList.action" 
						width="99.8%" 
						autoload="false"
						searchform="bmfwform">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column field="cz" title="操作" rowcallback="czRowCallback" align="left"></cps:column>	
			<cps:column field="bfwdxxm" title="服务对象姓名"></cps:column>	
			<cps:column field="bfwdxsfzh" title="服务对象身份证"></cps:column>
			<cps:column field="fwdxxm" title="服务民警姓名"></cps:column>
			<cps:column field="fwdxsfzh" title="服务民警身份证"></cps:column>
			<cps:column field="fwsj" title="服务时间"></cps:column>
			<cps:column field="djsj" title="登记时间"></cps:column>
		</cps:tableGrid>
	</creator:box>
</creator:view>
