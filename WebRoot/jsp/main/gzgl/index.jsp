<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>社区警务-安全防范管理系统</title>
<creator:importScript></creator:importScript>
<script type="text/javascript" src="<c:url value='/jsp/common/js/frameindex.js'/>"></script>
</head>
<frameset id="mainfameset"  cols="170,*" frameborder="no" border="0" framespacing="0">
  	<frame src="<c:url value='/jsp/main/gzgl/left.jsp'/>" name="leftFrame" id="leftFrame" scrolling="no" title="leftFrame" noresize="noresize"/>
  	<frame src="<c:url value='/jsp/main/gzgl/center.jsp'/>" name="centerFrame" id="centerFrame" scrolling="auto" title="centerFrame" noresize="noresize"/>
</frameset>
<noframes>
<body>
</body>
</noframes>
</html>
