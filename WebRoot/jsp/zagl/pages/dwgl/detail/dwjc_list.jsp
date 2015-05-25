<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
<creator:Script src="/jsp/zagl/pages/dwgl/detail/js/dwjc_detail.js"></creator:Script>
	<cps:tableGrid url="/zagl/dw/queryDwjcBeans.action?dwcx.jgbh=${dw.dwjbxx.jgbh}"
		id="dwjcList" width="99.5%" autoload="true"
		usepager="true" mutilSelect="false">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column title="操作" rowcallback="dwjcClickRowcallback"></cps:column>
		<cps:column title="奖惩类别" field="jclbmc"></cps:column>
		<cps:column title="奖惩日期" field="cfrq"></cps:column>
		<cps:column title="奖惩内容" field="cfnr" maxlength="20"></cps:column>
		<cps:column title="登记时间" field="djsj"></cps:column>
	</cps:tableGrid>
</creator:view>