<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view width="99.8%">
<creator:Script src="/jsp/lsgl/js/zdryzkdjtj.js"></creator:Script>
	<creator:tbar id="fwtooltbar">
	<!-- queryList(); -->
		<cps:button value="统计" onclick="queryList()"></cps:button>
		<cps:button value="导出" onclick="downloadExcel()"></cps:button>
	</creator:tbar>
	<creator:panel id="fwquerypanel" title="重点人员在控登记统计分析" tbarId="fwtooltbar">
		<form id="queryForm"   method="post" target="exportiframe" style="">
			<input type="hidden" name="operType" value="select" />
			<cps:table>
				<cps:row>				    
					<cps:tdLabel>市局：</cps:tdLabel>
					<cps:tdContent>
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
					<cps:tdLabel>县区局：</cps:tdLabel>
					<cps:tdContent>
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
					
					<cps:tdLabel>派出所：</cps:tdLabel>
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
					<cps:tdLabel width="10%">社区：</cps:tdLabel>
						<cps:tdContent>
							<s:select id="sqdm" list="sqJbxxList"  name="queryBean.sqdm" listKey="sqbh" listValue="jc" headerKey="" headerValue=" " cssClass="cps-select" ></s:select>
					</cps:tdContent>
					<cps:tdLabel width="10%">对象类别：</cps:tdLabel>
					<cps:tdContent >
						<cps:select zdlb="GA_ZDRYLBDM" name="queryBean.dxlb" parentDm="dl" headerKey="" headerValue="--请选择--"  id="dxlb" ></cps:select>
					</cps:tdContent>
				</cps:row>		
				<cps:row>
					<cps:tdLabel width="5%">统计时间：</cps:tdLabel>
					<cps:tdContent>	
						<cps:date   dateFmt="yyyy-MM-dd" cssStyle="width:38%" id="dJdateStart" name="queryBean.djdateStart" value="${queryBean.djdateStart}"></cps:date>	
						-
						<cps:date dateFmt="yyyy-MM-dd" cssStyle="width:38%" id="dJdateEnd" name="queryBean.djdateEnd" defaultSystemDate="true"></cps:date>				
					</cps:tdContent>
					<cps:tdLabel width="10%">姓名：</cps:tdLabel>
					<cps:tdContent width="25%">
						 <cps:textfield id="zdryxm" name="queryBean.zdryxm"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="10%">身份证号：</cps:tdLabel>
					<cps:tdContent width="25%">
						 <cps:textfield id="zdrysfzh" name="queryBean.zdrysfzh" isSfzh="true"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="10%"><b>统计分类：</b></cps:tdLabel>
					<cps:tdContent width="25%" colspan="5">
						<input id="tjjbfxj" type="radio" name="queryBean.tjjb"  value="1" />&nbsp<b>分县局</b>&nbsp&nbsp
		    			<input id="tjjbpcs" type="radio" name="queryBean.tjjb"   value="2"/>&nbsp<b>派出所</b>&nbsp&nbsp
		    			<input id="tjjbjwq" type="radio" name="queryBean.tjjb"   value="3" checked="checked"/>&nbsp<b>警务区</b>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</form>
	</creator:panel>
		<cps:tableGrid  url="/lsgl/zdryzkdjtj/queryZdryZkdjTjListPage.action" title="在控登记情况"
			id="zdryzkdjtjList" autoload="false" pageSize="700" width="99.8%" isAsynch="true"
			usepager="true" searchform="queryForm" autothead="false" mutilSelect="false">
			<cps:column isNumber="true" title="序号"></cps:column>
			
			<cps:column field="zdryzrdwmc" title="责任单位" align="left" maxlength="23" width="25%"></cps:column>
			<cps:column field="zdrysl"   title="重点人员数" align="center"></cps:column>
			<cps:column field="zkdjs" title="在控登记数" align="center"></cps:column>
			<cps:column field="zkdjzks" title="在控数" align="center"></cps:column>
			<cps:column field="zkdjsks" title="失控数" align="center"></cps:column>
			<cps:column field="zkdjlv" title="登记率" maxlength="10" align="center"></cps:column>
			<cps:column field="zkdjzklv" title="在控率" maxlength="10" align="center"></cps:column>
		</cps:tableGrid>
	
	<iframe id="exportiframe" name="exportiframe" height="0" width="0"></iframe>
</creator:view>