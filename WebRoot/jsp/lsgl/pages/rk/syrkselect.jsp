<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="实有人口查询">
	<creator:Script src="/jsp/lsgl/js/syrkselect.js"></creator:Script>
	<form id="queryForm">
		<input type="hidden" id="czselect" value="false">
		<input type="hidden" id="fwid" value="${queryBean.fwid }">
		<creator:tbar id="syrktbar">
			<cps:button value="查询" onclick="queryTableGrid()"></cps:button>
			<cps:button value="新增" onclick="openNewRkInfoPage()"></cps:button>
			<cps:button value="选定" onclick="openSelectedRkInfoPage()"></cps:button>
		</creator:tbar>
		 <creator:panel id="syrkselectpanel" title="实有人口查询" width="99.8%" tbarId="syrktbar">
		 	<cps:table>
		 		<cps:row id="rylb_other">
		 			<cps:tdLabel width="10%">身份证号码：</cps:tdLabel>
		 			<cps:tdContent colspan="5" >
		 				<cps:textfield id="sfzh" name="queryBean.sfzh" isSfzh="true" required="true" cssStyle="width:30%"></cps:textfield>
		 			</cps:tdContent>
		 		</cps:row>
		 	</cps:table>
		 </creator:panel>
	 </form>
	<div id="syrkdiv">
		<cps:tableGrid id="syrktablegrid"  
						url="/lsgl/rk/queryRkJbxxBySfzh.action" 
						searchform="queryForm"
						autoload="false"
						width="99.8%"
						usepager="false"
						click="rowCallbackRkJbxx"
						mutilSelect="false">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column isCheckbox="true"></cps:column>
			<cps:column field="rylbms" title="人员类别"></cps:column>
			<cps:column field="xm" title="姓名" maxlength="15"></cps:column>
			<cps:column field="sfzh" title="身份证号"></cps:column>
			<cps:column field="xbms" title="性别"></cps:column>
			<cps:column field="csrq" title="出生日期"></cps:column>
			<cps:column field="hjdqhmc" title="户籍地区划"></cps:column>
			<cps:column field="hjdxz" title="户籍地详址" maxlength="10"></cps:column>
		</cps:tableGrid>
	</div>
	<div id="rkjbxxdiv" style="display: none;">
		<%@include file="/jsp/lsgl/pages/rk/rkjbxx.jsp" %>
	</div>
</creator:view>
