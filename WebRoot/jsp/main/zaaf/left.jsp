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
		<a href="#" class="left_menu_main_a">人口采集</a>
	    <div class="left_menubox">
	    	<a href="<c:url value='/lsgl/rk/toRkListPage.action'/>?queryBean.rylb=1" class="left_menu_item_c" target="centerFrame"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;常住人口登记</a>
	    	<a href="<c:url value='/lsgl/rk/toRkListPage.action'/>?queryBean.rylb=2" class="left_menu_item_d" target="centerFrame"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;流动人口登记</a>
	    	<a href="<c:url value='/lsgl/rk/toRkListPage.action'/>?queryBean.rylb=5" class="left_menu_item_d" target="centerFrame"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;寄住人口登记</a>
	    	<a href="<c:url value='/lsgl/rk/toRkListPage.action'/>?queryBean.rylb=4" class="left_menu_item_d" target="centerFrame"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;境外人员登记</a>
	    	<a href="<c:url value='/lsgl/rk/toRkListPage.action'/>?queryBean.rylb=3" class="left_menu_item_d" target="centerFrame"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;未落户人员</a>
	    </div>
	     <a href="#" class="left_menu_main_b">单位采集</a>
	    <div class="left_menubox" style="display: none">
	    	<a href="<c:url value='/zagl/forward/toIndexPage.action?orgInfoUpdate.dwsx=01'/>" class="left_menu_item_c" target="centerFrame"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;特种行业</a>
	    	<a href="<c:url value='/zagl/forward/toIndexPage.action?orgInfoUpdate.dwsx=02'/>" class="left_menu_item_d" target="centerFrame"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;公共场所</a>
	    	<a href="<c:url value='/zagl/forward/toIndexPage.action?orgInfoUpdate.dwsx=03'/>" class="left_menu_item_d" target="centerFrame"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;内保单位</a>
	    	<a href="<c:url value='/zagl/forward/toIndexPage.action'/>" class="left_menu_item_d" target="centerFrame"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;娱乐场所</a>
	    </div>
	    <a href="#" class="left_menu_main_b">房屋采集</a>
	    <div class="left_menubox" style="display: none">
	    	<a href="<c:url value='/lsgl/fw/toFwJbxxListPage.action'/>" class="left_menu_item_d" target="centerFrame"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;实有房屋登记</a>
	    	<a href="<c:url value='/lsgl/fw/toFwJbxxListPage.action'/>?queryBean.sfczw=1" class="left_menu_item_d" target="centerFrame"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;出租房屋登记</a>
	    </div>
	</div>
</body>
</html>
