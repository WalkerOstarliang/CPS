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
	    <a href="#" class="left_menu_main_a">社区管理</a>
	    <div class="left_menubox">
	    	<a href="<c:url value='/afgl/sqgl/toSqJbxxPage.action'/>" class="left_menu_item_c" target="centerFrame"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;社区基本情况</a>
	    	<a href="<c:url value='/afgl/sqjbgl/toSqJbxxListPage.action'/>" class="left_menu_item_d" target="centerFrame"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;社区/农村登记</a>
	    	<a href="<c:url value='/afgl/jwhgl/toSqJwhListPage.action'/>" class="left_menu_item_d" target="centerFrame"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;居/村委会登记</a>
	    	<a href="<c:url value='/afgl/sqgbgl/toSqgbListPage.action'/>" class="left_menu_item_d" target="centerFrame"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;社区干部登记</a>
	    	<a href="<c:url value='/xqxx/toXqxxList.action'/>" class="left_menu_item_d" target="centerFrame"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;居民小区登记</a>
	    	<a href="<c:url value='/xqjfwfssxx/toXqjfwfssxxList.action'/>" class="left_menu_item_d" target="centerFrame"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;物防设备管理</a>
	    	<!-- <a href="#" class="left_menu_item_d" target="centerFrame"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;发案情况登记</a> -->
	    </div>
	    <a href="#" class="left_menu_main_b">警务区/室管理</a>
	    <div class="left_menubox" style="display: none">
	    	<a href="<c:url value='/sqjwsxx/toSqjwsxxList.action'/>" class="left_menu_item_d" target="centerFrame"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;警务区/室</a>
	    	<a href="<c:url value='/xgdyxx/toXgdyxxList.action'/>" class="left_menu_item_d" target="centerFrame"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;协管队员</a>
	    </div>
	    <a href="#" class="left_menu_main_b">治保会管理</a>
	     <div class="left_menubox" style="display: none">
	    	<a href="<c:url value='/zbhxx/toZbhxxList.action'/>" class="left_menu_item_d" target="centerFrame"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;组建治保会</a>
	    	<a href="<c:url value='/zbhcyxx/toZbhcyxxList.action'/>" class="left_menu_item_d" target="centerFrame"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;治保会成员</a>
	    </div>
	    <a href="#" class="left_menu_main_b">专职巡逻队管理</a>
	    <div class="left_menubox" style="display: none">
	    	<a href="<c:url value='/afgl/xldxx/toXldxxPage.action'/>?queryBean.xldlx=1" class="left_menu_item_d" target="centerFrame"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;组建巡逻队</a>
	    	<a href="<c:url value='/afgl/xldxx/toXldrxxPage.action'/>?queryBean.xldlx=1" class="left_menu_item_d" target="centerFrame"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;巡逻队员登记</a>
	    </div>
	    <a href="#" class="left_menu_main_b">义务巡逻队管理</a>
	     <div class="left_menubox" style="display: none">
	    	<a href="<c:url value='/afgl/xldxx/toXldxxPage.action'/>?queryBean.xldlx=2" class="left_menu_item_d" target="centerFrame"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;组建巡逻队</a>
	    	<a href="<c:url value='/afgl/xldxx/toXldrxxPage.action'/>?queryBean.xldlx=2" class="left_menu_item_d" target="centerFrame"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;巡逻队员登记</a>
	    </div>
	</div>
</body>
</html>
