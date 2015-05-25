<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view width="99.8%">
	<creator:Script src="/jsp/yjcj/js/yjcj.js"></creator:Script>
	<script type="text/javascript">
		function czrowback(tdObj,rowdata)
		{
			var html = "";
			html += "<span class=\"cps_span_href\" onclick=\"openXxfbWin('update','" + rowdata["xxid"] + "')\">修改<span>";
			return html;
		}
	</script>
	<form id="queryForm">
	</form>
	<creator:tbar id="opertbar">
		<cps:button value="新增" onclick="openXxfbWin('add')"></cps:button>
	</creator:tbar>
	<cps:tableGrid id="yjcjtablegrid" title="消息发布列表" tbarId="opertbar"
			url="/yjcj/queryXxfbBeansPageResult.action" 
			searchform="queryForm"
			mutilSelect="false"
			pageSize="10"
			autoload="true">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column field="title" title="消息内容" maxlength="20"></cps:column>
		<cps:column field="djrxm" title="发布人"></cps:column>
		<cps:column field="djdwmc" title="发布单位" maxlength="15"></cps:column>
		<cps:column field="djsj" title="发布时间" ></cps:column>
		<cps:column field="cz" title="操作" rowcallback="czrowback"></cps:column>
	</cps:tableGrid>
</creator:view>