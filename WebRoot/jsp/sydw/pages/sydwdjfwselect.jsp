<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view width="99.5%" title="实有单位登记之房屋地址选择页面">
	<creator:Script src="/jsp/zagl/js/dwfwselect.js"></creator:Script>
	<creator:Script src="/jsp/sydw/js/sydwdjfwselect.js"></creator:Script>
	<form id="queryForm">
		<cps:PanelView>
			<cps:tbar>
				<cps:button value="查询" onclick="queryList()"></cps:button>
				<cps:button value="重置" type="reset"></cps:button>
				<cps:button value="返回" onclick="history.go(-1)"></cps:button>
			</cps:tbar>
			<cps:panel id="fwquerypanel" title="实有单位登记之房屋地址选择">
				<s:hidden id="dwmc" name="queryBean.dwmc"></s:hidden>
				<input type="hidden" name="queryBean.fwzxbs" value="0"/>
				<cps:table>
					<cps:row>
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
						<cps:tdContent colspan="4" align="right">
							&nbsp;
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdContent colspan="6">
							<font color="red">
								说明：实有单位登记房屋地址选择，选择一个房屋地址后，点击“新增单位”按钮，进行单位登记
							</font>
						</cps:tdContent>
					</cps:row>
				</cps:table>
				<creator:tbar id="selecttbar">
					<cps:button value="添加房屋" onclick="openFwInfo('add','','')"></cps:button>
					<cps:button value="新增单位" onclick="clickNewDwBtn()"></cps:button>
				</creator:tbar>
				<cps:tableGrid id="fwtablegrid" title="房屋选择列表" tbarId="selecttbar"
						url="/lsgl/fw/queryFwPageResult.action"
						searchform="queryForm" 
						mutilSelect="false" 
						width="99.8%" 
						autoload="false">
					<cps:column isNumber="true" title="序号"></cps:column>
					<cps:column isCheckbox="true"></cps:column>
					<cps:column field="dzmc" title="房屋地址" align="left"></cps:column>
					<cps:column field="hzxm" title="房主姓名"></cps:column>
					<cps:column field="hzsfzh" title="房主身份证号"></cps:column>
				</cps:tableGrid>
			</cps:panel>
		</cps:PanelView>
	</form>
</creator:view>