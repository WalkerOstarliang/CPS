<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<%@include file="/template/fusion.inc" %>
	<div id="chartdiv"></div>
    <script type="text/javascript">
	    var chart = new FusionCharts(contextPath + "/FusionCharts/Charts/Column3D.swf", "chartdiv", 750, 300);
		chart.setDataURL(contextPath + "/outsite/loadXqtjXml.action");
		chart.setTransparent(false);
		chart.render("chartdiv");
	</script>
</creator:view>