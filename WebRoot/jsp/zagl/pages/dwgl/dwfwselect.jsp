<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view width="99.5%" title="地址选择窗口">
	<!-- 单位地址选择 -->
	<creator:Script src="/jsp/zagl/js/dwfwselect.js"></creator:Script>
	<form id="queryForm">
	<creator:tbar id="querytbar">
		<cps:button value="查询" onclick="queryList()"></cps:button>
		<cps:button value="重置" type="reset"></cps:button>
		<cps:button value="新增房屋" onclick="openFwInfo('add','','')"></cps:button>
		<c:if test="${dwfwzt eq 'add'}">
			<cps:button value="单位登记" onclick="addDw('${hylb}')"></cps:button>
		</c:if>
	</creator:tbar>
	<creator:panel id="fwquerypanel" title="房屋查询条件" tbarId="querytbar">
			<s:hidden id="czType" name="queryBean.czType"></s:hidden>
			<cps:table>
				<cps:row>
					<%--
					<s:if test="dwfwzt == 'select'">
					<cps:tdLabel width="10%">市：</cps:tdLabel>
					<cps:tdContent width="22%">
						<cps:select id="citydm" 
									list="${cityXzqhList}" 
									name="queryBean.citydm" 
									value="${queryBean.citydm}" 
									listKey="dm" 
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
						 			listKey="dm" 
						 			listValue="mc" 
						 			headerKey="" 
						 			headerValue=" " 
						 			onchange="doubleSelectJdxz(this.value,'jdxzdm',queryTableGrid)">
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
						 			onchange="doubleSelectSqByJdxzdm(this.value,'sqdm',queryTableGrid)" >
						 </cps:select>
					</cps:tdContent>
					</s:if>
					<s:else>
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
						 			onchange="doubleSelectJdxz(this.value,'jdxzdm',queryTableGrid)">
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
						 			onchange="doubleSelectSqByJdxzdm(this.value,'sqdm',queryTableGrid)" >
						 </cps:select>
					</cps:tdContent>
					
					</s:else>
					
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
						 			headerValue=" " 
						 			onchange="queryTableGrid()" >
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
					<cps:tdLabel>单元号：</cps:tdLabel>
					<cps:tdContent>
						 <cps:select id="dyh" zdlb="ZDY_DYH" name="queryBean.dyh" headerKey="" headerValue=" " onchange="queryTableGrid()"></cps:select>
					</cps:tdContent>
					<cps:tdLabel>楼层号：</cps:tdLabel>
					<cps:tdContent>
						  <cps:textfield id="lch" name="queryBean.lch"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>房间号：</cps:tdLabel>
					<cps:tdContent>
						 <cps:textfield id="fjh" name="queryBean.fjh"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="10%">实体名称：</cps:tdLabel>
					<cps:tdContent>
						 <cps:textfield id="stmc" name="queryBean.stmc" onblur="queryTableGrid()"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>&nbsp;</cps:tdLabel>
					<cps:tdContent>
						&nbsp;
					</cps:tdContent>
					<cps:tdLabel>&nbsp;</cps:tdLabel>
					<cps:tdContent>
						&nbsp;
					</cps:tdContent>
				</cps:row>
			</cps:table>
	</creator:panel>
	</form>
	<cps:tableGrid id="fwtablegrid" title="房屋列表"
			url="/lsgl/fw/queryFwPageResult.action"
			searchform="queryForm" 
			dblclick="rowdblClickReturn"
			mutilSelect="false" 
			width="99.8%" 
			autoload="false">
		<cps:column isNumber="true" title="序号"></cps:column>
		<c:if test="${dwfwzt eq 'add'}">
			<cps:column isCheckbox="true"></cps:column>
		</c:if>
		<cps:column field="dzmc" title="房屋地址" align="left"></cps:column>
		<cps:column field="hzxm" title="房主姓名"></cps:column>
		<cps:column field="hzsfzh" title="房主身份证号"></cps:column>
	</cps:tableGrid>
</creator:view>