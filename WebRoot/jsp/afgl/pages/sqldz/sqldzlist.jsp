<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
<creator:Script src="/jsp/afgl/js/sqldzlist.js"></creator:Script>
<creator:box>
	<creator:tbar id="tbar">
		<cps:button value="查&nbsp;询" onclick="jxQuery()"></cps:button>
		<cps:button value="新&nbsp;增" onclick="openInfoWin('add')"  display="${displayAddBtn}"></cps:button>
	</creator:tbar>
	<creator:panel id="xldcx" title="楼栋长管理" tbarId="tbar">
		<form id="xldqueryform" >
			<cps:table>
				<cps:row>
					<cps:tdLabel width="10%">市局：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.citygajgdm}">
								<s:select id="citygajgjgdm" list="cityGajgjgList"  name="queryBeanldz.citygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm',jxQuery)"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden"  name="queryBeanldz.citygajgjgdm" value="${queryBeanldz.citygajgjgdm}"/>
								<s:select id="citygajgjgdm" list="cityGajgjgList"  name="queryBeanldz.citygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm')" disabled="true"></s:select>
							</c:otherwise>
						</c:choose>
						
					</cps:tdContent>
					<cps:tdLabel width="10%">县区局：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.countrygajgdm}">
								<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBeanldz.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm')"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden"  name="queryBeanldz.countrygajgjgdm" value="${queryBeanldz.countrygajgjgdm}"/>
								<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBeanldz.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select"  disabled="true"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel width="12%">派出所：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.pcsdm}">
									<s:select id="pcsdm" list="pcsGajgjgList"  name="queryBeanldz.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue=" " cssClass="cps-select" onchange="doubleSelectJWS(this.value,'jwsselect')"></s:select>
							</c:when>
							<c:otherwise>
									<s:hidden name="queryBeanldz.pcsdm"></s:hidden>
									<s:select id="pcsdm" list="pcsGajgjgList"  name="queryBeanldz.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue=" " cssClass="cps-select" disabled="true"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>警务区：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${empty loginInfo.jwsqdm}">
								<s:select list="jwsqOrgList" id="jwsselect" name="queryBeanldz.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select" onchange="doubleSelectSqxxByJwsdm(this.value,'sqdm')" ></s:select>
							</c:when>
							<c:otherwise>
								<s:hidden id="jwsqdm" name="queryBeanldz.jwsqdm"></s:hidden>
								<s:select list="jwsqOrgList" id="jwsselect" name="queryBeanldz.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select"  disabled="true"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel>社区：</cps:tdLabel>
					<cps:tdContent>
						<s:select id="sqdm" list="sqJbxxList"  name="queryBeanldz.sqdm" listKey="sqbh" listValue="jc" headerKey="" headerValue=" " cssClass="cps-select"></s:select>
					</cps:tdContent>
					<cps:tdLabel>身份证号：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="sfzh" name="queryBeanldz.sfzh" ></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>姓名：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="xm" name="queryBeanldz.xm" ></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>注销标识：</cps:tdLabel>
					<cps:tdContent>
						<cps:select id="zxbs" name="queryBeanldz.zxbs" zdlb="ZDY_ZXBS" headerKey="" headerValue=" "  ></cps:select>
					</cps:tdContent>
					<cps:tdLabel>&nbsp;</cps:tdLabel>
					<cps:tdContent>
						&nbsp;
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</form>
	</creator:panel>
	
	
	<cps:tableGrid id="xldquerylist" title="楼栋长列表"
				mutilSelect="false"
				url="/afgl/sqldzgl/querySqLdzPageResult.action" 
				autoload="false"
				searchform="xldqueryform">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column isCheckbox="true"></cps:column>
		<cps:column field="cz" title="操作" rowcallback="czRowCallback"></cps:column>
		<cps:column field="xm" title="姓名"></cps:column>
		<cps:column field="sfzh" title="身份证号"></cps:column>
		<cps:column field="xbms" title="性别"></cps:column>
		<cps:column field="stdz" title="管理楼栋详址"></cps:column>
		<cps:column field="zxbsms" title="注销标识"></cps:column>
	</cps:tableGrid>
</creator:box>
</creator:view>