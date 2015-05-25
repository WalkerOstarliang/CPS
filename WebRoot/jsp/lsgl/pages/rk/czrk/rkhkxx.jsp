<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<div id="czrkxxpanel">
	<cps:tabPanel id="hkpanel" height="auto" width="99.8%">
		<cps:tabItem id="dqhkxxtabitem" title="当前户口信息" display="true">
			<%--当前人员户口信息 --%>
				<%@include file="/jsp/lsgl/pages/rk/czrk/dhrkhkxx.jsp" %>
		</cps:tabItem>
		<cps:tabItem id="hkqyjltabitem" title="户口迁移记录">
			<%--历史户籍信息 --%>
			<%@include file="/jsp/lsgl/pages/rk/czrk/rklshkxxlist.jsp" %>
		</cps:tabItem>
		
		<cps:tabItem id="shgxtabitem" title="社会关系">
			开发中...
		</cps:tabItem>
			
		<cps:tabItem id="lxfstabitem" title="联系方式">
			开发中....
		</cps:tabItem>
		
		<cps:tabItem id="tmtztabitem" title="体貌特征">
			开发中....
		</cps:tabItem>
		<cps:tabItem id="clxxtabitem" title="车辆信息">
			开发中....
		</cps:tabItem>
		
	</cps:tabPanel>
</div>
