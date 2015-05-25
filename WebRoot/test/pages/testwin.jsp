<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<html>
	<head>
		<%@include file="/template/include.inc" %>
		<script>
			function returnFormParam()
			{
				$.setResultValue($("#queryform").serialize());
				$.closeWindow();
			}
		</script>
	</head>
	<body>
		<form id="queryform">
			用户名：<input type="text" name="user.username"/><br/>
			真实姓名：<input type="text" name="user.realname"/><br/>
			姓名：<input type="text" name="username"/><br/>
			<cps:button value="提交" onclick="returnFormParam()"></cps:button>
		</form>
	</body>
</html>