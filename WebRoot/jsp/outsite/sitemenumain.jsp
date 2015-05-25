<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<c:forEach items="${childMenuMap}" var="twomenu">
	<div class="mar_top10">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="20" class="broder_bottom">
					<font color="blue">${twomenu.key.title}</font>
				</td>
			</tr>
			<tr>
				<td valign="middle">
					<c:forEach items="${twomenu.value}" var="threemenu">
						<div class="right_nav right_nav1">
							<c:if test="${showSelectChk == true}">
								<c:choose>
									<c:when test="${threemenu.isShortCut == true}">
										<input type="checkbox" value="${threemenu.menuid}" checked="checked" onclick="changeSelectKjfsMenu(this)" style="margin-top: 10px;float: left">
									</c:when>
									<c:otherwise>
										<input type="checkbox" value="${threemenu.menuid}" onclick="changeSelectKjfsMenu(this)" style="margin-top: 10px;float: left">
									</c:otherwise>
								</c:choose>
							</c:if>
							<a href="javascript:openMenuWindow('${threemenu.menuid}','${threemenu.href}')">
								<img src="<c:url value='/menu/showImageIcon.action?menuBean.menuid=${threemenu.menuid}'/>" width="32" height="32" />${threemenu.title}
							</a>
						</div>
					</div>
					</c:forEach>
					<div class="clear"></div>
				</td>
			</tr>
		</table>
	</div>
</c:forEach>
