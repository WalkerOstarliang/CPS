<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view width="99.5%">
	<creator:Script src="/jsp/lsgl/js/fwlist.js"></creator:Script>
	<creator:box>
		<creator:tbar id="fwtooltbar">
			<cps:button value="查询" onclick="queryList();"></cps:button>
		</creator:tbar>
		<creator:panel id="fwquerypanel" title="房屋查询条件" tbarId="fwtooltbar">
			<form id="queryForm">
				<input type="hidden" name="operType" value="select">
				<input type="hidden" name="modename" value="实有房屋">
				<cps:table>
					<%--
					<cps:row>
						<cps:tdLabel width="10%">市：</cps:tdLabel>
						<cps:tdContent width="25%">
							<s:select id="sjxzqh" list="cityXzqhList" name="queryBean.sjxzqh" listKey="dm" listValue="mc" headerKey="" headerValue="--请选择--" onchange="doubleSelectCountry(this.value,'xjxzqh',queryList);return false;" cssClass="cps-select"></s:select>
						</cps:tdContent>
						<cps:tdLabel width="10%">县/区：</cps:tdLabel>
						<cps:tdContent width="25%">
							<s:select id="xjxzqh" list="countryXzqhList" name="queryBean.xjxzqh" listKey="dm" listValue="mc" headerKey="" headerValue="--请选择--" onchange="doubleSelectJdxz(this.value,'jdxzdm',queryList)" cssClass="cps-select"></s:select>
						</cps:tdContent>
						<cps:tdLabel width="10%">街道/乡镇：</cps:tdLabel>
						<cps:tdContent>
							<s:select id="jdxzdm" list="xzjdqhList" name="queryBean.jdxzdm" listKey="dm" listValue="mc" headerKey="" headerValue="--请选择--" onchange="doubleSelectSqByJdxzdm(this.value,'sqdm',queryList)" cssClass="cps-select"></s:select>
						</cps:tdContent>
					</cps:row>
					--%>
					<cps:row>
					<cps:tdLabel width="10%">市局：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.citygajgdm}">
								<s:select id="citygajgjgdm" list="cityGajgjgList"  name="queryBean.citygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm',queryList)"></s:select>
							</c:when>
							<c:otherwise>
								<s:select id="citygajgjgdm" list="cityGajgjgList"  name="queryBean.citygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm',queryList)" disabled="true"></s:select>
							</c:otherwise>
							</c:choose>
						
					</cps:tdContent>
					<cps:tdLabel width="10%">县区局：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.countrygajgdm}">
								<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm',queryList)"></s:select>
							</c:when>
							<c:otherwise>
								<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm',queryList)" disabled="true"></s:select>
							</c:otherwise>
							</c:choose>
						
					</cps:tdContent>
					<cps:tdLabel width="10%">派出所：</cps:tdLabel>
					<cps:tdContent width="25%">
						<c:choose>
							<c:when test="${empty loginInfo.pcsdm}">
								<s:select id="pcsdm" list="pcsGajgjgList"  name="queryBean.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="queryList()"></s:select>
							</c:when>
							<c:otherwise>
								<s:select id="pcsdm" list="pcsGajgjgList"  name="queryBean.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="queryList()" disabled="true"></s:select>
							</c:otherwise>
							</c:choose>
						
					</cps:tdContent>
				</cps:row>
					<cps:row>
						<cps:tdLabel>产权人姓名：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="queryBean.cqrxm"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>身份证号：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="queryBean.cqrsfzh"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>&nbsp;</cps:tdLabel>
						<cps:tdContent>
							&nbsp;
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>房主姓名：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="queryBean.hzxm"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>房主身份证号：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="queryBean.hzsfzh"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>出租屋：</cps:tdLabel>
						<cps:tdContent>
							<cps:select zdlb="ZDY_ZDSF" id="sfczw" name="queryBean.sfczw" value="${queryBean.sfczw}" headerKey="" headerValue="--请选择--" onchange="queryList()"></cps:select>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
		
		<cps:tableGrid id="fwtablegrid"  title="出租房屋列表"
				url="/lsgl/fw/queryFwPageResult.action" 
				searchform="queryForm"	
				width="99.6%"
				mutilSelect="false"
				autoload="true"
				pageSize="20">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column field="fwxc" title="操作" align="left"></cps:column>
			<cps:column field="hzxm" title="房主姓名"></cps:column>
			<cps:column field="hzsfzh" title="房主身份证号"></cps:column>
			<cps:column field="sfczwms" title="是否出租屋"></cps:column>
			<cps:column field="fwmc" title="房屋地址" align="left" maxlength="15"></cps:column>
			<cps:column field="djsj" title="登记时间"></cps:column>
		</cps:tableGrid>
	</creator:box>
</creator:view>