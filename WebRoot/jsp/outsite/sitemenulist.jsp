<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:Script src="/jsp/outsite/js/sitemenu.js"></creator:Script>
	<div class="l_menu">
		<ul>
			<c:forEach items="${outSiteMenuBeans}" var="menubean">
				<li>
					<span><img src="<c:url value="/template/cps/images/left_icon.gif"/>" width="9" height="15" style="margin-bottom:-7px;" /></span> 
					<a href="javascript:openOutSiteWin('${menubean.id}','${menubean.menuname }','${menubean.menuhref}')">${menubean.menuname}</a>
				</li>
			</c:forEach>
		</ul>
	</div>
</creator:view>