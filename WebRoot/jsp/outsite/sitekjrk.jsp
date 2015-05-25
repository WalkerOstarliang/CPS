<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:Script src="/jsp/js/sitekjrk.js"></creator:Script>
	<cps:ImageIconPanel id="mykjrk">
		<c:forEach items="${leftMenuList}" var="menuBean">
			<cps:ImageIcon title="${menuBean.title}" 
							id="menu_${menuBean.menuid}" 
							href="${menuBean.href}" 
							imageSrc="/menu/showImageIcon.action?menuBean.menuid=${menuBean.menuid}"
							target="popu"
							>
			</cps:ImageIcon>
		</c:forEach>
	</cps:ImageIconPanel>
	
</creator:view>