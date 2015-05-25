<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view width="99.8%">
<creator:Script src="/jsp/lsgl/js/zdrylist.js"></creator:Script>
<creator:Script src="/jsp/lsgl/js/zdryinfo.js"></creator:Script>
<creator:box>
	<cps:PanelView>
	<cps:tbar>
		<cps:button value="查询" onclick="queryBtnQueryList()"></cps:button>
		<cps:button value="在控登记" onclick="zdryZkdj()" display="${displayAddBtn}"></cps:button>
		<cps:button value="导出" onclick="downloadExcel()"></cps:button>
	</cps:tbar>
	<cps:panel id="fwquerypanel" title="重点人员查询" >
		<form id="queryForm" target="exportiframe">
			<input type="hidden" name="operType" value="select" />
			<input type="hidden" name="modename" value="重点人员" />
			<input type="hidden" name="queryBean.gzdxbh" id="gzdxbh" />
			
			<cps:table>
				<cps:row>
					<cps:tdLabel width="12%">市局：</cps:tdLabel>
					<cps:tdContent width="22%">
						<c:choose>
							<c:when test="${empty loginInfo.citygajgdm}">
								<s:select id="citygajgjgdm" list="cityGajgjgList"  name="queryBean.citygajgjgdm"  listKey="dm" listValue="jc" headerKey="" headerValue=" " cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm')"></s:select>
							</c:when>
							<c:otherwise>
								<s:hidden name="queryBean.citygajgjgdm"></s:hidden>
								<s:select id="citygajgjgdm" list="cityGajgjgList"  name="queryBean.citygajgjgdm"  listKey="dm" listValue="jc" headerKey="" headerValue=" " cssClass="cps-select" disabled="true"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					
					<cps:tdLabel width="12%">县区局：</cps:tdLabel>
					<cps:tdContent width="22%">
						<c:choose>
							<c:when test="${empty loginInfo.countrygajgdm}">
								<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue=" " cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm')"></s:select>
							</c:when>
							<c:otherwise>
								<s:hidden name="queryBean.countrygajgjgdm"></s:hidden>
								<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue=" " cssClass="cps-select" disabled="true"></s:select>
							</c:otherwise>
						</c:choose>
					</cps:tdContent>
					
					<cps:tdLabel width="12%">派出所：</cps:tdLabel>
					<cps:tdContent>
						<c:choose>
							<c:when test="${empty loginInfo.pcsdm}">
								<s:select id="pcsdm" list="pcsGajgjgList"  name="queryBean.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue=" " cssClass="cps-select" onchange="doubleSelectJWS(this.value,'jwsselect')"></s:select>
							</c:when>
							<c:otherwise>
								<s:hidden name="queryBean.pcsdm"></s:hidden>
								<s:select id="pcsdm" list="pcsGajgjgList"  name="queryBean.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue=" " cssClass="cps-select" disabled="true"></s:select>
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
					
					<cps:tdLabel >对象类别：</cps:tdLabel>
					<cps:tdContent >
						<cps:select zdlb="GA_ZDRYLBDM" name="queryBean.dxlb" parentDm="dl" headerKey="" headerValue=" "  id="dxlb" ></cps:select>
					</cps:tdContent>
				</cps:row>		
				
				<cps:row>
					<cps:tdLabel>姓名：</cps:tdLabel>
					<cps:tdContent>
						 <cps:textfield id="xm" name="queryBean.xm"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel >身份证号：</cps:tdLabel>
					<cps:tdContent>
						 <cps:textfield id="sfzh" name="queryBean.sfzh" isSfzh="true"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>在控登记：</cps:tdLabel>
					<cps:tdContent>
						<s:select list="#{'0':'未在控登记','1':'已在控登记','2':'本月未做在控登记'}" name="queryBean.zkdj" headerKey="" headerValue="" cssClass="cps-select"/>
					</cps:tdContent>
				</cps:row>
				
				<cps:row>
					<cps:tdLabel>在控登记时间：</cps:tdLabel>
					<cps:tdContent>
						<cps:date id="minDate" name="queryBean.zkdjsjStart" cssStyle="width:37%" dateFmt="yyyy-MM" maxDateDepend="maxDate" maxDate="sysdate"></cps:date> -
						<cps:date id="maxDate" name="queryBean.zkdjsjEnd" cssStyle="width:37%" dateFmt="yyyy-MM" minDateDepend="minDate" maxDate="sysdate"></cps:date>
					</cps:tdContent>
					
					<cps:tdLabel>在控状态：</cps:tdLabel>
					<cps:tdContent>
						<cps:select name="queryBean.zkzt" zdlb="ZDRY_ZKZT" headerKey="" headerValue=" " />
					</cps:tdContent>
					<c:choose>
						<c:when test="${loginInfo.leve == 5}">
							<cps:tdLabel>托管状态：</cps:tdLabel>
							<cps:tdContent>
								<s:select list="#{'0':'未托管','1':'未接管','2':'退回托管','3':'已托管'}" name="queryBean.tgzt" headerKey="" headerValue=" " cssClass="cps-select"/>
							</cps:tdContent>
						</c:when>
						<c:otherwise>
							<cps:tdLabel>是否退回：</cps:tdLabel>
							<cps:tdContent>
								<s:select list="#{'0':'否','1':'是'}" name="queryBean.sfth" headerKey="" headerValue=" " cssClass="cps-select"/>
							</cps:tdContent>
						</c:otherwise>
					</c:choose>
				</cps:row>
				
				<c:if test="${loginInfo.leve != 5}">
						<cps:row>
							<cps:tdLabel>是否派发：</cps:tdLabel>
							<cps:tdContent>
								<s:select list="#{'0':'否','1':'是'}" name="queryBean.sfpf" headerKey="" headerValue=" " cssClass="cps-select"/>
							</cps:tdContent>
							
							<cps:tdLabel>&nbsp;</cps:tdLabel>
							<cps:tdContent>&nbsp;</cps:tdContent>
							
							<cps:tdLabel>&nbsp;</cps:tdLabel>
							<cps:tdContent>&nbsp;</cps:tdContent>
						</cps:row>
				</c:if>
			</cps:table>
		</form>
		</cps:panel>
	</cps:PanelView>
	<cps:tableGrid id="zdrylist"  
			url="/lsgl/zdry/queryZdryListPage.action" 
			searchform="queryForm"
			mutilSelect="false"
			autoload="false"
			title = "重点人员"
			pageSize="10">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column isCheckbox="true" expand="false"></cps:column>
		<cps:column field="cz" title="操作" align="left"></cps:column>
		<cps:column field="zdrylbbjmc" title="对象类别" align="left" maxlength="8"></cps:column>
		<cps:column field="xm"   title="姓名" maxlength="15" align="left"></cps:column>
		<cps:column field="sfzh" title="身份证号"></cps:column>
		<cps:column field="xbms" title="性别" align="left"></cps:column>
		<cps:column field="hjdxz" title="户籍地详址" maxlength="10" align="left"></cps:column>
		<cps:column field="xzzxz" title="现住址详址" maxlength="10" align="left"></cps:column>
		<c:if test="${loginInfo.leve != 5}">
			<cps:column field="sfth" title="是否退回"></cps:column>
			<cps:column field="sfpf" title="是否派发" ></cps:column>
		</c:if>
		<c:if test="${loginInfo.leve == 5}">
			<cps:column field="sftg" title="是否托管"></cps:column>
		</c:if>
	</cps:tableGrid>
	
	<iframe id="exportiframe" name="exportiframe" height="0" width="0"></iframe>
</creator:box>
</creator:view>