<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
<creator:Script src="/jsp/afgl/js/xldxxlist.js"></creator:Script>
<creator:box>
	<creator:tbar id="tbar">
		<cps:button value="查&nbsp;询" onclick="jxQueryXldxx()"></cps:button>
		<cps:button value="新&nbsp;增" onclick="openXldInfoWin('add','${queryBean.xldlx}','')"></cps:button>
		<cps:button value="添加队员" onclick="addTjxldy()"></cps:button>
	</creator:tbar>
	<creator:panel id="xldcx" title="巡防队查询" tbarId="tbar">
		<form id="xldqueryform">
			
			<cps:table>
					<cps:row>
					<cps:tdLabel width="10%">市局：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.citygajgdm}">
								<s:select id="citygajgjgdm" list="cityGajgjgList"  name="queryBean.citygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm',jxQueryXldxx)"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="queryBean.citygajgjgdm" value="${queryBean.citygajgjgdm }"/>
								<s:select id="citygajgjgdm" list="cityGajgjgList"  name="queryBean.citygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm',jxQueryXldxx)" disabled="true"></s:select>
							</c:otherwise>
							</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="10%">县区局：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.countrygajgdm}">
								<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm',jxQueryXldxx)"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="queryBean.countrygajgjgdm" value="${queryBean.countrygajgjgdm }"/>
								<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm',jxQueryXldxx)" disabled="true"></s:select>
							</c:otherwise>
							</c:choose>
						
					</cps:tdContent>
					<cps:tdLabel width="10%">派出所：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.pcsdm}">
								<s:select id="pcsdm" list="pcsGajgjgList"  name="queryBean.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="jxQueryXldxx()"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="queryBean.pcsdm" value="${queryBean.pcsdm }"/>
								<s:select id="pcsdm" list="pcsGajgjgList"  name="queryBean.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="jxQueryXldxx()" disabled="true"></s:select>
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
					<cps:tdLabel >巡逻队类型：</cps:tdLabel>
					<cps:tdContent >
						<s:select list="#{'1' : '专职巡防队','2' : '义务巡防队'}" id="xldlx" name="queryBean.xldlx" cssClass="cps-select" headerKey="" headerValue=" "></s:select>
					</cps:tdContent>
					<cps:tdLabel >分管领导：</cps:tdLabel>
					<cps:tdContent>
						<s:textfield id="ssdwfgld" name="queryBean.ssdwfgld" cssClass="cps-input"></s:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>责任人：</cps:tdLabel>
					<cps:tdContent>
						<s:textfield id="xldzrrxm" name="queryBean.xldzrrxm" cssClass="cps-input"></s:textfield>
					</cps:tdContent>
					<cps:tdLabel>组建日期：</cps:tdLabel>
					<cps:tdContent>
						<cps:date id="zjrqstart" name="queryBean.zjrqstart" cssStyle="width:38%" dateFmt="yyyy-MM-dd" maxDate="${currentSystemDate}"></cps:date>
						-
						<cps:date id="zjrqend" name="queryBean.zjrqend" cssStyle="width:38%" dateFmt="yyyy-MM-dd" maxDate="${currentSystemDate}" minDateDepend="zjrqstart"></cps:date>
					</cps:tdContent>
					<cps:tdLabel>注销日期：</cps:tdLabel>
					<cps:tdContent>
						<cps:date id="cxrqstart" name="queryBean.cxrqstart" cssStyle="width:38%" dateFmt="yyyy-MM-dd" maxDate="${currentSystemDate}"></cps:date>
						-
						<cps:date id="cxrqend" name="queryBean.cxrqend" cssStyle="width:38%" dateFmt="yyyy-MM-dd" maxDate="${currentSystemDate}" minDateDepend="cxrqstart"></cps:date>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>注销标识：</cps:tdLabel>
					<cps:tdContent>
						<cps:select id="cxbs" name="queryBean.cxbs" zdlb="AF_CXBS" headerKey="" headerValue="--请选择--" cssClass="cps-input" value="1"></cps:select>
					</cps:tdContent>
					<cps:tdLabel>&nbsp;</cps:tdLabel>
					<cps:tdContent>&nbsp;</cps:tdContent>
					<cps:tdLabel>&nbsp;</cps:tdLabel>
					<cps:tdContent>&nbsp;</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdContent colspan="6">
						<font color="red">说明：添加”巡防队员“之前请新增或者选择一个巡防队。</font>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</form>
	</creator:panel>
	
	<cps:tableGrid id="xldquerylist" title="巡防队列表"
				mutilSelect="true"
				width="99.8%"
				url="/afgl/xldxx/queryXldxxList.action" 
				searchform="xldqueryform">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column isCheckbox="true"></cps:column>
		<cps:column field="cz" title="操作" align="left" rowcallback="xldquerylistCzRowCallback"></cps:column>
		<cps:column field="xldmc" title="组织名称" align="left" maxlength="10"></cps:column>
		<cps:column field="zjsj" title="组建日期"></cps:column>
		<cps:column field="xldzrrxm" title="责任人"></cps:column>
		<cps:column field="ssdwmc" title="所属单位" align="left" width="30%" maxlength="18"></cps:column>
		<cps:column field="ssdwfgld" title="分管单位领导"></cps:column>
	</cps:tableGrid>
</creator:box>
</creator:view>