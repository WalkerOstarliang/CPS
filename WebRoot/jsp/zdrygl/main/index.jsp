<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>社区警务-重点人员管理系统</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<%@include file="/template/topinclude.inc" %>
	</head>
	<frameset rows="100,*,26" frameborder="no" border="0" framespacing="0">
		<frame src="top.jsp" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" title="topFrame" />
		<frame src="${contextPath}/zdry/statistics_toIndexForwardPage.action" name="mainFrame"  id="mainFrame" title="bottomFrame" />
		<frame src="bottom.jsp" name="bottomFrame" scrolling="no" noresize="noresize" id="bottomFrame" title="bottomFrame" />
	</frameset>
	<noframes>
		<body>
		</body>
	</noframes>
</html>
