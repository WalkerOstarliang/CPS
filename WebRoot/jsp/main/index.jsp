<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>社区警务管理系统-
			<c:if test="${modename=='lsgl'}">
				基础信息采集
			</c:if>	
			<c:if test="${modename=='gzgl'}">
				工作管理
			</c:if>
			<c:if test="${modename=='tjfx'}">
				统计分析
			</c:if>
		</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<%@include file="/template/topinclude.inc" %>
		
	</head>
	<frameset rows="100,*,26" frameborder="no" border="0" framespacing="0">
		<frame src="<c:url value='topIndex.action'/>?modename=${modename}" name="topFrame" scrolling="No"
			noresize="noresize" id="topFrame" title="topFrame" />
		<frameset id="mainfameset"  cols="150,*" frameborder="no" border="0" framespacing="0">
			<frame src="<c:url value='/leftIndex.action'/>?menuid=${menuid}" name="leftFrame" id="leftFrame" scrolling="no" title="leftFrame" noresize="noresize"/>
			<frame src="<c:url value='/jsp/main/home.jsp'/>" name="centerFrame" id="centerFrame" scrolling="auto" title="centerFrame" noresize="noresize"/>
		</frameset>
		<frame src="<c:url value='/jsp/main/bottom.jsp'/>" name="bottomFrame" scrolling="no"
			noresize="noresize" id="bottomFrame" title="bottomFrame" />
	</frameset>
	<noframes>
	</noframes>
</html>

