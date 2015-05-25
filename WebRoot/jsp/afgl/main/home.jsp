<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<creator:view>
	<script src="${contextPath}/FusionCharts/JSClass/FusionCharts.js"
		type="text/javascript"></script>
	<form id="homeform">
		<input type="hidden" id="dwdm" name="dwdm"/>
		<input type="hidden" id="dwlevel" name="dwlevel"/>
	</form>
	<creator:panel id="kkpcqktj_id" title="卡口盘查情况统计">
		<cps:tableGrid url="/home/kkpcqktjList.action" id="kkpcqktjList"
			autoload="true" autothead="false" width="100%" height="300px;" 
			mutilSelect="false" pageSize="10" usepager="true" searchform="homeform">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column field="dwmc" title="单位名称"></cps:column>
			<cps:column field="pcxxzs" title="盘查信息总数"></cps:column>
			<cps:column field="kkxczs" title="卡口巡查总数"></cps:column>
			<cps:column field="kywps" title="可疑物品数"></cps:column>
			<cps:column field="khsj" title="本月盘查考核时间"></cps:column>
		</cps:tableGrid>
	</creator:panel>
	
	<creator:panel id="kkfbqk_id" title="卡口分布情况">
		<div id="kkfbqk_div" style="width: 100%; height: 200px;"></div>
	</creator:panel>
	<creator:panel id="afjgtj_id" title="安防机构统计">
		<cps:tableGrid url="/home/afjgtjList.action" id="afjgtjList"
			autoload="true" autothead="false" width="100%" height="300px;" 
			mutilSelect="false" pageSize="10" usepager="true" searchform="homeform">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column field="dwmc" title="单位名称"></cps:column>
			<cps:column field="zzxldzs" title="专职巡逻队总数"></cps:column>
			<cps:column field="zzxldyzs" title="巡逻队员总数"></cps:column>
			<cps:column field="sqjwszs" title="社区警务室总数"></cps:column>
			<cps:column field="sqmjzs" title="社区民警总数"></cps:column>
			<cps:column field="jwhzs" title="居委会总数"></cps:column>
			<cps:column field="jwhgbzs" title="居委会干部总数"></cps:column>
			<cps:column field="ywxldzs" title="义务巡逻队总数"></cps:column>
			<cps:column field="ywxldyzs" title="巡逻队员总数"></cps:column>
			<cps:column field="jmxqzs" title="居民小区总数"></cps:column>
		</cps:tableGrid>
	</creator:panel>
	<script type="text/javascript" src="${contextPath}/jsp/afgl/js/home.js">
	</script>
</creator:view>