<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<creator:view>
	<creator:tbar id="op">
		<cps:button value="关闭" onclick="window.close()"></cps:button>
	</creator:tbar>
	<creator:panel id="ckyjxx" title="常控预警信息" tbarId="op">
		<%@include file="/jsp/zdrygl/pages/ckyj/ckyjInfo.jsp"%>
	</creator:panel>
</creator:view>