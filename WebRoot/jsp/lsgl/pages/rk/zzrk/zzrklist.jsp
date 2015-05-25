<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:tbar id="lszzxxsavetbar">
	<cps:button value="保存" onclick="submitFormRkInfo(saveAfterCallback)"></cps:button>
	<cps:button value="关闭" onclick="$.closeWindow()"></cps:button>
</creator:tbar>
<c:if test="${operType !='rydaxx'}">
	<creator:panel id="zzxxpanel" title="历史居住记录">
		<cps:tableGrid id="rktablegrid"
							list="${rkBean.ldrkzzxxBeans}"
							searchform="ryinfoqueryform"
							height="240"
							width="99.6%"
							click="ldrkZzxxCallback"
							isAsynch="false"
							usepager="false"
							autoload="true">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column  title="操作" rowcallback="zzrkLszzRowCallback"></cps:column>
			<cps:column field="xm" title="姓名" maxlength="15"></cps:column>
			<cps:column field="sfzh" title="身份证号"></cps:column>
			<cps:column field="zzcsms" title="居住处所" ></cps:column>
			<cps:column field="zzsyms" title="居住事由" ></cps:column>
		</cps:tableGrid>
		<div id="dqzzxx">
			<%@include file="/jsp/lsgl/pages/rk/zzrk/dqzzxx.jsp" %>
		</div>
	</creator:panel>
</c:if>
<c:if test="${operType == 'rydaxx'}">
<creator:panel id="zzxxpanel" title="历史居住记录">
	<div>
		<cps:tableGrid id="rktablegrid"
					list="${rkBean.ldrkzzxxBeans}"
					searchform="ryinfoqueryform"
					width="99.6%"
					click="ldrkZzxxCallback"
					isAsynch="false"
					usepager="false"
					autoload="true">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column  title="操作" rowcallback="zzrkLszzRowCallback"></cps:column>
			<cps:column field="xm" title="姓名" maxlength="15"></cps:column>
			<cps:column field="sfzh" title="身份证号"></cps:column>
			<cps:column field="zzcsms" title="居住处所" ></cps:column>
			<cps:column field="zzsyms" title="居住事由" ></cps:column>
		</cps:tableGrid>
		<div id="ldrkxxPage">
			<%@include file="/jsp/lsgl/pages/rk/zzrk/rydadqzzxx.jsp" %>
		</div>
	</div>
</creator:panel>
</c:if>
