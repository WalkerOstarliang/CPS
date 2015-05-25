<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<html>
	<head>
		<%@include file="/template/include.inc" %>
		<script type="text/javascript" src="<c:url value='/jsp/common/js/dwryselect.js'/>"></script>
		<script type="text/javascript">
		  mutilSelect = ${mutilSelect};
		  currentOrgCode = "${rootOrgCode}";
		</script>
	</head>
<body>
<table class="box14" style="width: 100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<th width="20%">关键词：</th>
		<td width="80%">
			 <input id="username" type="text" name="username" style="width: 100%;color:blue" onkeyup="seachUserBeanList(this.value)"/>
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
		<td width="40%" valign="top">
			<div class="cps-panel" style="width: 100%;">
				  <div class="cps-panel-title">人员列表</div>
			  	  <div id="rylbtable" class="cps-panel-content" style="overflow: auto;">
			  	  	<table id="dwrytable" width="100%" border="0" cellspacing="0" cellpadding="0" class="cps-tablegrid">
			          <thead>
				          <tr>
				          		<c:if test="${mutilSelect == true}">
				          			<th width="10" align="center"><input id="selectAllChk" type="checkbox"/></th>
				          		</c:if>
				          		<c:if test="${mutilSelect == false}">
				          			<th width="30" align="center">序号</th>
				          		</c:if>
				            	<th width="40%">姓名</th>
				            	<th width="50%">机构名称</th>
				          </tr>
			          </thead>
			          <tbody>
			          </tbody>
				    </table>
				  </div>
			</div>
		</td>		
	</tr>
</table>
<table class="box14" style="width: 100%" border="0" cellpadding="0" cellspacing="0">
<tr>
	<td align="center">
		<cps:button value="确定" onclick="resultSelectedDwryList()"></cps:button>&nbsp;
		<cps:button value="关闭" onclick="$.closeWindow()"></cps:button>
	</td>
</tr>
</table>

</body>
</html>