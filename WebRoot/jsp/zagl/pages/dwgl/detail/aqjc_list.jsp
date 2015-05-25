<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<creator:view>
<creator:Script src="/jsp/zagl/pages/dwgl/detail/js/aqjc_detail.js"></creator:Script>
	<cps:tableGrid url="/zagl/dw/queryDwaqjcBeans.action?dwcx.jgbh=${dw.dwjbxx.jgbh}"
		searchform="aqjcqueryform" id="aqjcList" autoload="true"
		usepager="true" width="99.5%" mutilSelect="true">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column title="操作" rowcallback="aqjcDetail"></cps:column>
		<cps:column title="检查内容" field="jcnr" maxlength="10"></cps:column>
		<cps:column title="检查人员" field="jcryxm"></cps:column>
		<cps:column title="检查单位" field="jcdwmc"></cps:column>
		<cps:column title="处理情况" field="jcclqkmc"></cps:column>
		<cps:column title="检查时间" field="jcsj"></cps:column>
		<cps:column title="登记时间" field="djsj"></cps:column>
	</cps:tableGrid>
</creator:view>
