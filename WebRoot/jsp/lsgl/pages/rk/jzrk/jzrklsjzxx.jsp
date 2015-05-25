<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:Script src="/jsp/lsgl/js/rkinfo.js"></creator:Script>
	<cps:PanelView>
		<cps:tbar>
			<cps:button value="关闭" onclick="closeWindow()"></cps:button>
		</cps:tbar>
		<cps:panel title="历史居住记录信息">
			<input type="hidden" id="rybh" name="rkBean.jbxxBean.rybh" value="${rkBean.jbxxBean.rybh}"/>
			<input type="hidden" id="sfzh" name="rkBean.jbxxBean.sfzh" value="${rkBean.jbxxBean.sfzh}">
			<cps:tableGrid id="rktablegrid" 
								width="99.8%"
								list="${rkBean.jzrkjzxxBeans}"
								isAsynch="false"
								searchform="ryinfoqueryform"
								mutilSelect="false"
								click="jzrkRowClick"
								usepager="false"
								autoload="true">
				<cps:column isNumber="true" title="序号"></cps:column>
				<cps:column field="xm" title="姓名" maxlength="15"></cps:column>
				<cps:column field="sfzh" title="身份证号"></cps:column>
				<cps:column field="jzsj" title="寄住时间" ></cps:column>
				<cps:column field="hzxm" title="房主姓名" ></cps:column>
				<cps:column field="hzsfzh" title="房主身份证号" ></cps:column>
				<cps:column field="djsj" title="登记时间"></cps:column>
				<cps:column field="djrxm" title="登记人姓名"></cps:column>
			</cps:tableGrid>
		</cps:panel>
	</cps:PanelView>
	<creator:panel id="jzxx" title="居住信息">
		<%@include file="/jsp/lsgl/pages/rk/jzrk/dqjzxx.jsp" %>
	</creator:panel>
</creator:view>