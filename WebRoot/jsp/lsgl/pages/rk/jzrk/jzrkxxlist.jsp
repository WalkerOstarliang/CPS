<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:tbar id="jzxxsavetbar">
	<cps:button value="保存" onclick="submitFormRkInfo(saveAfterCallback)"></cps:button>
	<cps:button value="关闭" onclick="$.closeWindow()"></cps:button>
</creator:tbar>
<c:if test="${operType !='rydaxx'}">
<creator:panel id="jzrklistpanel" title="历史寄住信息">
	<cps:tableGrid id="rktablegrid" 
						width="99.8%"
						list="${rkBean.jzrkjzxxBeans}"
						isAsynch="false"
						searchform="ryinfoqueryform"
						mutilSelect="false"
						click="jzrkRowClick"
						usepager="false"
						autoload="true">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column field="xm" title="姓名" maxlength="15"></cps:column>
		<cps:column field="sfzh" title="身份证号"></cps:column>
		<cps:column field="jzsj" title="寄住时间" ></cps:column>
		<cps:column field="hzxm" title="房主姓名" ></cps:column>
		<cps:column field="hzsfzh" title="房主身份证号" ></cps:column>
		<cps:column field="djsj" title="登记时间"></cps:column>
		<cps:column field="djrxm" title="登记人姓名"></cps:column>
	</cps:tableGrid>
	<div>
		<%@include file="/jsp/lsgl/pages/rk/jzrk/dqjzxx.jsp" %>
	</div>
</creator:panel>
</c:if>
<c:if test="${operType =='rydaxx'}">
	<div>
		<cps:tableGrid id="rktablegrid" 
							width="99.8%"
							list="${rkBean.jzrkjzxxBeans}"
							isAsynch="false"
							searchform="ryinfoqueryform"
							mutilSelect="false"
							click="jzrkRowClick"
							usepager="false"
							autoload="true">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column field="xm" title="姓名" maxlength="15"></cps:column>
			<cps:column field="sfzh" title="身份证号"></cps:column>
			<cps:column field="jzsj" title="寄住时间" ></cps:column>
			<cps:column field="hzxm" title="房主姓名" ></cps:column>
			<cps:column field="hzsfzh" title="房主身份证号" ></cps:column>
			<cps:column field="djsj" title="登记时间"></cps:column>
			<cps:column field="djrxm" title="登记人姓名"></cps:column>
		</cps:tableGrid>
		<div id="jzxxPage">
			<%@include file="/jsp/lsgl/pages/rk/jzrk/rydadqjzxx.jsp" %>
		</div>
	</div>
</c:if>
