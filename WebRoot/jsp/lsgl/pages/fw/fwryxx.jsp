<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:panel id="fwrkxxpanel" title="当前房屋居住人员">
	<cps:tableGrid id="fwrkxxtablegrid" 
				list="${fwBean.fwrkxxBeans}"
				width="99.8%"
				click="fwrkRowCallback"
				isAsynch="false">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column field="xm" title="姓名"></cps:column>
		<cps:column field="sfzh" title="身份证号"></cps:column>
		<cps:column field="xbms" title="性别"></cps:column>
		<cps:column field="rzsj" title="入住时间"></cps:column>
		<cps:column field="blsj" title="搬离时间"></cps:column>
		<cps:column field="djsj" title="登记时间"></cps:column>
		<cps:column field="djdwmc" title="登记单位"></cps:column>
	</cps:tableGrid>
	<div id="fwrkxxdiv">
		<%@include file="/jsp/lsgl/pages/rk/rkjbxx.jsp" %>
	</div>
	 
</creator:panel>