<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:panel id="zpxxpanel" width="99.8%" height="window" title="关联单位信息">
	<cps:tableGrid id="gldwtablegrid"  
			url="/lsgl/fw/queryGldwxxPageResultInfo.action?queryBean.fwid=${queryBean.fwid}" 
			width="99.6%"
			autoload="true"
			pageSize="10">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column field="gldwcz" title="操作" rowcallback="gldwczCallback"></cps:column>
		<cps:column field="dwmc" title="单位名称"></cps:column>
		<cps:column field="dwdh" title="单位电话"></cps:column>
		<cps:column field="frdb" title="法人代表"></cps:column>
		<cps:column field="frsfzhm" title="法人身份证号"></cps:column>
		<cps:column field="hylbmc" title="单位属性"></cps:column>
	</cps:tableGrid>
</creator:panel>
