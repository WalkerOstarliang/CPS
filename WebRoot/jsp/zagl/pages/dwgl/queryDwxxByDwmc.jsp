<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:tbar id="op">
		<cps:button value="关闭" onclick="window.close();"></cps:button>
	</creator:tbar>

	<form id="queryDwxxByDwmc_form">
		<input type="hidden" name="dwcx.dwmc" value="${dwcx.dwmc}"/>
		<input type="hidden" name="dwcx.citygajgjgdm" value="${loginInfo.citygajgdm}"/>
		<input type="hidden" name="dwcx.countrygajgjgdm" value="${loginInfo.countrygajgdm}"/>
		<input type="hidden" name="dwcx.pcsdm" value="${loginInfo.pcsdm}"/>
		<input type="hidden" name="dwcx.jwsqdm" value="${loginInfo.jwsqdm}"/>
	</form>
	
	<cps:tableGrid url="/zagl/dw/queryDwjbxxPageResultInfoByJgbh.action" title="辖区中同名单位"
			id="tmdwList" autoload="false" pageSize="10" width="99.8%" tbarId="op"
			usepager="true" searchform="queryDwxxByDwmc_form" autothead="false" mutilSelect="true">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column title="单位名称" field="dwmc" align="left"  maxlength="15"></cps:column>
			<cps:column title="法人代表" field="frdb" align="left"></cps:column>
			<cps:column title="法人身份证" field="frsfzhm" ></cps:column>
			<cps:column title="单位地址" field="dwdz" align="left"></cps:column>
			<cps:column title="注销标识" field="zxbsmc" align="left" ></cps:column>
	</cps:tableGrid>
	
	<script type="text/javascript">
		$(function(){
			$("#tmdwList").query("F", "queryDwxxByDwmc_form");
		});
	</script>
</creator:view>