<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:tbar id="jwrkjbxxsavetbar">
	<cps:button id="savebtn" value="保存" onclick="submitFormRkInfo(saveJwrkJbxxAfterCallback)"></cps:button>
	<cps:button value="关闭" onclick="$.closeWindow()"></cps:button>
</creator:tbar>
<creator:panel id="jwrkinfopanel" title="人员基本信息" tbarId="jwrkjbxxsavetbar">
	<%@include file="/jsp/lsgl/pages/rk/jwrk/jwrkjbxx.jsp"%>
	<%@include file="/jsp/lsgl/pages/rk/jwrk/dqjzxx.jsp"%>
</creator:panel>