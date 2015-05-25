<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:Script src="/jsp/xtgl/js/dwjcMain.js"></creator:Script>

	<creator:box>
		<creator:tbar id="op">
			<cps:button value="查询" onclick="searchInfo()"></cps:button>
			<cps:button value="新增" id="add" onclick="openEditWin('add')"></cps:button>
    		<cps:button value="批量删除" id="del" onclick="del()"></cps:button>
		</creator:tbar>
		
		<creator:panel id="search" title="查询条件" tbarId="op">
			<form id="dwjczQuery">
				<cps:table>
					<cps:row>
						<cps:tdLabel width="10%">行业类别<font color="red">*</font>：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:select name="dwjcpzQuery.hylb" headerKey=""
								headerValue="--请选择--" zdlb="ZDY_HYLB" cssStyle="width:96%;"
								id="hylb" onchange="hylbChange()" />
						</cps:tdContent>
						<cps:tdLabel id="tdLabel" width="10%">单位分类：</cps:tdLabel>
						<cps:tdContent id="tdContent" width="20%">
							<cps:doubleSelect zdlb="" id="dwdl" name="dwjcpzQuery.dwdl" parentdm="0"
								doubleSelectId="dwxl" cssStyle="width:47%" headerKey=""
								headerValue="--请选择--"></cps:doubleSelect>
							<cps:doubleSelect zdlb="" id="dwxl" name="dwjcpzQuery.dwxl"
								dependSelectId="dwdl" cssStyle="width:47%" headerKey=""
								headerValue="--请选择--"></cps:doubleSelect>
						</cps:tdContent>

						<cps:tdLabel width="10%">检查周期：</cps:tdLabel>
						<cps:tdContent width="30%">
							<cps:textfield name="dwjcpzQuery.sz" cssStyle="width:43%" />
							<cps:select name="dwjcpzQuery.dw" zdlb="ZAGL_JCZQDW" headerKey=""
								headerValue="--请选择--" cssStyle="width:43%" />
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
		
		<cps:tableGrid url="${contextPath}/xtgl/dwjcpz/queryDwjcpzList.action"
			 id="queryResultList" autoload="true" title="" width="99.8%"
			pageSize="20" usepager="true" searchform="dwjczQuery"
			autothead="true" mutilSelect="true">
			<cps:column isCheckbox="true"></cps:column>
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column title="操作" rowcallback="dwjcpzCallback" expand="false"></cps:column>
			<cps:column title="行业类别" field="hylbmc"></cps:column>
			<cps:column title="单位大类" field="dwdlmc"></cps:column>
			<cps:column title="单位细类" field="dwxlmc"></cps:column>
			<cps:column title="检查周期" field="showJczq"></cps:column>
			<cps:column title="登记人" field="djrxm"></cps:column>
			<cps:column title="登记日期" field="djrq"></cps:column>
		</cps:tableGrid>
	</creator:box>
</creator:view>
