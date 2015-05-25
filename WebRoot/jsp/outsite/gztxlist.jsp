<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:Script src="/jsp/outsite/js/gztxlist.js"></creator:Script>
	<div>
		<ul style="list-style:disc inside;">
			<c:forEach items="${xttxpzBeans}" var="xtpzBean">
				<li style="list-style-type:square;padding-left: 5px">${xtpzBean.title}<span id="gztx_${xtpzBean.id}" style="cursor: pointer;" onclick="openXqJbqktjlist('${xtpzBean.id}','${xtpzBean.title}')">[0]</span></li>
			</c:forEach>
		</ul>
	</div>
</creator:view>