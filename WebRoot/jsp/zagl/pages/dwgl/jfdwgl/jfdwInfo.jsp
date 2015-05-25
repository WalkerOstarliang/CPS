<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="湖南省社会公共安全技术防范系统设计施工单位">
	<creator:Script src="/jsp/zagl/js/cyry.js"></creator:Script>
	<creator:Script src="/jsp/zagl/pages/dwgl/jfdwgl/js/jfdw.js"></creator:Script>
	<cps:PanelView>
		<cps:tbar>
			<c:if test="${!(operType eq 'detail')}">
				<cps:button value="保存" onclick="saveDw()"></cps:button>
			</c:if>
			<cps:button value="年审" onclick="openNsxx('${dw.dwjbxx.jgbh}','${operType}')"></cps:button>
			<cps:button value="关闭" onclick="window.close();"></cps:button>
		</cps:tbar>
		<form id="jfdw_form">
			<input type="hidden" name="modename" value="技防单位" />
			<input id="opertype" type="hidden" name="opertype" value="${operType}" />
		
			<cps:panel title="单位基本信息">
				<%@include file="/jsp/zagl/pages/dwgl/jfdwgl/dwjbxxDetail.jsp"%>
			</cps:panel>
			
			<creator:panel id="jfdw" title="社会公共安全技术防范系统设计施工单位信息">
				<%@include file="/jsp/zagl/pages/dwgl/jfdwgl/jfdwDetail.jsp" %>
			</creator:panel>
		</form>
		<c:if test="${!(operType eq 'add')}" >
			<%@include file="/jsp/zagl/pages/dwgl/jfdwgl/cyry.jsp"%>
		</c:if>
	</cps:PanelView>
</creator:view>
