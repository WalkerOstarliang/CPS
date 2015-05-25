<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@include file="/template/include.inc" %>
<script type="text/javascript">
	$(function(){
		$("#left_menu").accordion();
	});
</script>
</head>
<body class="leftbox">
	<div><img src="<c:url value='/template/cps/images/left_a.jpg'/>" /></div>
	<div id="left_menu" class="left_menu">
		
		<a href="#" class="left_menu_main_a">参数字典</a>
	    <div class="left_menubox">
	    	<a href="<c:url value='/lsgl/rk/toRkListPage.action'/>?queryBean.rylb=1" class="left_menu_item_c" target="centerFrame"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;系统字典</a>
	    	<a href="<c:url value='/lsgl/rk/toRkListPage.action'/>?queryBean.rylb=2" class="left_menu_item_d" target="centerFrame"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;参数配置</a>
	    	<a href="<c:url value='/xtgl/xzqh/toXzqhPage.action'/>?queryBean.rylb=2" class="left_menu_item_d" target="centerFrame"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;行政区划</a>
	    	<a href="<c:url value='/mainIndex.action'/>" class="left_menu_item_d" target="_blank"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;菜单配置</a>
	    </div>
	    <a href="#" class="left_menu_main_a">系统任务</a>
	    <div class="left_menubox" style="display: none">
	    	<a href="<c:url value='/xtgl/dwjcpz/toDwjcpzList.action'/>" class="left_menu_item_c" target="centerFrame"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;单位检查配置</a>
	    	<a href="<c:url value='/gzgl/gztzgl/togztzmbxzPage.action'/>?operType=1" class="left_menu_item_d" target="centerFrame"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;台账模板</a>
	    </div>
	</div>
</body>
</html>
