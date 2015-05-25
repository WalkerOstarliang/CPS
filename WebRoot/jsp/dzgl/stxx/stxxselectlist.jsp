<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:Script src="/jsp/dzgl/js/dzxx.js"></creator:Script>
	<creator:tbar id="rwtbar">
		<cps:button value="查&nbsp;询" onclick="clickQuery();"></cps:button> 
		<cps:button value="重&nbsp;置" type="reset"></cps:button>
	</creator:tbar>
	<creator:box>
		<form method="post" id="searchform">
		<input type="hidden" id="executequery" value="false">
		<creator:panel id="stxxquerypanel" title="实体查询" tbarId="rwtbar">
				<cps:table>
					<cps:row>
						<%--
						<cps:tdLabel width="10%">市：</cps:tdLabel>
						<cps:tdContent width="22%">
							<cps:select id="citydm" 
										list="${cityXzqhList}" 
										name="queryBean.citydm" 
										value="${queryBean.citydm}" 
										listKey="dm" 
										disabled="${queryBean.citydisabled}" 
										listValue="mc" 
										hideValue="true"
										headerKey="" headerValue=" " 
										onchange="doubleSelectCountry(this.value,'countrydm',queryTableGrid);return false;">
							</cps:select>
						</cps:tdContent>
						<cps:tdLabel width="10%">县/区：</cps:tdLabel>
						<cps:tdContent width="22%">
							 <cps:select id="countrydm" 
							 			list="${countryXzqhList}" 
							 			name="queryBean.countrydm" 
							 			value="${queryBean.countrydm}" 
							 			hideValue="true" 
							 			disabled="${queryBean.countrydisabled}" 
							 			listKey="dm" 
							 			listValue="mc" 
							 			headerKey="" 
							 			headerValue=" " 
							 			onchange="doubleSelectJdxz(this.value,'jdxzdm')">
							 </cps:select>
						</cps:tdContent>
						<cps:tdLabel width="10%">街道/乡镇：</cps:tdLabel>
						<cps:tdContent>
							 <cps:select id="jdxzdm" 
							 			list="${xzjdqhList}"  
							 			name="queryBean.jdxzdm" 
							 			value="${queryBean.jdxzdm}" 
							 			listKey="dm" 
							 			listValue="jc" 
							 			headerKey="" 
							 			headerValue=" " 
							 			onchange="doubleSelectSqByJdxzdm(this.value,'sqdm')" >
							 </cps:select>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%">社区/村：</cps:tdLabel>
						<cps:tdContent width="22%">
							 <cps:select id="sqdm" 
							 			list="${sqJbxxList}"  
							 			name="queryBean.sqdm" 
							 			value="${queryBean.sqdm}" 
							 			listKey="sqbh" 
							 			listValue="jc" 
							 			headerKey="" 
							 			headerValue=" ">
							 </cps:select>
						</cps:tdContent>
						--%>
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
						<cps:tdLabel>社区：</cps:tdLabel>
							<cps:tdContent>
								<s:select id="sqdm" list="sqJbxxList"  name="queryBean.sqdm" listKey="sqbh" listValue="jc" headerKey="" headerValue=" " cssClass="cps-select"></s:select>
						</cps:tdContent>
						<cps:tdLabel width="10%">街路巷：</cps:tdLabel>
						<cps:tdContent width="22%">
							 <input type="hidden" id="jlxdm" name="queryBean.jlxdm"/>
							 <cps:textfield id="jlxmc" readonly="true" appendPopuBtn="true" onclick="openJlxSelect(setSelectJlxValue)"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					 
					<cps:row>
						<cps:tdLabel>门牌号：</cps:tdLabel>
						<cps:tdContent>
							 <cps:textfield id="mph" name="queryBean.mph"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>小区(组)：</cps:tdLabel>
						<cps:tdContent>
							  <cps:textfield id="xqz" name="queryBean.xqz"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>楼栋详址：</cps:tdLabel>
						<cps:tdContent>
							 <cps:textfield id="ldxz" name="queryBean.ldxz"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>实体名称：</cps:tdLabel>
						<cps:tdContent>
							 <cps:textfield id="stmc" name="queryBean.stmc"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>是否标注：</cps:tdLabel>
						<cps:tdContent>
							<s:select id="sfbz" list="#{'1':'是','0' : '否'}" name="queryBean.sfbz" cssClass="cps-select" headerKey="" headerValue=" "/>
						</cps:tdContent>
						<cps:tdLabel >注销标识：</cps:tdLabel>
						<cps:tdContent>
							 <cps:select zdlb="ZDY_STXX_ZXBS" id="zxbs" name="queryBean.zxbs" headerKey="" headerValue=" " value="1"></cps:select>
						</cps:tdContent>
					</cps:row>
				</cps:table>
		</creator:panel>
		</form>
		<cps:tableGrid url="/dzgl/dzxx/queryStxxBeansPageResult.action" title="实体列表"
							id="datagridList"
							autoload="true"
							mutilSelect="false"
							click="clickResultRowData"
							searchform="searchform" 
							width="99.8%">
			<cps:column isNumber="true" title="序号" ></cps:column>
			<cps:column field="stmc" title="实体名称" align="left" maxlength="10"></cps:column>
			<cps:column field="xzqhmc" title="行政区划" align="left"></cps:column>
			<cps:column field="jdxzmc" title="乡镇街道" align="left"></cps:column>
			<cps:column field="sqmc" title="社区村" align="left"></cps:column>
			<cps:column field="jlxmc" title="街路巷" align="left"></cps:column>
			<cps:column field="mph" title="门牌号" align="left"></cps:column>
			<cps:column field="xqz" title="小区组" align="left" maxlength="10"></cps:column>
			<cps:column field="ldxz" title="楼栋详址" align="left" maxlength="10"></cps:column>
		</cps:tableGrid>
	</creator:box>
</creator:view>