<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="${modename}核实登记">
	<creator:Script src="/jsp/lsgl/js/rkinfo.js"></creator:Script>
	<creator:Script src="/jsp/lsgl/js/rkinfodetail.js"></creator:Script>
	<form id="ryinfoqueryform">
		<input type="hidden" id="operType" name="operType" value="${operType}">
		<input type="hidden" id="querybeanrybh" name="queryBean.rybh" value="${rkBean.jbxxBean.rybh }"/>
	</form>
	<creator:panel id="rkpanel" title="人员基本信息" width="99.8%" height="auto" tbarId="rktbartool">
		<%@include file="/jsp/lsgl/pages/rk/rkjbxx.jsp"%>
	</creator:panel>
	<cps:tabPanel id="hkpanel" height="auto" width="99.8%">
		<cps:tabItem id="tab2" title="当前户口信息" display="true">
			<%--当前人员户口信息 --%>
			<%@include file="/jsp/lsgl/pages/rk/czrk/dhrkhkxx.jsp" %>
		</cps:tabItem>
		<cps:tabItem id="tab2" title="其他户口迁移记录">
			<%--历史户籍信息 --%>
			<%@include file="/jsp/lsgl/pages/rk/czrk/rklshkxxlist.jsp" %>
		</cps:tabItem>
	</cps:tabPanel>
</creator:view>
