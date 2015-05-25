<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
<creator:Script src="/jsp/zagl/pages/dwgl/detail/js/wxwpdw_detail.js"></creator:Script>
	<cps:table>
		<cps:row>
			<cps:tdLabel width="12%"><font color="red">*</font>货物类别：</cps:tdLabel>
			<cps:tdContent width="25%">
				${dw.wxwpdwBean.hwlbmc}&nbsp;
			</cps:tdContent>
			<cps:tdLabel width="12%"><font color="red">*</font>单位分类：</cps:tdLabel>
			<cps:tdContent colspan="3">
				<input type="hidden" value="${dw.wxwpdwBean.dwfl}" id="dwfl" /> 
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel>生产地址：</cps:tdLabel>
			<cps:tdContent colspan="5">
				${dw.wxwpdwBean.scdz}&nbsp;
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel>储存设备：</cps:tdLabel>
			<cps:tdContent colspan="5">
				${dw.wxwpdwBean.cssb}&nbsp;
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel>副本许可范围：</cps:tdLabel>
			<cps:tdContent colspan="5">
				${dw.wxwpdwBean.fbxkfw}&nbsp;
			</cps:tdContent>
		</cps:row>
		<cps:row>
			<cps:tdLabel>备注：</cps:tdLabel>
			<cps:tdContent colspan="5">
				${dw.wxwpdwBean.bz}&nbsp;
			</cps:tdContent>
		</cps:row>
	</cps:table>
</creator:view>