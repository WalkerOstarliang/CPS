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
	    <a href="#" class="left_menu_main_a">单位管理</a>
	    <div class="left_menubox">
	    	<a href="<c:url value='/zagl/dw/toDwcx.action?dwcx.hylb=01'/>" class="left_menu_item_c" target="centerFrame"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;特种行业</a>
	    	<a href="<c:url value='/zagl/dw/toDwcx.action?dwcx.hylb=02'/>" class="left_menu_item_d" target="centerFrame"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;公共场所</a>
	    	<a href="<c:url value='/zagl/dw/toDwcx.action?dwcx.hylb=03'/>" class="left_menu_item_d" target="centerFrame"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;内保单位</a>
	    	<a href="<c:url value='/zagl/dw/toDwcx.action?dwcx.hylb=05'/>" class="left_menu_item_d" target="centerFrame"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;上网服务场所</a>
	    </div>
	     <a href="#" class="left_menu_main_b">大型活动</a>
	    <div class="left_menubox" style="display: none">
	    	<a href="<c:url value='/dxhd/toDxhdList.action'/>" class="left_menu_item_d" target="centerFrame"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;大型活动登记</a>
	    </div>
	    <a href="#" class="left_menu_main_b">查询管理</a>
	    <div class="left_menubox" style="display: none">
	    	<a href="<c:url value='/zagl/dw/toDwcx.action?dwcx.opertype=detail'/>" class="left_menu_item_d" target="centerFrame"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;单位统一查询</a>
	    	<a href="<c:url value='/zagl/dw/toCyryList.action'/>" class="left_menu_item_d" target="centerFrame"><img src="<c:url value='/template/cps/images/left_d01.jpg'/>" />&nbsp;从业人员查询</a>
	    </div>
	</div>
</body>
</html>
