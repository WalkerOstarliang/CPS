<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>

<creator:view title="列管/撤管申请">
	<cps:tabPanel id="lgsq" height="700" width="900">
		<cps:tabItem id="application" title="列管/撤管申请" href="/zdry/collect_toCollectSpPage.action?lksqllzxx.sqxxbh=${sqxxbh}&lksqllzxx.lcgsqlx=${lcgsqlx}&isck=${isck }" display="true"></cps:tabItem>
		<cps:tabItem id="lzxx" title="列管/撤管流程" href="/zdry/collect_queryLksqlzxx.action?lksqllzxx.sqxxbh=${sqxxbh}"></cps:tabItem>
	</cps:tabPanel>
</creator:view>