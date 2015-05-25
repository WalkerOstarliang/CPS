<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@include file="/template/include.inc" %>
<script type="text/javascript">
	$(function(){
		$("#left_menu").accordion();
		$("#left_menu").find("a[id^=leftmenu_]:first").removeClass("left_menu_main_b").addClass("left_menu_main_a")
		$("#left_menu").find(".left_menubox:first").show();
	});
</script>
</head>
<body class="leftbox">
	<div id="left_menu" class="left_menu">
		<c:forEach items="${menuBeansMap}" var="twomenu">
			<a href="#" id="leftmenu_${twomenu.key.function_id}" class="left_menu_main_b">${twomenu.key.name}</a>
		    <div class="left_menubox" style="display: none">
		    	<c:forEach items="${twomenu.value}" var="threemenu" varStatus="st">
		    		<c:choose>
			    		<c:when test="${fn:startsWith(threemenu.path,'http')}">
			    			<c:choose>
			    				<c:when test="${fn:contains(threemenu.path,'?')}">
			    					<a href="${threemenu.path}&lv=${loginInfo.leve}&lv_max=${loginInfo.leve}&code=${loginInfo.orgcode}" class="left_menu_item_d" target="centerFrame">
			    						<img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;<span id="menu_${st.index}">${threemenu.name}</span>
			    					</a>
			    				</c:when>
			    				<c:otherwise>
			    					<a href="${threemenu.path}?lv=${loginInfo.leve}&lv_max=${loginInfo.leve}&code=${loginInfo.orgcode}" class="left_menu_item_d" target="centerFrame">
			    						<img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;<span id="menu_${st.index}">${threemenu.name}</span>
			    					</a>
			    				</c:otherwise>
			    			</c:choose>
			    		</c:when>
			    		<c:otherwise>
			    			<c:choose>
			    				<c:when test="${fn:contains(threemenu.path,'?')}">
			    					<a href="<c:url value='${threemenu.path}'/>&lv=${loginInfo.leve}&lv_max=${loginInfo.leve}&code=${loginInfo.orgcode}" class="left_menu_item_d" target="centerFrame">
			    						<img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;<span id="menu_${st.index}">${threemenu.name}</span>
			    					</a>
			    				</c:when>
			    				<c:otherwise>
			    					<a href="<c:url value='${threemenu.path}'/>?lv=${loginInfo.leve}&lv_max=${loginInfo.leve}&code=${loginInfo.orgcode}" class="left_menu_item_d" target="centerFrame">
			    						<img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;<span id="menu_${st.index}">${threemenu.name}</span>
			    					</a>
			    				</c:otherwise>
			    			</c:choose>
			    		</c:otherwise>
		    		</c:choose>
		   		</c:forEach>
		    </div>
		</c:forEach>
	</div>
</body>
</html>
