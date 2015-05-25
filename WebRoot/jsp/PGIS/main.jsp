<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>社区警务管理平台</title>
	<link rel="stylesheet" type="text/css" href="<c:url value='/template/themes/gray/easyui.css'/>">
	<link rel="stylesheet" href="<c:url value='${themePath}/common/ztree3.1/css/demo.css'/>" type="text/css"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/template/themes/icon.css'/>">
	<creator:importScript></creator:importScript>
	<script type="text/javascript" src="<c:url value='/template/default/js/jquery.easyui.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/jsp/common/js/top.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/jsp/PGIS/js/left.js'/>"></script>
	<script>
		$(function(){
			var p = $('body').layout('panel','west').panel({
				onCollapse:function(){
				}
			});
			
			var docheight = $(document).height();
		 
			$("#MainMap").height(docheight - 160);
		});
	</script>
</head>
<body class="easyui-layout">
	
	
	<div region="north" border="false" style="height:200px;background:#B3DFDA;padding:0px">
		<cps:tableGrid url="/dzgl/dzxx/queryStxxBeansPageResult.action"  
						id="datagridList"
						autoload="true"
						mutilSelect="false"
						searchform="searchform" 
						width="99.8%" usepager="false">
			<cps:column field="stmc" title="实体名称" align="left"></cps:column>
			<cps:column field="cz" title="操作" align="left"></cps:column>
		</cps:tableGrid>
	</div>
	<div region="center" >
		<div class="easyui-tabs" fit="true" border="false">
			<div title="首页"> 
				<iframe id="MainMap" src="${pgisiframeurl}" width="100%" scrolling="no" frameborder="0" ></iframe>
			</div>
		</div>
	</div>
	<div region="east" split="true" collapsed="false" title="East" style="width:200px;padding:10px;">
		 
	</div>
	<div region="south" border="false" style="height:26px;background:#A9FACD;padding:0px;">
		<div class="footer">版权所有：湖南省公安厅&nbsp;&nbsp;&nbsp;&nbsp;技术支持：湖南科创信息技术股份有限公司</div>
	</div>
</body>
</html>