<%@ page language="java"  pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<creator:view title="电动车列表">
	<!-- 电动车列表 -->
	<creator:box>
		<creator:Script src="/jsp/zagl/pages/ddccj/js/ddcList.js"></creator:Script>
		<creator:tbar id="op">
			<cps:button value="查询" type="button" onclick="query()"></cps:button>
			<cps:button value="电动车登记" onclick="openDdcInfoWin('add')" display="${displayAddBtn}"></cps:button>
			<cps:button value="导出" onclick="downloadDdcExcel()"></cps:button>
		</creator:tbar>
		<creator:panel id="cxtjpanel" title="查询条件" tbarId="op">
			<form id="ddccx">
				<cps:table>
				<input type="hidden" id="v_ddcid" name="v_ddcid"/> 
					<cps:row>
						<cps:tdLabel width="10%">市局：</cps:tdLabel>
						<cps:tdContent width="22%">
							<c:choose>
								<c:when test="${empty loginInfo.citygajgdm}">
									<s:select id="citygajgjgdm" list="cityGajgjgList"
										name="query.citygajgjgdm" listKey="dm" listValue="jc"
										headerKey="" headerValue="--请选择--" cssClass="cps-select"
										onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm')">
									</s:select>
								</c:when>
								<c:otherwise>
									<input type="hidden" name="query.citygajgjgdm" value="${query.citygajgjgdm}" />
									<s:select id="citygajgjgdm" list="cityGajgjgList"
										disabled="true" name="query.citygajgjgdm" listKey="dm"
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
										name="query.countrygajgjgdm" listKey="dm" listValue="jc"
										headerKey="" headerValue="--请选择--" cssClass="cps-select"
										onchange="doublePcsGajgjg(this.value,'pcsdm')"></s:select>
								</c:when>
								<c:otherwise>
									<input type="hidden" name="query.countrygajgjgdm" value="${query.countrygajgjgdm}" />
									<s:select id="countrygajgjgdm" list="countryGajgjgList"
										disabled="true" name="query.countrygajgjgdm" listKey="dm"
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
									<s:select id="pcsdm" list="pcsGajgjgList" name="query.pcsdm" onchange="doubleSelectJWS(this.value,'jwsselect')"
										listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--"
										cssClass="cps-select"></s:select>
								</c:when>
								<c:otherwise>
									<input type="hidden" name="query.pcsdm" value="${query.pcsdm}" />
									<s:select id="pcsdm" list="pcsGajgjgList" name="query.pcsdm"
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
										<s:select list="jwsqOrgList" id="jwsselect" name="query.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select"  ></s:select>
									</c:when>
									<c:otherwise>
										<s:hidden id="jwsqdm" name="query.jwsqdm"></s:hidden>
										<s:select list="jwsqOrgList" id="jwsselect" name="query.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select"  disabled="true"></s:select>
									</c:otherwise>
								</c:choose>
						</cps:tdContent>
						
						<cps:tdLabel>销售单位：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="query.xsdw"></cps:textfield>
						</cps:tdContent>
						
						<cps:tdLabel width="12%">品牌：</cps:tdLabel>
						<cps:tdContent width="21%">
								<cps:textfield name="query.pp"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					
					<cps:row>
						<cps:tdLabel width="12%">车架号：</cps:tdLabel>
						<cps:tdContent width="21%">
							<cps:textfield name="query.clsbh"></cps:textfield>
						</cps:tdContent>
						
						<cps:tdLabel>电机号：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="query.djh"></cps:textfield>
						</cps:tdContent>
						
						<cps:tdLabel>&nbsp;</cps:tdLabel>
						<cps:tdContent>&nbsp;</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>销售时间：</cps:tdLabel>
						<cps:tdContent colspan="5">
							<cps:date  dateFmt="yyyy-MM-dd" name="query.xssj_start" cssStyle="width:180px" maxDate="sysdate"  id="xssj_start"/> -
							<cps:date  dateFmt="yyyy-MM-dd" name="query.xssj_end" minDateDepend="xssj_start" cssStyle="width:180px" maxDate="sysdate"/>
						</cps:tdContent>
					</cps:row>	
				</cps:table>
			</form>
		</creator:panel>

		<cps:tableGrid url="/zagl/ddccj/queryDdcList.action" title="查询结果--(不勾选默认导出查询的全部记录)"
			id="ddcList" autoload="false" pageSize="10" width="99.8%"
			usepager="true" searchform="ddccx" autothead="false" mutilSelect="true">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column isCheckbox="true"></cps:column>
			<cps:column title="操作" field="cz" expand="false"  align="left" ></cps:column>
			<cps:column title="号牌号码" field="hphm" align="left"  maxlength="15"></cps:column>
			<cps:column title="电机号" field="djh" align="left"  maxlength="15"></cps:column>
			<cps:column title="销售单位" field="jxdmc" align="left" maxlength="10"></cps:column>
			<cps:column title="销售时间" field="xssj" align="center"></cps:column>
			<cps:column title="购买人" field="gmzxm" ></cps:column>
			<cps:column title="购买人身份证" field="gmzsfzh" align="left"></cps:column>
		</cps:tableGrid>
	</creator:box>
	
	<div style="display:none">
		<form id="exportform" target="exportiframe" method="post">
		</form>
		<iframe id="exportiframe" name="exportiframe" height="0" width="0"></iframe>
	</div>
</creator:view>

