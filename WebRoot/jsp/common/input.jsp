<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	Object exception = request.getAttribute("exceptionStack");
	System.out.println(exception);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html;charset=UTF-8">
<title>系统异常页面</title>
<link type="text/css" href="<c:url value='/jsp/common/css/style.css'/>" rel="stylesheet"  />
</head>
<body>
<div style="width:100%;margin: 0px;padding: 0px;">
  <div class="zzjs_net" style="margin: 0px;padding: 0px;">提示信息</div>
    <div class="_zzjs_net">
     	<p>系统访问发生错误，请重新访问。</p>
    </div>
    <div class="c4" style="padding: 5px;">
		<s:property value="exceptionStack"/>
  	</div>
</div>
</body>
</html>
