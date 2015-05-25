<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:tbar id="tbar">
	<cps:button value="添加" onclick="openAddThreeMenu('${menuBean.menuid}','main')"></cps:button> 
</creator:tbar>
<creator:panel id="menupanel" width="100%" height="window" title="系统功能菜单" tbarId="tbar">
	<input type="hidden" id="parentid" value="${menuBean.menuid}">
	<c:forEach items="${childMenuMap}" var="twomenu">
		<fieldset>
			<legend><cps:button value="新增菜单" onclick="openAddThreeMenu('${twomenu.key.menuid}')"></cps:button>${twomenu.key.title}</legend>
			<cps:ImageIconPanel>
				<c:forEach items="${twomenu.value}" var="threemenu">
					<cps:ImageIcon 
							id="${threemenu.menuid}"
							title="${threemenu.title}" 
							href="${threemenu.href}"
							target="popuwindow"
							imageSrc="/menu/showImageIcon.action?menuBean.menuid=${threemenu.menuid}">
					</cps:ImageIcon>
				</c:forEach>
			</cps:ImageIconPanel>
		</fieldset>
	</c:forEach>
</creator:panel>
 