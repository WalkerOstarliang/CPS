<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:tbar id="wlhsavetbar">
	<cps:button id="savebtn" value="保存" onclick="submitFormRkInfo(saveAfterCallback)"></cps:button>
	<cps:button value="关闭" onclick="$.closeWindow()"></cps:button>
</creator:tbar>
<creator:panel id="jzrklistpanel" title="历史未落户口信息" tbarId="wlhsavetbar">
	<cps:tableGrid id="rktablegrid"
			list="${rkBean.wlhrkBeans}"
			searchform="ryinfoqueryform"
			isAsynch="false"
			height="150"
			width="99.8%"
			click="wlhrkRowCallback"
			usepager="false"
			mutilSelect="false"
			autoload="true">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column field="xm" title="姓名" maxlength="15"></cps:column>
		<cps:column field="sfzh" title="身份证号"></cps:column>
		<cps:column field="czjzlms" title="持证件种类"></cps:column>
		<cps:column field="czjhm" title="持证件号码"></cps:column>
		<cps:column field="wlhqssj" title="未落户起始时间"></cps:column>
		<cps:column field="yhjdqhms" title="原户籍地区划"></cps:column>
		<cps:column field="yhjdxz" title="原户籍地详址"></cps:column>
		<cps:column field="djsj" title="登记时间"></cps:column>
		<cps:column field="djrxm" title="登记人姓名"></cps:column>
	</cps:tableGrid>
	<div view="true">
		<%@include file="/jsp/lsgl/pages/rk/wlczhk/dqwlhxx.jsp" %>
	</div>
</creator:panel>