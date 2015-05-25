<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:Script src="/jsp/zagl/pages/dwgl/detail/js/dwzp_detail.js"></creator:Script>
	<div id="xyzpdiv" style="width:99.8%;overflow: auto;border: 1px solid #CCCCCC;padding-top: 10px">
		<c:forEach items="${dw.dwzpList}" var="zp">
			<span zpid="${zpBean.id}" style="margin: 2px;cursor: pointer;">
				<img width="145" height="170" src="<c:url value='/zagl/dw/showDwzp.action'/>?dw.dwzp.id=${zp.id}"/>
			</span>
		</c:forEach>
	</div>
</creator:view>