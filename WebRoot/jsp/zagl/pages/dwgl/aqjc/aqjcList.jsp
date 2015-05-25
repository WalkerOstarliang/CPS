<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:Script src="/jsp/zagl/js/aqjclist.js"></creator:Script>
	<creator:tbar id="op">
		<cps:button value="查询" onclick="queryAqjcList()"></cps:button>
		<cps:button value="安全检查登记" onclick="clickAqjcdjBtn()"></cps:button>
		<cps:button value="导出" onclick="downloadAqjcExcel()"></cps:button>
	</creator:tbar>
	<creator:panel id="queryPanel" title="查询条件" tbarId="op">
		<form id="queryForm" method="post">
			<cps:table>
				<cps:row>
					<cps:tdLabel width="10%">市局：</cps:tdLabel>
					<cps:tdContent width="22%">
						<c:choose>
							<c:when test="${empty loginInfo.citygajgdm}">
								<s:select id="citygajgjgdm" list="cityGajgjgList"
									name="dwcx.citygajgjgdm" listKey="dm" listValue="jc"
									headerKey="" headerValue=" " cssClass="cps-select"
									onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm')">
								</s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="dwcx.citygajgjgdm"
									value="${dwcx.citygajgjgdm}" />
								<s:select id="citygajgjgdm" list="cityGajgjgList"
									disabled="true" name="dwcx.citygajgjgdm" listKey="dm"
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
									name="dwcx.countrygajgjgdm" listKey="dm" listValue="jc"
									headerKey="" headerValue=" " cssClass="cps-select"
									onchange="doublePcsGajgjg(this.value,'pcsdm')"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="dwcx.countrygajgjgdm"
									value="${dwcx.countrygajgjgdm}" />
								<s:select id="countrygajgjgdm" list="countryGajgjgList"
									disabled="true" name="dwcx.countrygajgjgdm" listKey="dm"
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
								<s:select id="pcsdm" list="pcsGajgjgList" name="dwcx.pcsdm"
									onchange="doubleSelectJWS(this.value,'jwsselect')" listKey="dm"
									listValue="jc" headerKey="" headerValue=" "
									cssClass="cps-select"></s:select>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="dwcx.pcsdm" value="${dwcx.pcsdm}" />
								<s:select id="pcsdm" list="pcsGajgjgList" name="dwcx.pcsdm"
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
								<s:select list="jwsqOrgList" id="jwsselect" name="dwcx.jwsqdm"
									listKey="orgcode" listValue="orgjc" headerKey=""
									headerValue=" " cssClass="cps-select"
									onchange="doubleSelectSqxxByJwsdm(this.value,'sqdm')"></s:select>
							</c:when>
							<c:otherwise>
								<s:hidden id="jwsqdm" name="dwcx.jwsqdm"></s:hidden>
								<s:select list="jwsqOrgList" id="jwsselect" name="dwcx.jwsqdm"
									listKey="orgcode" listValue="orgjc" headerKey=""
									headerValue=" " cssClass="cps-select" disabled="true"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					<cps:tdLabel>机构编号：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield name="dwcx.jgbh"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>单位名称：</cps:tdLabel>
					<cps:tdContent colspan="3">
						<cps:textfield name="dwcx.dwmc"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>单位属性：</cps:tdLabel>
					<cps:tdContent>
						<cps:select zdlb="ZDY_HYLB" name="dwcx.hylb" headerValue=" " headerKey=""/>
					</cps:tdContent>
					<cps:tdLabel>检查日期：</cps:tdLabel>
					<cps:tdContent>
						<cps:date id="starttime" dateFmt="yyyy-MM-dd" name="dwcx.starttime" maxDateDepend="endtime" cssStyle="width:35%"></cps:date>&nbsp;至&nbsp;
						<cps:date id="endtime" dateFmt="yyyy-MM-dd" name="dwcx.endtime" minDateDepend="starttime" maxDate="sysdate" cssStyle="width:35%"></cps:date>
					</cps:tdContent>
					<cps:tdLabel>&nbsp;</cps:tdLabel>
					<cps:tdContent>&nbsp;</cps:tdContent>
				</cps:row>
			</cps:table>
		</form>
	</creator:panel>
	<cps:tableGrid url="/zagl/dw/queryAqjcList.action"
			title="单位检查列表" 
			id="aqjcList" 
			autoload="false" 
			pageSize="10"
			width="99.8%" 
			usepager="true" 
			searchform="queryForm" 
			autothead="false"
			mutilSelect="false">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column isCheckbox="true" expand="false"></cps:column>
		<cps:column title="操作" align="center" rowcallback="czop"></cps:column>
		<cps:column title="机构编号" field="jgbh" align="left" width="200"></cps:column>
		<cps:column title="单位名称" field="dwmc" align="left" maxlength="15"></cps:column>
		<cps:column title="检查人员" field="jcryxm" align="left" maxlength="8"></cps:column>
		<cps:column title="检查时间" field="jcsj" align="center"></cps:column>
		<cps:column title="检查内容" field="jcnr" align="left" maxlength="15"></cps:column>
	</cps:tableGrid>
	
	<div style="display: none">
		<iframe id="exportiframe" name="exportiframe" height="0" width="0"></iframe>
	</div>
</creator:view>

