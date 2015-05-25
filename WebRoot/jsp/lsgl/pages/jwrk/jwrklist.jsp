<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view width="99.8%">
	<creator:box>
	<creator:Script src="/jsp/lsgl/js/jwrklist.js"></creator:Script>
	<form id="queryForm">
		<cps:PanelView>
			<cps:tbar>
				<cps:button value="查询" onclick="queryList()"></cps:button>
				<cps:button value="重置" onclick="reset()"></cps:button>
				<cps:button value="境外人口登记" onclick="toJwrkSelectFwWin(true,'4')" display="${displayAddBtn}"></cps:button>
				<cps:button value="打印" onclick="ldrkExportWord()"></cps:button>
			</cps:tbar>
			<cps:panel id="fwquerypanel" title="境外人员查询" >
				<cps:table>
					<cps:row>
						<cps:tdLabel  width="10%">市局：</cps:tdLabel>
						<cps:tdContent  width="22%">
								<c:choose>
								<c:when test="${empty loginInfo.citygajgdm}">
									<s:select id="citygajgjgdm" list="cityGajgjgList"  name="queryBean.citygajgjgdm"  listKey="dm" listValue="jc" headerKey="" headerValue="" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm')"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden name="queryBean.citygajgjgdm"></s:hidden>
									<s:select id="citygajgjgdm" list="cityGajgjgList"  name="queryBean.citygajgjgdm"  listKey="dm" listValue="jc" headerKey="" headerValue="" cssClass="cps-select" disabled="true"></s:select>
								</c:otherwise>
								</c:choose>
						</cps:tdContent>
						<cps:tdLabel  width="10%">县区局：</cps:tdLabel>
						<cps:tdContent  width="22%">
							<c:choose>
								<c:when test="${empty loginInfo.countrygajgdm}">
									<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm')"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden name="queryBean.countrygajgjgdm"></s:hidden>
									<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="" cssClass="cps-select" disabled="true"></s:select>
								</c:otherwise>
								</c:choose>
						</cps:tdContent>
						<cps:tdLabel   width="10%">派出所：</cps:tdLabel>
						<cps:tdContent>
							<c:choose>
								<c:when test="${empty loginInfo.pcsdm}">
										<s:select id="pcsdm" list="pcsGajgjgList"  name="queryBean.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="" cssClass="cps-select" onchange="doubleSelectJWS(this.value,'jwsselect')"></s:select>
								</c:when>
								<c:otherwise>
										<s:hidden name="queryBean.pcsdm"></s:hidden>
										<s:select id="pcsdm" list="pcsGajgjgList"  name="queryBean.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="" cssClass="cps-select" disabled="true"></s:select>
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
					 	<cps:tdLabel>国籍：</cps:tdLabel>
						<cps:tdContent>
							<cps:select zdlb="GB_GJ" id="gj" name="queryBean.gj" value="" headerKey="" headerValue=" "></cps:select>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>证件种类：</cps:tdLabel>
						<cps:tdContent >
							 <cps:select zdlb="GB_ZJZL"  id="zjzl" name="queryBean.zjzl" value="" headerKey="" headerValue=" "></cps:select>
						</cps:tdContent>
						<cps:tdLabel>证件号码：</cps:tdLabel>
						<cps:tdContent>
							 <cps:textfield id="zjhm" name="queryBean.zjhm" ></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel >性别：</cps:tdLabel>
						<cps:tdContent >
							 <cps:select zdlb="GB_XB" id="xb" name="queryBean.xb" value=""  headerKey="" headerValue=" "></cps:select>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>英文姓：</cps:tdLabel>
						<cps:tdContent >
							<cps:textfield id="ywx" name="queryBean.ywx"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>英文名：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield id="ywm" name="queryBean.ywm"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>登记时间：</cps:tdLabel>
						<cps:tdContent>
							<cps:date id="djsj_start" cssStyle="width:37%" name="queryBean.djsj_start" maxDate="${currentSystemDate}" dateFmt="yyyy-MM-dd" value="${queryBean.djsj_start}"></cps:date>
							-
							<cps:date id="djsj_end"   cssStyle="width:37%" minDateDepend="djsj_start" name="queryBean.djsj_end" maxDate="${currentSystemDate}" dateFmt="yyyy-MM-dd" value="${queryBean.djsj_end}"></cps:date>
						</cps:tdContent>
					</cps:row>
					
					<cps:row>
						<cps:tdLabel>实体名称：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield id="stmc" name="queryBean.stmc" ></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel >街路巷：</cps:tdLabel>
						<cps:tdContent>
							 <input type="hidden" id="jlxdm" name="queryBean.jlxdm"/>
							 <cps:textfield id="jlxmc" readonly="true" appendPopuBtn="true" onclick="openJlxSelect(setSelectJlxValue)"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>门牌号：</cps:tdLabel>
						<cps:tdContent>
							 <cps:textfield id="mph" name="queryBean.mph"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>小区(组)：</cps:tdLabel>
						<cps:tdContent>
							  <cps:textfield id="xqz" name="queryBean.xqz"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>楼栋详址：</cps:tdLabel>
						<cps:tdContent>
							 <cps:textfield id="ldxz" name="queryBean.ldxz"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>单元号：</cps:tdLabel>
						<cps:tdContent>
							 <cps:select id="dyh" zdlb="ZDY_DYH" name="queryBean.dyh" headerKey="" headerValue=" " onchange="queryTableGrid()"></cps:select>
						</cps:tdContent>
					</cps:row>
					 <cps:row>
						<cps:tdLabel>楼层号：</cps:tdLabel>
						<cps:tdContent>
							 <cps:textfield id="lch" name="queryBean.lch"   maxlength="10"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>房间号：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield id="fjh" name="queryBean.fjh"  maxlength="10"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>附属地址：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield id="fsdz" name="queryBean.fsdz"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel >注销标识：</cps:tdLabel>
						<cps:tdContent>
							 <cps:select zdlb="ZDY_ZXBS" id="zxbs" name="queryBean.zxbs" headerKey="" headerValue=" " value="0"></cps:select>
						</cps:tdContent>
						<cps:tdContent colspan="2">
							&nbsp;
						</cps:tdContent>
						<cps:tdContent colspan="2">
							&nbsp;
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</cps:panel>
			</cps:PanelView>
		</form>
		<cps:tableGrid id="rktablegrid"  
				title="境外人员列表"
				url="/lsgl/jwrk/queryJwrkPageResultInfo.action" 
				searchform="queryForm"
				mutilSelect="true"
				autoload="false"
				width="99.8%">
				<cps:column isNumber="true" title="序号"></cps:column>
				<cps:column isCheckbox="true"></cps:column>
				<cps:column field="cz" title="操作" align="center"></cps:column>
				<cps:column field="gjms" title="国籍" ></cps:column>
				<cps:column field="ywx" title="英文姓" maxlength="5"></cps:column>
				<cps:column field="ywm" title="英文名" maxlength="5"></cps:column>
				<cps:column field="zjzlms" title="证件种类" ></cps:column>
				<cps:column field="zjhm" title="证件号码" maxlength="7"></cps:column>
				<cps:column field="xbms" title="性别"></cps:column>
				<cps:column field="csrq" title="出生日期"></cps:column>
				<cps:column field="xzzxz" title="现住地" align="left" maxlength="8"></cps:column>
				<cps:column field="lxdh" title="联系电话" maxlength="7"></cps:column>
				<cps:column field="zxbsms" title="注销状态"></cps:column>	
		</cps:tableGrid>
	</creator:box>
</creator:view>