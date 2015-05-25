<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="街路巷选择列表">
<creator:Script  src="/jsp/common/js/jlxselect.js"></creator:Script>
<creator:panel id="panel" tbarId="condition" title="街路巷查询条件">
	<form id="jlxSelectForm" method="post">
		<input type="hidden" name="jlxBean.citydm" value="${loginInfo.citydm}">
		<input type="hidden" name="jlxBean.countrydm" value="${jlxBean.countrydm}">
		<input type="hidden" name="jlxBean.jdxzdm" value="${loginInfo.jdxzdm}">
		<input type="hidden" name="jlxBean.djdwdm" value="${loginInfo.orgcode}">
		<cps:table>
			<cps:row id="clear_row">
				<cps:tdLabel width="30%"><s:radio id="checkbox" name="checkboxvalue"  list="%{#{'1':'全部','0':'已用'}}"  listKey="key" listValue="value"  value="0" />名称：</cps:tdLabel>
				<cps:tdContent width="50%">
					<cps:textfield id="mc" name="jlxBean.mc" onkeyup="queryList();"></cps:textfield>
				</cps:tdContent>
				<cps:tdContent>
					<cps:button value="查询" onclick="queryList();"></cps:button>	
				</cps:tdContent>
			</cps:row>
			<cps:row>
				 <cps:tdContent colspan="3">
					 <font color="red">说明：在街路巷查询条件中输入街路巷的首字母或中文名称拼音可以进行查询。在列表中双击要记录可以选择街路巷。</font>
				</cps:tdContent>
			</cps:row>
		</cps:table>
	</form>	
</creator:panel>
<cps:tableGrid id="commonDzjlxList" title="街路巷列表"
			   url="/cps/dzjlx/queryDZJlxInfoInStxx.action"
			   autoload="true"
			   width="99.8%"
			   dblclick="rowDblClickCallback"
			   searchform="jlxSelectForm"
			   mutilSelect="false">
	<cps:column isNumber="true" title="序号" ></cps:column>	
	<cps:column field="dm" title="代码" ></cps:column>
	<cps:column field="jc" title="简称" align="left" ></cps:column>
	<cps:column field="mc" title="全称" align="left" ></cps:column>
	<cps:column field="ssxzqhmc" title="行政区划" ></cps:column>
</cps:tableGrid>
</creator:view>

