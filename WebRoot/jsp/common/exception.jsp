<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html;charset=UTF-8">
<title></title>
<link type="text/css" href="<c:url value='/jsp/common/css/style.css'/>" rel="stylesheet"  />
</head>
<body>
<div class="www_zzjs_net">
  <div class="zzjs_net">提示信息</div>
    <div class="_zzjs_net">
     	<p>系统访问发生异常，请重新访问。</p>
    </div>
    <div class="c4">
    	<s:property value="exception.message"/>
  	</div>
</div>

</body>
</html>
