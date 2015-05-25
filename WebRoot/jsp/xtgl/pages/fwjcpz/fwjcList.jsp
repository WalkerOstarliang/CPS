<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:Script src="/jsp/xtgl/js/fwjcpz.js"></creator:Script>

	<creator:box>
		<creator:tbar id="op">
			<cps:button value="查询" onclick="queryList()"></cps:button>
			<cps:button value="新增" id="add" onclick="openFwjcWin('add','')"></cps:button>
    		<cps:button value="批量删除" id="del" onclick="del()"></cps:button>
		</creator:tbar>
		
		<creator:panel id="search" title="查询条件" tbarId="op">
			<form id="fwjcpzQueryForm">
				<cps:table>
					<cps:row>
						<cps:tdLabel width="10%">房屋重点类别：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:select name="queryBean.fwzdlb" headerKey=""
								headerValue="--请选择--" zdlb="ZDY_FWZDGLLB" cssStyle="width:96%;"
								id="fwzdlb" onchange="queryList()" />
						</cps:tdContent>
						<cps:tdLabel width="10%">检查周期：</cps:tdLabel>
						<cps:tdContent width="30%">
							<cps:textfield name="queryBean.jczq" cssStyle="width:43%" />
							天
						</cps:tdContent>
						<cps:tdLabel>&nbsp;</cps:tdLabel>
						<cps:tdContent>&nbsp;</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
		
		<cps:tableGrid url="/xtgl/fwjcpz/queryFwjcpzListPageInfo.action"
			 id="queryFwjcpzList" autoload="true" title="" width="99.8%"
			pageSize="20" usepager="true" searchform="fwjcpzQueryForm"
			mutilSelect="true">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column isCheckbox="true"></cps:column>
			<cps:column title="操作" rowcallback="fwjcpzCallback"  ></cps:column>
			<cps:column title="房屋重点类别" field="fwzdlbms"></cps:column>
			<cps:column title="检查周期(天)" field="jczq"></cps:column>
			<cps:column title="提前检查天数(天)" field="tqtxts"></cps:column>
			<cps:column title="登记人" field="djrxm"></cps:column>
			<cps:column title="登记单位" field="djdwdm"></cps:column>
			<cps:column title="登记日期" field="djrq"></cps:column>
		</cps:tableGrid>
	</creator:box>
</creator:view>
