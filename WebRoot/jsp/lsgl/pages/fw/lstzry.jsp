<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:Script src="/jsp/lsgl/js/czfwczxx.js"></creator:Script>
<creator:panel id="fwquerypanel" title="历史居住人员" tbarId="fwtooltbar">
	<cps:tableGrid id="fwtablegrid"  
			url="/lsgl/rygl/queryXtzryPageInfo.action?fwid=${queryBean.fwid}&zxbs=1" 
			width="99.6%"
			autoload="true"
			pageSize="10">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column field="cz" title="操作" rowcallback="fwdetailtzryCzRowCallback"></cps:column>
		<cps:column field="xm" title="姓名"></cps:column>
		<cps:column field="zjzlms" title="证件种类"></cps:column>
		<cps:column field="sfzh" title="证件号码"></cps:column>
		<cps:column field="xbms" title="性别"></cps:column>
		<cps:column field="lxdh" title="联系方式"></cps:column>
		<cps:column field="fwcs" title="服务场所" maxlength="10"></cps:column>
		<cps:column field="rylbms" title="人员类别"></cps:column>
		<cps:column field="zxbsms" title="注销状态"></cps:column>
	</cps:tableGrid>
</creator:panel>
