<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%-- 派出所宣传活动列表 --%>
<creator:view>
	<creator:box>
		<creator:Script src="/jsp/gzgl/js/pcsxchdlist.js"></creator:Script>
		<cps:PanelView>
			<cps:tbar>
				<cps:button value="新增" display="${displayAddBtn}" onclick="openPcsXcHdInfoWin('','add')"></cps:button>
				<cps:button value="查询" onclick="pcsXcHdQuery()"></cps:button>
			</cps:tbar>
			<cps:panel title="查询条件">
				<form id="queryForm">
					<cps:table>
						<cps:row>
							<cps:tdLabel width="10%">市局：</cps:tdLabel>
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
							<cps:tdLabel width="10%">活动开展时间：</cps:tdLabel>
								<cps:tdContent colspan="3">
									<cps:date dateFmt="yyyy-MM-dd" name="query.hdsj_start" id="starttime" maxDateDepend="endtime" cssStyle="width:30%"/>&nbsp;至
									<cps:date dateFmt="yyyy-MM-dd" name="query.hdsj_end" id="endtime" maxDate="sysdate" minDateDepend="starttime" cssStyle="width:30%"/>
							</cps:tdContent>
						</cps:row>	
					</cps:table>
				</form>
			</cps:panel>
		</cps:PanelView>
		<cps:tableGrid
			url="/gzgl/pcsxchd/queryPcsXcHdList.action" 
			title="派出所宣传活动"
			id="pcsxchdList" 
			autoload="false" 
			pageSize="10" 
			width="99.8%" 
			usepager="true" 
			searchform="queryForm" 
			autothead="false" 
			mutilSelect="true">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column isCheckbox="true" expand="false"></cps:column>
			<cps:column title="操作" align="center" field="cz" width="15%"></cps:column>
			<cps:column title="活动类型" field="hdlxmc" align="left"></cps:column>
			<cps:column title="开展民警" field="hdkzmjxm" align="left"></cps:column>
			<cps:column title="活动时间" field="hdsj"></cps:column>
			<cps:column title="活动地址" field="hdxz" align="left"></cps:column>
		</cps:tableGrid>
	</creator:box>
</creator:view>