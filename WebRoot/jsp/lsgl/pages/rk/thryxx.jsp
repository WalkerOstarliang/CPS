<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:Script src="/jsp/lsgl/js/czfwczxx.js"></creator:Script>
<div>
	<cps:tableGrid id="thrylist" 
		url="/lsgl/rygl/queryThryBeanPageInfo.action?czrkBean.rybh=${queryBean.rybh}" 
		width="99.6%"
		autoload="true">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column title="操作" rowcallback="tzryCzRowCallback" align="left"></cps:column>
		<cps:column field="xm" title="姓名"></cps:column>
		<cps:column field="sfzh" title="身份证号"></cps:column>
		<cps:column field="xbms" title="性别"></cps:column>
		<cps:column field="yhzgxmc" title="与房主关系"></cps:column>
	</cps:tableGrid>
</div>

