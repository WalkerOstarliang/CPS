<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<div>
	<cps:tableGrid id="syfcxxList"
		url="/lsgl/fw/queryFwjbxxPageByHzsfzh.action?rybh=${queryBean.rybh}"
	    width="99.5%" 
		pageSize="10" 
		autoload="true"
		>
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column field="fwxc" title="操作" align="left"></cps:column>
		<cps:column field="dzmc" title="地址" align="left" maxlength="15"></cps:column>
		<cps:column field="cqlxmc" title="产权类型" ></cps:column>
		<cps:column field="sfczwms" title="是否出租屋"></cps:column>
		<cps:column field="zxbsms" title="注销状态"></cps:column>
	</cps:tableGrid>
</div>
