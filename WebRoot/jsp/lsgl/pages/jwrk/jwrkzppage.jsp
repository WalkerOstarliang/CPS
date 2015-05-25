<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:Script src="/jsp/lsgl/js/jwrkinfo.js"></creator:Script>
	<input type="hidden" id="rybh" value="${jwrkBean.rybh }">
	<cps:PanelView>
		<cps:tbar>
			<c:if test="${operType != 'detail'}">
				<cps:button value="新增" onclick="openAddJwrkRkzpxx()"/>
				<cps:button value="关闭" onclick="parent.close()"/>
			</c:if>
		</cps:tbar>
		<cps:panel id="zpxxpanel" title="境外人口照片信息">
			<div id="displayImage" style="border: 2px dotted #CCCCCC;height:150px;overflow: auto;">
				<c:if test="${zpxxBeans != null}">
					<c:forEach items="${zpxxBeans}" var="zpBean">
						<span>
							<img alt="${zpBean.ms}" title="${zpBean.ms}" width="120" height="140" src="<c:url value='/lsgl/rk/showRkzpImage.action'/>?queryBean.zpid=${zpBean.id}"/>
						</span>
					</c:forEach>
				</c:if>
			</div>
		</cps:panel>
	</cps:PanelView>
</creator:view>