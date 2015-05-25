<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<html>
	<head>
		<%@include file="/template/include.inc" %>
		<script type="text/javascript" src="<c:url value='/jsp/common/js/xzsqselect.js'/>"></script>
		<script type="text/javascript">
			currentOrgCode = "${loginInfo.rootOrgCode}";
		</script>
	</head>
<body>
<div class="cps-panel-title">行政区划列表</div>
<div id="treecontent" class="cps-panel-content" style="overflow-x: hidden;width: 99%;">
  <ul id="treeDemo" class="ztree" style="width: 99%;margin: 0;padding: 0px"></ul>
</div>
</body>
</html>