<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>系统管理</title>
</head>
<frameset cols="200,*" frameborder="no" border="0" framespacing="0" id="frameset">
	<frame src="left.jsp" name="leftFrame" scrolling="no" id="leftFrame" title="topFrame" />
	<frame src="${contextPath}/xtgl/dwjcpz/toDwjcpzList.action" name="dwjcMain" scrolling="no" id="dwjcMain" title="bottomFrame" />
</frameset>
<noframes>
<body>
</body>
</noframes>
</html>
