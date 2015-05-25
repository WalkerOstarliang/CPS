<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
<creator:Script src="/jsp/afgl/pages/zaxl/js/zaxlxlsqgbselect.js"></creator:Script>
<script type="text/javascript" >
	
</script >
<creator:box>
		<form id="xldsqgbqueryform" >
			<input type="hidden" name="query.id" value="${query.id}">
		</form>
	<cps:tableGrid id="xlsqgbquerylist" title="社区干部列表"
				mutilSelect="false"
				url="/afgl/zaxl/queryXlsqgbPageResult.action" 
				autoload="true"
				searchform="xldsqgbqueryform" 
				dblclick="rowdblclick">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column isCheckbox="true"></cps:column>
		<cps:column field="gbxm" title="姓名"></cps:column>
		<cps:column field="gbsfzh" title="身份证号"></cps:column>
		<cps:column field="gblxdh" title="联系电话"></cps:column>
	</cps:tableGrid>
</creator:box>
</creator:view>