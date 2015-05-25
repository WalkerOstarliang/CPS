<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view width="99.8%">
	<creator:Script src="/jsp/lsgl/js/rklist.js"></creator:Script>
	<creator:box>
	<form id="queryForm">
	<creator:tbar id="fwtooltbar">
		<cps:button value="查询" onclick="queryList();"></cps:button>
		<cps:button value="新增实有人口" onclick="openSelectFwWin(true,'')"></cps:button>
		<cps:button value="新增境外人口" onclick="openSelectFwWin(true,'4')"></cps:button>
	</creator:tbar>
	<creator:panel id="fwquerypanel" title="实有人口查询" tbarId="fwtooltbar">
			<input type="hidden" name="operType" value="select">
			<input type="hidden" name="modename" value="实有人口">
			<cps:table>
				<cps:row>
					<cps:tdLabel>市局：</cps:tdLabel>
					<cps:tdContent>
						<s:select id="citygajgjgdm" list="cityGajgjgList"  name="queryBean.citygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm',queryList)"></s:select>
					</cps:tdContent>
					<cps:tdLabel>县区局：</cps:tdLabel>
					<cps:tdContent>
						<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm',queryList)"></s:select>
					</cps:tdContent>
					<cps:tdLabel>派出所：</cps:tdLabel>
					<cps:tdContent>
						<s:select id="pcsdm" list="pcsGajgjgList"  name="queryBean.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="queryList()"></s:select>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel width="10%">人员类别：</cps:tdLabel>
					<cps:tdContent >
						<cps:select zdlb="ZDY_RYLB" name="queryBean.rylb" value="${queryBean.rylb}" headerKey="" headerValue="--请选择--" onchange="changeRylb(this.value)"></cps:select>
					</cps:tdContent>
					<cps:tdLabel width="10%">身份证号：</cps:tdLabel>
					<cps:tdContent width="25%">
						 <cps:textfield id="sfzh" name="queryBean.sfzh" isSfzh="true"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="10%">姓名：</cps:tdLabel>
					<cps:tdContent width="25%">
						 <cps:textfield id="xm" name="queryBean.xm"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row id="jwrkquerycondition">
					<cps:tdLabel width="10%">国籍：</cps:tdLabel>
					<cps:tdContent >
						 <cps:select zdlb="GB_GJ" id="gj" name="queryBean.gj" value="${queryBean.rylb}"  headerKey="" headerValue="--请选择--" onchange="queryList()"></cps:select>
					</cps:tdContent>
					<cps:tdLabel width="10%">证件种类：</cps:tdLabel>
					<cps:tdContent width="25%">
						 <cps:textfield id="zjzl" name="queryBean.zjzl"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="10%">证件号码：</cps:tdLabel>
					<cps:tdContent width="25%">
						 <cps:textfield id="zjhm" name="queryBean.zjhm"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				
			</cps:table>
		</creator:panel>
	</form>
	
	<cps:tableGrid id="rktablegrid"  
			url="/lsgl/rk/queryRkPageResultInfo.action" 
			searchform="queryForm" dblclick="rkSelect"
			mutilSelect="false"
			autoload="true">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column field="rylbms" title="人员类别"></cps:column>
		<cps:column field="gjms" title="国籍"></cps:column>
		<cps:column field="xm" title="姓名" maxlength="15"></cps:column>
		<cps:column field="ywm" title="英文名" maxlength="15"></cps:column>
		<cps:column field="sfzh" title="身份证号"></cps:column>
		<cps:column field="xbms" title="性别"></cps:column>
		<cps:column field="csrq" title="出生日期"></cps:column>
		<cps:column field="hjdqhmc" title="户籍地区划"></cps:column>
		<cps:column field="hjdxz" title="户籍地详址" maxlength="15"></cps:column>
	</cps:tableGrid>
	</creator:box>
</creator:view>