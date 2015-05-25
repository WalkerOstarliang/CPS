<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%-- 治安巡逻列表查询 --%>
<creator:view>
	<creator:Script src="/jsp/afgl/pages/zaxl/js/zaxl.js"></creator:Script>
	<cps:PanelView>
		<cps:tbar>
			<cps:button value="查询" onclick="zaxlSearch()"></cps:button>
			<cps:button value="重置" onclick="resetZaxlSeach()"></cps:button>
			<cps:button value="新增" onclick="openZaxlInfoWin('add')" display="${displayAddBtn}"></cps:button>
		</cps:tbar>
		<cps:panel title="查询条件">
			<form id="zaxlSearch" method="post">
				<cps:table>
					<cps:row>
						<cps:tdLabel width="11%">市局：</cps:tdLabel>
						<cps:tdContent width="22%">
							<c:choose>
								<c:when test="${empty loginInfo.citygajgdm}">
									<s:select id="citygajgjgdm" list="cityGajgjgList"
										name="query.citygajgjgdm" listKey="dm" listValue="jc"
										headerKey="" headerValue=" " cssClass="cps-select"
										onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm')">
									</s:select>
								</c:when>
								<c:otherwise>
									<input type="hidden" name="query.citygajgjgdm" value="${query.citygajgjgdm}" />
									<s:select id="citygajgjgdm" list="cityGajgjgList"
										disabled="true" name="query.citygajgjgdm" listKey="dm"
										listValue="jc" headerKey="" headerValue=" "
										cssClass="cps-select"
										onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm')">
									</s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="11%">县区局：</cps:tdLabel>
						<cps:tdContent width="22%">
							<c:choose>
								<c:when test="${empty loginInfo.countrygajgdm}">
									<s:select id="countrygajgjgdm" list="countryGajgjgList"
										name="query.countrygajgjgdm" listKey="dm" listValue="jc"
										headerKey="" headerValue=" " cssClass="cps-select"
										onchange="doublePcsGajgjg(this.value,'pcsdm')"></s:select>
								</c:when>
								<c:otherwise>
									<input type="hidden" name="query.countrygajgjgdm" value="${query.countrygajgjgdm}" />
									<s:select id="countrygajgjgdm" list="countryGajgjgList"
										disabled="true" name="query.countrygajgjgdm" listKey="dm"
										listValue="jc" headerKey="" headerValue=" "
										cssClass="cps-select"
										onchange="doublePcsGajgjg(this.value,'pcsdm')"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="11%">派出所：</cps:tdLabel>
						<cps:tdContent>
							<c:choose>
								<c:when test="${empty loginInfo.pcsdm}">
									<s:select id="pcsdm" list="pcsGajgjgList" name="query.pcsdm" onchange="doubleSelectJWS(this.value,'jwsselect')"
										listKey="dm" listValue="jc" headerKey="" headerValue=" "
										cssClass="cps-select"></s:select>
								</c:when>
								<c:otherwise>
									<input type="hidden" name="query.pcsdm" value="${query.pcsdm}" />
									<s:select id="pcsdm" list="pcsGajgjgList" name="query.pcsdm"
										disabled="true" listKey="dm" listValue="jc" headerKey=""
										headerValue=" " cssClass="cps-select"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					
					<cps:row>
						<cps:tdLabel>警务区：</cps:tdLabel>
						<cps:tdContent>
								<c:choose>
									<c:when test="${empty loginInfo.jwsqdm}">
										<s:select list="jwsqOrgList" id="jwsselect" name="query.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select" onchange="doubleSelectSqxxByJwsdm(this.value,'sqdm')" ></s:select>
									</c:when>
									<c:otherwise>
										<s:hidden id="jwsqdm" name="query.jwsqdm"></s:hidden>
										<s:select list="jwsqOrgList" id="jwsselect" name="query.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select"  disabled="true"></s:select>
									</c:otherwise>
								</c:choose>
						</cps:tdContent>
						
						<cps:tdLabel>巡逻社区：</cps:tdLabel>
							<cps:tdContent>
								<s:select id="sqdm" list="sqJbxxList"  name="query.sqdm" listKey="sqbh" listValue="jc" headerKey="" headerValue=" " cssClass="cps-select"></s:select>
						</cps:tdContent>
						
						<cps:tdLabel>巡逻日期：</cps:tdLabel>
						<cps:tdContent>
							<cps:date name="query.xlsj_s" dateFmt="yyyy-MM-dd" cssStyle="width:42%"></cps:date>至
							<cps:date name="query.xlsj_e" dateFmt="yyyy-MM-dd" cssStyle="width:42%"></cps:date>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>			
		</cps:panel>
	</cps:PanelView>
	
	<cps:tableGrid url="/afgl/zaxl/queryZaxlList.action" 
					title="治安巡逻列表"
					id="zaxlList" 
					autoload="false" 
					pageSize="10" 
					width="99.8%" 
					usepager="true" 
					searchform="zaxlSearch" 
					autothead="false" 
					mutilSelect="true">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column title="操作" field="cz" align="left" width="12%"></cps:column>
		<cps:column title="巡逻路线" field="xllx" align="left" width="15%" maxlength="100"></cps:column>
		<cps:column title="巡逻日期" field="xlsj" align="center" width="12%" maxlength="10"></cps:column>
		<cps:column title="巡逻社区" field="xlsqmc" align="left" width="15%"></cps:column>
		<cps:column title="巡逻情况" field="xlqk" align="left" maxlength="25"></cps:column>
	</cps:tableGrid>
</creator:view>
