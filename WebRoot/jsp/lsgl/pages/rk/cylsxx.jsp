<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:Script src="/jsp/lsgl/js/czfwczxx.js"></creator:Script>
<div>
		<cps:tableGrid id="cyryList"
			url="/zagl/dw/queryCyryPageResultInfo.action?cyrycx.rybh=${queryBean.rybh}"
		    width="99.5%" 
			pageSize="10" 
			autoload="true">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column title="操作" rowcallback="dwCzRowCallback"></cps:column>
			<cps:column title="姓名" field="xm"></cps:column>
			<cps:column title="工作单位" field="dwmc"></cps:column>
			<cps:column title="职务" field="zwmc"></cps:column>
			<cps:column title="聘用期限(年)" field="pynx"></cps:column>
		</cps:tableGrid>
</div>
