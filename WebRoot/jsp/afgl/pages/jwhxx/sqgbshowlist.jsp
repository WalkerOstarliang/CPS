<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
<creator:panel id="sqgbpanel" title="社区干部列表">
	<form id="sqgbform">
		<input type="hidden" name="queryBean.sssqbh" value="${queryBean.sssqbh}">
	</form>
	<cps:tableGrid id="sqgbshowlist" 
				mutilSelect="false"
				url="/afgl/sqgbgl/querySqgbPageResult.action" 
				searchform="sqgbform">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column field="gbxm" title="姓名"></cps:column>
		<cps:column field="gbxbmc" title="性别"></cps:column>
		<cps:column field="gbsfzh" title="身份证号"></cps:column>
		<cps:column field="gbxzdxz" title="住址"></cps:column>
		<cps:column field="gbzwmc" title="职务"></cps:column>
		<cps:column field="sssqmc" title="所在社区"></cps:column>
	</cps:tableGrid>
</creator:panel>
</creator:view>