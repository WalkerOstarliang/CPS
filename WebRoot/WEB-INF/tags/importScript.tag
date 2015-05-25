<%@tag pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<LINK href="<c:url value='/favicon.ico'/>" type="image/x-icon" rel="shortcut icon">
<link type="text/css" href="<c:url value='${themePath}/css/cps-${currentXzqh}.css'/>" rel="stylesheet"  />

<link type="text/css" href="<c:url value='/template/cps/css/layout.css'/>" rel="stylesheet"  />
<link type="text/css" href="<c:url value='/template/default/js/chosen.css'/>" rel="stylesheet"  />
<link type="text/css" href="<c:url value='${themePath}/css/validationEngine.jquery.css'/>" rel="stylesheet"/>
<link rel="stylesheet" href="<c:url value='${themePath}/common/ztree3.1/css/zTreeStyle/zTreeStyle.css'/>" type="text/css"/>
<link rel="stylesheet" href="<c:url value='${themePath}/common/ztree3.1/css/demo.css'/>" type="text/css"/>

<script type="text/javascript" src="<c:url value='${themePath}/js/jquery.min.1.8.3.js'/>"></script>
<script type="text/javascript" src="<c:url value='${themePath}/js/jquery.form.js'/>"></script>
<script type="text/javascript" src="<c:url value='${themePath}/js/json2.js'/>"></script>
<script type="text/javascript" src="<c:url value='${themePath}/js/jquery.validationEngine.js'/>"></script>
<script type="text/javascript" src="<c:url value='${themePath}/js/jquery.validationEngine-zh_CN.js'/>"></script>
<script type="text/javascript" src="<c:url value='/template/My97DatePicker/WdatePicker.js'/>" defer="defer"></script>
<script type="text/javascript" src="<c:url value='${themePath}/common/ztree3.1/js/jquery.ztree.core-3.1.js'/>"></script>

<script type="text/javascript" src="<c:url value='${themePath}/common/ztree3.1/js/jquery.ztree.excheck-3.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='${themePath}/common/ztree3.1/js/jquery.ztree.exedit-3.1.min.js'/>"></script>

<script type="text/javascript" src="<c:url value='/template/layer/layer.min.js'/>"></script>

<script type="text/javascript" src="<c:url value='${themePath}/js/jquery.tablegrid.js'/>"></script>
<script type="text/javascript" src="<c:url value='${themePath}/js/jquery.select.js'/>"></script>
<script type="text/javascript" src="<c:url value='${themePath}/js/jquery.tabpanel.js'/>"></script>

<script type="text/javascript" src="<c:url value='${themePath}/js/jquery.ajaxupload.js'/>"></script>
<script type="text/javascript" src="<c:url value='${themePath}/js/jquery.layout-latest.js'/>"></script>
<script type="text/javascript" src="<c:url value='${themePath}/js/jquery.doubledicselect.js'/>"></script>
<script type="text/javascript" src="<c:url value='${themePath}/js/jquery.fn.plugin.js'/>"></script>
<script type="text/javascript" src="<c:url value='${themePath}/js/jquery.accordion.js'/>"></script>
<script type="text/javascript" src="<c:url value='${themePath}/js/jquery.multifile.js'/>"></script>
<script type="text/javascript" src="<c:url value='${themePath}/js/jquery.contextmenu.r2.packed.js'/>"></script>
<script type="text/javascript" src="<c:url value='${themePath}/js/jquery.leanModal.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='${themePath}/js/jqplugins.js'/>"></script>
<script type="text/javascript" src="<c:url value='${themePath}/js/checkIdCard.js'/>"></script>
<script type="text/javascript" src="<c:url value='/jsp/common/js/common.js'/>"></script>

<script type="text/javascript" src="<c:url value='${themePath}/js/chosen.jquery.js'/>"></script>
<script type="text/javascript" src="<c:url value='${themePath}/js/docsupport/prism.js'/>"></script>

<script type="text/javascript" src="<c:url value='${themePath}/js/ajaxupload.js'/>"></script>
<script type="text/javascript" src="<c:url value='${themePath}/js/jsextend.js'/>"></script>
<script type="text/javascript" src="<c:url value='${themePath}/js/init.js'/>"></script>

<script type="text/javascript">
	var themePath = "${themePath}";
	var contextPath = "${contextPath}";
</script>
<script type="text/javascript">
	function showOrHideLeft()
	{
		 parent.showOrHideLeftfameset();
		 
	}
	$(function(){
		$("#mysebar").find("a:first").bind("click",function(){
			showOrHideLeft();
		});
		$(window).scroll(function(){
			var offset = $.scollPostion();
			$("#mysebar").css("top",185 + offset.top);
		});
		
	})
</script>
