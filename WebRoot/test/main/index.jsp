<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>社区警务</title>
<%@include file="/template/include.inc" %>
<script type="text/javascript">
</script>
</head>
<frameset rows="60,*" cols="*" frameborder="no" border="0" framespacing="0">
  <frame src="<c:url value='/test/main/top.jsp'/>" name="topFrame" scrolling="no" noresize="noresize" id="topFrame" title="topFrame"/>
  <frameset cols="120,*" frameborder="no" border="0" framespacing="0">
    <frame src="<c:url value='/test/main/left.jsp'/>" name="leftFrame" scrolling="no" noresize="noresize" id="leftFrame" title="leftFrame" />
    <frame src="<c:url value='/test/main/center.jsp'/>" name="mainFrame" id="mainFrame" title="mainFrame" />
  </frameset>
</frameset>
<noframes>
<body>
</body> 
</noframes>
</html>
