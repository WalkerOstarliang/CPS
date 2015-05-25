<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<cps:tabPanel id="zzxxtabpanel"  height="auto" width="99.8%">
	<cps:tabItem id="dqwlhtabitem" title="当前未落户信息" display="true">
		<%@include file="/jsp/lsgl/pages/rk/wlczhk/dqwlhxx.jsp" %>
	</cps:tabItem>
	<cps:tabItem id="lswlhtabitem" title="历史未落户信息">
		<%@include file="/jsp/lsgl/pages/rk/wlczhk/lswlhjllist.jsp" %>
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
	 
</cps:tabPanel>