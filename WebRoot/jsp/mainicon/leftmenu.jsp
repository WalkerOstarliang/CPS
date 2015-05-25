<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<cps:ImageIconPanel>
	<c:forEach items="${leftMenuList}" var="menu">
		<cps:ImageIcon 
					id="${menu.menuid}"
					title="${menu.title}" 
					imageSrc="/menu/showImageIcon.action?menuBean.menuid=${menu.menuid}" 
					onclick="initMainMenu('${menu.menuid}')">
		</cps:ImageIcon>
	</c:forEach>
</cps:ImageIconPanel>
 