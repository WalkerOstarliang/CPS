<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:tbar id="lshkxxxxsavetbar">
	<cps:button value="保存" onclick="submitFormRkInfo(saveAfterCallback)"></cps:button>
	<cps:button value="关闭" onclick="$.closeWindow()"></cps:button>
</creator:tbar>
<c:if test="${operType!='rydaxx'}">
	<creator:panel id="lshkxxpanel" title="户口信息" tbarId="lshkxxxxsavetbar">
		<input type="hidden" id="sfzh" name="rkBean.jbxxBean.sfzh" value="${rkBean.jbxxBean.sfzh}">
		<cps:tableGrid id="lsczrkxxtablegrid" 
						list="${rkBean.czrkBeans}"
						width="99.8%"
						autoload="true"
						isAsynch="false"
						click="hkxxRowClick"
						usepager="false" >
			<cps:column title="序号" isNumber="true"></cps:column>
			<cps:column field="xm" title="姓名"></cps:column>
			<cps:column field="sfzh" title="身份证号"></cps:column>
			<cps:column field="hh" title="户号"></cps:column>
			<cps:column field="hklbmc" title="户类型"></cps:column>
			<cps:column field="qrsj" title="迁入时间"></cps:column>
			<cps:column field="sspcsmc" title="派出所" maxlength="10"></cps:column>
			<cps:column field="djsj" title="登记时间"></cps:column>
		</cps:tableGrid>
		<%@include file="/jsp/lsgl/pages/rk/czrk/dhrkhkxx.jsp" %>
	</creator:panel>
</c:if>
<c:if test="${operType=='rydaxx'}">
<div>
	<input type="hidden" id="sfzh" name="rkBean.jbxxBean.sfzh" value="${rkBean.jbxxBean.sfzh}">
	<cps:tableGrid id="lsczrkxxtablegrid" 
					list="${rkBean.czrkBeans}"
					width="99.8%"
					autoload="true"
					isAsynch="false"
					click="hkxxRowClick"
					usepager="false" >
		<cps:column title="序号" isNumber="true"></cps:column>
		<cps:column field="xm" title="姓名"></cps:column>
		<cps:column field="sfzh" title="身份证号"></cps:column>
		<cps:column field="hh" title="户号"></cps:column>
		<cps:column field="hklbmc" title="户类型"></cps:column>
		<cps:column field="qrsj" title="迁入时间"></cps:column>
		<cps:column field="sspcsmc" title="派出所" maxlength="10"></cps:column>
		<cps:column field="djsj" title="登记时间"></cps:column>
	</cps:tableGrid>
	<div id="hkxxPage" >
		<%@include file="/jsp/lsgl/pages/rk/czrk/rydadhrkhkxx.jsp" %>
	</div>
</div>
</c:if>