<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>


<creator:view title="火灾详情">
	<creator:Script src="/jsp/xfdw/js/hztj.js"></creator:Script>
	<creator:tbar id="tjBar">
		<form id="queryForm">
			<input type="hidden" id="kssj" name="tjBean.kssj" value="${tjBean.kssj}"/>
			<input type="hidden" id="jssj" name="tjBean.jssj" value="${tjBean.jssj}"/>
			<input type="hidden" id="hzdj" name="tjBean.hzdj" value="${tjBean.hzdj}"/>
			<input type="hidden" id="p_code" name="tjBean.p_code" value="${tjBean.p_code}"/>
			<input type="hidden" id="org_code" name="tjBean.org_code" value="${tjBean.org_code}"/>
			<cps:button value="关闭" onclick="window.close()" ></cps:button>
		</form>
	</creator:tbar>
	<creator:panel id="xfdw_hztjList" title="火灾统计" tbarId="tjBar">
		<cps:tableGrid id="hzxqtablegrid"  
						title="火灾信息列表"
						url="/xfdw/hztj/queryHzxqList.action" 
						searchform="queryForm"
						autoload="true"
						pageSize="10"
						width="100%" 
						click="openDeail">
					<cps:column field="hzxh" title="火灾序号"></cps:column>
					<cps:column field="xzqybm" title="行政区域" align="left"></cps:column>
					<cps:column field="ssdwmc" title="派发单位" maxlength="15" align="left"></cps:column>
					<cps:column field="qhsj" title="起火时间"></cps:column>
					<cps:column field="qhdd" title="起火地点" maxlength="15" align="left"></cps:column>
					<cps:column field="hzmc" title="单位名称/户主名称" align="left"></cps:column>
					<cps:column field="swrs" title="死亡人数"></cps:column>
					<cps:column field="ssrs" title="受伤人数"></cps:column>
					<cps:column field="zjccss" title="直接财产损失"></cps:column>
					<cps:column field="szhs" title="受灾户数"></cps:column>
					<cps:column field="hzyy" title="火灾原因" maxlength="10" align="left"></cps:column>
					<cps:column field="qhcs" title="起火场所" maxlength="10" align="left"></cps:column>
				</cps:tableGrid>
	</creator:panel>
</creator:view>