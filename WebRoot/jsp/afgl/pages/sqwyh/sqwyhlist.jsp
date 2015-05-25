<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
<creator:Script src="/jsp/afgl/js/sqwyhlist.js"></creator:Script>
<creator:box>
	<creator:tbar id="tbar">
		<cps:button value="查&nbsp;询" onclick="jxQuery()"></cps:button>
		<cps:button value="新&nbsp;增" onclick="openywhInfoWin('add','')"  display="${displayAddBtn}"></cps:button>
	</creator:tbar>
	<creator:panel id="xldcx" title="业委会管理" tbarId="tbar">
		<form id="xldqueryform" >
			<cps:table>
				<cps:row>
					<cps:tdLabel width="10%">市局：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.citygajgdm}">
								<s:select id="citygajgjgdm" list="cityGajgjgList"  name="queryBeanwyh.citygajgjgdm" listKey="dm" listValue="jc" headerKey=""
								 headerValue="--请选择--" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm',jxQuery)"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden"  name="queryBeanwyh.citygajgjgdm" value="${queryBeanwyh.citygajgjgdm}"/>
								<s:select id="citygajgjgdm" list="cityGajgjgList"  name="queryBeanwyh.citygajgjgdm" listKey="dm"
								 listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" 
								 onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm',jxQuery)" disabled="true"></s:select>
							</c:otherwise>
						</c:choose>
						
					</cps:tdContent>
					<cps:tdLabel width="10%">县区局：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.countrygajgdm}">
								<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBeanwyh.countrygajgjgdm" listKey="dm" listValue="jc" 
								headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm',jxQuery)"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden"  name="queryBeanwyh.countrygajgjgdm" value="${queryBeanwyh.countrygajgjgdm}"/>
								<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBeanwyh.countrygajgjgdm" listKey="dm" listValue="jc" 
								headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm',jxQuery)" disabled="true"></s:select>
							</c:otherwise>
							</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="12%">派出所：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.pcsdm}">
								<s:select id="pcsdm" list="pcsGajgjgList"  name="queryBeanwyh.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleSelectJWS(this.value,'jwsselect')"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden"  name="queryBeanwyh.pcsdm" value="${queryBeanwyh.pcsdm}"/>
								<s:select id="pcsdm" list="pcsGajgjgList"  name="queryBeanwyh.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="jxQuery()" disabled="true"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>警务区：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${empty loginInfo.jwsqdm}">
								<s:select list="jwsqOrgList" id="jwsselect" name="queryBeanwyh.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select" onchange="doubleSelectSqxxByJwsdm(this.value,'sqdm')" ></s:select>
							</c:when>
							<c:otherwise>
								<s:hidden id="jwsqdm" name="queryBeanwyh.jwsqdm"></s:hidden>
								<s:select list="jwsqOrgList" id="jwsselect" name="queryBeanwyh.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select"  disabled="true"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel>社区：</cps:tdLabel>
					<cps:tdContent>
						<s:select id="sqdm" list="sqJbxxList"  name="queryBeanwyh.sqdm" listKey="sqbh" listValue="jc" headerKey="" headerValue=" " cssClass="cps-select"></s:select>
					</cps:tdContent>
					<cps:tdLabel>小区/组：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="wyxqmc" name="queryBeanwyh.wyxqmc" ></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>业主姓名：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="cyxm" name="queryBeanwyh.cyxm" ></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>业主身份证：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="cysfzh" name="queryBeanwyh.cysfzh" ></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>成立日期：</cps:tdLabel>
					<cps:tdContent>
						<cps:date id="clstartdate" name="queryBeanwyh.clstartdate" dateFmt="yyyy-MM-dd" cssStyle="width:40%"></cps:date>
							-
						<cps:date  id="clenddate" name="queryBeanwyh.clenddate" dateFmt="yyyy-MM-dd" cssStyle="width:40%"></cps:date>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>注销标识：</cps:tdLabel>
					<cps:tdContent>
						<cps:select id="zxbs" name="queryBeanwyh.zxbs" zdlb="ZDY_ZXBS" headerKey="" headerValue=" "  ></cps:select>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</form>
	</creator:panel>
	<cps:tableGrid id="xldquerylist" title="业委会列表"
				mutilSelect="false"
				url="/afgl/sqldzgl/querySqYwhPageResult.action" 
				autoload="false"
				searchform="xldqueryform">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column isCheckbox="true"></cps:column>
		<cps:column field="cz" title="操作" rowcallback="czywhRowCallback"></cps:column>
		<cps:column field="wyxqmc" title="业主委员会名称"></cps:column>
		<cps:column field="stmc" title="物业小区名称"></cps:column>
		<cps:column field="zxbsms" title="注销标识"></cps:column>
	</cps:tableGrid>
</creator:box>
</creator:view>