<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<cps:tableGrid url="/xtgl/sjhc/queryFw.action" title="登记出租房屋"
		id="dataList" autoload="false" pageSize="10" width="99.8%"
		usepager="true" autothead="false" mutilSelect="false">
	<cps:column isNumber="true" title="序号"></cps:column>
	<c:if test="${loginInfo.leve == 5}">
		<cps:column title="操作" rowcallback="fwCz" align="left"></cps:column>
	</c:if>
	<cps:column field="hzxm" title="房主姓名" align="left"></cps:column>
	<cps:column field="hzsfzh" title="房主身份证"></cps:column>
	<cps:column field="dzmc" title="地址" align="left" maxlength="15"></cps:column>
	<cps:column field="djrxm" title="登记人"></cps:column>
	<cps:column title="办理期限" field="blqx"></cps:column>
</cps:tableGrid>
