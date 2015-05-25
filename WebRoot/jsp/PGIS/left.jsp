<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<div>
	<form id="searchform">
		<cps:textfield id="stmc" name="stmc" value="请输入关键字" cssStyle="height:20px;color:gray;font-size:14px" onfocus="this.value=''"></cps:textfield>
		<cps:button value="查询"></cps:button>
	</form>
</div>
<div id="leftcontent" style="width:99%;height:500px;overflow-x:hidden;overflow-y:auto;border:1px slide gray;">
	<cps:tableGrid url="/dzgl/dzxx/queryStxxBeansPageResult.action"  
					id="datagridList"
					autoload="true"
					mutilSelect="false"
					searchform="searchform" 
					width="99.8%" usepager="false">
		<cps:column field="stmc" title="实体名称" align="left"></cps:column>
		<cps:column field="cz" title="操作" align="left"></cps:column>
	</cps:tableGrid>
</div>