<%@page contentType="text/html;" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="从业人员信息">
	<creator:Script src="/jsp/zagl/js/cyry.js"></creator:Script>
	<creator:tbar id="cyry_op">
		<c:if test="${!(dw.opertype eq 'detail')}">
			<cps:button value="保存" type="button" onclick="saveCyry()" />
		</c:if>
		<c:if test="${isxttxpage==true}">
			<c:if test="${isCyrypf == false}">
				<cps:button value="登记实有人口" type="button" onclick="openDjcyrysjrkWin('${rkBean.jbxxBean.sfzh}')" />
			</c:if>
			<cps:button value="反馈" type="button" onclick="openCyryTxfkWin('${dw.cyry.cyrybh}')"/>
		</c:if>
		<cps:button value="关闭" type="button" onclick="window.close();" />
	</creator:tbar>
	
	<c:choose>
		<c:when test="${dw.cyry.sfjwry == '1'}">
			<c:set var="title" value="境外人员信息" />
		</c:when>
		<c:when test="${isCyrypf==true}">
			<c:set var="title" value="从人员派发=》人员基本信息" />
		</c:when>
		<c:otherwise>
			<c:set var="title" value="人员基本信息" />
		</c:otherwise>
	</c:choose>
	<creator:panel id="crry_panel" title="${title}" tbarId="cyry_op">
		<div id="cyry_div">
			<form id="cyry_form">
				<input type="hidden" id="opertype" name="operType" value="${dw.opertype}" />
				<input type="hidden" id="dwjbxx_hylb" value="${hylb}" /> 
				<div id="rkjbxx">
					<c:choose>
						<c:when test="${dw.opertype eq 'detail'}">
							<c:choose>
								<c:when test="${dw.cyry.sfjwry == '1'}">
									<%@include file="/jsp/zagl/pages/dwgl/jwrydetail.jsp"%>
								</c:when>
								<c:otherwise>
									<%@include file="/jsp/lsgl/pages/rk/detailrkjbxx.jsp"%>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${dw.cyry.sfjwry == '1'}">
									<%@include file="/jsp/zagl/pages/dwgl/newjwry.jsp"%>
								</c:when>
								<c:otherwise>
									<%@include file="/jsp/zagl/pages/dwgl/newrkjbxx.jsp"%>
								</c:otherwise>
							</c:choose>
							
						</c:otherwise>
					</c:choose>
				</div>
				<creator:panel id="lscyrypanel" title="从业信息历史">
					<c:choose>
						<c:when test="${dw.opertype eq 'detail'}">
							<%@include file="/jsp/zagl/pages/dwgl/dwcyryinfo.jsp" %>
						</c:when>
						<c:otherwise>
							<%@include file="/jsp/zagl/pages/dwgl/dwcyryaddinfo.jsp" %>	
						</c:otherwise>
					</c:choose>
				</creator:panel>
			</form>
		</div>
	</creator:panel>
</creator:view>