<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:Script src="/jsp/js/sitekjrk.js"></creator:Script>
	<div class="div_box1">
		<input type="hidden" id="showSelectChk" value="${showSelectChk}"/>
		<input type="hidden" id="defaultShowMenuId" value="${defaultShowMenuId}">
    	<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
          <tr height="100%">
            <td width="110" id="leftpanel" height="100%" valign="top" class="f6f6f6 left_navbg">
            	<c:forEach items="${leftMenuList}" var="menuBean">
            		<c:if test="${menuBean.menuid != '9'}">
	            		<div id="nav_${menuBean.menuid}" class="left_nav" onclick="loadBtnChildMenu('${menuBean.menuid}')">
	            			<a href="javascript:void(0)">
	            				<img src="<c:url value='/template/cps/images/bg_${menuBean.menuid}.gif'/>" width="16" height="16" />
	            				${menuBean.title }&nbsp;&nbsp;&gt;
	            			</a>
	            		</div>
            		</c:if>
            	</c:forEach>
            </td>
            <td valign="top" height="100%">
            	<div id="centermenu" class="padd10">
                </div>
            </td>
          </tr>
        </table>
    </div>
</creator:view>
