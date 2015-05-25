<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<html>
	<head>
		<%@include file="/template/include.inc" %>
		<script type="text/javascript" src="<c:url value='/jsp/common/js/dwselect2.js'/>"></script>
		<script type="text/javascript">
		  mutilSelect = ${mutilSelect};
		  currentOrgCode = "${rootOrgCode}";
		  nodeSelectedType = "${nodeSelectedType}";
		  nodeNotSelectedType = "${nodeNotSelectedType}";
		  chkboxType = {"Y" : nodeSelectedType, "N" : nodeNotSelectedType};
		  setting.view.selectedMulti=mutilSelect;
		  setting.check.enable=mutilSelect;
		  setting.check.chkboxType=chkboxType;
		  
		</script>
	</head>
<body>
<table class="box14" style="width: 100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<th width="20%">关键词：</th>
		<td width="80%">
			 <input id="orgname" type="text" name="searchname" style="width: 100%;color:blue" onkeyup="seachOrgList()"/>
		</td>		
	</tr>
</table>
<table class="box14" style="width: 100%" height="85%" border="0" cellpadding="0" cellspacing="0">
	<tr height="90%">
		<td width="40%" valign="top" height="100%">
			<div id="treepanel" class="cps-panel" style="width: 100%;height: 100%">
				  <div class="cps-panel-title">单位列表</div>
			  	  <div id="treecontent" class="cps-panel-content" style="overflow-x: hidden;width: 100%;">
			  	  		<ul id="treeDemo" class="ztree" style="width: 100%;margin: 0;padding: 0px"></ul>
				  </div>
			</div>
		</td>
	</tr>
</table>
<c:if test="${mutilSelect}">
	<table class="box14" style="width: 100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td align="center">
				<cps:button value="确定" onclick="returnSelectedNodes()"></cps:button>&nbsp;
				<cps:button value="关闭" onclick="$.closeWindow()"></cps:button>
			</td>
		</tr>
	</table>
</c:if>
</body>
</html>