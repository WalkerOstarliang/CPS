<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="巡逻队信息高级查询">
	<creator:Script src="/jsp/afgl/js/xldgjquery.js"></creator:Script>
	<creator:panel id="xldgjquery" title="高级查询">
		<form id="xldgjqueryform">
			<cps:table>
				<cps:row>
					<cps:tdLabel width="15%">巡逻队名称：</cps:tdLabel>
					<cps:tdContent width="35%">
						<s:textfield id="xldmc" name="queryBean.xldmc" cssClass="cps-input"></s:textfield>
					</cps:tdContent>
					<cps:tdLabel width="15%">分管单位领导：</cps:tdLabel>
					<cps:tdContent>
						<s:textfield id="ssdwfgld" name="queryBean.ssdwfgld" cssClass="cps-input"></s:textfield>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdLabel>责任人：</cps:tdLabel>
					<cps:tdContent>
						<s:textfield id="xldzrrxm" name="queryBean.xldzrrxm" cssClass="cps-input"></s:textfield>
					</cps:tdContent>
					
					<cps:tdLabel>组建日期：</cps:tdLabel>
					<cps:tdContent>
						<cps:date id="zjrqstart" name="queryBean.zjrqstart" cssStyle="width:32%"></cps:date>
						-
						<cps:date id="zjrqend" name="queryBean.zjrqend" cssStyle="width:32%"></cps:date>
					</cps:tdContent>
					
				</cps:row>
				<cps:row>
					<cps:tdLabel>注销标识：</cps:tdLabel>
					<cps:tdContent>
						<cps:select id="cxbs" name="queryBean.cxbs" zdlb="AF_CXBS" headerKey="" headerValue="--请选择--" cssClass="cps-input"></cps:select>
					</cps:tdContent>
					<cps:tdLabel>注销日期：</cps:tdLabel>
					<cps:tdContent>
						<cps:date id="cxrqstart" name="queryBean.cxrqstart" cssStyle="width:32%"></cps:date>
						-
						<cps:date id="cxrqend" name="queryBean.cxrqend" cssStyle="width:32%"></cps:date>
					</cps:tdContent>
				</cps:row>
				<cps:row>
					<cps:tdContent colspan="4" align="center">
						<cps:button value="确&nbsp;定" onclick="resultGjqueryCondition()"></cps:button>
						<cps:button value="关&nbsp;闭" onclick="$.closeWindow()"></cps:button>
					</cps:tdContent>
				</cps:row>
			</cps:table>
		</form>
	</creator:panel>
</creator:view>