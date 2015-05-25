<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:Script src="/jsp/lsgl/js/rkinfo.js"></creator:Script>
	<input type="hidden" id="rybh" value="${rkBean.jbxxBean.rybh }">
	<input type="hidden" id="queryBeansfzh" value="${rkBean.jbxxBean.sfzh}">
	<%@include file="/jsp/lsgl/pages/rk/rkzpxx.jsp" %>
</creator:view>