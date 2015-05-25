<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<creator:view>
	<creator:Script src="/jsp/zagl/js/wyxq/wyxq.js"></creator:Script>
	<cps:PanelView>
		<cps:tbar id="dwlisttbar">
			<cps:button value="查询" onclick="queryWyxq()"></cps:button>
			<cps:button value="重置" type="reset"></cps:button>
			<cps:button value="新增" onclick="openWyxqWin(null,'add','${wyxq.ywwygs}')"></cps:button>
		</cps:tbar>
		<cps:panel id="cxpanel" title="查询条件">
			<form id="wyxqcx">
				<cps:table>
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
										<s:select list="jwsqOrgList" id="jwsselect" name="query.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select" onchange="doubleSelectSqxxByJwsdm(this.value,'sqdm')" ></s:select>
									</c:when>
									<c:otherwise>
										<s:hidden id="jwsqdm" name="query.jwsqdm"></s:hidden>
										<s:select list="jwsqOrgList" id="jwsselect" name="query.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select"  disabled="true"></s:select>
									</c:otherwise>
								</c:choose>
						</cps:tdContent>
						
						<cps:tdLabel width="10%">社区：</cps:tdLabel>
						<cps:tdContent>
							<s:select id="sqdm" list="sqJbxxList"  name="query.sqdm" listKey="sqbh" listValue="jc" headerKey="" headerValue=" " cssClass="cps-select"></s:select>
						</cps:tdContent>
						
						<cps:tdLabel>小区(组)名称：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="query.xqmc"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					
					<cps:row>
						<cps:tdLabel>登记时间：</cps:tdLabel>
							<cps:tdContent colspan="">
								<cps:date id="djsjstart" dateFmt="yyyy-MM-dd" name="query.djsjstart" cssStyle="width:39%" maxDate="${currentSystemDate}"/> -
								<cps:date id="djsjend" dateFmt="yyyy-MM-dd" name="query.djsjend" minDateDepend="djsjstart" cssStyle="width:39%" maxDate="${currentSystemDate}"/>
							</cps:tdContent>
							<cps:tdLabel>是否注销：</cps:tdLabel>
						<cps:tdContent>
							<cps:select id="zxbs" name="query.zxbs" zdlb="ZDY_ZXBS" headerKey="" headerValue=" " value="0" ></cps:select>
						</cps:tdContent>
						
						<cps:tdLabel>是否物业小区：</cps:tdLabel>
						<cps:tdContent>
							<c:choose>
								<c:when test="${wyxq.ywwygs =='1'}">
									<input type="hidden" id="ywwygs" name="query.ywwygs" value="${wyxq.ywwygs}">
									<s:select name="wyxq.ywwygs"  list="#{'0':'否','1':'是'}" cssClass="cps-select" disabled="true"></s:select>
								</c:when>
								<c:otherwise>
									<s:select name="query.ywwygs" id="ywwygs" list="#{'0':'否','1':'是'}" cssClass="cps-select" headerKey="" headerValue=""></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>	
				</cps:table>
			</form>
		</cps:panel>
	</cps:PanelView>

	<cps:tableGrid url="/zagl/wyxq/queryWyxqList.action" title="物业小区列表"
		id="wyxqList" autoload="false" pageSize="10" width="99.8%"
		usepager="true" searchform="query" autothead="false" mutilSelect="true">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column title="操作" field="cz" expand="false"  align="left" ></cps:column>
		<cps:column title="小区(组)名称" field="xqmc" align="left" maxlength="10" ></cps:column>
		<cps:column title="小区地址" field="dzmc" align="left" maxlength="12"></cps:column>
		<cps:column title="所在社区" field="sssqmc" maxlength="12" align="left" ></cps:column>
		<cps:column title="登记时间" field="djsj" align="center"></cps:column>
		<cps:column title="注销标识" field="zxbsmc" align="left" ></cps:column>
	</cps:tableGrid>
</creator:view>

