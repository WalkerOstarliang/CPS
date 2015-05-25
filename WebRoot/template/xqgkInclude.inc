<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	//上下文路径
	String contextPath = request.getContextPath();
	//主题路径
	String themePath = "/template/themes/black";
	
	pageContext.setAttribute("themePath", themePath);
	pageContext.setAttribute("contextPath", contextPath);
%>

<!-- 系统样式 -->
<link type="text/css" href="${contextPath}${themePath}/css/layout.css" rel="stylesheet"  />
<link type="text/css" href="${contextPath}${themePath}/css/win.css" rel="stylesheet"  />

<!-- jquery -->
<script type="text/javascript" src="${contextPath}/template/default/js/jquery-1.6.min.js"></script>
<script type="text/javascript" src="${contextPath}/template/default/js/jquery.form.js"></script>

<!-- 系统js -->
<script type="text/javascript" src="${contextPath}${themePath}/JsUtils/commonload.js"></script>
<script type="text/javascript" src="${contextPath}${themePath}/JsUtils/general.js"></script>
<script type="text/javascript" src="${contextPath}${themePath}/JsUtils/duty.js"></script>

<!-- 日期控件js -->
<script type="text/javascript" src="${contextPath}/template/My97DatePicker/WdatePicker.js" defer="defer"></script>

<script type="text/javascript">
	var themePath = "<%=themePath%>";
	var contextPath = "<%=contextPath%>";
</script>
<script type="text/javascript">

</script>
