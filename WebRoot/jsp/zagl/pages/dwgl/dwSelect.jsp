<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view width="99.5%" title="单位选择">
	<creator:Script src="/jsp/zagl/js/dwSelect.js"></creator:Script>
		<creator:tbar id="querytbar">
			<cps:button value="查询" onclick="dwcx()"></cps:button>
			<cps:button value="从业人员登记" onclick="toCyryDwQueryPage()"></cps:button>
			<cps:button value="返回" onclick="history.go(-1)"></cps:button>
		</creator:tbar>
		<creator:panel id="fwquerypanel" title="单位查询条件" tbarId="querytbar">
			<input type="hidden" id="isdblclick" name="${isdblclick }" value="${isdblclick}">
			<form id="dwcx">
				<input type="hidden" name="dwcx.zxbs" value="0">
				<cps:table>
					<cps:row>
						<cps:tdLabel width="10%">市局：</cps:tdLabel>
						<cps:tdContent width="22%">
							<c:choose>
								<c:when test="${empty loginInfo.citygajgdm}">
									<s:select id="citygajgjgdm" list="cityGajgjgList"
										name="dwcx.citygajgjgdm" listKey="dm" listValue="jc"
										headerKey="" headerValue="--请选择--" cssClass="cps-select"
										onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm')">
									</s:select>
								</c:when>
								<c:otherwise>
									<input type="hidden" name="dwcx.citygajgjgdm" value="${dwcx.citygajgjgdm}" />
									<s:select id="citygajgjgdm" list="cityGajgjgList"
										disabled="true" name="dwcx.citygajgjgdm" listKey="dm"
										listValue="jc" headerKey="" headerValue="--请选择--"
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
										headerKey="" headerValue="--请选择--" cssClass="cps-select"
										onchange="doublePcsGajgjg(this.value,'pcsdm')"></s:select>
								</c:when>
								<c:otherwise>
									<input type="hidden" name="dwcx.countrygajgjgdm" value="${dwcx.countrygajgjgdm}" />
									<s:select id="countrygajgjgdm" list="countryGajgjgList"
										disabled="true" name="dwcx.countrygajgjgdm" listKey="dm"
										listValue="jc" headerKey="" headerValue="--请选择--"
										cssClass="cps-select"
										onchange="doublePcsGajgjg(this.value,'pcsdm')"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="11%">派出所：</cps:tdLabel>
						<cps:tdContent>
							<c:choose>
								<c:when test="${empty loginInfo.pcsdm}">
									<s:select id="pcsdm" list="pcsGajgjgList" name="dwcx.pcsdm" onchange="doubleSelectJWS(this.value,'jwsselect')"
										listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--"
										cssClass="cps-select"></s:select>
								</c:when>
								<c:otherwise>
									<input type="hidden" name="dwcx.pcsdm" value="${dwcx.pcsdm}" />
									<s:select id="pcsdm" list="pcsGajgjgList" name="dwcx.pcsdm"
										disabled="true" listKey="dm" listValue="jc" headerKey=""
										headerValue="--请选择--" cssClass="cps-select"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					
					<cps:row>
						<cps:tdLabel>警务区：</cps:tdLabel>
						<cps:tdContent>
								<c:choose>
									<c:when test="${empty loginInfo.jwsqdm}">
										<s:select list="jwsqOrgList" id="jwsselect" name="dwcx.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select" onchange="doubleSelectSqxxByJwsdm(this.value,'sqdm')" ></s:select>
									</c:when>
									<c:otherwise>
										<s:hidden id="jwsqdm" name="dwcx.jwsqdm"></s:hidden>
										<s:select list="jwsqOrgList" id="jwsselect" name="dwcx.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select"  disabled="true"></s:select>
									</c:otherwise>
								</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%">社区：</cps:tdLabel>
							<cps:tdContent>
								<s:select id="sqdm" list="sqJbxxList"  name="dwcx.sqdm" listKey="sqbh" listValue="jc" headerKey="" headerValue=" " cssClass="cps-select"></s:select>
						</cps:tdContent>
						<cps:tdLabel>实体名称：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="dwcx.stmc"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>行业类别：</cps:tdLabel>
						<cps:tdContent>
							<cps:select headerValue=" " headerKey="" zdlb="ZDY_HYLB" name="dwcx.hylb" />
						</cps:tdContent>
						<cps:tdLabel>单位名称：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="dwcx.dwmc"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>法人代表：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="dwcx.frdb"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdContent colspan="6">
							<font color="red">注意：从业人员登记之单位选择</font>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
		
		<cps:tableGrid url="/zagl/dw/queryDwjbxxPageResultInfoByJgbh.action" 
			title="单位列表"
			id="cxjgList" autoload="false" pageSize="10" width="99.8%"
			usepager="true" searchform="dwcx" autothead="false" 
			dblclick="dblclickSetResult"
			mutilSelect="false">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column isCheckbox="true" expand="false"></cps:column>
			<cps:column title="操作" field="cz" rowcallback="dwSelectCzRowCallback"></cps:column>
			<cps:column title="单位名称" field="dwmc" align="left"></cps:column>
			<cps:column title="行业类别" field="hylbmc"></cps:column>
			<cps:column title="法人代表" field="frdb"></cps:column>
			<cps:column title="法人身份证" field="frsfzhm"></cps:column>
			<cps:column title="地址" field="dwdz"></cps:column>
			<cps:column title="注销标识" field="zxbsmc"></cps:column>
		</cps:tableGrid>
</creator:view>