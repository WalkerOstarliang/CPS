<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<creator:view>
<creator:Script src="/jsp/zagl/pages/dwgl/detail/js/tfsjyaList_detail.js"></creator:Script>
	<cps:tableGrid list="${dw.tfsjyaList}" id="tfsjyaList"
		autoload="true" searchform="" pageSize="5" width="99.5%" dblclick="openTfsjya"
		usepager="false" mutilSelect="false" isAsynch="false">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column title="预案类型" field="yalxmc"></cps:column>
		<cps:column title="修订时间" field="xdsj"></cps:column>
		<cps:column title="登记时间" field="djsj"></cps:column>
		<cps:column title="登记人" field="djrxm"></cps:column>
		<cps:column title="登记单位" field="djdwmc"></cps:column>
	</cps:tableGrid>
</creator:view>

