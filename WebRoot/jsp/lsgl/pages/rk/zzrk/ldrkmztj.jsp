<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<creator:Script src="/jsp/lsgl/js/ldrktj.js"></creator:Script>
<cps:PanelView >
	<cps:tbar >
		<c:if test="${queryBean.leve >loginInfo.leve}">
			<cps:button id="back"  value="返回上一级" onclick="backLastLeve()"></cps:button>
		</c:if>
	</cps:tbar>
	<cps:panel id="ldrktj" title="统计表格">
	<cps:table cssStyle="width:99.6%">
		<input type="hidden" id ="moveOrgcode" name = "queryBean.orgcode" value="${queryBean.orgcode}">
		<cps:row>
			<cps:tdLabel rowspan="1" cssStyle="text-align:center;width:30px;">序号</cps:tdLabel>
			<cps:tdLabel rowspan="1" cssStyle="text-align:left;width:100px;">单位名称</cps:tdLabel>
			<cps:tdLabel rowspan="1" cssStyle="text-align:center;width:40px;">总数</cps:tdLabel>
		</cps:row>
		<c:forEach items="${ldrktjBeans}" var="ldrktjBean" varStatus="st">
			<cps:row>
				<cps:tdContent cssStyle="text-align:center;" width="5px">${st.index+1}</cps:tdContent>
				<c:if test="${queryBean.leve != 5}">
					<cps:tdContent  cssStyle="text-align:left;"><span class='cps_span_href' style='color:green;cursor:hand;' onclick='Zqorgcode(${ldrktjBean.orgcode},${queryBean.leve })'>${ldrktjBean.orgname}</span></cps:tdContent>
				</c:if>
				<c:if test="${queryBean.leve == 5}">
					<cps:tdContent  cssStyle="text-align:left;">${ldrktjBean.orgname}</cps:tdContent>
				</c:if>
				<cps:tdContent  cssStyle="text-align:center;width:40px;">${ldrktjBean.count}</cps:tdContent>
			</cps:row>
		</c:forEach>
	</cps:table>
	</cps:panel>
</cps:PanelView>
