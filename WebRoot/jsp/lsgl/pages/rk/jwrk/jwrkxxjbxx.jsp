<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:Script src="/jsp/lsgl/js/rkinfo.js"></creator:Script>
	<form id="rkxxform" method="post">
		<input type="hidden" id="rybh" name="rkBean.jbxxBean.rybh" value="${rkBean.jbxxBean.rybh}"/>
		<cps:PanelView>
			<cps:tbar>
				<cps:button id="savebtn" value="保存" onclick="saveJwrkInfo()"></cps:button>
				<cps:button value="关闭" onclick="closeWindow()"></cps:button>
			</cps:tbar>
			<cps:panel id="jwrkinfopanel" title="人员基本信息">
				<%@include file="/jsp/lsgl/pages/rk/jwrk/jwrkjbxx.jsp"%>
				<%@include file="/jsp/lsgl/pages/rk/jwrk/dqjzxx.jsp"%>
			</cps:panel>
		</cps:PanelView>
	</form>
</creator:view>