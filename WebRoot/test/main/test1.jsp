<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<cps:view title="asd">
	<cps:script>
		function bbb()
		{
			return "&nbsp;";
		}
	</cps:script>
	<cps:tableGrid id="mysss" 
				title="治安类别" 
				pageSize="10"
				usepager="true"
				searchform="searchform"
				autothead="true"
				url="/test/queryTestData.action" 
				mutilSelect="true">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column isCheckbox="true"></cps:column>
		<cps:column title="用户名" field="username"></cps:column>
		<cps:column title="回调函数测试" field="aaa" rowcallback="bbb" ></cps:column>
		<cps:column title="籍贯" field="jg"></cps:column>
	</cps:tableGrid>
</cps:view>