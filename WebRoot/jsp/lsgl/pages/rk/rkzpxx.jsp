<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<cps:PanelView>
	<cps:tbar>
		<cps:button value="新增" onclick="openAddRkzpxx()"/>
		<cps:button value="关闭" onclick="parent.close()"/>
	</cps:tbar>
	<cps:panel id="zpxxpanel" title="人口照片信息">
		<div id="displayImage" style="border: 2px dotted #CCCCCC;height:150px;overflow: auto;">
		<c:forEach items="${rkBean.zpxxBeans}" var="zpBean">
			<span>
				<img alt="${zpBean.ms}" title="${zpBean.ms}" width="120" height="140" src="<c:url value='/lsgl/rk/showRkzpImage.action'/>?queryBean.zpid=${zpBean.id}"/>
			</span>
		</c:forEach>
	</div>
	</cps:panel>
</cps:PanelView>