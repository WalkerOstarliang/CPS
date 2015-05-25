<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view width="99.8%">
	<creator:box>
		<creator:Script src="/jsp/lsgl/js/zdrylist.js"></creator:Script>
		<creator:Script src="/jsp/lsgl/js/zdryinfo.js"></creator:Script>
		<creator:tbar id="fwtooltbar">
			<%--
			<cps:button value="重点对象登记" onclick="openZdryInfo('add')"></cps:button>
			--%>
			<cps:button value="查询" onclick="queryList();"></cps:button>
		</creator:tbar>
		<creator:panel id="fwquerypanel" title="重点人员查询" tbarId="fwtooltbar">
			<form id="queryForm">
				<input type="hidden" name="operType" value="select">
				<input type="hidden" name="modename" value="重点人员">
				
				<input type="hidden" name="queryBean.xzzqh" value="${loginInfo.orgcode}">
				<input type="hidden" name="queryBean.sspcsdm" value="${loginInfo.orgcode}">
				<input type="hidden" name="queryBean.gxdwdm" value="${loginInfo.orgcode}">
				<cps:table>
						<cps:row>
						<cps:tdLabel>市局：</cps:tdLabel>
						<cps:tdContent>
								<c:choose>
								<c:when test="${empty loginInfo.citygajgdm}">
									<s:select id="citygajgjgdm" list="cityGajgjgList"  name="queryBean.citygajgjgdm"  listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm',queryList)"></s:select>
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
									<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm',queryList)"></s:select>
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
										<s:select id="pcsdm" list="pcsGajgjgList"  name="queryBean.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="queryList()"></s:select>
								</c:when>
								<c:otherwise>
										<s:hidden name="queryBean.pcsdm"></s:hidden>
										<s:select id="pcsdm" list="pcsGajgjgList"  name="queryBean.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" disabled="true"></s:select>
								</c:otherwise>
								</c:choose>
						
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%">对象类别：</cps:tdLabel>
						<cps:tdContent >
							<cps:select zdlb="ZDDXLB" name="queryBean.dxlb" value="${queryBean.dxlb}" headerKey="" headerValue="--请选择--"  id="dxlb"  onchange="queryList()" ></cps:select>
						</cps:tdContent>
						<cps:tdLabel width="10%">身份证号：</cps:tdLabel>
						<cps:tdContent width="25%">
							 <cps:textfield id="sfzh" name="queryBean.sfzh"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="10%">姓名：</cps:tdLabel>
						<cps:tdContent width="25%">
							 <cps:textfield id="xm" name="queryBean.xm"></cps:textfield>
						</cps:tdContent>
					</cps:row>
				</cps:table>
				</form>
			</creator:panel>
		
		<cps:tableGrid id="zdrylist"  
				url="/lsgl/zdry/queryWrlZdryListPage.action" 
				searchform="queryForm"
				mutilSelect="false"
				autoload="false"
				title = "未认领重点人员"
				pageSize="10">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column field="cz"   title="操作"  align="left"></cps:column>
			<cps:column field="zdrylbbjmc" title="重点人员类别" align="left" maxlength="8"></cps:column>
			<cps:column field="xm"   title="姓名" maxlength="15"></cps:column>
			<cps:column field="sfzh" title="身份证号"></cps:column>
			<cps:column field="xbms" title="性别"></cps:column>
			<cps:column field="csrq" title="出生日期"></cps:column>
			<cps:column field="hjdxz" title="户籍地详址" maxlength="10"></cps:column>
			<cps:column field="xzzxz" title="现住址详址"  maxlength="10"></cps:column>
		</cps:tableGrid>
	</creator:box>
</creator:view>