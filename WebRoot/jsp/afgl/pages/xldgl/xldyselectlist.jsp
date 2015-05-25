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
		<cps:button value="确&nbsp;定" onclick="xldyresultSelectedRowData()"></cps:button>
	</creator:tbar>
	<creator:panel id="xldycx" title="巡逻队员管理" tbarId="tbar">
		<form id="xldqueryform">
			<cps:table>
				<cps:row>
					<cps:tdLabel width="10%">巡逻队名称：</cps:tdLabel>
					<cps:tdContent width="25%">
						<input type="hidden" id="xldbh" name="queryBean.xldbh" value="${queryBean.xldbh }"/>
						<cps:textfield id="xldmc" name="queryBean.xldmc" value="${queryBean.xldmc}" readonly="true"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="10%">身份证号：</cps:tdLabel>
					<cps:tdContent width="25%">
						<cps:textfield id="xldysfzh" name="queryBean.xldysfzh"></cps:textfield>
					</cps:tdContent>
					<cps:tdLabel width="10%">巡逻队员姓名：</cps:tdLabel>
					<cps:tdContent width="25%">
						<cps:textfield id="xldyxm" name="queryBean.xldyxm"></cps:textfield>
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
	</cps:tableGrid>
</creator:box>
</creator:view>