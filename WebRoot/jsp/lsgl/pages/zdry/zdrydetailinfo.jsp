<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<form id="queryBeanform">
	<input type="hidden" id="queryBeanrybh" name="queryBean.rybh" value="${queryBean.rybh}"/>
	 
	<input type="hidden" id="queryBeanrkid" name="queryBean.rkid" value="${queryBean.rkid}"/>
	  
	<input type="hidden" id="queryBeanoperType" name="operType" value="${operType}"/>
	<input type="hidden" id="modename" name="modename" value="${modename}"/>
	<input type="hidden" id="queryBeansfzh" name="queryBean.sfzh" value="${queryBean.sfzh}"/>
</form>
<%@include file="/jsp/lsgl/pages/zdry/zdryxxloadinfo.jsp"%>