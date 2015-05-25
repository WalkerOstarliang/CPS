<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
<creator:Script src="/jsp/zagl/pages/dwgl/detail/js/cyry_detail.js"></creator:Script>
	<cps:tableGrid url="${contextPath}/zagl/dw/queryCyryPageResultInfo.action?cyrycx.jgbh=${dw.dwjbxx.jgbh}&cyrycx.zxbs=${cyrycx.zxbs}&cyrycx.sfabry=${cyrycx.sfabry}"
			id="cyryList" autoload="true" searchform="queryCyryForm" width="99.5%"
			pageSize="10" usepager="true" mutilSelect="false" dblclick="openCyryDetail">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column rowcallback="cyryCallback" title="操作"></cps:column>
		<cps:column title="姓名" field="xm"></cps:column>
		<cps:column title="所在部门" field="bmmc"></cps:column>
		<cps:column title="职务" field="zwmc"></cps:column>
		<cps:column title="聘用期限(年)" field="pynx"></cps:column>
		<c:if test="${cyrycx.zxbs eq '0'}">
			<cps:column title="入职时间" field="rzsj"></cps:column>
		</c:if>
		<c:if test="${cyrycx.zxbs eq '1'}">
			<cps:column title="离职时间" field="lzsj"></cps:column>
		</c:if>
	</cps:tableGrid>
</creator:view>	