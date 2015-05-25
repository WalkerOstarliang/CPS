<%@tag pageEncoding="UTF-8"%>
<%@attribute name="title" required="false" rtexprvalue="true"%>
<%@attribute name="width" required="false" rtexprvalue="true"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/xml; charset=utf-8" />
<title>${title}</title>
<creator:importScript></creator:importScript>
</head>
<body style="width: ${width};">
	<div id="loading" class="cps-loading">
	</div>
	<jsp:doBody></jsp:doBody>
</body>
</html>