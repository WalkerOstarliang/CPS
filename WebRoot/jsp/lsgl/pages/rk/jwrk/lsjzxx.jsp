<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:tbar id="lsjzxxsavetbar">
	<cps:button id="savebtn" value="保存" onclick="submitFormRkInfo(saveAfterCallback)"></cps:button>
	<cps:button value="关闭" onclick="$.closeWindow()"></cps:button>
</creator:tbar>
<creator:panel id="lsjzxxpanel" title="户口信息" tbarId="lsjzxxsavetbar">
	<cps:tableGrid id="rktablegrid" 
			list="${rkBean.jwrkjzxxBeans}"
			isAsynch="false"
			width="99.8%"
			click="jwrkjzRowCallback"
			searchform="ryinfoqueryform"
			mutilSelect="false">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column field="xm" title="中文名"></cps:column>
		<cps:column field="ywm" title="英文名"></cps:column>
		<cps:column field="zjzlms" title="证件类型" ></cps:column>
		<cps:column field="zjhm" title="证件号码" ></cps:column>
		<cps:column field="xbms" title="性别" ></cps:column>
		<cps:column field="dzmc" title="地址"></cps:column>
	</cps:tableGrid>
	<div view="true">
		<%@include file="/jsp/lsgl/pages/rk/jwrk/dqjzxx.jsp" %>
	</div>
</creator:panel>