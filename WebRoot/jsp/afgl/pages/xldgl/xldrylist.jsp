<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
<creator:Script src="/jsp/afgl/js/xldrylist.js"></creator:Script>
<creator:box>
	<creator:tbar id="tbar">
		<cps:button value="查&nbsp;询" onclick="jxQueryXldxx()"></cps:button>
		<cps:button value="新&nbsp;增" onclick="openXldryInfoWin('add','${queryBean.xldlx}')"></cps:button>
		<%--<cps:button value="批量删除" onclick="batchDeleteXldr()"></cps:button>--%>
	</creator:tbar>
	<creator:panel id="xldycx" title="${queryBean.xldlx=='1' ? '专职巡逻队员管理' : '义务巡逻队员管理'}" tbarId="tbar">
		<form id="xldqueryform">
			<s:hidden id="xldlx" name="queryBean.xldlx"></s:hidden>
			<cps:table>
			
						<cps:row>
					<cps:tdLabel width="10%">市局：</cps:tdLabel>
					<cps:tdContent width="25%">
						<s:select id="citygajgjgdm" list="cityGajgjgList"  name="queryBean.citygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm',jxQueryXldxx)"></s:select>
					</cps:tdContent>
					<cps:tdLabel width="10%">县区局：</cps:tdLabel>
					<cps:tdContent width="25%">
						<s:select id="countrygajgjgdm" list="countryGajgjgList"  name="queryBean.countrygajgjgdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="doublePcsGajgjg(this.value,'pcsdm',jxQueryXldxx)"></s:select>
					</cps:tdContent>
					<cps:tdLabel width="10%">派出所：</cps:tdLabel>
					<cps:tdContent width="25%">
						<s:select id="pcsdm" list="pcsGajgjgList"  name="queryBean.pcsdm" listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--" cssClass="cps-select" onchange="jxQueryXldxx()"></s:select>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>巡逻队名称：</cps:tdLabel>
					<cps:tdContent>
						<input type="hidden" id="xldbh" name="queryBean.xldbh"/>
						<cps:textfield id="xldmc" name="queryBean.xldmc" ondblclick="openXldSelectWin('${queryBean.xldlx}')"></cps:textfield>
						<cps:button value="选择" onclick="openXldSelectWin('${queryBean.xldlx}')"></cps:button>
					</cps:tdContent>
					<cps:tdLabel>身份证号：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="xldysfzh" name="queryBean.xldysfzh"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel>巡逻队员姓名：</cps:tdLabel>
					<cps:tdContent>
						<cps:textfield id="xldyxm" name="queryBean.xldyxm"></cps:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>上岗时间：</cps:tdLabel>
					<cps:tdContent>
						<cps:date id="sgrqstart" name="queryBean.sgrqstart" cssStyle="width:32%;"></cps:date>
						-
						<cps:date id="sgrqend" name="queryBean.sgrqend"  cssStyle="width:32%;"></cps:date>
					</cps:tdContent>
					<cps:tdLabel>在岗状态：</cps:tdLabel>
					<cps:tdContent colspan="3">
						<cps:select id="zgzt" name="queryBean.zgzt" zdlb="AF_ZGZT" headerKey="" headerValue="--请选择--" onchange="jxQueryXldxx()" cssClass="cps-input" cssStyle="width:32%;"></cps:select>
					</cps:tdContent>
				</cps:row>
				
			</cps:table>
		</form>
	</creator:panel>
	
	
	<cps:tableGrid id="xldyquerylist" 
				mutilSelect="true"
				url="/afgl/xldxx/queryXldryxxList.action" 
				searchform="xldqueryform">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column isCheckbox="true"></cps:column>
		<cps:column field="xldyxm" title="姓名"></cps:column>
		<cps:column field="xldmc" title="巡逻队"></cps:column>
		<cps:column field="xldysfzh" title="身份证号"></cps:column>
		<cps:column field="xldyxbmc" title="性别"></cps:column>
		<cps:column field="sgrq" title="上岗时间"></cps:column>
		<cps:column field="cz" title="操作" rowcallback="rowCallback"></cps:column>
	</cps:tableGrid>
</creator:box>
</creator:view>