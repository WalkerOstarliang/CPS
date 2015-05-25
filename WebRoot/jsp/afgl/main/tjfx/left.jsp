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
		<a href="#" class="left_menu_main_a">卡口信息管理</a>
	    <div class="left_menubox">
	    	<a href="center.jsp" class="left_menu_item_c" target="centerFrame"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;卡口信息登记</a>
	    	<a href="test.jsp" class="left_menu_item_d" target="centerFrame"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;卡口巡逻登记</a>
	    	<a href="#" class="left_menu_item_d"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;卡口盘查登记</a>
	    </div>
	    <a href="#" class="left_menu_main_b">可疑物品管理</a>
	    <div class="left_menubox" style="display: none">
	    	<a href="#" class="left_menu_item_d"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;卡口信息登记</a>
	    	<a href="#" class="left_menu_item_d"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;卡口巡逻登记</a>
	    	<a href="#" class="left_menu_item_d"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;卡口盘查登记</a>
	    </div>
	    <a href="#" class="left_menu_main_b">盘查信息管理</a>
	     <div class="left_menubox" style="display: none">
	    	<a href="#" class="left_menu_item_d"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;卡口信息登记</a>
	    	<a href="#" class="left_menu_item_d"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;卡口巡逻登记</a>
	    	<a href="#" class="left_menu_item_d"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;卡口盘查登记</a>
	    </div>
	</div>
</body>
</html>
