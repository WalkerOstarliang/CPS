<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:Script src="/jsp/lsgl/js/czfwczxx.js"></creator:Script>
<div>
	<cps:tableGrid id="fwtablegrid"  
		url="/lsgl/rygl/queryTzryBeanPageInfo.action?tzryBean.rybh=${queryBean.rybh}" 
		width="99.6%">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column title="操作" rowcallback="tzryCzRowCallback" align="left"></cps:column>
		<cps:column field="xm" title="姓名"></cps:column>
		<cps:column field="sfzh" title="身份证号"></cps:column>
		<cps:column field="xbms" title="性别"></cps:column>
		<cps:column field="dzmc" title="地址名称" align="left" maxlength="15"></cps:column>
		<cps:column field="lxdh" title="联系电话"></cps:column>
		<cps:column field="fwcs" title="服务处所"></cps:column>
		<cps:column field="zxbsms" title="注销标识"></cps:column>
	</cps:tableGrid>
</div>
