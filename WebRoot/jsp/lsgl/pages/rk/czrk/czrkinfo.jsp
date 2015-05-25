<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:tbar id="rkjbxxsavetbar">
	<cps:button value="保存" onclick="submitFormRkInfo(saveCzrkJbxxAfterCallback)"></cps:button>
	<cps:button value="关闭" onclick="$.closeWindow()"></cps:button>
</creator:tbar>
<creator:panel id="rkjbxx" title="人口基本信息" tbarId="rkjbxxsavetbar" height="window">
 	<%@include file="/jsp/lsgl/pages/rk/newrkjbxx.jsp" %>
 	<%@include file="/jsp/lsgl/pages/rk/czrk/dhrkhkxx.jsp" %>
</creator:panel>
